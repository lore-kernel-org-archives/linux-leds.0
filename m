From: Dmitry Bondar <bond@simicon.com>
Subject: [PATCH] Add LED driven by multiple gpio.
Date: Mon, 25 Apr 2016 11:14:38 +0300
Message-ID: <1461572078.2269.2.camel@dlinux>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-HsImRLDRMDqdP6N29C8u"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.simicon.com ([85.143.184.139]:40997 "EHLO mail.simicon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753894AbcDYI36 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 25 Apr 2016 04:29:58 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>


--=-HsImRLDRMDqdP6N29C8u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello, on our board we have one LED with 2 gpio connected to it:
 - when gpio0 is on and gpio1 on - LED is orange.
 - when gpio0 is on and gpio1 off - LED is green.
 - when gpio0 is off and gpio1 on - LED is red.
 - when gpio0 is off and gpio1 off - LED is off.
We want use led_trigger (nand-disk) on this LED.
Below patch which we use for get one LED on 2 gpios.
Can be this in mainline, or may be exist other - better way?

-- 
Dmitry Bondar, 
simicon.com

--=-HsImRLDRMDqdP6N29C8u
Content-Disposition: attachment; filename="0000-cover-letter.patch"
Content-Type: text/x-patch; name="0000-cover-letter.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 27f61d2bf3264f1434c0e568c5adb82fafc591b1 Mon Sep 17 00:00:00 2001
From: Dmitry Bondar <bond@simicon.ru>
Date: Fri, 22 Apr 2016 18:33:44 +0300
Subject: [PATCH 0/2] Add LED driven by multiple gpio

Hello, on our board we have one LED with 2 gpio connected to it:
 - when gpio0 is on and gpio1 on - LED is orange.
 - when gpio0 is on and gpio1 off - LED is green.
 - when gpio0 is off and gpio1 on - LED is red.
 - when gpio0 is off and gpio1 off - LED is off.
We want use led_trigger (nand-disk) on this LED.
Below patch which we use for get one LED on 2 gpios.
Can be this in mainline, or may be exist other - better way?


Dmitry Bondar (2):
  add multiple gpio led(mgpio-led) description to device tree
  add multiple gpio led(mgpio-led) driver

 .../devicetree/bindings/leds/leds-mgpio.txt        |   31 ++++
 drivers/leds/Kconfig                               |    8 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/leds-mgpio.c                          |  191 ++++++++++++++++++++
 4 files changed, 231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mgpio.txt
 create mode 100644 drivers/leds/leds-mgpio.c

-- 
1.7.10.4


--=-HsImRLDRMDqdP6N29C8u
Content-Disposition: attachment;
	filename*0=0001-add-multiple-gpio-led-mgpio-led-description-to-devic.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-add-multiple-gpio-led-mgpio-led-description-to-devic.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 359cf82ccd8ca100b4330596843af17fbaa85a9e Mon Sep 17 00:00:00 2001
From: Dmitry Bondar <bond@simicon.ru>
Date: Fri, 22 Apr 2016 17:46:33 +0300
Subject: [PATCH 1/2] Add LED driven by multiple gpio
 led(mgpio-led) description to
 device tree

---
 .../devicetree/bindings/leds/leds-mgpio.txt        |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mgpio.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-mgpio.txt b/Documentation/devicetree/bindings/leds/leds-mgpio.txt
new file mode 100644
index 0000000..135d810
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mgpio.txt
@@ -0,0 +1,31 @@
+LED connected to multiple GPIO lines
+For example red/green/orange led with to 2 gpio connectd to it.
+
+Required properties:
+- compatible : should be "mgpio-led".
+- gpios :  Should specify the LED's GPIOs, see "gpios property" in
+  Documentation/devicetree/bindings/gpio/gpio.txt.  Active low LEDs should be
+  indicated using flags in the GPIO specifier.
+- color_names: list of colors
+- color_vals: list of gpio values for each color
+  in example below for red led gpio 23 must be 0 and gpio 8 must be 1
+
+Optional properties:
+- label :
+  see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger :
+  see Documentation/devicetree/bindings/leds/common.txt
+- default-color
+  string from color-names
+Examples:
+
+led_uplink{
+        compatible = "simicon,mgpio-led";
+        label = "uplink";
+        gpios = <&portb 23 GPIO_ACTIVE_HIGH>, <&portb 8 GPIO_ACTIVE_HIGH>;
+        color_vals =  <1 1>, <0 1>, <1 0>;
+        color_names = "orange", "red", "green";
+        default-color = "green";
+        linux,default-trigger = "heartbeat";
+};
+
-- 
1.7.10.4


--=-HsImRLDRMDqdP6N29C8u
Content-Disposition: attachment; filename="0002-add-multiple-gpio-led-mgpio-led-driver.patch"
Content-Type: text/x-patch; name="0002-add-multiple-gpio-led-mgpio-led-driver.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 27f61d2bf3264f1434c0e568c5adb82fafc591b1 Mon Sep 17 00:00:00 2001
From: Dmitry Bondar <bond@simicon.ru>
Date: Fri, 22 Apr 2016 17:50:04 +0300
Subject: [PATCH 2/2] Add LED driven by multiple gpio
 led(mgpio-led) driver

---
 drivers/leds/Kconfig      |    8 ++
 drivers/leds/Makefile     |    1 +
 drivers/leds/leds-mgpio.c |  191 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 200 insertions(+)
 create mode 100644 drivers/leds/leds-mgpio.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 2251478..33ce940 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -616,6 +616,14 @@ config LEDS_VERSATILE
 	  This option enabled support for the LEDs on the ARM Versatile
 	  and RealView boards. Say Y to enabled these.
 
+config LEDS_MGPIO
+	tristate "LED driven by multiple gpio"
+	depends on LEDS_CLASS
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  This option enables support for the LEDs connected to
+	  multiple GPIO outputs.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index cb2013d..e6189e2 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
+obj-$(CONFIG_LEDS_MGPIO)		+= leds-mgpio.c
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-mgpio.c b/drivers/leds/leds-mgpio.c
new file mode 100644
index 0000000..9055af0
--- /dev/null
+++ b/drivers/leds/leds-mgpio.c
@@ -0,0 +1,191 @@
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/leds.h>
+#include <linux/of.h>
+#include <linux/device.h>
+
+struct ledmgpio_state {
+	struct device_node *of_node;
+	struct gpio_descs *gpios;
+	struct led_classdev led;
+	int *color_vals; /*color to gpios values*/
+
+	int color; /*current color*/
+};
+
+static ssize_t show_dev_attr_color(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct ledmgpio_state *s =
+			container_of(cdev, struct ledmgpio_state, led);
+	const char *string;
+	int ret;
+
+	ret = of_property_read_string_index(s->of_node, "color_names", s->color,
+			&string);
+	if (ret != 0)
+		return -EINVAL;
+	ret = snprintf(buf, PAGE_SIZE, "%s\n", string);
+	return strlen(buf);
+}
+
+ssize_t store_dev_attr_color(struct device *dev, struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct ledmgpio_state *s =
+			container_of(cdev, struct ledmgpio_state, led);
+	int len, idx;
+	char color_name[64];
+
+	if (count < 1)
+		return -EINVAL;
+
+	strncpy(color_name, buf, sizeof(color_name));
+	color_name[sizeof(color_name) - 1] = '\0';
+	len = strlen(color_name);
+	if (len && color_name[len - 1] == '\n')
+		color_name[len - 1] = '\0';
+
+	idx = of_property_match_string(s->of_node, "color_names", color_name);
+	if (idx < 0)
+		return -EINVAL;
+	s->color = idx;
+	return count;
+}
+
+static DEVICE_ATTR(color, S_IRUGO | S_IWUSR,
+		show_dev_attr_color, store_dev_attr_color);
+
+static void ledmgpio_led_set(struct led_classdev *cdev,
+		enum led_brightness brightness)
+{
+	struct ledmgpio_state *s =
+			container_of(cdev, struct ledmgpio_state, led);
+	int values[s->gpios->ndescs];
+	unsigned int i;
+
+	if (brightness == LED_OFF) {
+		for (i = 0; i < s->gpios->ndescs; i++)
+			values[i] = 0;
+	} else {
+		for (i = 0; i < s->gpios->ndescs; i++) {
+			int idx  = s->color * s->gpios->ndescs + i;
+
+			values[i] = s->color_vals[idx];
+		}
+	}
+	gpiod_set_array_cansleep(s->gpios->ndescs, s->gpios->desc, values);
+}
+
+int read_recode_table(struct device *dev, struct ledmgpio_state *s)
+{
+	int ncolors;
+	int ret;
+	int color, g;
+
+	ncolors = of_property_count_strings(dev->of_node, "color_names");
+	if (ncolors <= 0)
+		return -1;
+	s->color_vals = devm_kcalloc(dev, ncolors * s->gpios->ndescs,
+			sizeof(int), GFP_KERNEL);
+	if (!s->color_vals)
+		return -1;
+	for (color = 0; color < ncolors; color++) {
+		for (g = 0; g < s->gpios->ndescs; g++) {
+			u32 val;
+			int idx  = color * s->gpios->ndescs + g;
+
+			ret = of_property_read_u32_index(dev->of_node,
+					"color_vals", idx, &val);
+			if (ret != 0)
+				return -1;
+			s->color_vals[idx] = val;
+		}
+	}
+	return 0;
+}
+
+static int ledmgpio_probe(struct platform_device *pdev)
+{
+	struct ledmgpio_state *s;
+	const char *string;
+	int ret;
+
+	s = devm_kzalloc(&pdev->dev, sizeof(*s), GFP_KERNEL);
+	if (!s)
+		return -ENOMEM;
+	s->of_node = pdev->dev.of_node;
+
+	s->gpios = devm_gpiod_get_array(&pdev->dev, NULL, GPIOD_OUT_LOW);
+	if (IS_ERR(s->gpios))
+		return PTR_ERR(s->gpios);
+
+	s->led.name = pdev->dev.of_node->name;
+	ret = of_property_read_string(pdev->dev.of_node, "label", &string);
+	if (ret == 0)
+		s->led.name = string;
+	s->led.default_trigger = "none";
+	ret = of_property_read_string(pdev->dev.of_node,
+			"linux,default-trigger", &string);
+	if (ret == 0)
+		s->led.default_trigger = string;
+	s->led.brightness_set = ledmgpio_led_set;
+	s->color = 0;
+	ret = of_property_read_string(pdev->dev.of_node, "default-color",
+			&string);
+	if (ret == 0) {
+		int idx = of_property_match_string(s->of_node, "color_names",
+				string);
+		if (idx < 0)
+			return -EINVAL;
+		s->color = idx;
+	}
+
+	ret = read_recode_table(&pdev->dev, s);
+	if (ret != 0)
+		return ret;
+
+	ret = led_classdev_register(&pdev->dev, &s->led);
+	if (ret != 0)
+		return ret;
+	ret = device_create_file(s->led.dev, &dev_attr_color);
+	if (ret)
+		return ret;
+	pdev->dev.platform_data = s;
+	return 0;
+}
+
+static int ledmgpio_remove(struct platform_device *pdev)
+{
+	struct ledmgpio_state *s = dev_get_platdata(&pdev->dev);
+
+	device_remove_file(s->led.dev, &dev_attr_color);
+	led_classdev_unregister(&s->led);
+	devm_gpiod_put_array(&pdev->dev, s->gpios);
+	return 0;
+}
+
+static const struct of_device_id ledmgpio_of_match[] = {
+	{ .compatible = "mgpio-led", },
+	{}
+};
+
+static struct platform_driver ledmgpio_platform_driver = {
+	.probe = ledmgpio_probe,
+	.remove = ledmgpio_remove,
+	.driver = {
+		.name = "led-mgpio",
+		.of_match_table = ledmgpio_of_match,
+	},
+};
+
+module_platform_driver(ledmgpio_platform_driver);
+MODULE_AUTHOR("Dmitry Bondar <bond@simicon.com>");
+MODULE_DESCRIPTION("multipe GPIO LED driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:led-mgpio");
-- 
1.7.10.4


--=-HsImRLDRMDqdP6N29C8u--
