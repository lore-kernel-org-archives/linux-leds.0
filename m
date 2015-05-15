From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH] leds: put hard limit on minimum blink period for slow leds
Date: Fri, 15 May 2015 19:47:37 +0300
Message-ID: <55562329.9070604@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp43.i.mail.ru ([94.100.177.103]:36641 "EHLO smtp43.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752335AbbEOQry (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 15 May 2015 12:47:54 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Michael Hennerich <michael.hennerich@analog.com>, Jan-Simon Moeller <jansimon.moeller@gmx.de>, Support Opensource <support.opensource@diasemi.com>, Milo Kim <milo.kim@ti.com>, Riku Voipio <riku.voipio@iki.fi>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, patches@opensource.wolfsonmicro.com


Currently the timer trigger allows to set blink period as small as
1mS. But in fact the minimum period is jiffy, which is usually 10mS.
The following mail says:
http://lkml.iu.edu/hypermail/linux/kernel/1504.3/03469.html
---
As I mentioned before even with hr timer it wouldn't be possible
to assure that 1ms is achievable due to locking and bus latency
reasons.
---
So the limit of 10mS should be enforced for drivers that use
waiting operations, like transfers across slow bus.
This allows to stay on safe side when CONFIG_HZ is set to eg 1000.

This patch differentiates the "slow" drivers by marking them with
the new LED_BRIGHTNESS_SLOW flag. Currently every driver that uses
a work-queue in .brightness_set op, is marked as such.
The extra bonus is the possibility of a further development
aiming for software PWM for "fast" drivers.

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Michael Hennerich <michael.hennerich@analog.com>
CC: Jan-Simon Moeller <jansimon.moeller@gmx.de>
CC: Support Opensource <support.opensource@diasemi.com>
CC: Milo Kim <milo.kim@ti.com>
CC: Riku Voipio <riku.voipio@iki.fi>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: Kyungmin Park <kyungmin.park@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: patches@opensource.wolfsonmicro.com

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-core.c                | 30 +++++++++++++++++++-----------
 drivers/leds/led-triggers.c            |  8 +++++---
 drivers/leds/leds-88pm860x.c           |  1 +
 drivers/leds/leds-adp5520.c            |  1 +
 drivers/leds/leds-bd2802.c             |  2 +-
 drivers/leds/leds-blinkm.c             |  3 ++-
 drivers/leds/leds-da903x.c             |  1 +
 drivers/leds/leds-da9052.c             |  1 +
 drivers/leds/leds-dac124s085.c         |  1 +
 drivers/leds/leds-gpio.c               |  2 ++
 drivers/leds/leds-lm3533.c             |  1 +
 drivers/leds/leds-lm355x.c             |  1 +
 drivers/leds/leds-lm3642.c             |  1 +
 drivers/leds/leds-lp3944.c             |  3 ++-
 drivers/leds/leds-lp55xx-common.c      |  1 +
 drivers/leds/leds-lp8788.c             |  1 +
 drivers/leds/leds-lp8860.c             |  1 +
 drivers/leds/leds-lt3593.c             |  1 +
 drivers/leds/leds-mc13783.c            |  3 ++-
 drivers/leds/leds-pca9532.c            |  1 +
 drivers/leds/leds-pca955x.c            |  1 +
 drivers/leds/leds-pca963x.c            |  1 +
 drivers/leds/leds-pwm.c                |  4 +++-
 drivers/leds/leds-regulator.c          |  2 +-
 drivers/leds/leds-tca6507.c            |  1 +
 drivers/leds/leds-wm831x-status.c      |  1 +
 drivers/leds/leds-wm8350.c             |  2 +-
 drivers/leds/trigger/ledtrig-oneshot.c |  5 ++++-
 drivers/leds/trigger/ledtrig-timer.c   | 18 +++++++++++++-----
 include/linux/leds.h                   |  8 ++++++--
 30 files changed, 78 insertions(+), 29 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 9886dac..2653755 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -25,12 +25,19 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
 LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);

-static void led_set_software_blink(struct led_classdev *led_cdev,
+static int led_set_software_blink(struct led_classdev *led_cdev,
 				   unsigned long delay_on,
 				   unsigned long delay_off)
 {
 	int current_brightness;

+	if (led_cdev->flags & LED_BRIGHTNESS_SLOW) {
+		if (delay_on < LED_SLOW_MIN_PERIOD)
+			return -EINVAL;
+		if (delay_off < LED_SLOW_MIN_PERIOD)
+			return -EINVAL;
+	}
+
 	current_brightness = led_get_brightness(led_cdev);
 	if (current_brightness)
 		led_cdev->blink_brightness = current_brightness;
@@ -43,36 +50,37 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 	/* never on - just set to off */
 	if (!delay_on) {
 		led_set_brightness_async(led_cdev, LED_OFF);
-		return;
+		return 0;
 	}

 	/* never off - just set to brightness */
 	if (!delay_off) {
 		led_set_brightness_async(led_cdev, led_cdev->blink_brightness);
-		return;
+		return 0;
 	}

 	mod_timer(&led_cdev->blink_timer, jiffies + 1);
+	return 0;
 }


-static void led_blink_setup(struct led_classdev *led_cdev,
+static int led_blink_setup(struct led_classdev *led_cdev,
 		     unsigned long *delay_on,
 		     unsigned long *delay_off)
 {
 	if (!(led_cdev->flags & LED_BLINK_ONESHOT) &&
 	    led_cdev->blink_set &&
 	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
-		return;
+		return 0;

 	/* blink with 1 Hz as default if nothing specified */
 	if (!*delay_on && !*delay_off)
 		*delay_on = *delay_off = 500;

-	led_set_software_blink(led_cdev, *delay_on, *delay_off);
+	return led_set_software_blink(led_cdev, *delay_on, *delay_off);
 }

-void led_blink_set(struct led_classdev *led_cdev,
+int led_blink_set(struct led_classdev *led_cdev,
 		   unsigned long *delay_on,
 		   unsigned long *delay_off)
 {
@@ -81,18 +89,18 @@ void led_blink_set(struct led_classdev *led_cdev,
 	led_cdev->flags &= ~LED_BLINK_ONESHOT;
 	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;

-	led_blink_setup(led_cdev, delay_on, delay_off);
+	return led_blink_setup(led_cdev, delay_on, delay_off);
 }
 EXPORT_SYMBOL(led_blink_set);

-void led_blink_set_oneshot(struct led_classdev *led_cdev,
+int led_blink_set_oneshot(struct led_classdev *led_cdev,
 			   unsigned long *delay_on,
 			   unsigned long *delay_off,
 			   int invert)
 {
 	if ((led_cdev->flags & LED_BLINK_ONESHOT) &&
 	     timer_pending(&led_cdev->blink_timer))
-		return;
+		return -EBUSY;

 	led_cdev->flags |= LED_BLINK_ONESHOT;
 	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
@@ -102,7 +110,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
 	else
 		led_cdev->flags &= ~LED_BLINK_INVERT;

-	led_blink_setup(led_cdev, delay_on, delay_off);
+	return led_blink_setup(led_cdev, delay_on, delay_off);
 }
 EXPORT_SYMBOL(led_blink_set_oneshot);

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index e8b1120..012b94c 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -272,6 +272,7 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
 			     int oneshot,
 			     int invert)
 {
+	int rc = 0;
 	struct led_classdev *led_cdev;

 	if (!trig)
@@ -280,12 +281,13 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
 	read_lock(&trig->leddev_list_lock);
 	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
 		if (oneshot)
-			led_blink_set_oneshot(led_cdev, delay_on, delay_off,
-					      invert);
+			rc = led_blink_set_oneshot(led_cdev, delay_on,
+						   delay_off, invert);
 		else
-			led_blink_set(led_cdev, delay_on, delay_off);
+			rc = led_blink_set(led_cdev, delay_on, delay_off);
 	}
 	read_unlock(&trig->leddev_list_lock);
+	WARN_ON(rc);
 }

 void led_trigger_blink(struct led_trigger *trig,
diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 1497a09..b21e6ac 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -213,6 +213,7 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	data->current_brightness = 0;
 	data->cdev.name = data->name;
 	data->cdev.brightness_set = pm860x_led_set;
+	data->cdev.flags |= LED_BRIGHTNESS_SLOW;
 	mutex_init(&data->lock);
 	INIT_WORK(&data->work, pm860x_led_work);

diff --git a/drivers/leds/leds-adp5520.c b/drivers/leds/leds-adp5520.c
index 07e66ca..f3540c2 100644
--- a/drivers/leds/leds-adp5520.c
+++ b/drivers/leds/leds-adp5520.c
@@ -137,6 +137,7 @@ static int adp5520_led_probe(struct platform_device *pdev)
 		led_dat->cdev.default_trigger = cur_led->default_trigger;
 		led_dat->cdev.brightness_set = adp5520_led_set;
 		led_dat->cdev.brightness = LED_OFF;
+		led_dat->cdev.flags |= LED_BRIGHTNESS_SLOW;

 		if (cur_led->flags & ADP5520_FLAG_LED_MASK)
 			led_dat->flags = cur_led->flags;
diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 6078c15..3aba6af 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -633,7 +633,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 	led->cdev_led2b.brightness = LED_OFF;
 	led->cdev_led2b.brightness_set = bd2802_set_led2b_brightness;
 	led->cdev_led2b.blink_set = bd2802_set_led2b_blink;
-	led->cdev_led2b.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev_led2b.flags |= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_SLOW;

 	ret = led_classdev_register(&led->client->dev, &led->cdev_led2b);
 	if (ret < 0) {
diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index d0452b0..e5cc289 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -668,7 +668,8 @@ static int blinkm_probe(struct i2c_client *client,
 		led[i]->i2c_client = client;
 		led[i]->id = i;
 		led[i]->led_cdev.max_brightness = 255;
-		led[i]->led_cdev.flags = LED_CORE_SUSPENDRESUME;
+		led[i]->led_cdev.flags = LED_CORE_SUSPENDRESUME |
+				LED_BRIGHTNESS_SLOW;
 		atomic_set(&led[i]->active, 0);
 		switch (i) {
 		case RED:
diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 952ba96e..af6318f 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -115,6 +115,7 @@ static int da903x_led_probe(struct platform_device *pdev)
 	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.brightness_set = da903x_led_set;
 	led->cdev.brightness = LED_OFF;
+	led->cdev.flags |= LED_BRIGHTNESS_SLOW;

 	led->id = id;
 	led->flags = pdata->flags;
diff --git a/drivers/leds/leds-da9052.c b/drivers/leds/leds-da9052.c
index 28291b6..0c12b46 100644
--- a/drivers/leds/leds-da9052.c
+++ b/drivers/leds/leds-da9052.c
@@ -137,6 +137,7 @@ static int da9052_led_probe(struct platform_device *pdev)
 		led[i].cdev.brightness = LED_OFF;
 		led[i].cdev.max_brightness = DA9052_MAX_BRIGHTNESS;
 		led[i].brightness = LED_OFF;
+		led[i].flags |= LED_BRIGHTNESS_SLOW;
 		led[i].led_index = pled->leds[i].flags;
 		led[i].da9052 = dev_get_drvdata(pdev->dev.parent);
 		INIT_WORK(&led[i].work, da9052_led_work);
diff --git a/drivers/leds/leds-dac124s085.c b/drivers/leds/leds-dac124s085.c
index db3ba8b..64b3ed7 100644
--- a/drivers/leds/leds-dac124s085.c
+++ b/drivers/leds/leds-dac124s085.c
@@ -88,6 +88,7 @@ static int dac124s085_probe(struct spi_device *spi)
 		led->ldev.brightness = LED_OFF;
 		led->ldev.max_brightness = 0xfff;
 		led->ldev.brightness_set = dac124s085_set_brightness;
+		led->ldev.flags |= LED_BRIGHTNESS_SLOW;
 		ret = led_classdev_register(&spi->dev, &led->ldev);
 		if (ret < 0)
 			goto eledcr;
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 15eb3f8..45c0bb1 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -137,6 +137,8 @@ static int create_gpio_led(const struct gpio_led *template,
 	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
 	if (!template->retain_state_suspended)
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	if (led_dat->can_sleep)
+		led_dat->cdev.flags |= LED_BRIGHTNESS_SLOW;

 	ret = gpiod_direction_output(led_dat->gpiod, state);
 	if (ret < 0)
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 6e2e020..f70cd0e 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -697,6 +697,7 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->cdev.brightness_get = lm3533_led_get;
 	led->cdev.blink_set = lm3533_led_blink_set;
 	led->cdev.brightness = LED_OFF;
+	led->cdev.flags |= LED_BRIGHTNESS_SLOW;
 	led->cdev.groups = lm3533_led_attribute_groups,
 	led->id = pdev->id;

diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index f5112cb..4a9948b 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -483,6 +483,7 @@ static int lm355x_probe(struct i2c_client *client,
 	chip->cdev_flash.name = "flash";
 	chip->cdev_flash.max_brightness = 16;
 	chip->cdev_flash.brightness_set = lm355x_strobe_brightness_set;
+	chip->cdev_flash.flags |= LED_BRIGHTNESS_SLOW;
 	chip->cdev_flash.default_trigger = "flash";
 	err = led_classdev_register((struct device *)
 				    &client->dev, &chip->cdev_flash);
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index d3dec01..84bb319 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -375,6 +375,7 @@ static int lm3642_probe(struct i2c_client *client,
 	chip->cdev_flash.name = "flash";
 	chip->cdev_flash.max_brightness = 16;
 	chip->cdev_flash.brightness_set = lm3642_strobe_brightness_set;
+	chip->cdev_flash.flags |= LED_BRIGHTNESS_SLOW;
 	chip->cdev_flash.default_trigger = "flash";
 	chip->cdev_flash.groups = lm3642_flash_groups,
 	err = led_classdev_register((struct device *)
diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 53144fb..70b15b3 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -323,7 +323,8 @@ static int lp3944_configure(struct i2c_client *client,
 			led->ldev.max_brightness = 1;
 			led->ldev.brightness_set = lp3944_led_set_brightness;
 			led->ldev.blink_set = lp3944_led_set_blink;
-			led->ldev.flags = LED_CORE_SUSPENDRESUME;
+			led->ldev.flags = LED_CORE_SUSPENDRESUME |
+					LED_BRIGHTNESS_SLOW;

 			INIT_WORK(&led->work, lp3944_led_work);
 			err = led_classdev_register(&client->dev, &led->ldev);
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 77c26bc..02bc090 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -173,6 +173,7 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	}

 	led->cdev.brightness_set = lp55xx_set_brightness;
+	led->cdev.flags |= LED_BRIGHTNESS_SLOW;
 	led->cdev.groups = lp55xx_led_groups;

 	if (pdata->led_config[chan].name) {
diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
index 3409f03..3fe2983 100644
--- a/drivers/leds/leds-lp8788.c
+++ b/drivers/leds/leds-lp8788.c
@@ -140,6 +140,7 @@ static int lp8788_led_probe(struct platform_device *pdev)
 	led->lp = lp;
 	led->led_dev.max_brightness = MAX_BRIGHTNESS;
 	led->led_dev.brightness_set = lp8788_brightness_set;
+	led->led_dev.flags |= LED_BRIGHTNESS_SLOW;

 	led_pdata = lp->pdata ? lp->pdata->led_pdata : NULL;

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 8c2b7fb..9270410 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -407,6 +407,7 @@ static int lp8860_probe(struct i2c_client *client,
 	led->led_dev.name = led->label;
 	led->led_dev.max_brightness = LED_FULL;
 	led->led_dev.brightness_set = lp8860_brightness_set;
+	led->led_dev.flags |= LED_BRIGHTNESS_SLOW;

 	mutex_init(&led->lock);
 	INIT_WORK(&led->work, lp8860_led_brightness_work);
diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 9f41124..cedc31c 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -104,6 +104,7 @@ static int create_lt3593_led(const struct gpio_led *template,

 	if (!template->retain_state_suspended)
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led_dat->cdev.flags |= LED_BRIGHTNESS_SLOW;

 	ret = devm_gpio_request_one(parent, template->gpio, state ?
 				    GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index e2b847f..706a94f 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -256,7 +256,8 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 		leds->led[i].leds = leds;
 		leds->led[i].cdev.name = name;
 		leds->led[i].cdev.default_trigger = trig;
-		leds->led[i].cdev.flags = LED_CORE_SUSPENDRESUME;
+		leds->led[i].cdev.flags = LED_CORE_SUSPENDRESUME |
+				LED_BRIGHTNESS_SLOW;
 		leds->led[i].cdev.brightness_set = mc13xxx_led_set;
 		leds->led[i].cdev.max_brightness = mc13xxx_max_brightness(id);

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 5a6363d..e9bcd0e 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -361,6 +361,7 @@ static int pca9532_configure(struct i2c_client *client,
 			led->ldev.brightness = LED_OFF;
 			led->ldev.brightness_set = pca9532_set_brightness;
 			led->ldev.blink_set = pca9532_set_blink;
+			led->ldev.flags |= LED_BRIGHTNESS_SLOW;
 			INIT_WORK(&led->work, pca9532_led_work);
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index c3a08b6..2a6f1e5 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -329,6 +329,7 @@ static int pca955x_probe(struct i2c_client *client,

 		pca955x_led->led_cdev.name = pca955x_led->name;
 		pca955x_led->led_cdev.brightness_set = pca955x_led_set;
+		pca955x_led->led_cdev.flags |= LED_BRIGHTNESS_SLOW;

 		INIT_WORK(&pca955x_led->work, pca955x_led_work);

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index bee3e1a..0b2ff27 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -409,6 +409,7 @@ static int pca963x_probe(struct i2c_client *client,

 		pca963x[i].led_cdev.name = pca963x[i].name;
 		pca963x[i].led_cdev.brightness_set = pca963x_led_set;
+		pca963x[i].led_cdev.flags |= LED_BRIGHTNESS_SLOW;

 		if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
 			pca963x[i].led_cdev.blink_set = pca963x_blink_set;
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 1d07e3e..daff48d 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -122,8 +122,10 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	}

 	led_data->can_sleep = pwm_can_sleep(led_data->pwm);
-	if (led_data->can_sleep)
+	if (led_data->can_sleep) {
 		INIT_WORK(&led_data->work, led_pwm_work);
+		led_data->cdev.flags |= LED_BRIGHTNESS_SLOW;
+	}

 	led_data->period = pwm_get_period(led_data->pwm);
 	if (!led_data->period && (led->pwm_period_ns > 0))
diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
index ffc2139..3b898fb 100644
--- a/drivers/leds/leds-regulator.c
+++ b/drivers/leds/leds-regulator.c
@@ -173,7 +173,7 @@ static int regulator_led_probe(struct platform_device *pdev)

 	led->cdev.brightness_set = regulator_led_brightness_set;
 	led->cdev.name = pdata->name;
-	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev.flags |= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_SLOW;
 	led->vcc = vcc;

 	/* to handle correctly an already enabled regulator */
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 20fa8e7..8209b0d 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -788,6 +788,7 @@ static int tca6507_probe(struct i2c_client *client,
 				= pdata->leds.leds[i].default_trigger;
 			l->led_cdev.brightness_set = tca6507_brightness_set;
 			l->led_cdev.blink_set = tca6507_blink_set;
+			l->led_cdev.flags |= LED_BRIGHTNESS_SLOW;
 			l->bank = -1;
 			err = led_classdev_register(&client->dev,
 						    &l->led_cdev);
diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index 56027ef..7718dcd 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -288,6 +288,7 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	drvdata->cdev.name = pdata.name;
 	drvdata->cdev.default_trigger = pdata.default_trigger;
 	drvdata->cdev.brightness_set = wm831x_status_set;
+	drvdata->cdev.flags |= LED_BRIGHTNESS_SLOW;
 	drvdata->cdev.blink_set = wm831x_status_blink_set;
 	drvdata->cdev.groups = wm831x_status_groups;

diff --git a/drivers/leds/leds-wm8350.c b/drivers/leds/leds-wm8350.c
index 0d12183..ad1ada3 100644
--- a/drivers/leds/leds-wm8350.c
+++ b/drivers/leds/leds-wm8350.c
@@ -235,7 +235,7 @@ static int wm8350_led_probe(struct platform_device *pdev)
 	led->cdev.brightness_set = wm8350_led_set;
 	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.name = pdata->name;
-	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev.flags |= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_SLOW;
 	led->enabled = regulator_is_enabled(isink);
 	led->isink = isink;
 	led->dcdc = dcdc;
diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index fbd02cd..ba91838 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -29,12 +29,15 @@ struct oneshot_trig_data {
 static ssize_t led_shot(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
+	ssize_t ret;
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct oneshot_trig_data *oneshot_data = led_cdev->trigger_data;

-	led_blink_set_oneshot(led_cdev,
+	ret = led_blink_set_oneshot(led_cdev,
 			&led_cdev->blink_delay_on, &led_cdev->blink_delay_off,
 			oneshot_data->invert);
+	if (ret)
+		return ret;

 	/* content is ignored */
 	return size;
diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 8d09327..edc0c7f 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -31,13 +31,15 @@ static ssize_t led_delay_on_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;

 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
 		return ret;

-	led_blink_set(led_cdev, &state, &led_cdev->blink_delay_off);
+	ret = led_blink_set(led_cdev, &state, &led_cdev->blink_delay_off);
+	if (ret)
+		return ret;
 	led_cdev->blink_delay_on = state;

 	return size;
@@ -56,13 +58,15 @@ static ssize_t led_delay_off_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;

 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
 		return ret;

-	led_blink_set(led_cdev, &led_cdev->blink_delay_on, &state);
+	ret = led_blink_set(led_cdev, &led_cdev->blink_delay_on, &state);
+	if (ret)
+		return ret;
 	led_cdev->blink_delay_off = state;

 	return size;
@@ -84,12 +88,16 @@ static void timer_trig_activate(struct led_classdev *led_cdev)
 	if (rc)
 		goto err_out_delayon;

-	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
+	rc = led_blink_set(led_cdev, &led_cdev->blink_delay_on,
 		      &led_cdev->blink_delay_off);
+	if (rc)
+		goto err_out_delayoff;
 	led_cdev->activated = true;

 	return;

+err_out_delayoff:
+	device_remove_file(led_cdev->dev, &dev_attr_delay_off);
 err_out_delayon:
 	device_remove_file(led_cdev->dev, &dev_attr_delay_on);
 }
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9a2b000..356b8d1 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -47,6 +47,10 @@ struct led_classdev {
 #define SET_BRIGHTNESS_ASYNC	(1 << 21)
 #define SET_BRIGHTNESS_SYNC	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
+#define LED_BRIGHTNESS_SLOW	(1 << 24)
+
+/* safe period value for slow leds is 10mS */
+#define LED_SLOW_MIN_PERIOD 10

 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
@@ -127,7 +131,7 @@ extern void led_classdev_resume(struct led_classdev *led_cdev);
  * led_cdev->brightness_set() will not stop the blinking,
  * use led_classdev_brightness_set() instead.
  */
-extern void led_blink_set(struct led_classdev *led_cdev,
+extern int led_blink_set(struct led_classdev *led_cdev,
 			  unsigned long *delay_on,
 			  unsigned long *delay_off);
 /**
@@ -144,7 +148,7 @@ extern void led_blink_set(struct led_classdev *led_cdev,
  * If invert is set, led blinks for delay_off first, then for
  * delay_on and leave the led on after the on-off cycle.
  */
-extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
+extern int led_blink_set_oneshot(struct led_classdev *led_cdev,
 				  unsigned long *delay_on,
 				  unsigned long *delay_off,
 				  int invert);
-- 
2.1.0
