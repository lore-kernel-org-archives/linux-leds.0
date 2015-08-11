From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 45/57] leds: versatile: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:37:58 +0200
Message-ID: <1439285890-27329-46-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-versatile.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-versatile.c b/drivers/leds/leds-versatile.c
index 8055302..49b3339 100644
--- a/drivers/leds/leds-versatile.c
+++ b/drivers/leds/leds-versatile.c
@@ -82,7 +82,7 @@ static int versatile_leds_probe(struct platform_device *dev)
 
 		led->base = base;
 		led->cdev.name = versatile_leds[i].name;
-		led->cdev.brightness_set = versatile_led_set;
+		led->cdev.brightness_set_nonblocking = versatile_led_set;
 		led->cdev.brightness_get = versatile_led_get;
 		led->cdev.default_trigger = versatile_leds[i].trigger;
 		led->mask = BIT(i);
-- 
1.7.9.5
