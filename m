From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 32/51] leds: gpio: Remove work queue
Date: Fri, 17 Jul 2015 10:47:18 +0200
Message-ID: <1437122857-6765-33-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46140 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1945960AbbGQItX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 04:49:23 -0400
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Raphael Assenat <raph@8d.com>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Raphael Assenat <raph@8d.com>
---
 drivers/leds/leds-gpio.c |   50 +++++++++++-----------------------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index af1876a..bf4dfbd 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -20,32 +20,16 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 
 struct gpio_led_data {
 	struct led_classdev cdev;
 	struct gpio_desc *gpiod;
-	struct work_struct work;
-	u8 new_level;
 	u8 can_sleep;
 	u8 blinking;
 	int (*platform_gpio_blink_set)(struct gpio_desc *desc, int state,
 			unsigned long *delay_on, unsigned long *delay_off);
 };
 
-static void gpio_led_work(struct work_struct *work)
-{
-	struct gpio_led_data *led_dat =
-		container_of(work, struct gpio_led_data, work);
-
-	if (led_dat->blinking) {
-		led_dat->platform_gpio_blink_set(led_dat->gpiod,
-					led_dat->new_level, NULL, NULL);
-		led_dat->blinking = 0;
-	} else
-		gpiod_set_value_cansleep(led_dat->gpiod, led_dat->new_level);
-}
-
 static void gpio_led_set(struct led_classdev *led_cdev,
 	enum led_brightness value)
 {
@@ -62,17 +46,12 @@ static void gpio_led_set(struct led_classdev *led_cdev,
 	 * seem to have a reliable way to know if we're already in one; so
 	 * let's just assume the worst.
 	 */
-	if (led_dat->can_sleep) {
-		led_dat->new_level = level;
-		schedule_work(&led_dat->work);
-	} else {
-		if (led_dat->blinking) {
-			led_dat->platform_gpio_blink_set(led_dat->gpiod, level,
-							 NULL, NULL);
-			led_dat->blinking = 0;
-		} else
-			gpiod_set_value(led_dat->gpiod, level);
-	}
+	if (led_dat->blinking) {
+		led_dat->platform_gpio_blink_set(led_dat->gpiod, level,
+						 NULL, NULL);
+		led_dat->blinking = 0;
+	} else
+		gpiod_set_value(led_dat->gpiod, level);
 }
 
 static int gpio_blink_set(struct led_classdev *led_cdev,
@@ -125,6 +104,8 @@ static int create_gpio_led(const struct gpio_led *template,
 	led_dat->cdev.name = template->name;
 	led_dat->cdev.default_trigger = template->default_trigger;
 	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
+	if (!led_dat->can_sleep)
+		led_dat->cdev.flags |= LED_BRIGHTNESS_FAST;
 	led_dat->blinking = 0;
 	if (blink_set) {
 		led_dat->platform_gpio_blink_set = blink_set;
@@ -143,17 +124,9 @@ static int create_gpio_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	INIT_WORK(&led_dat->work, gpio_led_work);
-
 	return led_classdev_register(parent, &led_dat->cdev);
 }
 
-static void delete_gpio_led(struct gpio_led_data *led)
-{
-	led_classdev_unregister(&led->cdev);
-	cancel_work_sync(&led->work);
-}
-
 struct gpio_leds_priv {
 	int num_leds;
 	struct gpio_led_data leds[];
@@ -233,7 +206,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 
 err:
 	for (count = priv->num_leds - 1; count >= 0; count--)
-		delete_gpio_led(&priv->leds[count]);
+		led_classdev_unregister(&priv->leds[count].cdev);
 	return ERR_PTR(ret);
 }
 
@@ -265,7 +238,8 @@ static int gpio_led_probe(struct platform_device *pdev)
 			if (ret < 0) {
 				/* On failure: unwind the led creations */
 				for (i = i - 1; i >= 0; i--)
-					delete_gpio_led(&priv->leds[i]);
+					led_classdev_unregister(
+							&priv->leds[i].cdev);
 				return ret;
 			}
 		}
@@ -286,7 +260,7 @@ static int gpio_led_remove(struct platform_device *pdev)
 	int i;
 
 	for (i = 0; i < priv->num_leds; i++)
-		delete_gpio_led(&priv->leds[i]);
+		led_classdev_unregister(&priv->leds[i].cdev);
 
 	return 0;
 }
-- 
1.7.9.5
