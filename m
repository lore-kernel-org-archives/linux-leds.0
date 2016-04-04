From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 3/5] leds: trigger: panic: Use led_trigger_event_nosleep
Date: Mon,  4 Apr 2016 17:22:04 -0300
Message-ID: <1459801326-5541-4-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: linux-leds@vger.kernel.org

Calling led_trigger_event may schedule a delayed LED set,
if the LED was being used by a delayed blink trigger when
the kernel paniced.

Therefore, we must use led_trigger_event_nosleep to override
this situation, and set the LED unconditionally.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/leds/trigger/ledtrig-panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
index 627b350c5ec3..145c238d55f2 100644
--- a/drivers/leds/trigger/ledtrig-panic.c
+++ b/drivers/leds/trigger/ledtrig-panic.c
@@ -17,7 +17,7 @@ static struct led_trigger *trigger;
 
 static long led_panic_blink(int state)
 {
-	led_trigger_event(trigger, state ? LED_FULL : LED_OFF);
+	led_trigger_event_nosleep(trigger, state ? LED_FULL : LED_OFF);
 	return 0;
 }
 
-- 
2.7.0
