From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 40/51] leds: versatile: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:26 +0200
Message-ID: <1437122857-6765-41-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-versatile.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-versatile.c b/drivers/leds/leds-versatile.c
index 8055302..46ba28f 100644
--- a/drivers/leds/leds-versatile.c
+++ b/drivers/leds/leds-versatile.c
@@ -85,6 +85,7 @@ static int versatile_leds_probe(struct platform_device *dev)
 		led->cdev.brightness_set = versatile_led_set;
 		led->cdev.brightness_get = versatile_led_get;
 		led->cdev.default_trigger = versatile_leds[i].trigger;
+		led->cdev.flags |= LED_BRIGHTNESS_FAST;
 		led->mask = BIT(i);
 
 		if (led_classdev_register(NULL, &led->cdev) < 0) {
-- 
1.7.9.5
