From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 29/51] leds: wm8350: Remove work queue
Date: Fri, 17 Jul 2015 10:47:15 +0200
Message-ID: <1437122857-6765-30-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Mark Brown <broonie@kernel.org>
List-Id: linux-leds@vger.kernel.org

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
---
 drivers/leds/leds-wm8350.c      |   31 ++++++-------------------------
 include/linux/mfd/wm8350/pmic.h |    1 -
 2 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/leds-wm8350.c b/drivers/leds/leds-wm8350.c
index 0d12183..149579a 100644
--- a/drivers/leds/leds-wm8350.c
+++ b/drivers/leds/leds-wm8350.c
@@ -138,21 +138,22 @@ static void wm8350_led_disable(struct wm8350_led *led)
 	led->enabled = 0;
 }
 
-static void led_work(struct work_struct *work)
+static void wm8350_led_set(struct led_classdev *led_cdev,
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
 		wm8350_led_disable(led);
-		goto out;
+		return;
 	}
 
 	/* This scales linearly into the index of valid current
@@ -171,31 +172,14 @@ static void led_work(struct work_struct *work)
 			isink_cur[uA], ret);
 
 	wm8350_led_enable(led);
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
@@ -251,8 +235,6 @@ static int wm8350_led_probe(struct platform_device *pdev)
 			 pdata->max_uA);
 
 	spin_lock_init(&led->value_lock);
-	mutex_init(&led->mutex);
-	INIT_WORK(&led->work, led_work);
 	led->value = LED_OFF;
 	platform_set_drvdata(pdev, led);
 
@@ -264,7 +246,6 @@ static int wm8350_led_remove(struct platform_device *pdev)
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
