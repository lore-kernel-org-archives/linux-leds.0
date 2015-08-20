From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 35/36] leds: pwm: remove work queue
Date: Thu, 20 Aug 2015 16:44:05 +0200
Message-ID: <1440081846-11697-36-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Raphael Assenat <raph@8d.com>
List-Id: linux-leds@vger.kernel.org

Now the core implements the work queue, remove it from the drivers,
and switch to using brightness_set_blocking op.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Raphael Assenat <raph@8d.com>
---
 drivers/leds/leds-pwm.c |   34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 1d07e3e..bc50193 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -22,12 +22,10 @@
 #include <linux/pwm.h>
 #include <linux/leds_pwm.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 
 struct led_pwm_data {
 	struct led_classdev	cdev;
 	struct pwm_device	*pwm;
-	struct work_struct	work;
 	unsigned int		active_low;
 	unsigned int		period;
 	int			duty;
@@ -51,14 +49,6 @@ static void __led_pwm_set(struct led_pwm_data *led_dat)
 		pwm_enable(led_dat->pwm);
 }
 
-static void led_pwm_work(struct work_struct *work)
-{
-	struct led_pwm_data *led_dat =
-		container_of(work, struct led_pwm_data, work);
-
-	__led_pwm_set(led_dat);
-}
-
 static void led_pwm_set(struct led_classdev *led_cdev,
 	enum led_brightness brightness)
 {
@@ -75,10 +65,14 @@ static void led_pwm_set(struct led_classdev *led_cdev,
 
 	led_dat->duty = duty;
 
-	if (led_dat->can_sleep)
-		schedule_work(&led_dat->work);
-	else
-		__led_pwm_set(led_dat);
+	__led_pwm_set(led_dat);
+}
+
+static int led_pwm_set_blocking(struct led_classdev *led_cdev,
+	enum led_brightness brightness)
+{
+	led_pwm_set(led_cdev, brightness);
+	return 0;
 }
 
 static inline size_t sizeof_pwm_leds_priv(int num_leds)
@@ -89,11 +83,8 @@ static inline size_t sizeof_pwm_leds_priv(int num_leds)
 
 static void led_pwm_cleanup(struct led_pwm_priv *priv)
 {
-	while (priv->num_leds--) {
+	while (priv->num_leds--)
 		led_classdev_unregister(&priv->leds[priv->num_leds].cdev);
-		if (priv->leds[priv->num_leds].can_sleep)
-			cancel_work_sync(&priv->leds[priv->num_leds].work);
-	}
 }
 
 static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
@@ -105,7 +96,6 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	led_data->active_low = led->active_low;
 	led_data->cdev.name = led->name;
 	led_data->cdev.default_trigger = led->default_trigger;
-	led_data->cdev.brightness_set = led_pwm_set;
 	led_data->cdev.brightness = LED_OFF;
 	led_data->cdev.max_brightness = led->max_brightness;
 	led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
@@ -122,8 +112,10 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	}
 
 	led_data->can_sleep = pwm_can_sleep(led_data->pwm);
-	if (led_data->can_sleep)
-		INIT_WORK(&led_data->work, led_pwm_work);
+	if (!led_data->can_sleep)
+		led_data->cdev.brightness_set = led_pwm_set;
+	else
+		led_data->cdev.brightness_set_blocking = led_pwm_set_blocking;
 
 	led_data->period = pwm_get_period(led_data->pwm);
 	if (!led_data->period && (led->pwm_period_ns > 0))
-- 
1.7.9.5
