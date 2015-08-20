From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 21/36] leds: lp8788: Remove work queue
Date: Thu, 20 Aug 2015 16:43:51 +0200
Message-ID: <1440081846-11697-22-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Milo Kim <milo.kim@ti.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Milo Kim <milo.kim@ti.com>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-lp8788.c |   48 +++++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
index 3409f03..0eee38f 100644
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
 
@@ -76,24 +74,29 @@ static int lp8788_led_init_device(struct lp8788_led *led,
 	return lp8788_update_bits(led->lp, addr, mask, val);
 }
 
-static void lp8788_led_enable(struct lp8788_led *led,
+static int lp8788_led_enable(struct lp8788_led *led,
 			enum lp8788_isink_number num, int on)
 {
+	int ret;
+
 	u8 mask = 1 << num;
 	u8 val = on << num;
 
-	if (lp8788_update_bits(led->lp, LP8788_ISINK_CTRL, mask, val))
-		return;
+	ret = lp8788_update_bits(led->lp, LP8788_ISINK_CTRL, mask, val);
+	if (ret == 0)
+		led->on = on;
 
-	led->on = on;
+	return ret;
 }
 
-static void lp8788_led_work(struct work_struct *work)
+static int lp8788_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness val)
 {
-	struct lp8788_led *led = container_of(work, struct lp8788_led, work);
+	struct lp8788_led *led =
+			container_of(led_cdev, struct lp8788_led, led_dev);
+
 	enum lp8788_isink_number num = led->isink_num;
-	int enable;
-	u8 val = led->brightness;
+	int enable, ret;
 
 	mutex_lock(&led->lock);
 
@@ -101,28 +104,21 @@ static void lp8788_led_work(struct work_struct *work)
 	case LP8788_ISINK_1:
 	case LP8788_ISINK_2:
 	case LP8788_ISINK_3:
-		lp8788_write_byte(led->lp, lp8788_pwm_addr[num], val);
+		ret = lp8788_write_byte(led->lp, lp8788_pwm_addr[num], val);
+		if (ret < 0)
+			goto unlock;
 		break;
 	default:
 		mutex_unlock(&led->lock);
-		return;
+		return -EINVAL;
 	}
 
 	enable = (val > 0) ? 1 : 0;
 	if (enable != led->on)
-		lp8788_led_enable(led, num, enable);
-
+		ret = lp8788_led_enable(led, num, enable);
+unlock:
 	mutex_unlock(&led->lock);
-}
-
-static void lp8788_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness brt_val)
-{
-	struct lp8788_led *led =
-			container_of(led_cdev, struct lp8788_led, led_dev);
-
-	led->brightness = brt_val;
-	schedule_work(&led->work);
+	return ret;
 }
 
 static int lp8788_led_probe(struct platform_device *pdev)
@@ -139,7 +135,7 @@ static int lp8788_led_probe(struct platform_device *pdev)
 
 	led->lp = lp;
 	led->led_dev.max_brightness = MAX_BRIGHTNESS;
-	led->led_dev.brightness_set = lp8788_brightness_set;
+	led->led_dev.brightness_set_blocking = lp8788_brightness_set;
 
 	led_pdata = lp->pdata ? lp->pdata->led_pdata : NULL;
 
@@ -149,7 +145,6 @@ static int lp8788_led_probe(struct platform_device *pdev)
 		led->led_dev.name = led_pdata->name;
 
 	mutex_init(&led->lock);
-	INIT_WORK(&led->work, lp8788_led_work);
 
 	platform_set_drvdata(pdev, led);
 
@@ -173,7 +168,6 @@ static int lp8788_led_remove(struct platform_device *pdev)
 	struct lp8788_led *led = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&led->led_dev);
-	flush_work(&led->work);
 
 	return 0;
 }
-- 
1.7.9.5
