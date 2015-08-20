From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 12/36] leds: 88pm860x: Remove work queue
Date: Thu, 20 Aug 2015 16:43:42 +0200
Message-ID: <1440081846-11697-13-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-88pm860x.c |   23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 1497a09..c9fcf49 100644
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
+static int pm860x_led_set(struct led_classdev *cdev,
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
@@ -112,15 +111,8 @@ static void pm860x_led_work(struct work_struct *work)
 	dev_dbg(chip->dev, "Update LED. (reg:%d, brightness:%d)\n",
 		led->reg_control, led->brightness);
 	mutex_unlock(&led->lock);
-}
 
-static void pm860x_led_set(struct led_classdev *cdev,
-			   enum led_brightness value)
-{
-	struct pm860x_led *data = container_of(cdev, struct pm860x_led, cdev);
-
-	data->brightness = value >> 3;
-	schedule_work(&data->work);
+	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -212,9 +204,8 @@ static int pm860x_led_probe(struct platform_device *pdev)
 
 	data->current_brightness = 0;
 	data->cdev.name = data->name;
-	data->cdev.brightness_set = pm860x_led_set;
+	data->cdev.brightness_set_blocking = pm860x_led_set;
 	mutex_init(&data->lock);
-	INIT_WORK(&data->work, pm860x_led_work);
 
 	ret = led_classdev_register(chip->dev, &data->cdev);
 	if (ret < 0) {
-- 
1.7.9.5
