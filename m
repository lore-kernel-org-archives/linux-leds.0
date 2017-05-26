From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 2/2] leds: trigger: gpio: Use threaded IRQ
Date: Fri, 26 May 2017 15:17:47 +0200
Message-ID: <468b1585fa64ee73ed8bea3e274a0816cd4b6160.1495804666.git.jan.kiszka@siemens.com>
References: <cover.1495804666.git.jan.kiszka@siemens.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1495804666.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1495804666.git.jan.kiszka@siemens.com>
References: <cover.1495804666.git.jan.kiszka@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This both simplifies the code because we can drop the workqueue
indirection, and it enables using the trigger for GPIOs that work with
threaded IRQs themselves.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 drivers/leds/trigger/ledtrig-gpio.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 93d6b82e6437..8891e88d54dd 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -14,14 +14,12 @@
 #include <linux/init.h>
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
-#include <linux/workqueue.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
 #include "../leds.h"
 
 struct gpio_trig_data {
 	struct led_classdev *led;
-	struct work_struct work;
 
 	unsigned desired_brightness;	/* desired brightness when led is on */
 	unsigned inverted;		/* true when gpio is inverted */
@@ -32,22 +30,8 @@ static irqreturn_t gpio_trig_irq(int irq, void *_led)
 {
 	struct led_classdev *led = _led;
 	struct gpio_trig_data *gpio_data = led->trigger_data;
-
-	/* just schedule_work since gpio_get_value can sleep */
-	schedule_work(&gpio_data->work);
-
-	return IRQ_HANDLED;
-};
-
-static void gpio_trig_work(struct work_struct *work)
-{
-	struct gpio_trig_data *gpio_data = container_of(work,
-			struct gpio_trig_data, work);
 	int tmp;
 
-	if (!gpio_data->gpio)
-		return;
-
 	tmp = gpio_get_value_cansleep(gpio_data->gpio);
 	if (gpio_data->inverted)
 		tmp = !tmp;
@@ -61,6 +45,8 @@ static void gpio_trig_work(struct work_struct *work)
 	} else {
 		led_set_brightness_nosleep(gpio_data->led, LED_OFF);
 	}
+
+	return IRQ_HANDLED;
 }
 
 static ssize_t gpio_trig_brightness_show(struct device *dev,
@@ -120,7 +106,7 @@ static ssize_t gpio_trig_inverted_store(struct device *dev,
 	gpio_data->inverted = inverted;
 
 	/* After inverting, we need to update the LED. */
-	schedule_work(&gpio_data->work);
+	gpio_trig_irq(0, led);
 
 	return n;
 }
@@ -147,7 +133,6 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 	ret = sscanf(buf, "%u", &gpio);
 	if (ret < 1) {
 		dev_err(dev, "couldn't read gpio number\n");
-		flush_work(&gpio_data->work);
 		return -EINVAL;
 	}
 
@@ -161,8 +146,8 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 		return n;
 	}
 
-	ret = request_irq(gpio_to_irq(gpio), gpio_trig_irq,
-			IRQF_SHARED | IRQF_TRIGGER_RISING
+	ret = request_threaded_irq(gpio_to_irq(gpio), NULL, gpio_trig_irq,
+			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_RISING
 			| IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);
 	if (ret) {
 		dev_err(dev, "request_irq failed with error %d\n", ret);
@@ -171,7 +156,7 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 			free_irq(gpio_to_irq(gpio_data->gpio), led);
 		gpio_data->gpio = gpio;
 		/* After changing the GPIO, we need to update the LED. */
-		schedule_work(&gpio_data->work);
+		gpio_trig_irq(0, led);
 	}
 
 	return ret ? ret : n;
@@ -201,7 +186,6 @@ static void gpio_trig_activate(struct led_classdev *led)
 
 	gpio_data->led = led;
 	led->trigger_data = gpio_data;
-	INIT_WORK(&gpio_data->work, gpio_trig_work);
 	led->activated = true;
 
 	return;
@@ -224,7 +208,6 @@ static void gpio_trig_deactivate(struct led_classdev *led)
 		device_remove_file(led->dev, &dev_attr_gpio);
 		device_remove_file(led->dev, &dev_attr_inverted);
 		device_remove_file(led->dev, &dev_attr_desired_brightness);
-		flush_work(&gpio_data->work);
 		if (gpio_data->gpio != 0)
 			free_irq(gpio_to_irq(gpio_data->gpio), led);
 		kfree(gpio_data);
-- 
2.12.0
