From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH v2] leds: fix brightness changing when software blinking is
 active
Date: Thu, 14 May 2015 18:24:02 +0300
Message-ID: <5554BE12.7050209@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org


The following sequence:
echo timer >/sys/class/leds/<name>/trigger
echo 1 >/sys/class/leds/<name>/brightness
should change the ON brightness for blinking.
The function led_set_brightness() was mistakenly initiating the
delayed blink stop procedure, which resulted in no blinking with
the timer trigger still active.

This patch fixes the problem by changing led_set_brightness()
to not initiate the delayed blink stop when brightness is not 0.

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: Kyungmin Park <kyungmin.park@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class.c |    5 +++++
 drivers/leds/led-core.c  |    5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 795ec99..65c2c80 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -121,6 +121,11 @@ static void led_timer_function(unsigned long data)
 	brightness = led_get_brightness(led_cdev);
 	if (!brightness) {
 		/* Time to switch the LED on. */
+		if (led_cdev->delayed_set_value) {
+			led_cdev->blink_brightness =
+					led_cdev->delayed_set_value;
+			led_cdev->delayed_set_value = 0;
+		}
 		brightness = led_cdev->blink_brightness;
 		delay = led_cdev->blink_delay_on;
 	} else {
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 356e851..a90dd26 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -119,10 +119,11 @@ void led_set_brightness(struct led_classdev *led_cdev,
 {
 	int ret = 0;

-	/* delay brightness setting if need to stop soft-blink timer */
+	/* delay brightness if soft-blink is active */
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
 		led_cdev->delayed_set_value = brightness;
-		schedule_work(&led_cdev->set_brightness_work);
+		if (brightness == LED_OFF)
+			schedule_work(&led_cdev->set_brightness_work);
 		return;
 	}

-- 
1.7.9.5
