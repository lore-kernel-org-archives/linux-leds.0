From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 38/51] leds: s3c24xx: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:24 +0200
Message-ID: <1437122857-6765-39-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41978 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946041AbbGQItp (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 04:49:45 -0400
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Ben Dooks <ben@simtec.co.uk>

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ben Dooks <ben@simtec.co.uk>
---
 drivers/leds/leds-s3c24xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 83641a7..ed61bf9 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -84,7 +84,7 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 	led->cdev.brightness_set = s3c24xx_led_set;
 	led->cdev.default_trigger = pdata->def_trigger;
 	led->cdev.name = pdata->name;
-	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev.flags |= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST;
 
 	led->pdata = pdata;
 
-- 
1.7.9.5
