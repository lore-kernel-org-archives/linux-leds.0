From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 11/36] leds: tlc591xx: Remove work queue
Date: Thu, 20 Aug 2015 16:43:41 +0200
Message-ID: <1440081846-11697-12-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-tlc591xx.c |   31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index b806eca..30453164 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -14,7 +14,6 @@
 #include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 
 #define TLC591XX_MAX_LEDS	16
 
@@ -42,13 +41,11 @@
 #define LEDOUT_MASK		0x3
 
 #define ldev_to_led(c)		container_of(c, struct tlc591xx_led, ldev)
-#define work_to_led(work)	container_of(work, struct tlc591xx_led, work)
 
 struct tlc591xx_led {
 	bool active;
 	unsigned int led_no;
 	struct led_classdev ldev;
-	struct work_struct work;
 	struct tlc591xx_priv *priv;
 };
 
@@ -110,12 +107,12 @@ tlc591xx_set_pwm(struct tlc591xx_priv *priv, struct tlc591xx_led *led,
 	return regmap_write(priv->regmap, pwm, brightness);
 }
 
-static void
-tlc591xx_led_work(struct work_struct *work)
+static int
+tlc591xx_brightness_set(struct led_classdev *led_cdev,
+			enum led_brightness brightness)
 {
-	struct tlc591xx_led *led = work_to_led(work);
+	struct tlc591xx_led *led = ldev_to_led(led_cdev);
 	struct tlc591xx_priv *priv = led->priv;
-	enum led_brightness brightness = led->ldev.brightness;
 	int err;
 
 	switch (brightness) {
@@ -131,18 +128,7 @@ tlc591xx_led_work(struct work_struct *work)
 			err = tlc591xx_set_pwm(priv, led, brightness);
 	}
 
-	if (err)
-		dev_err(led->ldev.dev, "Failed setting brightness\n");
-}
-
-static void
-tlc591xx_brightness_set(struct led_classdev *led_cdev,
-			enum led_brightness brightness)
-{
-	struct tlc591xx_led *led = ldev_to_led(led_cdev);
-
-	led->ldev.brightness = brightness;
-	schedule_work(&led->work);
+	return err;
 }
 
 static void
@@ -151,10 +137,8 @@ tlc591xx_destroy_devices(struct tlc591xx_priv *priv, unsigned int j)
 	int i = j;
 
 	while (--i >= 0) {
-		if (priv->leds[i].active) {
+		if (priv->leds[i].active)
 			led_classdev_unregister(&priv->leds[i].ldev);
-			cancel_work_sync(&priv->leds[i].work);
-		}
 	}
 }
 
@@ -175,9 +159,8 @@ tlc591xx_configure(struct device *dev,
 
 		led->priv = priv;
 		led->led_no = i;
-		led->ldev.brightness_set = tlc591xx_brightness_set;
+		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
 		led->ldev.max_brightness = LED_FULL;
-		INIT_WORK(&led->work, tlc591xx_led_work);
 		err = led_classdev_register(dev, &led->ldev);
 		if (err < 0) {
 			dev_err(dev, "couldn't register LED %s\n",
-- 
1.7.9.5
