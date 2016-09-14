From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 4/7] leds: gpio: simplify gpio_leds_create
Date: Wed, 14 Sep 2016 20:55:06 +0200
Message-ID: <e5a8f86e-7ab8-e0f6-eddc-92a4b8467618@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Definition of np can be moved into the loop as well to simplify
the code a little.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rebased due to removal of patch 2 of the original series
---
 drivers/leds/leds-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index da4aa8e..171ba2f 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -159,7 +159,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 	struct fwnode_handle *child;
 	struct gpio_leds_priv *priv;
 	int count, ret;
-	struct device_node *np;
 
 	count = device_get_child_node_count(dev);
 	if (!count)
@@ -173,6 +172,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
 		struct gpio_led led = {};
 		const char *state = NULL;
+		struct device_node *np = to_of_node(child);
 
 		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);
 		if (IS_ERR(led.gpiod)) {
@@ -181,8 +181,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			goto err;
 		}
 
-		np = to_of_node(child);
-
 		if (fwnode_property_present(child, "label")) {
 			fwnode_property_read_string(child, "label", &led.name);
 		} else {
-- 
2.9.2
