From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v8] leds: class: Add new optional brightness_hw_changed attribute
Date: Sun, 29 Jan 2017 14:42:52 +0100
Message-ID: <20170129134252.6185-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57576 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751154AbdA2Nwt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 29 Jan 2017 08:52:49 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Some LEDs may have their brightness level changed autonomously
(outside of kernel control) by hardware / firmware. This commit
adds support for an optional brightness_hw_changed attribute to
signal such changes to userspace (if a driver can detect them):

What:		/sys/class/leds/<led>/brightness_hw_changed
Date:		January 2017
KernelVersion:	4.11
Description:
		Last hardware set brightness level for this LED. Some LEDs
		may be changed autonomously by hardware/firmware. Only LEDs
		where this happens and the driver can detect this, will
		have this file.

		This file supports poll() to detect when the hardware
		changes the brightness.

		Reading this file will return the last brightness level set
		by the hardware, this may be different from the current
		brightness.

Drivers which want to support this, simply add LED_BRIGHT_HW_CHANGED to
their flags field and call led_classdev_notify_brightness_hw_changed()
with the hardware set brightness when they detect a hardware / firmware
triggered brightness change.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
Changes in v6:
-New patch in v6 of this set, replacing previous trigger based API
Changes in v7
-Return -ENODATA when brightness_hw_changed gets read before any
 hw brightness change event as happened
-Make the hw_brightness_changed attr presence configurable through Kconfig
Changes in v8
-Add WARN_ON in case a driver calls led_classdev_notify_brightness_hw_changed
 without setting the LED_BRIGHT_HW_CHANGED flag
-Document the need for LED_BRIGHT_HW_CHANGED in
 Documentation/leds/leds-class.txt
---
 Documentation/ABI/testing/sysfs-class-led | 17 +++++++
 Documentation/leds/leds-class.txt         | 15 ++++++
 drivers/leds/Kconfig                      |  9 ++++
 drivers/leds/led-class.c                  | 76 +++++++++++++++++++++++++++++++
 include/linux/leds.h                      | 15 ++++++
 5 files changed, 132 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 491cdee..5f67f7a 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -23,6 +23,23 @@ Description:
 		If the LED does not support different brightness levels, this
 		should be 1.
 
+What:		/sys/class/leds/<led>/brightness_hw_changed
+Date:		January 2017
+KernelVersion:	4.11
+Description:
+		Last hardware set brightness level for this LED. Some LEDs
+		may be changed autonomously by hardware/firmware. Only LEDs
+		where this happens and the driver can detect this, will have
+		this file.
+
+		This file supports poll() to detect when the hardware changes
+		the brightness.
+
+		Reading this file will return the last brightness level set
+		by the hardware, this may be different from the current
+		brightness. Reading this file when no hw brightness change
+		event has happened will return an ENODATA error.
+
 What:		/sys/class/leds/<led>/trigger
 Date:		March 2006
 KernelVersion:	2.6.17
diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index f1f7ec9..836cb16 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -65,6 +65,21 @@ LED subsystem core exposes following API for setting brightness:
 		blinking, returns -EBUSY if software blink fallback is enabled.
 
 
+LED registration API
+====================
+
+A driver wanting to register a LED classdev for use by other drivers /
+userspace needs to allocate and fill a led_classdev struct and then call
+[devm_]led_classdev_register. If the non devm version is used the driver
+must call led_classdev_unregister from its remove function before
+free-ing the led_classdev struct.
+
+If the driver can detect hardware initiated brightness changes and thus
+wants to have a brightness_hw_changed attribute then the LED_BRIGHT_HW_CHANGED
+flag must be set in flags before registering. Calling
+led_classdev_notify_brightness_hw_changed on a classdev not registered with
+the LED_BRIGHT_HW_CHANGED flag is a bug and will trigger a WARN_ON.
+
 Hardware accelerated blink of LEDs
 ==================================
 
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index c621cbb..275f467 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -29,6 +29,15 @@ config LEDS_CLASS_FLASH
 	  for the flash related features of a LED device. It can be built
 	  as a module.
 
+config LEDS_BRIGHTNESS_HW_CHANGED
+	bool "LED Class brightness_hw_changed attribute support"
+	depends on LEDS_CLASS
+	help
+	  This option enables support for the brightness_hw_changed attribute
+	  for led sysfs class devices under /sys/class/leds.
+
+	  See Documentation/ABI/testing/sysfs-class-led for details.
+
 comment "LED drivers"
 
 config LEDS_88PM860X
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 326ee6e..f2b0a80 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -103,6 +103,68 @@ static const struct attribute_group *led_groups[] = {
 	NULL,
 };
 
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+static ssize_t brightness_hw_changed_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	if (led_cdev->brightness_hw_changed == -1)
+		return -ENODATA;
+
+	return sprintf(buf, "%u\n", led_cdev->brightness_hw_changed);
+}
+
+static DEVICE_ATTR_RO(brightness_hw_changed);
+
+static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
+{
+	struct device *dev = led_cdev->dev;
+	int ret;
+
+	ret = device_create_file(dev, &dev_attr_brightness_hw_changed);
+	if (ret) {
+		dev_err(dev, "Error creating brightness_hw_changed\n");
+		return ret;
+	}
+
+	led_cdev->brightness_hw_changed_kn =
+		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
+	if (!led_cdev->brightness_hw_changed_kn) {
+		dev_err(dev, "Error getting brightness_hw_changed kn\n");
+		device_remove_file(dev, &dev_attr_brightness_hw_changed);
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static void led_remove_brightness_hw_changed(struct led_classdev *led_cdev)
+{
+	sysfs_put(led_cdev->brightness_hw_changed_kn);
+	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
+}
+
+void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cdev,
+					       enum led_brightness brightness)
+{
+	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
+		return;
+
+	led_cdev->brightness_hw_changed = brightness;
+	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
+}
+EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
+#else
+static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
+{
+	return 0;
+}
+static void led_remove_brightness_hw_changed(struct led_classdev *led_cdev)
+{
+}
+#endif
+
 /**
  * led_classdev_suspend - suspend an led_classdev.
  * @led_cdev: the led_classdev to suspend.
@@ -204,10 +266,21 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
+		ret = led_add_brightness_hw_changed(led_cdev);
+		if (ret) {
+			device_unregister(led_cdev->dev);
+			return ret;
+		}
+	}
+
 	led_cdev->work_flags = 0;
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	led_cdev->brightness_hw_changed = -1;
+#endif
 	mutex_init(&led_cdev->led_access);
 	/* add to the list of leds */
 	down_write(&leds_list_lock);
@@ -256,6 +329,9 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 
 	flush_work(&led_cdev->set_brightness_work);
 
+	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
+		led_remove_brightness_hw_changed(led_cdev);
+
 	device_unregister(led_cdev->dev);
 
 	down_write(&leds_list_lock);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 569cb53..c771153 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -13,6 +13,7 @@
 #define __LINUX_LEDS_H_INCLUDED
 
 #include <linux/device.h>
+#include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
@@ -46,6 +47,7 @@ struct led_classdev {
 #define LED_DEV_CAP_FLASH	(1 << 18)
 #define LED_HW_PLUGGABLE	(1 << 19)
 #define LED_PANIC_INDICATOR	(1 << 20)
+#define LED_BRIGHT_HW_CHANGED	(1 << 21)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -110,6 +112,11 @@ struct led_classdev {
 	bool			activated;
 #endif
 
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	int			 brightness_hw_changed;
+	struct kernfs_node	*brightness_hw_changed_kn;
+#endif
+
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
 };
@@ -422,4 +429,12 @@ static inline void ledtrig_cpu(enum cpu_led_event evt)
 }
 #endif
 
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+extern void led_classdev_notify_brightness_hw_changed(
+	struct led_classdev *led_cdev, enum led_brightness brightness);
+#else
+static inline void led_classdev_notify_brightness_hw_changed(
+	struct led_classdev *led_cdev, enum led_brightness brightness) { }
+#endif
+
 #endif		/* __LINUX_LEDS_H_INCLUDED */
-- 
2.9.3
