From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 09/26] leds: lt3593: Use generic support for composing LED names
Date: Sun,  9 Jun 2019 21:07:46 +0200
Message-ID: <20190609190803.14815-10-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com, Daniel Mack <daniel@zonque.org>
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Daniel Mack <daniel@zonque.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lt3593.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 83e8e58d81cb..c94995f0daa2 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -10,10 +10,10 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <uapi/linux/uleds.h>
+
+#define LED_LT3593_NAME "lt3593"
 
 struct lt3593_led_data {
-	char name[LED_MAX_NAME_SIZE];
 	struct led_classdev cdev;
 	struct gpio_desc *gpiod;
 };
@@ -66,6 +66,7 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	struct lt3593_led_data *led_data;
 	struct fwnode_handle *child;
 	int ret, state = LEDS_GPIO_DEFSTATE_OFF;
+	struct led_init_data init_data = {};
 	const char *tmp;
 
 	if (!dev->of_node)
@@ -86,14 +87,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
 
 	child = device_get_next_child_node(dev, NULL);
 
-	ret = fwnode_property_read_string(child, "label", &tmp);
-	if (ret < 0)
-		snprintf(led_data->name, sizeof(led_data->name),
-			 "lt3593::");
-	else
-		snprintf(led_data->name, sizeof(led_data->name),
-			 "lt3593:%s", tmp);
-
 	fwnode_property_read_string(child, "linux,default-trigger",
 				    &led_data->cdev.default_trigger);
 
@@ -102,11 +95,14 @@ static int lt3593_led_probe(struct platform_device *pdev)
 			state = LEDS_GPIO_DEFSTATE_ON;
 	}
 
-	led_data->cdev.name = led_data->name;
 	led_data->cdev.brightness_set_blocking = lt3593_led_set;
 	led_data->cdev.brightness = state ? LED_FULL : LED_OFF;
 
-	ret = devm_led_classdev_register(dev, &led_data->cdev);
+	init_data.fwnode = child;
+	init_data.devicename = LED_LT3593_NAME;
+	init_data.default_label = ":";
+
+	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
 	if (ret < 0) {
 		fwnode_handle_put(child);
 		return ret;
-- 
2.11.0
