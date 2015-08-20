From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 29/36] leds: lt3593: Remove work queue
Date: Thu, 20 Aug 2015 16:43:59 +0200
Message-ID: <1440081846-11697-30-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@caiaq.de>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-lt3593.c |   33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 9f41124..a7ff510 100644
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
+static int lt3593_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness value)
 {
-	int pulses;
 	struct lt3593_led_data *led_dat =
-		container_of(work, struct lt3593_led_data, work);
+		container_of(led_cdev, struct lt3593_led_data, cdev);
+	int pulses;
 
 	/*
 	 * The LT3593 resets its internal current level register to the maximum
@@ -47,18 +45,18 @@ static void lt3593_led_work(struct work_struct *work)
 	 * applied is to the output driver.
 	 */
 
-	if (led_dat->new_level == 0) {
+	if (value == 0) {
 		gpio_set_value_cansleep(led_dat->gpio, 0);
-		return;
+		return 0;
 	}
 
-	pulses = 32 - (led_dat->new_level * 32) / 255;
+	pulses = 32 - (value * 32) / 255;
 
 	if (pulses == 0) {
 		gpio_set_value_cansleep(led_dat->gpio, 0);
 		mdelay(1);
 		gpio_set_value_cansleep(led_dat->gpio, 1);
-		return;
+		return 0;
 	}
 
 	gpio_set_value_cansleep(led_dat->gpio, 1);
@@ -69,16 +67,8 @@ static void lt3593_led_work(struct work_struct *work)
 		gpio_set_value_cansleep(led_dat->gpio, 1);
 		udelay(1);
 	}
-}
 
-static void lt3593_led_set(struct led_classdev *led_cdev,
-	enum led_brightness value)
-{
-	struct lt3593_led_data *led_dat =
-		container_of(led_cdev, struct lt3593_led_data, cdev);
-
-	led_dat->new_level = value;
-	schedule_work(&led_dat->work);
+	return 0;
 }
 
 static int create_lt3593_led(const struct gpio_led *template,
@@ -97,7 +87,7 @@ static int create_lt3593_led(const struct gpio_led *template,
 	led_dat->cdev.default_trigger = template->default_trigger;
 	led_dat->gpio = template->gpio;
 
-	led_dat->cdev.brightness_set = lt3593_led_set;
+	led_dat->cdev.brightness_set_blocking = lt3593_led_set;
 
 	state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
 	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
@@ -111,8 +101,6 @@ static int create_lt3593_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	INIT_WORK(&led_dat->work, lt3593_led_work);
-
 	ret = led_classdev_register(parent, &led_dat->cdev);
 	if (ret < 0)
 		return ret;
@@ -129,7 +117,6 @@ static void delete_lt3593_led(struct lt3593_led_data *led)
 		return;
 
 	led_classdev_unregister(&led->cdev);
-	cancel_work_sync(&led->work);
 }
 
 static int lt3593_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
