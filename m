From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] leds: core: Add led_notify_brightness_change helper function
Date: Wed, 19 Oct 2016 15:33:54 +0200
Message-ID: <20161019133355.6192-2-hdegoede@redhat.com>
References: <20161019133355.6192-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42846 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755784AbcJSOLe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 Oct 2016 10:11:34 -0400
In-Reply-To: <20161019133355.6192-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

In some use-cases led hardware may autonomously change its brightness,
userspace may want to be able to listen for this happening.

The standard way to listen for sysfs attributes changing is for userspace
to poll for POLL_PRI on the attribute. This commit adds a
led_notify_brightness_change helper function allowing drivers to signal
userspace this way.

This is documented in Documentation/ABI/testing/sysfs-class-led,
as documented there this is only intended to signal autonomous changes
done by the hardware and it is not the intention to do a sysfs_notify
for triggers and blinking.

One use-case for this is the keyboard backlight used on some laptops,
which is controlled by a hardwired (firmware handled) hotkey. In this
case we want to signal userspace of the brightness changes triggered
by the hotkey (which does not generate key events).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/ABI/testing/sysfs-class-led |  5 +++++
 drivers/leds/led-class.c                  |  9 +++++++++
 drivers/leds/led-core.c                   |  6 ++++++
 include/linux/leds.h                      | 12 ++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 86ace28..518b674 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -7,6 +7,11 @@ Description:
 		have hardware brightness support so will just be turned on for
 		non-zero brightness settings. The value is between 0 and
 		/sys/class/leds/<led>/max_brightness.
+		The file supports poll() to detect changes, changes are only
+		signalled when the hardware / firmware changes the brightness
+		itself and the driver can detect this. Changes done by
+		kernel triggers / software blinking and writing the brightness
+		file are not signalled.
 
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
index 3bce448..ec085a6 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -308,6 +308,12 @@ int led_update_brightness(struct led_classdev *led_cdev)
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
index ddfcb2d..203eb26 100644
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
+ * led_notify_brightness_change - Notify userspace of hw brightness changes
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
