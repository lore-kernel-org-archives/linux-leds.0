From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 2/5] leds: leds-mc13783: Use LED core PM functions
Date: Sat, 14 Dec 2013 15:00:48 +0400
Message-ID: <1387018850-6974-2-git-send-email-shc_work@mail.ru>
References: <1387018850-6974-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fallback7.mail.ru ([94.100.176.135]:45446 "EHLO
	fallback7.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625Ab3LNLBm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 14 Dec 2013 06:01:42 -0500
Received: from smtp40.i.mail.ru (smtp40.i.mail.ru [94.100.177.100])
	by fallback7.mail.ru (mPOP.Fallback_MX) with ESMTP id 8432AF185154
	for <linux-leds@vger.kernel.org>; Sat, 14 Dec 2013 15:01:25 +0400 (MSK)
In-Reply-To: <1387018850-6974-1-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Philippe Retornaz <philippe.retornaz@epfl.ch>, Alexander Shiyan <shc_work@mail.ru>

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/leds/leds-mc13783.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index e61bdb5..670b936 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -184,6 +184,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 		leds->led[i].leds = leds;
 		leds->led[i].cdev.name = name;
 		leds->led[i].cdev.default_trigger = trig;
+		leds->led[i].cdev.flags |= LED_CORE_SUSPENDRESUME;
 		leds->led[i].cdev.brightness_set = mc13xxx_led_set;
 		leds->led[i].cdev.brightness = LED_OFF;
 
-- 
1.8.3.2
