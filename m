From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 4.9 v2 2/2] led: core: Clear LED_BLINK_SW flag in led_blink_set()
Date: Mon, 19 Mar 2018 20:23:19 +0100
Message-ID: <1521487399-10447-3-git-send-email-jacek.anaszewski@gmail.com>
References: <1521487399-10447-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1521487399-10447-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, pavel@ucw.cz, jacek.anaszewski@gmail.com, Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: linux-leds@vger.kernel.org

With the current code, the following sequence won't work :
echo timer > trigger

echo 0 >  delay_off
* at this point we call
** led_delay_off_store
** led_blink_set
*** stop timer
** led_blink_setup
** led_set_software_blink
*** if !delay_on, led off
*** if !delay_off, set led_set_brightness_nosleep <--- LED_BLINK_SW
is set but timer is stop
*** otherwise start timer/set LED_BLINK_SW flag

echo xxx > brightness
* led_set_brightness
** if LED_BLINK_SW
*** if brightness=0, led off
*** else apply brightness if next timer <--- timer is stop, and will
never apply new setting
** otherwise set led_set_brightness_nosleep

To fix that, when we delete the timer, we should clear LED_BLINK_SW.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
Reported-by: Sasha Levin <Alexander.Levin@microsoft.com>
Reported-by: Matthias Schiffer <mschiffer@universe-factory.net>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/led-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 3bce448..454ed4d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -188,6 +188,7 @@ void led_blink_set(struct led_classdev *led_cdev,
 {
 	del_timer_sync(&led_cdev->blink_timer);
 
+	led_cdev->flags &= ~LED_BLINK_SW;
 	led_cdev->flags &= ~LED_BLINK_ONESHOT;
 	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
 
-- 
2.1.4
