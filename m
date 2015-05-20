From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 16/20] leds: mark pwm driver with LED_BRIGHTNESS_FAST flag
Date: Wed, 20 May 2015 18:34:17 +0300
Message-ID: <555CA979.8080700@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp34.i.mail.ru ([94.100.177.94]:47669 "EHLO smtp34.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752821AbbETPeV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 20 May 2015 11:34:21 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>


This driver doesn't use sleeping operations in .brightness_set
method if can_sleep variable is not set. In that case it can be
marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-pwm.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 1d07e3e..82d01e5 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -124,6 +124,8 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	led_data->can_sleep = pwm_can_sleep(led_data->pwm);
 	if (led_data->can_sleep)
 		INIT_WORK(&led_data->work, led_pwm_work);
+	else
+		led_data->cdev.flags |= LED_BRIGHTNESS_FAST;

 	led_data->period = pwm_get_period(led_data->pwm);
 	if (!led_data->period && (led->pwm_period_ns > 0))
-- 
1.7.9.5
