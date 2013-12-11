From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH] leds: leds-pwm: fix duty time overflow.
Date: Wed, 11 Dec 2013 17:19:42 +0800
Message-ID: <1386753582-16009-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from [207.46.163.24] ([207.46.163.24]:38348 "EHLO
	co9outboundpool.messaging.microsoft.com" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751294Ab3LKKM4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Wed, 11 Dec 2013 05:12:56 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, b47053@freescale.com

Overflow maybe occurs when calculates the duty time. For instance,
the period time is 990000000ns, and the max_brightness is 127, when
setting the brightness to 12, the duty value will be 25906026ns, but
it should be 93543307ns.
---
 drivers/leds/leds-pwm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index bb6f948..7cb2cd8 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -66,9 +66,11 @@ static void led_pwm_set(struct led_classdev *led_cdev,
 	struct led_pwm_data *led_dat =
 		container_of(led_cdev, struct led_pwm_data, cdev);
 	unsigned int max = led_dat->cdev.max_brightness;
-	unsigned int period =  led_dat->period;
+	unsigned long long duty =  led_dat->period;
 
-	led_dat->duty = brightness * period / max;
+	duty *= brightness;
+	do_div(duty, max);
+	led_dat->duty = duty;
 
 	if (led_dat->can_sleep)
 		schedule_work(&led_dat->work);
-- 
1.8.4
