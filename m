From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 21/51] leds: wm831x: Remove work queue
Date: Fri, 17 Jul 2015 10:47:07 +0200
Message-ID: <1437122857-6765-22-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Mark Brown <broonie@kernel.org>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Brown <broonie@kernel.org>
---
 drivers/leds/leds-wm831x-status.c |   23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index 56027ef..01dad0e 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -23,7 +23,6 @@
 struct wm831x_status {
 	struct led_classdev cdev;
 	struct wm831x *wm831x;
-	struct work_struct work;
 	struct mutex mutex;
 
 	spinlock_t value_lock;
@@ -40,10 +39,8 @@ struct wm831x_status {
 #define to_wm831x_status(led_cdev) \
 	container_of(led_cdev, struct wm831x_status, cdev)
 
-static void wm831x_status_work(struct work_struct *work)
+static void wm831x_status_set(struct wm831x_status *led)
 {
-	struct wm831x_status *led = container_of(work, struct wm831x_status,
-						 work);
 	unsigned long flags;
 
 	mutex_lock(&led->mutex);
@@ -70,8 +67,8 @@ static void wm831x_status_work(struct work_struct *work)
 	mutex_unlock(&led->mutex);
 }
 
-static void wm831x_status_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
+static void wm831x_status_brightness_set(struct led_classdev *led_cdev,
+					 enum led_brightness value)
 {
 	struct wm831x_status *led = to_wm831x_status(led_cdev);
 	unsigned long flags;
@@ -80,8 +77,8 @@ static void wm831x_status_set(struct led_classdev *led_cdev,
 	led->brightness = value;
 	if (value == LED_OFF)
 		led->blink = 0;
-	schedule_work(&led->work);
 	spin_unlock_irqrestore(&led->value_lock, flags);
+	wm831x_status_set(led);
 }
 
 static int wm831x_status_blink_set(struct led_classdev *led_cdev,
@@ -147,11 +144,8 @@ static int wm831x_status_blink_set(struct led_classdev *led_cdev,
 	else
 		led->blink = 0;
 
-	/* Always update; if we fail turn off blinking since we expect
-	 * a software fallback. */
-	schedule_work(&led->work);
-
 	spin_unlock_irqrestore(&led->value_lock, flags);
+	wm831x_status_set(led);
 
 	return ret;
 }
@@ -206,11 +200,9 @@ static ssize_t wm831x_status_src_store(struct device *dev,
 	for (i = 0; i < ARRAY_SIZE(led_src_texts); i++) {
 		if (!strcmp(name, led_src_texts[i])) {
 			mutex_lock(&led->mutex);
-
 			led->src = i;
-			schedule_work(&led->work);
-
 			mutex_unlock(&led->mutex);
+			wm831x_status_set(led);
 		}
 	}
 
@@ -262,7 +254,6 @@ static int wm831x_status_probe(struct platform_device *pdev)
 		pdata.name = dev_name(&pdev->dev);
 
 	mutex_init(&drvdata->mutex);
-	INIT_WORK(&drvdata->work, wm831x_status_work);
 	spin_lock_init(&drvdata->value_lock);
 
 	/* We cache the configuration register and read startup values
@@ -287,7 +278,7 @@ static int wm831x_status_probe(struct platform_device *pdev)
 
 	drvdata->cdev.name = pdata.name;
 	drvdata->cdev.default_trigger = pdata.default_trigger;
-	drvdata->cdev.brightness_set = wm831x_status_set;
+	drvdata->cdev.brightness_set = wm831x_status_brightness_set;
 	drvdata->cdev.blink_set = wm831x_status_blink_set;
 	drvdata->cdev.groups = wm831x_status_groups;
 
-- 
1.7.9.5
