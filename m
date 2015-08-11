From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 44/57] leds: ss4200: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:37:57 +0200
Message-ID: <1439285890-27329-45-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Dave Hansen <dave@sr71.net>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Dave Hansen <dave@sr71.net>
---
 drivers/leds/leds-ss4200.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 046cb70..925305e 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -485,7 +485,7 @@ static int register_nasgpio_led(int led_nr)
 	led->brightness = LED_OFF;
 	if (nasgpio_led_get_attr(led, GP_LVL))
 		led->brightness = LED_FULL;
-	led->brightness_set = nasgpio_led_set_brightness;
+	led->brightness_set_nonblocking = nasgpio_led_set_brightness;
 	led->blink_set = nasgpio_led_set_blink;
 	led->groups = nasgpio_led_groups;
 	ret = led_classdev_register(&nas_gpio_pci_dev->dev, led);
-- 
1.7.9.5
