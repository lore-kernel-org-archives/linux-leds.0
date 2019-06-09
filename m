From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 23/26] leds: gpio: Use generic support for composing LED names
Date: Sun,  9 Jun 2019 21:08:00 +0200
Message-ID: <20190609190803.14815-24-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-gpio.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index b26cf78993d1..fe70613aca34 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -77,11 +77,11 @@ static int gpio_blink_set(struct led_classdev *led_cdev,
 
 static int create_gpio_led(const struct gpio_led *template,
 	struct gpio_led_data *led_dat, struct device *parent,
-	struct device_node *np, gpio_blink_set_t blink_set)
+	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
 {
+	struct led_init_data init_data = {};
 	int ret, state;
 
-	led_dat->cdev.name = template->name;
 	led_dat->cdev.default_trigger = template->default_trigger;
 	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
 	if (!led_dat->can_sleep)
@@ -112,7 +112,16 @@ static int create_gpio_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	return devm_led_classdev_register(parent, &led_dat->cdev);
+	if (template->name) {
+		led_dat->cdev.name = template->name;
+		ret = devm_led_classdev_register(parent, &led_dat->cdev);
+	} else {
+		init_data.fwnode = fwnode;
+		ret = devm_led_classdev_register_ext(parent, &led_dat->cdev,
+						     &init_data);
+	}
+
+	return ret;
 }
 
 struct gpio_leds_priv {
@@ -145,15 +154,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
 		struct gpio_led led = {};
 		const char *state = NULL;
-		struct device_node *np = to_of_node(child);
-
-		ret = fwnode_property_read_string(child, "label", &led.name);
-		if (ret && IS_ENABLED(CONFIG_OF) && np)
-			led.name = np->name;
-		if (!led.name) {
-			fwnode_handle_put(child);
-			return ERR_PTR(-EINVAL);
-		}
 
 		led.gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
 							     GPIOD_ASIS,
@@ -185,7 +185,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		if (fwnode_property_present(child, "panic-indicator"))
 			led.panic_indicator = 1;
 
-		ret = create_gpio_led(&led, led_dat, dev, np, NULL);
+		ret = create_gpio_led(&led, led_dat, dev, child, NULL);
 		if (ret < 0) {
 			fwnode_handle_put(child);
 			return ERR_PTR(ret);
-- 
2.11.0
