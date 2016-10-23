From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] led: core: Fix blink_brightness setting race
Date: Sun, 23 Oct 2016 21:47:26 +0200
Message-ID: <20161023194726.24388-2-hdegoede@redhat.com>
References: <20161023194726.24388-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41740 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753493AbcJWTrc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 23 Oct 2016 15:47:32 -0400
In-Reply-To: <20161023194726.24388-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

All 3 of led_timer_func, led_set_brightness and led_set_software_blink
set blink_brightness. If led_timer_func or led_set_software_blink race
with led_set_brightness they may end up overwriting the new
blink_brightness. The new atomic work_flags does not protect against
this as it just protects the flags and not blink_brightness.

This commit introduces a new new_blink_brightness value which gets
set by led_set_brightness and read by led_timer_func on LED on, fixing
this.

Dealing with the new brightness at LED on time, makes the new
brightness apply sooner, which also fixes a led_set_brightness which
happens while a oneshot blink which ends in LED on is running not
getting applied.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-core.c | 14 +++++++-------
 include/linux/leds.h    |  1 +
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 17a0964..d474f97 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -81,17 +81,17 @@ static void led_timer_function(unsigned long data)
 	brightness = led_get_brightness(led_cdev);
 	if (!brightness) {
 		/* Time to switch the LED on. */
-		brightness = led_cdev->blink_brightness;
+		if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
+					&led_cdev->work_flags))
+			brightness = led_cdev->new_blink_brightness;
+		else
+			brightness = led_cdev->blink_brightness;
 		delay = led_cdev->blink_delay_on;
 	} else {
 		/* Store the current brightness value to be able
 		 * to restore it when the delay_off period is over.
-		 * Do it only if there is no pending blink brightness
-		 * change, to avoid overwriting the new value.
 		 */
-		if (!test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
-					&led_cdev->work_flags))
-			led_cdev->blink_brightness = brightness;
+		led_cdev->blink_brightness = brightness;
 		brightness = LED_OFF;
 		delay = led_cdev->blink_delay_off;
 	}
@@ -260,7 +260,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
 		} else {
 			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
 				&led_cdev->work_flags);
-			led_cdev->blink_brightness = brightness;
+			led_cdev->new_blink_brightness = brightness;
 		}
 		return;
 	}
diff --git a/include/linux/leds.h b/include/linux/leds.h
index cff9df7..6669404 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -87,6 +87,7 @@ struct led_classdev {
 	unsigned long		 blink_delay_on, blink_delay_off;
 	struct timer_list	 blink_timer;
 	int			 blink_brightness;
+	int			 new_blink_brightness;
 	void			(*flash_resume)(struct led_classdev *led_cdev);
 
 	struct work_struct	set_brightness_work;
-- 
2.9.3
