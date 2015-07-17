From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 51/51] leds: ipaq-micro: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:37 +0200
Message-ID: <1437122857-6765-52-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50244 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946133AbbGQIuR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 04:50:17 -0400
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ipaq-micro.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index 3776f51..3ac9fa6 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -104,7 +104,7 @@ static struct led_classdev micro_led = {
 	.name			= "led-ipaq-micro",
 	.brightness_set		= micro_leds_brightness_set,
 	.blink_set		= micro_leds_blink_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static int micro_leds_probe(struct platform_device *pdev)
-- 
1.7.9.5
