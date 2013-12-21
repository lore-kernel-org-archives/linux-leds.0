From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v2 2/5] leds: leds-mc13783: Use LED core PM functions
Date: Sat, 21 Dec 2013 08:31:34 +0400
Message-ID: <1387600296-22602-2-git-send-email-shc_work@mail.ru>
References: <1387600296-22602-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp23.mail.ru ([94.100.176.176]:42741 "EHLO smtp23.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754433Ab3LUEbs (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 20 Dec 2013 23:31:48 -0500
In-Reply-To: <1387600296-22602-1-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Alexander Shiyan <shc_work@mail.ru>

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/leds/leds-mc13783.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index e61bdb5..d402b56 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -184,6 +184,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 		leds->led[i].leds = leds;
 		leds->led[i].cdev.name = name;
 		leds->led[i].cdev.default_trigger = trig;
+		leds->led[i].cdev.flags = LED_CORE_SUSPENDRESUME;
 		leds->led[i].cdev.brightness_set = mc13xxx_led_set;
 		leds->led[i].cdev.brightness = LED_OFF;
 
-- 
1.8.3.2
