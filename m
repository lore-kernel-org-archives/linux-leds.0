From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 28/51] leds: regulator: Remove work queue
Date: Fri, 17 Jul 2015 10:47:14 +0200
Message-ID: <1437122857-6765-29-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>
List-Id: linux-leds@vger.kernel.org

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Antonio Ospite <ospite@studenti.unina.it>
---
 drivers/leds/leds-regulator.c |   34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
index ffc2139..87615e1 100644
--- a/drivers/leds/leds-regulator.c
+++ b/drivers/leds/leds-regulator.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 #include <linux/leds.h>
 #include <linux/leds-regulator.h>
 #include <linux/platform_device.h>
@@ -25,10 +24,8 @@
 
 struct regulator_led {
 	struct led_classdev cdev;
-	enum led_brightness value;
 	int enabled;
 	struct mutex mutex;
-	struct work_struct work;
 
 	struct regulator *vcc;
 };
@@ -94,22 +91,23 @@ static void regulator_led_disable(struct regulator_led *led)
 	led->enabled = 0;
 }
 
-static void regulator_led_set_value(struct regulator_led *led)
+static void regulator_led_set_value(struct regulator_led *led,
+				    enum led_brightness value)
 {
 	int voltage;
 	int ret;
 
 	mutex_lock(&led->mutex);
 
-	if (led->value == LED_OFF) {
+	if (value == LED_OFF) {
 		regulator_led_disable(led);
 		goto out;
 	}
 
 	if (led->cdev.max_brightness > 1) {
-		voltage = led_regulator_get_voltage(led->vcc, led->value);
+		voltage = led_regulator_get_voltage(led->vcc, value);
 		dev_dbg(led->cdev.dev, "brightness: %d voltage: %d\n",
-				led->value, voltage);
+				value, voltage);
 
 		ret = regulator_set_voltage(led->vcc, voltage, voltage);
 		if (ret != 0)
@@ -123,21 +121,12 @@ out:
 	mutex_unlock(&led->mutex);
 }
 
-static void led_work(struct work_struct *work)
-{
-	struct regulator_led *led;
-
-	led = container_of(work, struct regulator_led, work);
-	regulator_led_set_value(led);
-}
-
 static void regulator_led_brightness_set(struct led_classdev *led_cdev,
 			   enum led_brightness value)
 {
 	struct regulator_led *led = to_regulator_led(led_cdev);
 
-	led->value = value;
-	schedule_work(&led->work);
+	regulator_led_set_value(led, value);
 }
 
 static int regulator_led_probe(struct platform_device *pdev)
@@ -169,7 +158,6 @@ static int regulator_led_probe(struct platform_device *pdev)
 				pdata->brightness);
 		return -EINVAL;
 	}
-	led->value = pdata->brightness;
 
 	led->cdev.brightness_set = regulator_led_brightness_set;
 	led->cdev.name = pdata->name;
@@ -181,21 +169,18 @@ static int regulator_led_probe(struct platform_device *pdev)
 		led->enabled = 1;
 
 	mutex_init(&led->mutex);
-	INIT_WORK(&led->work, led_work);
 
 	platform_set_drvdata(pdev, led);
 
 	ret = led_classdev_register(&pdev->dev, &led->cdev);
-	if (ret < 0) {
-		cancel_work_sync(&led->work);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* to expose the default value to userspace */
-	led->cdev.brightness = led->value;
+	led->cdev.brightness = pdata->brightness;
 
 	/* Set the default led status */
-	regulator_led_set_value(led);
+	regulator_led_set_value(led, led->cdev.brightness);
 
 	return 0;
 }
@@ -205,7 +190,6 @@ static int regulator_led_remove(struct platform_device *pdev)
 	struct regulator_led *led = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&led->cdev);
-	cancel_work_sync(&led->work);
 	regulator_led_disable(led);
 	return 0;
 }
-- 
1.7.9.5
