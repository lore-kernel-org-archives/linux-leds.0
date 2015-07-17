From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 39/51] leds: ss4200: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:25 +0200
Message-ID: <1437122857-6765-40-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Dave Hansen <dave@sr71.net>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Dave Hansen <dave@sr71.net>
---
 drivers/leds/leds-ss4200.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 046cb70..53ac0aa 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -488,6 +488,7 @@ static int register_nasgpio_led(int led_nr)
 	led->brightness_set = nasgpio_led_set_brightness;
 	led->blink_set = nasgpio_led_set_blink;
 	led->groups = nasgpio_led_groups;
+	led->flags |= LED_BRIGHTNESS_FAST;
 	ret = led_classdev_register(&nas_gpio_pci_dev->dev, led);
 	if (ret)
 		return ret;
-- 
1.7.9.5
