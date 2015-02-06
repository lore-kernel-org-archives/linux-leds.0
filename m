From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] leds: leds-pwm: drop one pwm_get_period() call
Date: Fri,  6 Feb 2015 17:04:00 +0100
Message-ID: <1423238640-32202-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:37908 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755283AbbBFQEJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 6 Feb 2015 11:04:09 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

pwm_get_period() is called twice in case the child parameter is set. I
assume retrieving this parameter once is enough therefore this patch
removes the conditial invocation of pwm_get_period().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/leds/leds-pwm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index f668500a2157..1d07e3e83d29 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -119,13 +119,10 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		dev_err(dev, "unable to request PWM for %s: %d\n",
 			led->name, ret);
 		return ret;
 	}
 
-	if (child)
-		led_data->period = pwm_get_period(led_data->pwm);
-
 	led_data->can_sleep = pwm_can_sleep(led_data->pwm);
 	if (led_data->can_sleep)
 		INIT_WORK(&led_data->work, led_pwm_work);
 
 	led_data->period = pwm_get_period(led_data->pwm);
-- 
2.1.4
