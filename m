From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v4 1/4] leds: core: add generic support for RGB Color LED's
Date: Thu, 25 Feb 2016 23:11:49 +0100
Message-ID: <56CF7C25.4060707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34007 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbcBYWRe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 25 Feb 2016 17:17:34 -0500
Received: by mail-wm0-f67.google.com with SMTP id b205so6027227wmb.1
        for <linux-leds@vger.kernel.org>; Thu, 25 Feb 2016 14:17:33 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Add generic support for RGB Color LED's.

Basic idea is to use enum led_brightness also for the hue and saturation
color components.This allows to implement the color extension w/o
changes to struct led_classdev.

Select LEDS_RGB to enable building drivers using the RGB extension.

Flag LED_SET_HUE_SAT allows to specify that hue / saturation
should be overridden even if the provided values are zero.

Some examples for writing values to /sys/class/leds/<xx>/brightness:
(now also hex notation can be used)

255 -> set full brightness and keep existing color if set
0 -> switch LED off but keep existing color so that it can be restored
     if the LED is switched on again later
0x1000000 -> switch LED off and set also hue and saturation to 0
0x00ffff -> set full brightness, full saturation and set hue to 0 (red)

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- move extension-specific code into a separate source file and
  introduce config symbol LEDS_HSV for it
- create separate patch for the extension to sysfs
- use variable name led_cdev as in the rest if the core
- rename to_hsv to led_validate_brightness
- rename LED_BRIGHTNESS_SET_COLOR to LED_SET_HSV
- introduce helper is_off for checking whether V part
  of a HSV value is zero
v3:
- change Kconfig to use depend instead of select, add help message,
  and change config symbol to LEDS_COLOR
- change LED core object file name in Makefile
- rename flag LED_SET_HSV to LED_SET_COLOR
- rename is_off to led_is_off
- rename led_validate-brightness to led_confine_brightness
- rename variable in led_confine_brightness
- add dummy enum led_brightness value to enforce 32bit enum
- rename led-hsv-core.c to led-color-core.c
- move check of provided brightness value to led_confine_brightness
v4:
- change config symbol name to LEDS_RGB
- change name of new file to led-rgb-core.c
- factor out part of led_confine_brightness
- change led_is_off to __is_set_brightness
- in led_set_software_blink pass led_cdev->max_brightness instead of LED_FULL
- rename LED_SET_COLOR to LED_SET_HUE_SAT
---
 drivers/leds/Kconfig        | 11 +++++++++++
 drivers/leds/Makefile       |  4 +++-
 drivers/leds/led-class.c    |  2 +-
 drivers/leds/led-core.c     | 16 +++++++++-------
 drivers/leds/led-rgb-core.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/leds/leds.h         | 17 +++++++++++++++++
 include/linux/leds.h        |  9 +++++++++
 7 files changed, 92 insertions(+), 9 deletions(-)
 create mode 100644 drivers/leds/led-rgb-core.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 7f940c2..4a4f1b2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -13,6 +13,13 @@ menuconfig NEW_LEDS
 
 if NEW_LEDS
 
+config LEDS_RGB
+	bool "RGB Color LED Support"
+	help
+	 This option enables support for RGB Color LED devices.
+	 Sysfs attribute brightness is interpreted as a HSV color value.
+	 For details see Documentation/leds/leds-class.txt.
+
 config LEDS_CLASS
 	tristate "LED Class Support"
 	help
@@ -29,6 +36,10 @@ config LEDS_CLASS_FLASH
 	  for the flash related features of a LED device. It can be built
 	  as a module.
 
+if LEDS_RGB
+comment "RGB Color LED drivers"
+endif # LEDS_RGB
+
 comment "LED drivers"
 
 config LEDS_88PM860X
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index e9d5309..cc3676f 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -1,6 +1,8 @@
 
 # LED Core
-obj-$(CONFIG_NEW_LEDS)			+= led-core.o
+obj-$(CONFIG_NEW_LEDS)			+= led-core-objs.o
+led-core-objs-y				:= led-core.o
+led-core-objs-$(CONFIG_LEDS_RGB)	+= led-rgb-core.o
 obj-$(CONFIG_LEDS_CLASS)		+= led-class.o
 obj-$(CONFIG_LEDS_CLASS_FLASH)		+= led-class-flash.o
 obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index aa84e5b..007a5b3 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -53,7 +53,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (ret)
 		goto unlock;
 
-	if (state == LED_OFF)
+	if (!__is_brightness_set(state))
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
 
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 3495d5d..e75b0c8 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -62,7 +62,7 @@ static void led_timer_function(unsigned long data)
 	}
 
 	brightness = led_get_brightness(led_cdev);
-	if (!brightness) {
+	if (!__is_brightness_set(brightness)) {
 		/* Time to switch the LED on. */
 		brightness = led_cdev->blink_brightness;
 		delay = led_cdev->blink_delay_on;
@@ -133,8 +133,9 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 	if (current_brightness)
 		led_cdev->blink_brightness = current_brightness;
 	if (!led_cdev->blink_brightness)
-		led_cdev->blink_brightness = led_cdev->max_brightness;
-
+		led_cdev->blink_brightness =
+				led_confine_brightness(led_cdev,
+						led_cdev->max_brightness);
 	led_cdev->blink_delay_on = delay_on;
 	led_cdev->blink_delay_off = delay_off;
 
@@ -235,12 +236,13 @@ void led_set_brightness(struct led_classdev *led_cdev,
 		 * work queue task to avoid problems in case we are called
 		 * from hard irq context.
 		 */
-		if (brightness == LED_OFF) {
+		if (!__is_brightness_set(brightness)) {
 			led_cdev->flags |= LED_BLINK_DISABLE;
 			schedule_work(&led_cdev->set_brightness_work);
 		} else {
 			led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
-			led_cdev->blink_brightness = brightness;
+			led_cdev->blink_brightness =
+				led_confine_brightness(led_cdev, brightness);
 		}
 		return;
 	}
@@ -265,7 +267,7 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 				enum led_brightness value)
 {
-	led_cdev->brightness = min(value, led_cdev->max_brightness);
+	led_cdev->brightness = led_confine_brightness(led_cdev, value);
 
 	if (led_cdev->flags & LED_SUSPENDED)
 		return;
@@ -280,7 +282,7 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
 
-	led_cdev->brightness = min(value, led_cdev->max_brightness);
+	led_cdev->brightness = led_confine_brightness(led_cdev, value);
 
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
diff --git a/drivers/leds/led-rgb-core.c b/drivers/leds/led-rgb-core.c
new file mode 100644
index 0000000..b81daeb
--- /dev/null
+++ b/drivers/leds/led-rgb-core.c
@@ -0,0 +1,42 @@
+/*
+ * LED Class Color Support
+ *
+ * Author: Heiner Kallweit <hkallweit1@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include "leds.h"
+
+#define LED_HUE_SAT_MASK	0x00ffff00
+
+/*
+ * The color extension handles RGB LEDs but uses a HSV color model internally.
+ * led_rgb_adjust_hue_sat sets hue and saturation part of the HSV color value.
+ */
+static enum led_brightness led_rgb_adjust_hue_sat(struct led_classdev *led_cdev,
+						  enum led_brightness value)
+{
+	/* LED_SET_HUE_SAT sets hue and saturation even if both are zero */
+	if (value & LED_SET_HUE_SAT || value > LED_FULL)
+		return value & LED_HUE_SAT_MASK;
+	else
+		return led_cdev->brightness & ~LED_BRIGHTNESS_MASK;
+}
+
+enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
+					   enum led_brightness value)
+{
+	enum led_brightness brightness = 0;
+
+	if (led_cdev->flags & LED_DEV_CAP_HSV)
+		brightness = led_rgb_adjust_hue_sat(led_cdev, value);
+
+	return brightness |
+	       min(value & LED_BRIGHTNESS_MASK, led_cdev->max_brightness);
+}
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index db3f20d..f3a8ed5 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -16,17 +16,34 @@
 #include <linux/rwsem.h>
 #include <linux/leds.h>
 
+#define LED_BRIGHTNESS_MASK	0x000000ff
+
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
 	return led_cdev->brightness;
 }
 
+static inline bool __is_brightness_set(enum led_brightness brightness)
+{
+	return (brightness & LED_BRIGHTNESS_MASK) != LED_OFF;
+}
+
 void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev,
 				enum led_brightness value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 				enum led_brightness value);
+#if IS_ENABLED(CONFIG_LEDS_RGB)
+enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
+					   enum led_brightness value);
+#else
+static inline enum led_brightness led_confine_brightness(
+		struct led_classdev *led_cdev, enum led_brightness value)
+{
+	return min(value, led_cdev->max_brightness);
+}
+#endif
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index f203a8f..1e98b2e 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -29,8 +29,16 @@ enum led_brightness {
 	LED_OFF		= 0,
 	LED_HALF	= 127,
 	LED_FULL	= 255,
+	/*
+	 * dummy enum value to make gcc use a 32 bit type for the enum
+	 * even if compiled with -fshort-enums. This is needed for
+	 * the enum to store hsv values.
+	 */
+	LED_LEVEL_DUMMY	= 0xffffffff,
 };
 
+#define LED_SET_HUE_SAT		BIT(24)
+
 struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
@@ -50,6 +58,7 @@ struct led_classdev {
 #define LED_SYSFS_DISABLE	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
 #define LED_HW_PLUGGABLE	(1 << 24)
+#define LED_DEV_CAP_HSV		(1 << 25)
 
 	/* Set LED brightness level
 	 * Must not sleep. Use brightness_set_blocking for drivers
-- 
2.7.1
