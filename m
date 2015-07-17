From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 30/51] leds: pwm: remove work queue
Date: Fri, 17 Jul 2015 10:47:16 +0200
Message-ID: <1437122857-6765-31-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Raphael Assenat <raph@8d.com>
List-Id: linux-leds@vger.kernel.org

Now the core implements the work queue, remove it from the drivers.
If brightness setting is guaranteed not to sleep then set the flag
LED_BRIGHTNESS_FAST.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Raphael Assenat <raph@8d.com>
---
 drivers/leds/leds-pwm.c |   24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 1d07e3e..0068297 100644
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
@@ -75,10 +65,7 @@ static void led_pwm_set(struct led_classdev *led_cdev,
 
 	led_dat->duty = duty;
 
-	if (led_dat->can_sleep)
-		schedule_work(&led_dat->work);
-	else
-		__led_pwm_set(led_dat);
+	__led_pwm_set(led_dat);
 }
 
 static inline size_t sizeof_pwm_leds_priv(int num_leds)
@@ -89,11 +76,8 @@ static inline size_t sizeof_pwm_leds_priv(int num_leds)
 
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
@@ -122,8 +106,8 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	}
 
 	led_data->can_sleep = pwm_can_sleep(led_data->pwm);
-	if (led_data->can_sleep)
-		INIT_WORK(&led_data->work, led_pwm_work);
+	if (!led_data->can_sleep)
+		led_data->cdev.flags |= LED_BRIGHTNESS_FAST;
 
 	led_data->period = pwm_get_period(led_data->pwm);
 	if (!led_data->period && (led->pwm_period_ns > 0))
-- 
1.7.9.5
