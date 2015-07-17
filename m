From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 49/51] leds: rb532: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:35 +0200
Message-ID: <1437122857-6765-50-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Phil Sutter <n0-1@freewrt.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Phil Sutter <n0-1@freewrt.org>
---
 drivers/leds/leds-rb532.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
index fcd1215b..e825006 100644
--- a/drivers/leds/leds-rb532.c
+++ b/drivers/leds/leds-rb532.c
@@ -35,6 +35,7 @@ static struct led_classdev rb532_uled = {
 	.brightness_set = rb532_led_set,
 	.brightness_get = rb532_led_get,
 	.default_trigger = "nand-disk",
+	.flags		= LED_BRIGHTNESS_FAST,
 };
 
 static int rb532_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
