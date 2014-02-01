From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v3 2/5] leds: leds-mc13783: Use LED core PM functions
Date: Sat,  1 Feb 2014 10:36:29 +0400
Message-ID: <1391236591-16540-2-git-send-email-shc_work@mail.ru>
References: <1391236591-16540-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fallback3.mail.ru ([94.100.176.58]:38114 "EHLO
	fallback3.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962AbaBAGiR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 1 Feb 2014 01:38:17 -0500
Received: from smtp31.i.mail.ru (smtp31.i.mail.ru [94.100.177.91])
	by fallback3.mail.ru (mPOP.Fallback_MX) with ESMTP id 55A9D10ADB6AB
	for <linux-leds@vger.kernel.org>; Sat,  1 Feb 2014 10:36:52 +0400 (MSK)
In-Reply-To: <1391236591-16540-1-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Alexander Shiyan <shc_work@mail.ru>

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/leds/leds-mc13783.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 5534002..c8bd8a8 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -183,6 +183,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 		leds->led[i].leds = leds;
 		leds->led[i].cdev.name = name;
 		leds->led[i].cdev.default_trigger = trig;
+		leds->led[i].cdev.flags = LED_CORE_SUSPENDRESUME;
 		leds->led[i].cdev.brightness_set = mc13xxx_led_set;
 		leds->led[i].cdev.brightness = LED_OFF;
 
-- 
1.8.3.2
