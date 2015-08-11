From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 12/57] leds: tlc591xx: Remove work queue
Date: Tue, 11 Aug 2015 11:37:25 +0200
Message-ID: <1439285890-27329-13-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-tlc591xx.c |   25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index b806eca..f7e6711 100644
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
 
@@ -111,11 +108,11 @@ tlc591xx_set_pwm(struct tlc591xx_priv *priv, struct tlc591xx_led *led,
 }
 
 static void
-tlc591xx_led_work(struct work_struct *work)
+tlc591xx_brightness_set(struct led_classdev *led_cdev,
+			enum led_brightness brightness)
 {
-	struct tlc591xx_led *led = work_to_led(work);
+	struct tlc591xx_led *led = ldev_to_led(led_cdev);
 	struct tlc591xx_priv *priv = led->priv;
-	enum led_brightness brightness = led->ldev.brightness;
 	int err;
 
 	switch (brightness) {
@@ -136,25 +133,13 @@ tlc591xx_led_work(struct work_struct *work)
 }
 
 static void
-tlc591xx_brightness_set(struct led_classdev *led_cdev,
-			enum led_brightness brightness)
-{
-	struct tlc591xx_led *led = ldev_to_led(led_cdev);
-
-	led->ldev.brightness = brightness;
-	schedule_work(&led->work);
-}
-
-static void
 tlc591xx_destroy_devices(struct tlc591xx_priv *priv, unsigned int j)
 {
 	int i = j;
 
 	while (--i >= 0) {
-		if (priv->leds[i].active) {
+		if (priv->leds[i].active)
 			led_classdev_unregister(&priv->leds[i].ldev);
-			cancel_work_sync(&priv->leds[i].work);
-		}
 	}
 }
 
@@ -177,7 +162,7 @@ tlc591xx_configure(struct device *dev,
 		led->led_no = i;
 		led->ldev.brightness_set = tlc591xx_brightness_set;
 		led->ldev.max_brightness = LED_FULL;
-		INIT_WORK(&led->work, tlc591xx_led_work);
+		led->ldev.flags |= LED_BRIGHTNESS_BLOCKING;
 		err = led_classdev_register(dev, &led->ldev);
 		if (err < 0) {
 			dev_err(dev, "couldn't register LED %s\n",
-- 
1.7.9.5
