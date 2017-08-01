From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v2 3/4] leds: pca955x: add GPIO support
Date: Tue,  1 Aug 2017 14:09:08 +0200
Message-ID: <1501589349-5681-4-git-send-email-clg@kaod.org>
References: <1501589349-5681-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501589349-5681-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

The PCA955x family of chips are I2C LED blinkers whose pins not used
to control LEDs can be used as general purpose I/Os (GPIOs).

The following adds such a support by defining different operation
modes for the pins (See bindings documentation for more details). The
pca955x driver is then extended with a gpio_chip when some of pins are
operating as GPIOs. The default operating mode is to behave as a LED.

The GPIO support is conditioned by CONFIG_LEDS_PCA955X_GPIO.

Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
---
 drivers/leds/Kconfig                    |  11 +++
 drivers/leds/leds-pca955x.c             | 158 +++++++++++++++++++++++++++-----
 include/dt-bindings/leds/leds-pca955x.h |  16 ++++
 3 files changed, 162 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/leds/leds-pca955x.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 594b24d410c3..3013cd35c65e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -377,6 +377,17 @@ config LEDS_PCA955X
 	  LED driver chips accessed via the I2C bus.  Supported
 	  devices include PCA9550, PCA9551, PCA9552, and PCA9553.
 
+config LEDS_PCA955X_GPIO
+	bool "Enable GPIO support for PCA955X"
+	depends on LEDS_PCA955X
+	depends on GPIOLIB
+	help
+	  Allow unused pins on PCA955X to be used as gpio.
+
+	  To use a pin as gpio the pin type should be set to
+	  PCA955X_TYPE_GPIO in the device tree.
+
+
 config LEDS_PCA963X
 	tristate "LED support for PCA963x I2C chip"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index a8918ff0a7e9..ac0f726ff1af 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -53,6 +53,8 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#include <dt-bindings/leds/leds-pca955x.h>
+
 /* LED select registers determine the source that drives LED outputs */
 #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
 #define PCA955X_LS_LED_OFF	0x1	/* Output HI-Z */
@@ -118,6 +120,9 @@ struct pca955x {
 	struct pca955x_led *leds;
 	struct pca955x_chipdef	*chipdef;
 	struct i2c_client	*client;
+#ifdef CONFIG_LEDS_PCA955X_GPIO
+	struct gpio_chip gpio;
+#endif
 };
 
 struct pca955x_led {
@@ -125,6 +130,7 @@ struct pca955x_led {
 	struct led_classdev	led_cdev;
 	int			led_num;	/* 0 .. 15 potentially */
 	char			name[32];
+	u32			type;
 	const char		*default_trigger;
 };
 
@@ -259,6 +265,65 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+#ifdef CONFIG_LEDS_PCA955X_GPIO
+/*
+ * Read the INPUT register, which contains the state of LEDs.
+ */
+static u8 pca955x_read_input(struct i2c_client *client, int n)
+{
+	return (u8)i2c_smbus_read_byte_data(client, n);
+}
+
+static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+
+	if (led->type == PCA955X_TYPE_GPIO)
+		return 0;
+
+	return -EBUSY;
+}
+
+static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				   int val)
+{
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+
+	if (val)
+		pca955x_led_set(&led->led_cdev, LED_FULL);
+	else
+		pca955x_led_set(&led->led_cdev, LED_OFF);
+}
+
+static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+	u8 reg = pca955x_read_input(pca955x->client, led->led_num / 8);
+
+	return !!(reg & (1 << (led->led_num % 8)));
+}
+
+static int pca955x_gpio_direction_input(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	/* To use as input ensure pin is not driven */
+	pca955x_gpio_set_value(gc, offset, 0);
+
+	return 0;
+}
+
+static int pca955x_gpio_direction_output(struct gpio_chip *gc,
+					 unsigned int offset, int val)
+{
+	pca955x_gpio_set_value(gc, offset, val);
+
+	return 0;
+}
+#endif /* CONFIG_LEDS_PCA955X_GPIO */
+
 #if IS_ENABLED(CONFIG_OF)
 static struct pca955x_platform_data *
 pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
@@ -297,6 +362,8 @@ pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
 		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
 			 "%s", name);
 
+		pdata->leds[reg].type = PCA955X_TYPE_LED;
+		of_property_read_u32(child, "type", &pdata->leds[reg].type);
 		of_property_read_string(child, "linux,default-trigger",
 					&pdata->leds[reg].default_trigger);
 	}
@@ -332,6 +399,7 @@ static int pca955x_probe(struct i2c_client *client,
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
+	int ngpios = 0;
 
 	if (id) {
 		chip = &pca955x_chipdefs[id->driver_data];
@@ -391,36 +459,52 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x->chipdef = chip;
 
 	for (i = 0; i < chip->bits; i++) {
+		struct pca955x_led *pdata_led = &pdata->leds[i];
+
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
 		pca955x_led->pca955x = pca955x;
-
-		/* Platform data can specify LED names and default triggers */
-		if (pdata) {
-			if (pdata->leds[i].name)
+		pca955x_led->type = pdata_led->type;
+
+		switch (pca955x_led->type) {
+		case PCA955X_TYPE_NONE:
+			break;
+		case PCA955X_TYPE_GPIO:
+			ngpios++;
+			break;
+		case PCA955X_TYPE_LED:
+			/*
+			 * Platform data can specify LED names and
+			 * default triggers
+			 */
+			if (pdata) {
+				if (pdata->leds[i].name)
+					snprintf(pca955x_led->name,
+						 sizeof(pca955x_led->name),
+						 "pca955x:%s",
+						 pdata->leds[i].name);
+				if (pdata->leds[i].default_trigger)
+					pca955x_led->led_cdev.default_trigger =
+						pdata->leds[i].default_trigger;
+			} else {
 				snprintf(pca955x_led->name,
-					sizeof(pca955x_led->name), "pca955x:%s",
-					pdata->leds[i].name);
-			if (pdata->leds[i].default_trigger)
-				pca955x_led->led_cdev.default_trigger =
-					pdata->leds[i].default_trigger;
-		} else {
-			snprintf(pca955x_led->name, sizeof(pca955x_led->name),
-				 "pca955x:%d", i);
-		}
+					 sizeof(pca955x_led->name),
+					 "pca955x:%d", i);
+			}
 
-		pca955x_led->led_cdev.name = pca955x_led->name;
-		pca955x_led->led_cdev.brightness_set_blocking = pca955x_led_set;
+			pca955x_led->led_cdev.name = pca955x_led->name;
+			pca955x_led->led_cdev.brightness_set_blocking =
+				pca955x_led_set;
 
-		err = devm_led_classdev_register(&client->dev,
-						 &pca955x_led->led_cdev);
-		if (err)
-			return err;
-	}
+			err = devm_led_classdev_register(&client->dev,
+							&pca955x_led->led_cdev);
+			if (err)
+				return err;
 
-	/* Turn off LEDs */
-	for (i = 0; i < pca95xx_num_led_regs(chip->bits); i++)
-		pca955x_write_ls(client, i, 0x55);
+			/* Turn off LED */
+			pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
+		}
+	}
 
 	/* PWM0 is used for half brightness or 50% duty cycle */
 	pca955x_write_pwm(client, 0, 255-LED_HALF);
@@ -432,6 +516,34 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x_write_psc(client, 0, 0);
 	pca955x_write_psc(client, 1, 0);
 
+#ifdef CONFIG_LEDS_PCA955X_GPIO
+	if (ngpios) {
+		pca955x->gpio.label = "gpio-pca955x";
+		pca955x->gpio.direction_input = pca955x_gpio_direction_input;
+		pca955x->gpio.direction_output = pca955x_gpio_direction_output;
+		pca955x->gpio.set = pca955x_gpio_set_value;
+		pca955x->gpio.get = pca955x_gpio_get_value;
+		pca955x->gpio.request = pca955x_gpio_request_pin;
+		pca955x->gpio.can_sleep = 1;
+		pca955x->gpio.base = -1;
+		pca955x->gpio.ngpio = ngpios;
+		pca955x->gpio.parent = &client->dev;
+		pca955x->gpio.owner = THIS_MODULE;
+
+		err = devm_gpiochip_add_data(&client->dev, &pca955x->gpio,
+					     pca955x);
+		if (err) {
+			/* Use data->gpio.dev as a flag for freeing gpiochip */
+			pca955x->gpio.parent = NULL;
+			dev_warn(&client->dev, "could not add gpiochip\n");
+			return err;
+		}
+		dev_info(&client->dev, "gpios %i...%i\n",
+			 pca955x->gpio.base, pca955x->gpio.base +
+			 pca955x->gpio.ngpio - 1);
+	}
+#endif
+
 	return 0;
 }
 
diff --git a/include/dt-bindings/leds/leds-pca955x.h b/include/dt-bindings/leds/leds-pca955x.h
new file mode 100644
index 000000000000..78cb7e979de7
--- /dev/null
+++ b/include/dt-bindings/leds/leds-pca955x.h
@@ -0,0 +1,16 @@
+/*
+ * This header provides constants for pca955x LED bindings.
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#ifndef _DT_BINDINGS_LEDS_PCA955X_H
+#define _DT_BINDINGS_LEDS_PCA955X_H
+
+#define PCA955X_TYPE_NONE         0
+#define PCA955X_TYPE_LED          1
+#define PCA955X_TYPE_GPIO         2
+
+#endif /* _DT_BINDINGS_LEDS_PCA955X_H */
-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
