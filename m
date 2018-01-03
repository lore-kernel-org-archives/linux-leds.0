From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH] leds: core: Fix regression caused by commit 2b83ff96f51d
Date: Wed,  3 Jan 2018 22:40:14 +0100
Message-ID: <1515015614-3178-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, matthieu.castet@parrot.com, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Commit 2b83ff96f51d ("led: core: Fix brightness setting when setting delay_off=0")
replaced del_timer_sync(&led_cdev->blink_timer) with led_stop_software_blink(),
which in addition to the former also clears LED_BLINK_SW flag.

The fact that the function clears also blink_delay_on and blink_delay_off
properties of struct led_classdev wasn't considered harmful but it turned out
to be so in case when pointer to one or both props is passed to led_blink_set()
like in the ledtrig-timer.c. In such cases zeroes are passed in delay_on and/or
delay_off arguments to led_blink_setup(), which results either in stopping the
software blinking or setting blinking frequency always to 1Hz.

Avoid using led_stop_software_blink() and add a single call required
to clear LED_BLINK_SW flag, which was the only required modification to
fix the original issue.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/led-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f3654fd..ede4fa0 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -186,8 +186,9 @@ void led_blink_set(struct led_classdev *led_cdev,
 		   unsigned long *delay_on,
 		   unsigned long *delay_off)
 {
-	led_stop_software_blink(led_cdev);
+	del_timer_sync(&led_cdev->blink_timer);
 
+	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
 	clear_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
 	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
 
-- 
2.1.4
