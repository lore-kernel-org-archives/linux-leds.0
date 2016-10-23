From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/4] leds: core: Add support for poll()ing the sysfs brightness attr for changes.
Date: Sun, 23 Oct 2016 21:46:49 +0200
Message-ID: <20161023194652.24335-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org

Add support for userspace using poll() for POLL_PRI on the sysfs brightness
attr to watch for brightness changes.

This commit adds a led_notify_brightness_change helper function for
waking up any poll() waiters; and calls this after any brightness changes
(after any led_classdev->brightness_set[_blocking] calls have completed).

In some use-cases led hardware may autonomously change its brightness,
e.g. the keyboard backlight used on some laptops is controlled by a
hardwired (firmware handled) hotkey. led_notify_brightness_change is
exported for use by drivers which can detect such autonomous changes.

This commit also updates the Documentation/ABI/testing/sysfs-class-led
documentation to document that userspace may now poll on the brightness
attribute.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Wakeup / notify userspace on any brightness changes, not just on
 autonomous changes done by the hw
---
 Documentation/ABI/testing/sysfs-class-led |  8 ++++++--
 drivers/leds/led-class.c                  |  9 +++++++++
 drivers/leds/led-core.c                   | 16 +++++++++++++++-
 include/linux/leds.h                      | 12 ++++++++++++
 4 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 86ace28..0685551 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -1,12 +1,16 @@
 What:		/sys/class/leds/<led>/brightness
-Date:		March 2006
-KernelVersion:	2.6.17
+Date:		March 2006 (poll October 2016)
+KernelVersion:	2.6.17 (poll since 4.10)
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
 		Set the brightness of the LED. Most LEDs don't
 		have hardware brightness support so will just be turned on for
 		non-zero brightness settings. The value is between 0 and
 		/sys/class/leds/<led>/max_brightness.
+		The file supports poll() to detect brightness changes, in
+		some cases the hardware / firmware may change the brightness
+		autonomously, poll() should be woken up in this case too,
+		but not all drivers may support this.
 
 What:		/sys/class/leds/<led>/max_brightness
 Date:		March 2006
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index aa84e5b..3427a65 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -203,6 +203,14 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
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
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
@@ -254,6 +262,7 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 
 	flush_work(&led_cdev->set_brightness_work);
 
+	sysfs_put(led_cdev->brightness_kn);
 	device_unregister(led_cdev->dev);
 
 	down_write(&leds_list_lock);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 3bce448..e2e5cc7 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -33,16 +33,24 @@ static int __led_set_brightness(struct led_classdev *led_cdev,
 
 	led_cdev->brightness_set(led_cdev, value);
 
+	led_notify_brightness_change(led_cdev);
+
 	return 0;
 }
 
 static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
 					 enum led_brightness value)
 {
+	int ret;
+
 	if (!led_cdev->brightness_set_blocking)
 		return -ENOTSUPP;
 
-	return led_cdev->brightness_set_blocking(led_cdev, value);
+	ret = led_cdev->brightness_set_blocking(led_cdev, value);
+	if (ret >= 0)
+		led_notify_brightness_change(led_cdev);
+
+	return ret;
 }
 
 static void led_timer_function(unsigned long data)
@@ -308,6 +316,12 @@ int led_update_brightness(struct led_classdev *led_cdev)
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
index ddfcb2d..eebcd8c 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -13,6 +13,7 @@
 #define __LINUX_LEDS_H_INCLUDED
 
 #include <linux/device.h>
+#include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
@@ -94,6 +95,8 @@ struct led_classdev {
 	struct work_struct	set_brightness_work;
 	int			delayed_set_value;
 
+	struct kernfs_node	*brightness_kn;
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */
 	struct rw_semaphore	 trigger_lock;
@@ -193,6 +196,15 @@ extern int led_set_brightness_sync(struct led_classdev *led_cdev,
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
