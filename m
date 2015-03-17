From: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 3/3] leds: Add ktd2692 flash LED driver
Date: Tue, 17 Mar 2015 17:45:51 +0900
Message-ID: <1426581951-11869-4-git-send-email-ingi2.kim@samsung.com>
References: <1426581951-11869-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1426581951-11869-1-git-send-email-ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: sakari.ailus-X3B1VOXEql0@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patch adds a driver to support the ktd2692 flash LEDs.
ktd2692 can control flash current by ExpressWire interface.

Signed-off-by: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/leds/Kconfig        |   9 +
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ktd2692.c | 522 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 532 insertions(+)
 create mode 100644 drivers/leds/leds-ktd2692.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 25b320d..9311cfc4 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -498,6 +498,15 @@ config LEDS_MENF21BMC
 	  This driver can also be built as a module. If so the module
 	  will be called leds-menf21bmc.
 
+config LEDS_KTD2692
+	tristate "Flash LED support for the KTD2692 Driver"
+	depends on LEDS_CLASS_FLASH && GPIOLIB
+	help
+	  This option enables support for the KTD2692 connected through
+	  ExpressWire Interface. Say Y to enabled these.
+	  It depends on LEDS_CLASS_FLASH for using flash led (strobe) and
+	  GPIOLIB for using gpio pin to control Expresswire interface
+
 comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index cbba921..289513b 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
 obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
 obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
+obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
new file mode 100644
index 0000000..8aa339c
--- /dev/null
+++ b/drivers/leds/leds-ktd2692.c
@@ -0,0 +1,522 @@
+/*
+ * LED driver : leds-ktd2692.c
+ *
+ * Copyright (C) 2015 Samsung Electronics
+ * Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/led-class-flash.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/workqueue.h>
+
+#define GET_BIT(bit, val)			(((val) >> (bit)) & 0x01)
+
+/* Value related the flash timeout */
+#define KTD2692_FLASH_TM_LEVELS			8
+#define KTD2692_DEFAULT_FLASH_TM_US		1049000
+#define KTD2692_MAX_FLASH_TM_US			1835000
+
+/* Macro for getting offset of flash timeout */
+#define GET_TIMEOUT_OFFSET(timeout, step)	((timeout) / (step))
+
+/* Adjust a multiple of brightness */
+#define KTD2692_BRIGHTNESS_RANGE_255_TO_16(x)	(((x) >> 4) & 0x0F)
+#define KTD2692_BRIGHTNESS_RANGE_255_TO_8(x)	(((x) >> 5) & 0x0F)
+#define KTD2692_BRIGHTNESS_RANGE_255_TO_4(x)	(((x) >> 6) & 0x0F)
+
+/* Base register address */
+#define KTD2692_REG_LVP_BASE			0x00
+#define KTD2692_REG_FLASH_TIMEOUT_BASE		0x20
+#define KTD2692_REG_MIN_CURRENT_SET_BASE	0x40
+#define KTD2692_REG_MOVIE_CURRENT_BASE		0x60
+#define KTD2692_REG_FLASH_CURRENT_BASE		0x80
+#define KTD2692_REG_MODE_BASE			0xA0
+
+/* Set bit coding time for expresswire interface */
+#define KTD2692_TIME_RESET_US			700
+#define KTD2692_TIME_DATA_START_TIME_US		10
+#define KTD2692_TIME_HIGH_END_OF_DATA_US	350
+#define KTD2692_TIME_LOW_END_OF_DATA_US		10
+#define KTD2692_TIME_SHORT_BITSET_US		4
+#define KTD2692_TIME_LONG_BITSET_US		12
+
+/* KTD2692 default length of name */
+#define KTD2692_NAME_LENGTH			20
+
+/* KTD2692 default name */
+#define KTD2692_DEFAULT_NAME			"ktd2692"
+
+enum ktd2692_bitset {
+	KTD2692_LOW = 0,
+	KTD2692_HIGH,
+};
+
+/* Low Voltage Protection Setting */
+enum ktd2692_lvp_setting {
+	KTD2692_LVP_DISABLE = 0,
+	KTD2692_LVP_3_2V,
+	KTD2692_LVP_3_3V,
+	KTD2692_LVP_3_4V,		/* default */
+	KTD2692_LVP_3_5V,
+	KTD2692_LVP_3_6V,
+	KTD2692_LVP_3_7V,
+	KTD2692_LVP_3_8V,
+};
+
+/* Flash Timeout Setting (msec) */
+enum ktd2692_timeout_setting {
+	KTD2692_TIMEOUT_DISABLE = 0,
+	KTD2692_TIMEOUT_262ms,
+	KTD2692_TIMEOUT_524ms,
+	KTD2692_TIMEOUT_786ms,
+	KTD2692_TIMEOUT_1049ms,		/* default */
+	KTD2692_TIMEOUT_1311ms,
+	KTD2692_TIMEOUT_1573ms,
+	KTD2692_TIMEOUT_1835ms,
+};
+
+/* Minimum Current Setting for Timer Operating */
+enum ktd2692_min_current_setting {
+	KTD2692_MIN_CURRENT_90mA = 0,
+	KTD2692_MIN_CURRENT_120mA,
+	KTD2692_MIN_CURRENT_150mA,
+	KTD2692_MIN_CURRENT_180mA,
+	KTD2692_MIN_CURRENT_210mA,
+	KTD2692_MIN_CURRENT_240mA,	/* default */
+	KTD2692_MIN_CURRENT_270mA,
+	KTD2692_MIN_CURRENT_300mA,
+};
+
+/* Movie current setting */
+enum ktd2692_movie_current_setting {
+	KTD2692_MOVIE_CURRENT_1 = 0,
+	KTD2692_MOVIE_CURRENT_2,
+	KTD2692_MOVIE_CURRENT_3,
+	KTD2692_MOVIE_CURRENT_4,
+	KTD2692_MOVIE_CURRENT_5,	/* default */
+	KTD2692_MOVIE_CURRENT_6,
+	KTD2692_MOVIE_CURRENT_7,
+	KTD2692_MOVIE_CURRENT_8,
+	KTD2692_MOVIE_CURRENT_9,
+	KTD2692_MOVIE_CURRENT_10,
+	KTD2692_MOVIE_CURRENT_11,
+	KTD2692_MOVIE_CURRENT_12,
+	KTD2692_MOVIE_CURRENT_13,
+	KTD2692_MOVIE_CURRENT_14,
+	KTD2692_MOVIE_CURRENT_15,
+	KTD2692_MOVIE_CURRENT_16,
+};
+
+/* Flash current setting */
+enum ktd2692_flash_current_setting {
+	KTD2692_FLASH_CURRENT_1 = 0,
+	KTD2692_FLASH_CURRENT_2,
+	KTD2692_FLASH_CURRENT_3,
+	KTD2692_FLASH_CURRENT_4,
+	KTD2692_FLASH_CURRENT_5,
+	KTD2692_FLASH_CURRENT_6,
+	KTD2692_FLASH_CURRENT_7,
+	KTD2692_FLASH_CURRENT_8,
+	KTD2692_FLASH_CURRENT_9,
+	KTD2692_FLASH_CURRENT_10,
+	KTD2692_FLASH_CURRENT_11,
+	KTD2692_FLASH_CURRENT_12,
+	KTD2692_FLASH_CURRENT_13,
+	KTD2692_FLASH_CURRENT_14,
+	KTD2692_FLASH_CURRENT_15,
+	KTD2692_FLASH_CURRENT_16,	/* default */
+};
+
+/* Movie / Flash Mode Control */
+enum ktd2692_mode_setting {
+	KTD2692_MODE_DISABLE = 0,	/* default */
+	KTD2692_MODE_MOVIE,
+	KTD2692_MODE_FLASH,
+};
+
+struct ktd2692_led_settings {
+	enum ktd2692_lvp_setting lvp;
+	enum ktd2692_min_current_setting min_current;
+	enum ktd2692_movie_current_setting movie_current;
+	enum ktd2692_flash_current_setting flash_current;
+	enum ktd2692_mode_setting mode;
+};
+
+struct ktd2692_flash_timeout_setting {
+	struct led_flash_setting flash_timeout;
+};
+
+struct ktd2692_context {
+	struct ktd2692_led_settings setting;
+	/* Related LED Flash class device */
+	struct led_classdev_flash fled_cdev;
+	struct mutex lock;
+	struct regulator *regulator;
+	struct work_struct work_brightness_set;
+
+	int ctrl_gpio;
+	u32 flash_timeout_us;
+	enum led_brightness torch_brightness;
+};
+
+static struct ktd2692_context *fled_cdev_to_led(
+				struct led_classdev_flash *fled_cdev)
+{
+	return container_of(fled_cdev, struct ktd2692_context, fled_cdev);
+}
+
+static int ktd2692_led_regulator_enable(struct ktd2692_context *led)
+{
+	struct led_classdev_flash *fled_cdev = &led->fled_cdev;
+	struct led_classdev *led_cdev = &fled_cdev->led_cdev;
+	int ret;
+
+	if (regulator_is_enabled(led->regulator) > 0)
+		return 0;
+
+	ret = regulator_enable(led->regulator);
+	if (ret)
+		dev_err(led_cdev->dev, "Failed to enable vin:%d\n", ret);
+
+	return ret;
+}
+
+static void ktd2692_led_regulator_disable(struct ktd2692_context *led)
+{
+	struct led_classdev_flash *fled_cdev = &led->fled_cdev;
+	struct led_classdev *led_cdev = &fled_cdev->led_cdev;
+	int ret;
+
+	if (!regulator_is_enabled(led->regulator))
+		return;
+
+	ret = regulator_disable(led->regulator);
+	if (ret)
+		dev_err(led_cdev->dev, "Failed to disable vin:%d\n", ret);
+}
+
+static void ktd2692_expresswire_start(struct ktd2692_context *led)
+{
+	gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
+	udelay(KTD2692_TIME_DATA_START_TIME_US);
+}
+
+static void ktd2692_expresswire_reset(struct ktd2692_context *led)
+{
+	gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
+	udelay(KTD2692_TIME_RESET_US);
+}
+
+static void ktd2692_expresswire_end(struct ktd2692_context *led)
+{
+	gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
+	udelay(KTD2692_TIME_LOW_END_OF_DATA_US);
+	gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
+	udelay(KTD2692_TIME_HIGH_END_OF_DATA_US);
+}
+
+static void ktd2692_expresswire_set_bit(struct ktd2692_context *led, bool bit)
+{
+	if (bit) {
+		gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
+		udelay(KTD2692_TIME_SHORT_BITSET_US);
+		gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
+		udelay(KTD2692_TIME_LONG_BITSET_US);
+	} else {
+		gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
+		udelay(KTD2692_TIME_LONG_BITSET_US);
+		gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
+		udelay(KTD2692_TIME_SHORT_BITSET_US);
+	}
+}
+
+static void ktd2692_expresswire_write(struct ktd2692_context *led, u8 value)
+{
+	int i;
+
+	ktd2692_expresswire_start(led);
+	for (i = 7; i >= 0; i--)
+		ktd2692_expresswire_set_bit(led, GET_BIT(i, value));
+	ktd2692_expresswire_end(led);
+}
+
+static void ktd2692_brightness_set(struct ktd2692_context *led,
+					enum led_brightness brightness)
+{
+	mutex_lock(&led->lock);
+
+	ktd2692_expresswire_reset(led);
+
+	if (brightness == LED_OFF) {
+		led->setting.mode = KTD2692_MODE_DISABLE;
+		led->fled_cdev.led_cdev.brightness = LED_OFF;
+		goto out;
+	}
+
+	if (brightness < 0 ||
+		brightness > led->fled_cdev.led_cdev.max_brightness) {
+		dev_err(led->fled_cdev.led_cdev.dev,
+			"Invalid brightness %d\n", brightness);
+		goto out;
+	}
+
+	led->setting.movie_current =
+			KTD2692_BRIGHTNESS_RANGE_255_TO_8(brightness);
+	ktd2692_expresswire_write(led, led->setting.movie_current
+			| KTD2692_REG_MOVIE_CURRENT_BASE);
+	ktd2692_expresswire_write(led, KTD2692_LVP_DISABLE
+			| KTD2692_REG_LVP_BASE);
+	ktd2692_expresswire_write(led, KTD2692_MIN_CURRENT_300mA
+			| KTD2692_REG_MIN_CURRENT_SET_BASE);
+	led->setting.mode = KTD2692_MODE_MOVIE;
+	ktd2692_expresswire_write(led,
+			led->setting.mode | KTD2692_REG_MODE_BASE);
+
+	led->fled_cdev.led_cdev.brightness = brightness;
+
+out:
+	mutex_unlock(&led->lock);
+}
+
+static void ktd2692_brightness_set_work(struct work_struct *work)
+{
+	struct ktd2692_context *led =
+		container_of(work, struct ktd2692_context, work_brightness_set);
+
+	ktd2692_brightness_set(led, led->torch_brightness);
+}
+
+static void ktd2692_led_brightness_set(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
+
+	led->torch_brightness = brightness;
+	schedule_work(&led->work_brightness_set);
+}
+
+static int ktd2692_led_brightness_set_sync(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
+
+	ktd2692_brightness_set(led, brightness);
+
+	return 0;
+}
+
+static enum led_brightness ktd2692_brightness_get(struct led_classdev *led_cdev)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
+
+	return led->fled_cdev.led_cdev.brightness;
+}
+
+static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
+						bool state)
+{
+	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
+	struct led_flash_setting *timeout = &fled_cdev->timeout;
+	u32 flash_tm_reg;
+
+	mutex_lock(&led->lock);
+
+	ktd2692_expresswire_reset(led);
+
+	if (state == 0)
+		goto out;
+
+	led->setting.mode = KTD2692_MODE_FLASH;
+	flash_tm_reg = GET_TIMEOUT_OFFSET(timeout->val, timeout->step);
+
+	ktd2692_expresswire_write(led, led->setting.lvp
+			| KTD2692_REG_LVP_BASE);
+	ktd2692_expresswire_write(led, led->setting.min_current
+			| KTD2692_REG_MIN_CURRENT_SET_BASE);
+	ktd2692_expresswire_write(led, flash_tm_reg
+			| KTD2692_REG_FLASH_TIMEOUT_BASE);
+	ktd2692_expresswire_write(led, led->setting.flash_current
+			| KTD2692_REG_FLASH_CURRENT_BASE);
+	ktd2692_expresswire_write(led, led->setting.mode
+			| KTD2692_REG_MODE_BASE);
+
+	fled_cdev->led_cdev.brightness = LED_OFF;
+	led->setting.mode = KTD2692_MODE_DISABLE;
+
+out:
+	mutex_unlock(&led->lock);
+	return 0;
+}
+
+static int ktd2692_led_flash_timeout_set(struct led_classdev_flash *fled_cdev,
+						u32 timeout)
+{
+	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
+
+	led->fled_cdev.timeout.val = timeout;
+
+	return 0;
+}
+
+static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	led->ctrl_gpio = of_get_named_gpio(np, "ctrl-gpio", 0);
+	if (!gpio_is_valid(led->ctrl_gpio)) {
+		dev_err(dev, "no strobe_gpio property found\n");
+		return -EINVAL;
+	}
+
+	ret = devm_gpio_request_one(dev, led->ctrl_gpio,
+					GPIOF_OPEN_SOURCE, "ctrl-gpio");
+	if (ret) {
+		dev_err(dev, "failed to request ctrl-gpio %d error %d\n",
+				led->ctrl_gpio, ret);
+		return ret;
+	}
+
+	ret = of_property_read_u32(np, "flash-timeout-us",
+				&led->flash_timeout_us);
+	/* default setting */
+	if (ret)
+		led->flash_timeout_us = KTD2692_DEFAULT_FLASH_TM_US;
+
+	return 0;
+}
+
+static void ktd2692_init_flash_timeout_set(u32 flash_timeout_us,
+					struct ktd2692_flash_timeout_setting *s)
+{
+	struct led_flash_setting *setting;
+
+	setting = &s->flash_timeout;
+	setting->min = KTD2692_TIMEOUT_DISABLE;
+	setting->max = KTD2692_MAX_FLASH_TM_US;
+	setting->step = KTD2692_MAX_FLASH_TM_US / (KTD2692_FLASH_TM_LEVELS - 1);
+	setting->val = flash_timeout_us;
+}
+
+static const struct led_flash_ops flash_ops = {
+	.strobe_set = ktd2692_led_flash_strobe_set,
+	.timeout_set = ktd2692_led_flash_timeout_set,
+};
+
+static int ktd2692_probe(struct platform_device *pdev)
+{
+	struct ktd2692_context *led;
+	struct led_classdev *led_cdev;
+	struct led_classdev_flash *fled_cdev;
+	struct ktd2692_flash_timeout_setting timeout_setting;
+	int ret;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	if (!pdev->dev.of_node)
+		return -ENXIO;
+
+	fled_cdev = &led->fled_cdev;
+	led_cdev = &fled_cdev->led_cdev;
+	platform_set_drvdata(pdev, led);
+
+	ret = ktd2692_parse_dt(led, &pdev->dev);
+	if (ret)
+		return ret;
+
+	led->regulator = devm_regulator_get(&pdev->dev, "vin");
+	if (IS_ERR(led->regulator)) {
+		dev_err(&pdev->dev, "regulator get failed\n");
+		ret = PTR_ERR(led->regulator);
+		led->regulator = NULL;
+		return ret;
+	}
+
+	ret = ktd2692_led_regulator_enable(led);
+	if (ret)
+		goto err_regulator;
+
+	ktd2692_init_flash_timeout_set(led->flash_timeout_us, &timeout_setting);
+	fled_cdev->timeout = timeout_setting.flash_timeout;
+	fled_cdev->ops = &flash_ops;
+
+	led->setting.lvp = KTD2692_LVP_DISABLE;
+	led->setting.min_current = KTD2692_MIN_CURRENT_240mA;
+	led->setting.flash_current = KTD2692_FLASH_CURRENT_7;
+	led->setting.mode = KTD2692_MODE_DISABLE;
+
+	led_cdev->name = KTD2692_DEFAULT_NAME;
+	led_cdev->brightness = LED_OFF;
+	led_cdev->max_brightness = LED_FULL;
+	led_cdev->brightness_set = ktd2692_led_brightness_set;
+	led_cdev->brightness_set_sync = ktd2692_led_brightness_set_sync;
+	led_cdev->brightness_get = ktd2692_brightness_get;
+	led_cdev->flags |= LED_DEV_CAP_FLASH;
+	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
+
+	INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_work);
+
+	ret = led_classdev_flash_register(&pdev->dev, fled_cdev);
+	if (ret) {
+		dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->name);
+		goto err_register;
+	}
+
+	mutex_init(&led->lock);
+
+	return 0;
+err_register:
+	cancel_work_sync(&led->work_brightness_set);
+err_regulator:
+	ktd2692_led_regulator_disable(led);
+	platform_set_drvdata(pdev, NULL);
+	return ret;
+}
+
+static int ktd2692_remove(struct platform_device *pdev)
+{
+	struct ktd2692_context *led = platform_get_drvdata(pdev);
+
+	cancel_work_sync(&led->work_brightness_set);
+	led_classdev_flash_unregister(&led->fled_cdev);
+	ktd2692_led_regulator_disable(led);
+
+	mutex_destroy(&led->lock);
+
+	return 0;
+}
+
+static const struct of_device_id ktd2692_match[] = {
+	{ .compatible = "kinetic,ktd2692", },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver ktd2692_driver = {
+	.driver = {
+		.name  = "leds-ktd2692",
+		.of_match_table = ktd2692_match,
+	},
+	.probe  = ktd2692_probe,
+	.remove = ktd2692_remove,
+};
+
+module_platform_driver(ktd2692_driver);
+
+MODULE_AUTHOR("Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
+MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
+MODULE_LICENSE("GPL v2");
-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
