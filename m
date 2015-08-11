From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 48/57] leds: asic3: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:38:01 +0200
Message-ID: <1439285890-27329-49-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39931 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933995AbbHKJki (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2015 05:40:38 -0400
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Paul Parsons <lost.distance@yahoo.com>

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Paul Parsons <lost.distance@yahoo.com>
---
 drivers/leds/leds-asic3.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-asic3.c b/drivers/leds/leds-asic3.c
index 1b71eac..c23f565 100644
--- a/drivers/leds/leds-asic3.c
+++ b/drivers/leds/leds-asic3.c
@@ -109,7 +109,7 @@ static int asic3_led_probe(struct platform_device *pdev)
 
 	led->cdev->name = led->name;
 	led->cdev->flags = LED_CORE_SUSPENDRESUME;
-	led->cdev->brightness_set = brightness_set;
+	led->cdev->brightness_set_nonblocking = brightness_set;
 	led->cdev->blink_set = blink_set;
 	led->cdev->default_trigger = led->default_trigger;
 
-- 
1.7.9.5
