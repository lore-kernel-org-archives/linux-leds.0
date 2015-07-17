From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 09/51] leds: adp5520: Remove work queue
Date: Fri, 17 Jul 2015 10:46:55 +0200
Message-ID: <1437122857-6765-10-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Michael Hennerich <michael.hennerich@analog.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/leds/leds-adp5520.c |   22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-adp5520.c b/drivers/leds/leds-adp5520.c
index 07e66ca..6378150 100644
--- a/drivers/leds/leds-adp5520.c
+++ b/drivers/leds/leds-adp5520.c
@@ -17,34 +17,24 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/leds.h>
-#include <linux/workqueue.h>
 #include <linux/mfd/adp5520.h>
 #include <linux/slab.h>
 
 struct adp5520_led {
 	struct led_classdev	cdev;
-	struct work_struct	work;
 	struct device		*master;
-	enum led_brightness	new_brightness;
 	int			id;
 	int			flags;
 };
 
-static void adp5520_led_work(struct work_struct *work)
-{
-	struct adp5520_led *led = container_of(work, struct adp5520_led, work);
-	adp5520_write(led->master, ADP5520_LED1_CURRENT + led->id - 1,
-			 led->new_brightness >> 2);
-}
-
 static void adp5520_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness value)
 {
 	struct adp5520_led *led;
 
 	led = container_of(led_cdev, struct adp5520_led, cdev);
-	led->new_brightness = value;
-	schedule_work(&led->work);
+	adp5520_write(led->master, ADP5520_LED1_CURRENT + led->id - 1,
+			 value >> 2);
 }
 
 static int adp5520_led_setup(struct adp5520_led *led)
@@ -146,9 +136,6 @@ static int adp5520_led_probe(struct platform_device *pdev)
 		led_dat->id = led_dat->flags & ADP5520_FLAG_LED_MASK;
 
 		led_dat->master = pdev->dev.parent;
-		led_dat->new_brightness = LED_OFF;
-
-		INIT_WORK(&led_dat->work, adp5520_led_work);
 
 		ret = led_classdev_register(led_dat->master, &led_dat->cdev);
 		if (ret) {
@@ -170,10 +157,8 @@ static int adp5520_led_probe(struct platform_device *pdev)
 
 err:
 	if (i > 0) {
-		for (i = i - 1; i >= 0; i--) {
+		for (i = i - 1; i >= 0; i--)
 			led_classdev_unregister(&led[i].cdev);
-			cancel_work_sync(&led[i].work);
-		}
 	}
 
 	return ret;
@@ -192,7 +177,6 @@ static int adp5520_led_remove(struct platform_device *pdev)
 
 	for (i = 0; i < pdata->num_leds; i++) {
 		led_classdev_unregister(&led[i].cdev);
-		cancel_work_sync(&led[i].work);
 	}
 
 	return 0;
-- 
1.7.9.5
