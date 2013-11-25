From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 2/3] leds/pwm: Don't disable pwm when setting brightness to 0
Date: Mon, 25 Nov 2013 21:43:44 +0100
Message-ID: <1385412225-29740-3-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:38916 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054Ab3KYUo2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 25 Nov 2013 15:44:28 -0500
In-Reply-To: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>

This fixes disabling the LED on i.MX28. The PWM hardware delays using
the newly set pwm-config until the beginning of a new period. It's very
likely that pwm_disable is called before the current period ends. In
case the LED was on brightness=3Dmax before the LED stays on because in
the disabled PWM block the period never ends.

Also only call pwm_enable only once in the probe call back and the
matching pwm_disable in .remove(). Moreover the pwm is explicitly
initialized to off.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-pwm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 2848171..cdc3e4d 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -45,11 +45,6 @@ static void __led_pwm_set(struct led_pwm_data *led_d=
at)
 	int new_duty =3D led_dat->duty;
=20
 	pwm_config(led_dat->pwm, new_duty, led_dat->period);
-
-	if (new_duty =3D=3D 0)
-		pwm_disable(led_dat->pwm);
-	else
-		pwm_enable(led_dat->pwm);
 }
=20
 static void led_pwm_work(struct work_struct *work)
@@ -180,6 +175,10 @@ static int led_pwm_probe(struct platform_device *p=
dev)
 			led_dat->cdev.max_brightness =3D cur_led->max_brightness;
 			led_dat->cdev.flags |=3D LED_CORE_SUSPENDRESUME;
=20
+			led_dat->duty =3D 0;
+			__led_pwm_set(led_dat);
+			pwm_enable(led_dat->pwm);
+
 			led_dat->can_sleep =3D pwm_can_sleep(led_dat->pwm);
 			if (led_dat->can_sleep)
 				INIT_WORK(&led_dat->work, led_pwm_work);
@@ -215,6 +214,7 @@ static int led_pwm_remove(struct platform_device *p=
dev)
 		led_classdev_unregister(&priv->leds[i].cdev);
 		if (priv->leds[i].can_sleep)
 			cancel_work_sync(&priv->leds[i].work);
+		pwm_disable(priv->leds[i].pwm);
 	}
=20
 	return 0;
--=20
1.8.4.2
