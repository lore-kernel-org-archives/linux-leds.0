From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 06/24] leds: sc27xx-blt: Use led_compose_name()
Date: Tue,  6 Nov 2018 23:07:14 +0100
Message-ID: <1541542052-10081-7-git-send-email-jacek.anaszewski@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Xiaotong Lu <xiaotong.lu@spreadtrum.com>, Baolin Wang <baolin.wang@linaro.org>
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/leds/leds-sc27xx-bltc.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index 9d9b7aa..9fe7cb1 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -6,7 +6,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <uapi/linux/uleds.h>
 
 /* PMIC global control register definition */
 #define SC27XX_MODULE_EN0	0xc08
@@ -36,7 +35,7 @@
 #define SC27XX_LEDS_MAX		3
 
 struct sc27xx_led {
-	char name[LED_MAX_NAME_SIZE];
+	struct fwnode_handle *fwnode;
 	struct led_classdev ldev;
 	struct sc27xx_led_priv *priv;
 	u8 line;
@@ -132,16 +131,22 @@ static int sc27xx_led_register(struct device *dev, struct sc27xx_led_priv *priv)
 
 	for (i = 0; i < SC27XX_LEDS_MAX; i++) {
 		struct sc27xx_led *led = &priv->leds[i];
+		struct led_init_data init_data = { led->fwnode };
 
 		if (!led->active)
 			continue;
 
+		err = led_compose_name(led->fwnode, "sc27xx", ":",
+				       init_data.name);
+		if (err)
+			return err;
+
 		led->line = i;
 		led->priv = priv;
-		led->ldev.name = led->name;
 		led->ldev.brightness_set_blocking = sc27xx_led_set;
 
-		err = devm_led_classdev_register(dev, &led->ldev);
+		err = devm_led_classdev_register_ext(dev, &led->ldev,
+						     &init_data);
 		if (err)
 			return err;
 	}
@@ -154,7 +159,6 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *child;
 	struct sc27xx_led_priv *priv;
-	const char *str;
 	u32 base, count, reg;
 	int err;
 
@@ -196,15 +200,8 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
+		priv->leds[reg].fwnode = of_fwnode_handle(child);
 		priv->leds[reg].active = true;
-
-		err = of_property_read_string(child, "label", &str);
-		if (err)
-			snprintf(priv->leds[reg].name, LED_MAX_NAME_SIZE,
-				 "sc27xx::");
-		else
-			snprintf(priv->leds[reg].name, LED_MAX_NAME_SIZE,
-				 "sc27xx:%s", str);
 	}
 
 	err = sc27xx_led_register(dev, priv);
-- 
2.1.4
