From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 33/36] leds: wm8350: Remove work queue
Date: Thu, 20 Aug 2015 16:44:03 +0200
Message-ID: <1440081846-11697-34-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36547 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752087AbbHTOrv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 20 Aug 2015 10:47:51 -0400
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mark Brown <broonie@kernel.org>

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
---
 drivers/leds/leds-wm8350.c      |   64 +++++++++++++++------------------------
 include/linux/mfd/wm8350/pmic.h |    1 -
 2 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/leds-wm8350.c b/drivers/leds/leds-wm8350.c
index 0d12183..e1e4e9d 100644
--- a/drivers/leds/leds-wm8350.c
+++ b/drivers/leds/leds-wm8350.c
@@ -89,40 +89,42 @@ static const int isink_cur[] = {
 #define to_wm8350_led(led_cdev) \
 	container_of(led_cdev, struct wm8350_led, cdev)
 
-static void wm8350_led_enable(struct wm8350_led *led)
+static int wm8350_led_enable(struct wm8350_led *led)
 {
-	int ret;
+	int ret = 0;
 
 	if (led->enabled)
-		return;
+		return ret;
 
 	ret = regulator_enable(led->isink);
 	if (ret != 0) {
 		dev_err(led->cdev.dev, "Failed to enable ISINK: %d\n", ret);
-		return;
+		return ret;
 	}
 
 	ret = regulator_enable(led->dcdc);
 	if (ret != 0) {
 		dev_err(led->cdev.dev, "Failed to enable DCDC: %d\n", ret);
 		regulator_disable(led->isink);
-		return;
+		return ret;
 	}
 
 	led->enabled = 1;
+
+	return ret;
 }
 
-static void wm8350_led_disable(struct wm8350_led *led)
+static int wm8350_led_disable(struct wm8350_led *led)
 {
-	int ret;
+	int ret = 0;
 
 	if (!led->enabled)
-		return;
+		return ret;
 
 	ret = regulator_disable(led->dcdc);
 	if (ret != 0) {
 		dev_err(led->cdev.dev, "Failed to disable DCDC: %d\n", ret);
-		return;
+		return ret;
 	}
 
 	ret = regulator_disable(led->isink);
@@ -132,27 +134,29 @@ static void wm8350_led_disable(struct wm8350_led *led)
 		if (ret != 0)
 			dev_err(led->cdev.dev, "Failed to reenable DCDC: %d\n",
 				ret);
-		return;
+		return ret;
 	}
 
 	led->enabled = 0;
+
+	return ret;
 }
 
-static void led_work(struct work_struct *work)
+static int wm8350_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness value)
 {
-	struct wm8350_led *led = container_of(work, struct wm8350_led, work);
+	struct wm8350_led *led = to_wm8350_led(led_cdev);
+	unsigned long flags;
 	int ret;
 	int uA;
-	unsigned long flags;
 
-	mutex_lock(&led->mutex);
+	led->value = value;
 
 	spin_lock_irqsave(&led->value_lock, flags);
 
 	if (led->value == LED_OFF) {
 		spin_unlock_irqrestore(&led->value_lock, flags);
-		wm8350_led_disable(led);
-		goto out;
+		return wm8350_led_disable(led);
 	}
 
 	/* This scales linearly into the index of valid current
@@ -166,36 +170,21 @@ static void led_work(struct work_struct *work)
 
 	ret = regulator_set_current_limit(led->isink, isink_cur[uA],
 					  isink_cur[uA]);
-	if (ret != 0)
+	if (ret != 0) {
 		dev_err(led->cdev.dev, "Failed to set %duA: %d\n",
 			isink_cur[uA], ret);
+		return ret;
+	}
 
-	wm8350_led_enable(led);
-
-out:
-	mutex_unlock(&led->mutex);
-}
-
-static void wm8350_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
-{
-	struct wm8350_led *led = to_wm8350_led(led_cdev);
-	unsigned long flags;
-
-	spin_lock_irqsave(&led->value_lock, flags);
-	led->value = value;
-	schedule_work(&led->work);
-	spin_unlock_irqrestore(&led->value_lock, flags);
+	return wm8350_led_enable(led);
 }
 
 static void wm8350_led_shutdown(struct platform_device *pdev)
 {
 	struct wm8350_led *led = platform_get_drvdata(pdev);
 
-	mutex_lock(&led->mutex);
 	led->value = LED_OFF;
 	wm8350_led_disable(led);
-	mutex_unlock(&led->mutex);
 }
 
 static int wm8350_led_probe(struct platform_device *pdev)
@@ -232,7 +221,7 @@ static int wm8350_led_probe(struct platform_device *pdev)
 	if (led == NULL)
 		return -ENOMEM;
 
-	led->cdev.brightness_set = wm8350_led_set;
+	led->cdev.brightness_set_blocking = wm8350_led_set;
 	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.name = pdata->name;
 	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
@@ -251,8 +240,6 @@ static int wm8350_led_probe(struct platform_device *pdev)
 			 pdata->max_uA);
 
 	spin_lock_init(&led->value_lock);
-	mutex_init(&led->mutex);
-	INIT_WORK(&led->work, led_work);
 	led->value = LED_OFF;
 	platform_set_drvdata(pdev, led);
 
@@ -264,7 +251,6 @@ static int wm8350_led_remove(struct platform_device *pdev)
 	struct wm8350_led *led = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&led->cdev);
-	flush_work(&led->work);
 	wm8350_led_disable(led);
 	return 0;
 }
diff --git a/include/linux/mfd/wm8350/pmic.h b/include/linux/mfd/wm8350/pmic.h
index 579b50c..7a09e7f 100644
--- a/include/linux/mfd/wm8350/pmic.h
+++ b/include/linux/mfd/wm8350/pmic.h
@@ -715,7 +715,6 @@ struct wm8350_led_platform_data {
 
 struct wm8350_led {
 	struct platform_device *pdev;
-	struct mutex mutex;
 	struct work_struct work;
 	spinlock_t value_lock;
 	enum led_brightness value;
-- 
1.7.9.5
