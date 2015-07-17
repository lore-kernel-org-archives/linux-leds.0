From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 23/51] leds: da9052: Remove work queue
Date: Fri, 17 Jul 2015 10:47:09 +0200
Message-ID: <1437122857-6765-24-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/leds/leds-da9052.c |   35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-da9052.c b/drivers/leds/leds-da9052.c
index 28291b6..e4dc010 100644
--- a/drivers/leds/leds-da9052.c
+++ b/drivers/leds/leds-da9052.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/leds.h>
-#include <linux/workqueue.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/da9052/reg.h>
@@ -32,11 +31,9 @@
 
 struct da9052_led {
 	struct led_classdev cdev;
-	struct work_struct work;
 	struct da9052 *da9052;
 	unsigned char led_index;
 	unsigned char id;
-	int brightness;
 };
 
 static unsigned char led_reg[] = {
@@ -44,12 +41,13 @@ static unsigned char led_reg[] = {
 	DA9052_LED_CONT_5_REG,
 };
 
-static int da9052_set_led_brightness(struct da9052_led *led)
+static int da9052_set_led_brightness(struct da9052_led *led,
+				     enum led_brightness brightness)
 {
 	u8 val;
 	int error;
 
-	val = (led->brightness & 0x7f) | DA9052_LED_CONT_DIM;
+	val = (brightness & 0x7f) | DA9052_LED_CONT_DIM;
 
 	error = da9052_reg_write(led->da9052, led_reg[led->led_index], val);
 	if (error < 0)
@@ -58,21 +56,13 @@ static int da9052_set_led_brightness(struct da9052_led *led)
 	return error;
 }
 
-static void da9052_led_work(struct work_struct *work)
-{
-	struct da9052_led *led = container_of(work, struct da9052_led, work);
-
-	da9052_set_led_brightness(led);
-}
-
 static void da9052_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness value)
 {
-	struct da9052_led *led;
+	struct da9052_led *led =
+			container_of(led_cdev, struct da9052_led, cdev);
 
-	led = container_of(led_cdev, struct da9052_led, cdev);
-	led->brightness = value;
-	schedule_work(&led->work);
+	da9052_set_led_brightness(led, value);
 }
 
 static int da9052_configure_leds(struct da9052 *da9052)
@@ -136,10 +126,8 @@ static int da9052_led_probe(struct platform_device *pdev)
 		led[i].cdev.brightness_set = da9052_led_set;
 		led[i].cdev.brightness = LED_OFF;
 		led[i].cdev.max_brightness = DA9052_MAX_BRIGHTNESS;
-		led[i].brightness = LED_OFF;
 		led[i].led_index = pled->leds[i].flags;
 		led[i].da9052 = dev_get_drvdata(pdev->dev.parent);
-		INIT_WORK(&led[i].work, da9052_led_work);
 
 		error = led_classdev_register(pdev->dev.parent, &led[i].cdev);
 		if (error) {
@@ -148,7 +136,8 @@ static int da9052_led_probe(struct platform_device *pdev)
 			goto err_register;
 		}
 
-		error = da9052_set_led_brightness(&led[i]);
+		error = da9052_set_led_brightness(&led[i],
+						  led[i].cdev.brightness);
 		if (error) {
 			dev_err(&pdev->dev, "Unable to init led %d\n",
 				led[i].led_index);
@@ -166,10 +155,8 @@ static int da9052_led_probe(struct platform_device *pdev)
 	return 0;
 
 err_register:
-	for (i = i - 1; i >= 0; i--) {
+	for (i = i - 1; i >= 0; i--)
 		led_classdev_unregister(&led[i].cdev);
-		cancel_work_sync(&led[i].work);
-	}
 err:
 	return error;
 }
@@ -187,10 +174,8 @@ static int da9052_led_remove(struct platform_device *pdev)
 	pled = pdata->pled;
 
 	for (i = 0; i < pled->num_leds; i++) {
-		led[i].brightness = 0;
-		da9052_set_led_brightness(&led[i]);
+		da9052_set_led_brightness(&led[i], LED_OFF);
 		led_classdev_unregister(&led[i].cdev);
-		cancel_work_sync(&led[i].work);
 	}
 
 	return 0;
-- 
1.7.9.5
