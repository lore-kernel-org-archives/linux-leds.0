From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] leds: gpio: Drop unneeded manual of_node assignment
Date: Fri,  7 Dec 2018 11:10:06 +0100
Message-ID: <1544177406-24752-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-leds@vger.kernel.org

This reverts the main change of commit bff23714bc36 ("leds: leds-gpio:
Set of_node for created LED devices") because of_node assignment is
handled by core since commit 7ea79ae86c28 ("leds: gpio: use OF variant
of LED registering function").  Basically the code was overwriting the
of_node with same value.

No functional change expected.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/leds-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 45e012093865..998f2ff6914d 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -190,7 +190,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return ERR_PTR(ret);
 		}
-		led_dat->cdev.dev->of_node = np;
 		priv->num_leds++;
 	}
 
-- 
2.7.4
