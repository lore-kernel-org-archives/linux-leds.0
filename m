From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 56/57] leds: ipaq-micro: Set LED_BRIGHTNESS_BLOCKING flag
Date: Tue, 11 Aug 2015 11:38:09 +0200
Message-ID: <1439285890-27329-57-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42877 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934237AbbHKJlA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2015 05:41:00 -0400
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>

Since implemented brightness_set op can sleep mark the LED blocking.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ipaq-micro.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index 3776f51..fb82bd3 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -104,7 +104,8 @@ static struct led_classdev micro_led = {
 	.name			= "led-ipaq-micro",
 	.brightness_set		= micro_leds_brightness_set,
 	.blink_set		= micro_leds_blink_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME |
+				  LED_BRIGHTNESS_BLOCKING,
 };
 
 static int micro_leds_probe(struct platform_device *pdev)
-- 
1.7.9.5
