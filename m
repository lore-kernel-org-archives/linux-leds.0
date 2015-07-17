From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 17/51] leds: lp8788: Remove work queue
Date: Fri, 17 Jul 2015 10:47:03 +0200
Message-ID: <1437122857-6765-18-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Milo Kim <milo.kim@ti.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp8788.c |   22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
index 3409f03..634c9ad 100644
--- a/drivers/leds/leds-lp8788.c
+++ b/drivers/leds/leds-lp8788.c
@@ -26,10 +26,8 @@
 struct lp8788_led {
 	struct lp8788 *lp;
 	struct mutex lock;
-	struct work_struct work;
 	struct led_classdev led_dev;
 	enum lp8788_isink_number isink_num;
-	enum led_brightness brightness;
 	int on;
 };
 
@@ -88,12 +86,14 @@ static void lp8788_led_enable(struct lp8788_led *led,
 	led->on = on;
 }
 
-static void lp8788_led_work(struct work_struct *work)
+static void lp8788_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness val)
 {
-	struct lp8788_led *led = container_of(work, struct lp8788_led, work);
+	struct lp8788_led *led =
+			container_of(led_cdev, struct lp8788_led, led_dev);
+
 	enum lp8788_isink_number num = led->isink_num;
 	int enable;
-	u8 val = led->brightness;
 
 	mutex_lock(&led->lock);
 
@@ -115,16 +115,6 @@ static void lp8788_led_work(struct work_struct *work)
 	mutex_unlock(&led->lock);
 }
 
-static void lp8788_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness brt_val)
-{
-	struct lp8788_led *led =
-			container_of(led_cdev, struct lp8788_led, led_dev);
-
-	led->brightness = brt_val;
-	schedule_work(&led->work);
-}
-
 static int lp8788_led_probe(struct platform_device *pdev)
 {
 	struct lp8788 *lp = dev_get_drvdata(pdev->dev.parent);
@@ -149,7 +139,6 @@ static int lp8788_led_probe(struct platform_device *pdev)
 		led->led_dev.name = led_pdata->name;
 
 	mutex_init(&led->lock);
-	INIT_WORK(&led->work, lp8788_led_work);
 
 	platform_set_drvdata(pdev, led);
 
@@ -173,7 +162,6 @@ static int lp8788_led_remove(struct platform_device *pdev)
 	struct lp8788_led *led = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&led->led_dev);
-	flush_work(&led->work);
 
 	return 0;
 }
-- 
1.7.9.5
