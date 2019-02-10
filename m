From: Yisheng Xie <ysxie@foxmail.com>
Subject: [PATCH] leds: pwm: fix max_brightness works abnormal when active_low
Date: Sun, 10 Feb 2019 20:37:09 +0800
Message-ID: <1549802229-31170-1-git-send-email-ysxie@foxmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Yisheng Xie <ysxie@foxmail.com>
List-Id: linux-leds@vger.kernel.org

When leds-pwm is active_low, smaller number of  duty kept in led_dat
means less brighness, so we should disable pwm when led_dat->duty is
equal to period instead of zero, which means max_brightness.

Signed-off-by: Yisheng Xie <ysxie@foxmail.com>
---
 drivers/leds/leds-pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index df80c89..07fb772 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -41,7 +41,7 @@ static void __led_pwm_set(struct led_pwm_data *led_dat)
 
 	pwm_config(led_dat->pwm, new_duty, led_dat->period);
 
-	if (new_duty == 0)
+	if (led_dat->active_low ? new_duty == led_dat->period : new_duty == 0)
 		pwm_disable(led_dat->pwm);
 	else
 		pwm_enable(led_dat->pwm);
-- 
1.9.1
