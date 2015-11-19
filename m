From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCHi v6] leds: ipaq-micro: Implement brightness_set_blocking op
Date: Thu, 19 Nov 2015 17:48:27 +0100
Message-ID: <1447951707-21294-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38940 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757862AbbKSQsl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2015 11:48:41 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY2000XCMP1LWA0@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 20 Nov 2015 01:48:39 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>

Since brightness setting can sleep for this driver, implement
brightness_set_blocking op, instead of brightness_set.
It makes this driver compatible with LED triggers.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
Changes from v5:
- use newly introduced brightness_set_blocking op, which was deemed
  a better solution that flags proposed at earlier stage
  of LED core improvent patch sets

 drivers/leds/leds-ipaq-micro.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index fa262b6..229386f 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -102,7 +102,7 @@ static int micro_leds_blink_set(struct led_classdev *led_cdev,
 
 static struct led_classdev micro_led = {
 	.name			= "led-ipaq-micro",
-	.brightness_set		= micro_leds_brightness_set,
+	.brightness_set_blocking = micro_leds_brightness_set,
 	.blink_set		= micro_leds_blink_set,
 	.flags			= LED_CORE_SUSPENDRESUME,
 };
-- 
1.7.9.5
