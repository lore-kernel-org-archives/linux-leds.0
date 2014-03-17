From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] leds: pwm: set polarity on non DT platforms
Date: Mon, 17 Mar 2014 19:38:41 +0100
Message-ID: <1395081521-16568-1-git-send-email-alexandre.belloni@free-electrons.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:60095 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932214AbaCQSiu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 17 Mar 2014 14:38:50 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>

Set inversed polarity when .active_low is set in the platform_data. With device
tree, this is taken care of by of_pwm_xlate_with_flags(), called from
of_pwm_get().

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/leds/leds-pwm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 605047428b5a..09681556a6aa 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -180,6 +180,11 @@ static int led_pwm_probe(struct platform_device *pdev)
 			led_dat->cdev.max_brightness = cur_led->max_brightness;
 			led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 
+			if (led_dat->active_low)
+				if (pwm_set_polarity(led_dat->pwm,
+						 PWM_POLARITY_INVERSED))
+					dev_err(&pdev->dev, "impossible to change polarity");
+
 			led_dat->can_sleep = pwm_can_sleep(led_dat->pwm);
 			if (led_dat->can_sleep)
 				INIT_WORK(&led_dat->work, led_pwm_work);
-- 
1.8.3.2
