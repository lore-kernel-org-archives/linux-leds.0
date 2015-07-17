From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 25/51] leds: lt3593: Remove work queue
Date: Fri, 17 Jul 2015 10:47:11 +0200
Message-ID: <1437122857-6765-26-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@caiaq.de>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Mack <daniel@caiaq.de>
---
 drivers/leds/leds-lt3593.c |   27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 9f41124..5e456ee 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -19,7 +19,6 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/leds.h>
-#include <linux/workqueue.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/slab.h>
@@ -28,15 +27,14 @@
 struct lt3593_led_data {
 	struct led_classdev cdev;
 	unsigned gpio;
-	struct work_struct work;
-	u8 new_level;
 };
 
-static void lt3593_led_work(struct work_struct *work)
+static void lt3593_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness value)
 {
-	int pulses;
 	struct lt3593_led_data *led_dat =
-		container_of(work, struct lt3593_led_data, work);
+		container_of(led_cdev, struct lt3593_led_data, cdev);
+	int pulses;
 
 	/*
 	 * The LT3593 resets its internal current level register to the maximum
@@ -47,12 +45,12 @@ static void lt3593_led_work(struct work_struct *work)
 	 * applied is to the output driver.
 	 */
 
-	if (led_dat->new_level == 0) {
+	if (value == 0) {
 		gpio_set_value_cansleep(led_dat->gpio, 0);
 		return;
 	}
 
-	pulses = 32 - (led_dat->new_level * 32) / 255;
+	pulses = 32 - (value * 32) / 255;
 
 	if (pulses == 0) {
 		gpio_set_value_cansleep(led_dat->gpio, 0);
@@ -71,16 +69,6 @@ static void lt3593_led_work(struct work_struct *work)
 	}
 }
 
-static void lt3593_led_set(struct led_classdev *led_cdev,
-	enum led_brightness value)
-{
-	struct lt3593_led_data *led_dat =
-		container_of(led_cdev, struct lt3593_led_data, cdev);
-
-	led_dat->new_level = value;
-	schedule_work(&led_dat->work);
-}
-
 static int create_lt3593_led(const struct gpio_led *template,
 	struct lt3593_led_data *led_dat, struct device *parent)
 {
@@ -111,8 +99,6 @@ static int create_lt3593_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	INIT_WORK(&led_dat->work, lt3593_led_work);
-
 	ret = led_classdev_register(parent, &led_dat->cdev);
 	if (ret < 0)
 		return ret;
@@ -129,7 +115,6 @@ static void delete_lt3593_led(struct lt3593_led_data *led)
 		return;
 
 	led_classdev_unregister(&led->cdev);
-	cancel_work_sync(&led->work);
 }
 
 static int lt3593_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
