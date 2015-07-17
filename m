From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 08/51] leds: 88pm860x: Remove work queue
Date: Fri, 17 Jul 2015 10:46:54 +0200
Message-ID: <1437122857-6765-9-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42537 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932065AbbGQIsO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 04:48:14 -0400
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/leds/leds-88pm860x.c |   21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 1497a09..fb29848 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -16,7 +16,6 @@
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 #include <linux/mfd/88pm860x.h>
 #include <linux/module.h>
 
@@ -33,7 +32,6 @@
 struct pm860x_led {
 	struct led_classdev cdev;
 	struct i2c_client *i2c;
-	struct work_struct work;
 	struct pm860x_chip *chip;
 	struct mutex lock;
 	char name[MFD_NAME_SIZE];
@@ -69,17 +67,18 @@ static int led_power_set(struct pm860x_chip *chip, int port, int on)
 	return ret;
 }
 
-static void pm860x_led_work(struct work_struct *work)
+static void pm860x_led_set(struct led_classdev *cdev,
+			   enum led_brightness value)
 {
-
-	struct pm860x_led *led;
+	struct pm860x_led *led = container_of(cdev, struct pm860x_led, cdev);
 	struct pm860x_chip *chip;
 	unsigned char buf[3];
 	int ret;
 
-	led = container_of(work, struct pm860x_led, work);
 	chip = led->chip;
 	mutex_lock(&led->lock);
+	led->brightness = value >> 3;
+
 	if ((led->current_brightness == 0) && led->brightness) {
 		led_power_set(chip, led->port, 1);
 		if (led->iset) {
@@ -114,15 +113,6 @@ static void pm860x_led_work(struct work_struct *work)
 	mutex_unlock(&led->lock);
 }
 
-static void pm860x_led_set(struct led_classdev *cdev,
-			   enum led_brightness value)
-{
-	struct pm860x_led *data = container_of(cdev, struct pm860x_led, cdev);
-
-	data->brightness = value >> 3;
-	schedule_work(&data->work);
-}
-
 #ifdef CONFIG_OF
 static int pm860x_led_dt_init(struct platform_device *pdev,
 			      struct pm860x_led *data)
@@ -214,7 +204,6 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	data->cdev.name = data->name;
 	data->cdev.brightness_set = pm860x_led_set;
 	mutex_init(&data->lock);
-	INIT_WORK(&data->work, pm860x_led_work);
 
 	ret = led_classdev_register(chip->dev, &data->cdev);
 	if (ret < 0) {
-- 
1.7.9.5
