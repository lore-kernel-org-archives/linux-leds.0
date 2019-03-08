From: Nick Crews <ncrews@chromium.org>
Subject: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Fri,  8 Mar 2019 13:38:02 -0700
Message-ID: <20190308203801.57920-1-ncrews@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: enric.balletbo@collabora.com, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, dlaurie@chromium.org, derat@google.com, groeck@google.com, dtor@google.com, Nick Crews <ncrews@chromium.org>
List-Id: linux-leds@vger.kernel.org

This patch is meant to be applied on top of the for-next
branch of the platform/chrome repository, as it uses some of
the code staged there.

The EC is in charge of controlling the keyboard backlight on
the Wilco platform. We expose a standard LED class device at
/sys/class/leds/wilco::kbd_backlight. This driver is modeled
after the standard Chrome OS keyboard backlight driver at
drivers/platform/chrome/cros_kbd_led_backlight.c

Some Wilco devices do not support a keyboard backlight. This
is checked in probe(), and in this case the sysfs entry will
not appear, and everything will behave normally.

When the EC is reset (loses all AC and battery power), it will
restart in some unpredictable state. The brightness on the
keyboard could be anything, and reading the brightness
from the EC is undefined behavior. Therefore, at startup the
brightness should be set, and then everything will work.

Signed-off-by: Nick Crews <ncrews@chromium.org>
---
 drivers/platform/chrome/wilco_ec/Kconfig      |   9 +
 drivers/platform/chrome/wilco_ec/Makefile     |   2 +
 drivers/platform/chrome/wilco_ec/core.c       |  14 ++
 .../chrome/wilco_ec/kbd_led_backlight.c       | 191 ++++++++++++++++++
 include/linux/platform_data/wilco-ec.h        |   2 +
 5 files changed, 218 insertions(+)
 create mode 100644 drivers/platform/chrome/wilco_ec/kbd_led_backlight.c

diff --git a/drivers/platform/chrome/wilco_ec/Kconfig b/drivers/platform/chrome/wilco_ec/Kconfig
index e09e4cebe9b4..15b56f5ce090 100644
--- a/drivers/platform/chrome/wilco_ec/Kconfig
+++ b/drivers/platform/chrome/wilco_ec/Kconfig
@@ -18,3 +18,12 @@ config WILCO_EC_DEBUGFS
 	  manipulation and allow for testing arbitrary commands.  This
 	  interface is intended for debug only and will not be present
 	  on production devices.
+
+config WILCO_EC_KBD_BACKLIGHT
+	tristate "Enable keyboard led backlight control"
+	depends on WILCO_EC
+	help
+	  If you say Y here, you get support to set the keyboard backlight led
+	  brightness. This happens via a standard LED driver that uses the
+	  Wilco EC mailbox interface. A standard led class device will
+	  appear under /sys/class/leds/wilco::kbd_backlight
diff --git a/drivers/platform/chrome/wilco_ec/Makefile b/drivers/platform/chrome/wilco_ec/Makefile
index 063e7fb4ea17..8436539813cd 100644
--- a/drivers/platform/chrome/wilco_ec/Makefile
+++ b/drivers/platform/chrome/wilco_ec/Makefile
@@ -4,3 +4,5 @@ wilco_ec-objs				:= core.o mailbox.o
 obj-$(CONFIG_WILCO_EC)			+= wilco_ec.o
 wilco_ec_debugfs-objs			:= debugfs.o
 obj-$(CONFIG_WILCO_EC_DEBUGFS)		+= wilco_ec_debugfs.o
+wilco_kbd_backlight-objs		:= kbd_led_backlight.o
+obj-$(CONFIG_WILCO_EC_KBD_BACKLIGHT)	+= wilco_kbd_backlight.o
diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
index 05e1e2be1c91..5cfe0a422c8a 100644
--- a/drivers/platform/chrome/wilco_ec/core.c
+++ b/drivers/platform/chrome/wilco_ec/core.c
@@ -89,8 +89,21 @@ static int wilco_ec_probe(struct platform_device *pdev)
 		goto unregister_debugfs;
 	}
 
+	/* Register child dev to be found by the keyboard backlight driver. */
+	ec->kbbl_pdev = platform_device_register_data(dev,
+						      "wilco-kbd-backlight",
+						      PLATFORM_DEVID_AUTO,
+						      NULL, 0);
+	if (IS_ERR(ec->kbbl_pdev)) {
+		dev_err(dev, "Failed to create keyboard backlight pdev\n");
+		ret = PTR_ERR(ec->kbbl_pdev);
+		goto unregister_rtc;
+	}
+
 	return 0;
 
+unregister_rtc:
+	platform_device_unregister(ec->rtc_pdev);
 unregister_debugfs:
 	if (ec->debugfs_pdev)
 		platform_device_unregister(ec->debugfs_pdev);
@@ -102,6 +115,7 @@ static int wilco_ec_remove(struct platform_device *pdev)
 {
 	struct wilco_ec_device *ec = platform_get_drvdata(pdev);
 
+	platform_device_unregister(ec->kbbl_pdev);
 	platform_device_unregister(ec->rtc_pdev);
 	if (ec->debugfs_pdev)
 		platform_device_unregister(ec->debugfs_pdev);
diff --git a/drivers/platform/chrome/wilco_ec/kbd_led_backlight.c b/drivers/platform/chrome/wilco_ec/kbd_led_backlight.c
new file mode 100644
index 000000000000..586e4258d78e
--- /dev/null
+++ b/drivers/platform/chrome/wilco_ec/kbd_led_backlight.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Keyboard backlight LED driver for the Wilco Embedded Controller
+ *
+ * Copyright 2019 Google LLC
+ *
+ * The EC is in charge of controlling the keyboard backlight on
+ * the Wilco platform. We expose a standard LED class device at
+ * /sys/class/leds/wilco::kbd_backlight. Power Manager normally
+ * controls the backlight by writing a percentage in range [0, 100]
+ * to the brightness property. This driver is modeled after the
+ * standard Chrome OS keyboard backlight driver at
+ * drivers/platform/chrome/cros_kbd_led_backlight.c
+ *
+ * Some Wilco devices do not support a keyboard backlight. This
+ * is checked in probe(), and in this case the sysfs entry will
+ * not appear, and everything will behave normally.
+ *
+ * When the EC is reset (loses all AC and battery power), it will
+ * restart in some unpredictable state. The brightness on the
+ * keyboard could be anything, and reading the brightness
+ * from the EC is undefined behavior. Therefore, at startup the
+ * brightness should be set, and then everything will work.
+ */
+
+#include <linux/leds.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/platform_data/wilco-ec.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define DRV_NAME		"wilco-kbd-backlight"
+
+#define EC_COMMAND_KB_BKLIGHT	0x75
+#define KBBL_MSG_SIZE		16
+/* The EC can set the backlight brightness in several different modes.
+The mode we care about is PWM mode, where we separately supply a
+literal percentage to set the brightness to. We need to set the proper
+KBBL_PWM_MODE flag in the KBBL_MODE_INDEX-th byte in the message, and
+then supply the percentage within the KBBL_BRIGHTNESS_INDEX-th byte
+within the message. When we read the brightness, the percentage is
+returned in this same byte location. */
+#define KBBL_PWM_MODE		BIT(1)	/* flag to set brightness by percent */
+#define KBBL_MODE_INDEX		2	/* location of mode flags */
+#define KBBL_BRIGHTNESS_INDEX	7	/* location of brightness percent */
+
+/* What action do we want the EC to perform? */
+enum kbbl_subcommand {
+	KBBL_GET_FEATURES = 0x00,
+	KBBL_GET_STATE = 0x01,
+	KBBL_SET_STATE = 0x02,
+};
+
+struct wilco_keyboard_led_data {
+	struct wilco_ec_device *ec;
+	struct led_classdev led;
+};
+
+static void keyboard_led_set_brightness(struct led_classdev *cdev,
+					enum led_brightness brightness)
+{
+	u8 request[KBBL_MSG_SIZE];
+	struct wilco_ec_message msg;
+	struct wilco_keyboard_led_data *data;
+	int ret;
+
+	memset(&request, 0, sizeof(request));
+	request[0] = KBBL_SET_STATE;
+	request[KBBL_MODE_INDEX] = KBBL_PWM_MODE;
+	request[KBBL_BRIGHTNESS_INDEX] = brightness;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.type = WILCO_EC_MSG_LEGACY;
+	msg.command = EC_COMMAND_KB_BKLIGHT;
+	msg.request_data = &request;
+	msg.request_size = sizeof(request);
+	msg.response_size = 0;
+
+	data = container_of(cdev, struct wilco_keyboard_led_data, led);
+	ret = wilco_ec_mailbox(data->ec, &msg);
+	if (ret < 0)
+		dev_err(cdev->dev, "Failed setting keyboard brightness: %d",
+			ret);
+}
+
+static enum led_brightness
+keyboard_led_get_brightness(struct led_classdev *cdev)
+{
+	u8 request = KBBL_GET_STATE;
+	u8 response[KBBL_MSG_SIZE];
+	struct wilco_ec_message msg;
+	struct wilco_keyboard_led_data *data;
+	int ret;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.type = WILCO_EC_MSG_LEGACY;
+	msg.command = EC_COMMAND_KB_BKLIGHT;
+	msg.request_data = &request;
+	msg.request_size = sizeof(request);
+	msg.response_data = &response;
+	msg.response_size = sizeof(response);
+
+	data = container_of(cdev, struct wilco_keyboard_led_data, led);
+	ret = wilco_ec_mailbox(data->ec, &msg);
+	if (ret < 0) {
+		dev_err(cdev->dev, "Failed getting keyboard brightness: %d",
+			ret);
+		/*
+		 * The LED core doesn't actually do anything with this,
+		 * it just fails to update the brightness field of the
+		 * led_classdev. In that case the old value will be displayed,
+		 * which was initialized to 0 at probe().
+		 */
+		return ret;
+	}
+
+	return response[KBBL_BRIGHTNESS_INDEX];
+}
+
+static inline bool keyboard_leds_exist(struct wilco_ec_device *ec)
+{
+	u8 request = KBBL_GET_FEATURES;
+	u8 response;
+	struct wilco_ec_message msg;
+	int ret;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.flags = WILCO_EC_FLAG_RAW_RESPONSE;
+	msg.type = WILCO_EC_MSG_LEGACY;
+	msg.command = EC_COMMAND_KB_BKLIGHT;
+	msg.request_data = &request;
+	msg.request_size = sizeof(request);
+	msg.response_data = &response;
+	msg.response_size = sizeof(response);
+
+	ret = wilco_ec_mailbox(ec, &msg);
+	if (ret < 0) {
+		dev_err(ec->dev,
+			"Failed checking keyboard backlight support: %d", ret);
+		return false;
+	}
+
+	/* EC returns 0xFF in MBOX[0] if backlight is not supported. */
+	return response != 0xFF;
+}
+
+static int keyboard_led_probe(struct platform_device *pdev)
+{
+	struct wilco_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
+	struct wilco_keyboard_led_data *data;
+	int error;
+
+	if (!keyboard_leds_exist(ec))
+		return -ENXIO;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->ec = ec;
+	/* To get recognized by Power Manager needs to have "*:kbd_backlight" */
+	data->led.name = "wilco::kbd_backlight";
+	data->led.max_brightness = 100;
+	/* Init so if led.brightness_get() fails, we have default val to show */
+	data->led.brightness = 0;
+	data->led.flags = LED_CORE_SUSPENDRESUME;
+	data->led.brightness_set = keyboard_led_set_brightness;
+	data->led.brightness_get = keyboard_led_get_brightness;
+
+	error = devm_led_classdev_register(&pdev->dev, &data->led);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static struct platform_driver keyboard_led_driver = {
+	.driver = {
+		.name = DRV_NAME,
+	},
+	.probe = keyboard_led_probe,
+};
+module_platform_driver(keyboard_led_driver);
+
+MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
+MODULE_DESCRIPTION("Wilco keyboard backlight LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/include/linux/platform_data/wilco-ec.h b/include/linux/platform_data/wilco-ec.h
index 446473a46b88..3da6af3e362b 100644
--- a/include/linux/platform_data/wilco-ec.h
+++ b/include/linux/platform_data/wilco-ec.h
@@ -36,6 +36,7 @@
  * @data_size: Size of the data buffer used for EC communication.
  * @debugfs_pdev: The child platform_device used by the debugfs sub-driver.
  * @rtc_pdev: The child platform_device used by the RTC sub-driver.
+ * @kbbl_pdev: The child pdev used by the keyboard backlight sub-driver.
  */
 struct wilco_ec_device {
 	struct device *dev;
@@ -47,6 +48,7 @@ struct wilco_ec_device {
 	size_t data_size;
 	struct platform_device *debugfs_pdev;
 	struct platform_device *rtc_pdev;
+	struct platform_device *kbbl_pdev;
 };
 
 /**
-- 
2.20.1
