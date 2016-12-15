From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 1/1 RFC] gpio: Pass GPIO label down to gpiod_request when using get_gpiod_from_child
Date: Thu, 15 Dec 2016 09:53:21 +0100
Message-ID: <20161215085321.20337-1-alexander.stein@systec-electronic.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:51467 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1757457AbcLOIy2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 15 Dec 2016 03:54:28 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org

Currently all users of fwnode_get_named_gpiod() have no way to specify a
label for the GPIO. So GPIOs listed in debugfs are shown with label "?".
With this change a proper label is used.
Also adjust all users so they can pass a label, properly retrieved from
device tree properties.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
This patchset addresses the problem described in
https://www.spinics.net/lists/linux-leds/msg07233.html

I can only verify leds-gpio usage, but changes to gpio_keys_polled and
amba-clcd-nomadik seem pretty straight forward.

If this is the right thing to do, I need to know who I shall CC for
patch approval.

 drivers/gpio/devres.c                     |  6 ++++--
 drivers/gpio/gpiolib.c                    |  6 ++++--
 drivers/input/keyboard/gpio_keys_polled.c | 11 ++++++-----
 drivers/leds/leds-gpio.c                  | 13 +++++++------
 drivers/video/fbdev/amba-clcd-nomadik.c   |  9 +++++----
 include/linux/gpio/consumer.h             | 12 ++++++++----
 6 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index b760cbb..892aa1b 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -127,13 +127,15 @@ EXPORT_SYMBOL(devm_gpiod_get_index);
  * @dev:	GPIO consumer
  * @con_id:	function within the GPIO consumer
  * @child:	firmware node (child of @dev)
+ * @label:	label for GPIO
  *
  * GPIO descriptors returned from this function are automatically disposed on
  * driver detach.
  */
 struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
-					    struct fwnode_handle *child)
+					    struct fwnode_handle *child,
+					    const char *label)
 {
 	static const char * const suffixes[] = { "gpios", "gpio" };
 	char prop_name[32]; /* 32 is max size of property name */
@@ -154,7 +156,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 			snprintf(prop_name, sizeof(prop_name), "%s",
 							       suffixes[i]);
 
-		desc = fwnode_get_named_gpiod(child, prop_name);
+		desc = fwnode_get_named_gpiod(child, prop_name, label);
 		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
 			break;
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 868128a..b56a5ae 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3246,6 +3246,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  * fwnode_get_named_gpiod - obtain a GPIO from firmware node
  * @fwnode:	handle of the firmware node
  * @propname:	name of the firmware property representing the GPIO
+ * @label:	label for GPIO
  *
  * This function can be used for drivers that get their configuration
  * from firmware.
@@ -3257,7 +3258,8 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  * In case of error an ERR_PTR() is returned.
  */
 struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname)
+					 const char *propname,
+					 const char *label)
 {
 	struct gpio_desc *desc = ERR_PTR(-ENODEV);
 	bool active_low = false;
@@ -3287,7 +3289,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	if (IS_ERR(desc))
 		return desc;
 
-	ret = gpiod_request(desc, NULL);
+	ret = gpiod_request(desc, label);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 62bdb1d..01087c7 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -167,7 +167,12 @@ static struct gpio_keys_platform_data *gpio_keys_polled_get_devtree_pdata(struct
 	device_for_each_child_node(dev, child) {
 		struct gpio_desc *desc;
 
-		desc = devm_get_gpiod_from_child(dev, NULL, child);
+		button = &pdata->buttons[pdata->nbuttons++];
+
+		fwnode_property_read_string(child, "label", &button->desc);
+
+		desc = devm_get_gpiod_from_child(dev, NULL, child,
+						 button->desc);
 		if (IS_ERR(desc)) {
 			error = PTR_ERR(desc);
 			if (error != -EPROBE_DEFER)
@@ -177,8 +182,6 @@ static struct gpio_keys_platform_data *gpio_keys_polled_get_devtree_pdata(struct
 			fwnode_handle_put(child);
 			return ERR_PTR(error);
 		}
-
-		button = &pdata->buttons[pdata->nbuttons++];
 		button->gpiod = desc;
 
 		if (fwnode_property_read_u32(child, "linux,code", &button->code)) {
@@ -188,8 +191,6 @@ static struct gpio_keys_platform_data *gpio_keys_polled_get_devtree_pdata(struct
 			return ERR_PTR(-EINVAL);
 		}
 
-		fwnode_property_read_string(child, "label", &button->desc);
-
 		if (fwnode_property_read_u32(child, "linux,input-type",
 					     &button->type))
 			button->type = EV_KEY;
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index d400dca..7557788 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -174,12 +174,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		const char *state = NULL;
 		struct device_node *np = to_of_node(child);
 
-		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);
-		if (IS_ERR(led.gpiod)) {
-			fwnode_handle_put(child);
-			return ERR_CAST(led.gpiod);
-		}
-
 		ret = fwnode_property_read_string(child, "label", &led.name);
 		if (ret && IS_ENABLED(CONFIG_OF) && np)
 			led.name = np->name;
@@ -188,6 +182,13 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			return ERR_PTR(-EINVAL);
 		}
 
+		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child,
+						      led.name);
+		if (IS_ERR(led.gpiod)) {
+			fwnode_handle_put(child);
+			return ERR_CAST(led.gpiod);
+		}
+
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led.default_trigger);
 
diff --git a/drivers/video/fbdev/amba-clcd-nomadik.c b/drivers/video/fbdev/amba-clcd-nomadik.c
index 0c06fca..22e963e 100644
--- a/drivers/video/fbdev/amba-clcd-nomadik.c
+++ b/drivers/video/fbdev/amba-clcd-nomadik.c
@@ -184,7 +184,8 @@ static void tpg110_init(struct device *dev, struct device_node *np,
 {
 	dev_info(dev, "TPG110 display init\n");
 
-	grestb = devm_get_gpiod_from_child(dev, "grestb", &np->fwnode);
+	grestb = devm_get_gpiod_from_child(dev, "grestb", &np->fwnode,
+					   "grestb");
 	if (IS_ERR(grestb)) {
 		dev_err(dev, "no GRESTB GPIO\n");
 		return;
@@ -192,19 +193,19 @@ static void tpg110_init(struct device *dev, struct device_node *np,
 	/* This asserts the GRESTB signal, putting the display into reset */
 	gpiod_direction_output(grestb, 1);
 
-	scen = devm_get_gpiod_from_child(dev, "scen", &np->fwnode);
+	scen = devm_get_gpiod_from_child(dev, "scen", &np->fwnode, "scen");
 	if (IS_ERR(scen)) {
 		dev_err(dev, "no SCEN GPIO\n");
 		return;
 	}
 	gpiod_direction_output(scen, 0);
-	scl = devm_get_gpiod_from_child(dev, "scl", &np->fwnode);
+	scl = devm_get_gpiod_from_child(dev, "scl", &np->fwnode, "scl");
 	if (IS_ERR(scl)) {
 		dev_err(dev, "no SCL GPIO\n");
 		return;
 	}
 	gpiod_direction_output(scl, 0);
-	sda = devm_get_gpiod_from_child(dev, "sda", &np->fwnode);
+	sda = devm_get_gpiod_from_child(dev, "sda", &np->fwnode, "sda");
 	if (IS_ERR(sda)) {
 		dev_err(dev, "no SDA GPIO\n");
 		return;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fb0fde6..82b4014 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -135,10 +135,12 @@ int desc_to_gpio(const struct gpio_desc *desc);
 struct fwnode_handle;
 
 struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname);
+					 const char *propname,
+					 const char *label);
 struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
-					    struct fwnode_handle *child);
+					    struct fwnode_handle *child,
+					    const char *label);
 #else /* CONFIG_GPIOLIB */
 
 static inline int gpiod_count(struct device *dev, const char *con_id)
@@ -412,13 +414,15 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 struct fwnode_handle;
 
 static inline struct gpio_desc *fwnode_get_named_gpiod(
-	struct fwnode_handle *fwnode, const char *propname)
+	struct fwnode_handle *fwnode, const char *propname,
+	const char *label)
 {
 	return ERR_PTR(-ENOSYS);
 }
 
 static inline struct gpio_desc *devm_get_gpiod_from_child(
-	struct device *dev, const char *con_id, struct fwnode_handle *child)
+	struct device *dev, const char *con_id, struct fwnode_handle *child,
+	const char *label)
 {
 	return ERR_PTR(-ENOSYS);
 }
-- 
2.10.2
