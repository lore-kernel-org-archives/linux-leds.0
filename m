From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v2 2/5] leds: pwm: remove work queue
Date: Tue, 30 Jun 2015 15:59:27 +0200
Message-ID: <1435672770-4261-2-git-send-email-j.anaszewski@samsung.com>
References: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44811 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858AbbF3OCN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jun 2015 10:02:13 -0400
In-reply-to: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

Commit 483a3122 ("leds: Use set_brightness_work for brightness_set
ops that can sleep") removed from LED subsystem drivers the
responsibility of using work queues internally.
Modify the driver to benefit from this modification.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
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
