From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4] leds: core: Add support for poll()ing the sysfs brightness attr for changes.
Date: Fri, 11 Nov 2016 15:22:07 +0100
Message-ID: <20161111142207.8584-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52302 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751821AbcKKOWL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 11 Nov 2016 09:22:11 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

This commit adds a led_notify_brightness_change helper function for
waking up any poll() waiters; and calls this after brightness changes
done by userspace writing the brightness sysfs attribute.

In some use-cases led hardware may autonomously change its brightness,
e.g. the keyboard backlight used on some laptops is controlled by a
hardwired (firmware handled) hotkey. led_notify_brightness_change is
exported for use by drivers which can detect such autonomous changes,
so that these changes can be signalled to userspace too.

This commit also updates the Documentation/ABI/testing/sysfs-class-led
documentation to document that userspace may now poll on the brightness
attribute.

Note that we only notify userspace on writes to the sysfs brightness
attribute and on autonomous changes done by the hw and NOT on triggers /
blinking. This is deliberate trigger / blinking brightness changes are
not interesting to userspace and the notification can cause a high load
with high frequency triggers / blinking.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Wakeup / notify userspace on any brightness changes, not just on
 autonomous changes done by the hw
Changes in v3:
-Rebase on linux-leds/for-next
Changes in v4:
-Only notify userspace on writes to the sysfs brightness attribute and
 on autonomous changes done by the hw; do NOT notify on triggers / blinking,
 these changes are not interesting to userspace and the notification can
 cause a high load with high frequency triggers / blinking
---
 Documentation/ABI/testing/sysfs-class-led |  9 +++++++--
 drivers/leds/led-class.c                  | 10 ++++++++++
 drivers/leds/led-core.c                   |  6 ++++++
 include/linux/leds.h                      | 12 ++++++++++++
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 491cdee..6809add 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -1,12 +1,17 @@
 What:		/sys/class/leds/<led>/brightness
-Date:		March 2006
-KernelVersion:	2.6.17
+Date:		March 2006 (poll October 2016)
+KernelVersion:	2.6.17 (poll since 4.10)
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
 		Set the brightness of the LED. Most LEDs don't
 		have hardware brightness support, so will just be turned on for
 		non-zero brightness settings. The value is between 0 and
 		/sys/class/leds/<led>/max_brightness.
+		The file supports poll() to detect changes, changes are only
+		signalled when this file is written or when the hardware /
+		firmware changes the brightness itself and the driver can detect
+		this. Changes done by kernel triggers / software blinking are
+		not signalled.
 
 		Writing 0 to this file clears active trigger.
 
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 42909d7..0e1498a 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (state == LED_OFF)
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
+	led_notify_brightness_change(led_cdev);
 
 	ret = size;
 unlock:
@@ -204,6 +205,14 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	led_cdev->brightness_kn = sysfs_get_dirent(led_cdev->dev->kobj.sd,
+						   "brightness");
+	if (!led_cdev->brightness_kn) {
+		dev_err(led_cdev->dev, "Error getting brightness kernfs_node\n");
+		device_unregister(led_cdev->dev);
+		return -ENODEV;
+	}
+
 	led_cdev->work_flags = 0;
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
@@ -256,6 +265,7 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 
 	flush_work(&led_cdev->set_brightness_work);
 
+	sysfs_put(led_cdev->brightness_kn);
 	device_unregister(led_cdev->dev);
 
 	down_write(&leds_list_lock);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ef13604..a61ae4b 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -310,6 +310,12 @@ int led_update_brightness(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_update_brightness);
 
+void led_notify_brightness_change(struct led_classdev *led_cdev)
+{
+	sysfs_notify_dirent(led_cdev->brightness_kn);
+}
+EXPORT_SYMBOL_GPL(led_notify_brightness_change);
+
 /* Caller must ensure led_cdev->led_access held */
 void led_sysfs_disable(struct led_classdev *led_cdev)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 569cb53..a9d9398 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -13,6 +13,7 @@
 #define __LINUX_LEDS_H_INCLUDED
 
 #include <linux/device.h>
+#include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
@@ -99,6 +100,8 @@ struct led_classdev {
 	struct work_struct	set_brightness_work;
 	int			delayed_set_value;
 
+	struct kernfs_node	*brightness_kn;
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */
 	struct rw_semaphore	 trigger_lock;
@@ -198,6 +201,15 @@ extern int led_set_brightness_sync(struct led_classdev *led_cdev,
 extern int led_update_brightness(struct led_classdev *led_cdev);
 
 /**
+ * led_notify_brightness_change - Notify userspace of brightness changes
+ * @led_cdev: the LED to do the notify on
+ *
+ * Let any users waiting for POLL_PRI on the led's brightness sysfs
+ * atrribute know that the brightness has been changed.
+ */
+extern void led_notify_brightness_change(struct led_classdev *led_cdev);
+
+/**
  * led_sysfs_disable - disable LED sysfs interface
  * @led_cdev: the LED to set
  *
-- 
2.9.3
