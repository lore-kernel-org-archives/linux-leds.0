From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 2/2] leds: tlc591xx: Use the OF version of the LED registration function
Date: Mon, 1 Jul 2019 17:26:02 +0200
Message-ID: <20190701152602.31716-3-jjhiblot@ti.com>
References: <20190701152602.31716-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701152602.31716-1-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>
List-Id: linux-leds@vger.kernel.org

The driver parses the device-tree to identify which LED should be handled.
Since the information about the device node is known at this time, we can
provide the LED core with it. It may be useful later.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/leds-tlc591xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 14e47ff44df5..6a2936c94b73 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -207,7 +207,7 @@ tlc591xx_probe(struct i2c_client *client,
 		led->led_no = idx++;
 		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
 		led->ldev.max_brightness = LED_FULL;
-		err = devm_led_classdev_register(dev, &led->ldev);
+		err = devm_of_led_classdev_register(dev, child, &led->ldev);
 		if (err < 0) {
 			dev_err(dev, "couldn't register LED %s\n",
 				led->ldev.name);
-- 
2.17.1
