From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v2] leds: add LED_ON brightness as boolean value
Date: Thu, 05 Jan 2017 11:34:12 +0900
Message-ID: <20170105023412.26472-1-andi.shyti@samsung.com>
References: <CGME20170105023420epcas1p28624575ab6619e1930ebc05795725d90@epcas1p2.samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52811 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750776AbdAECpX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Jan 2017 21:45:23 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Jaechul Lee <jcsing.lee@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

Some devices do not handle the led brightness or simply don't
care about it. Conceptually said devices want to just switch on
or off the led. It is useless in this case to have a 255 range
of brightness, while just having an LED_ON and LED_OFF improves
the boolean meaning of the led status.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
Hi,

Thanks Pavel and Jacek for your review.

Differences from V1
- used explicit assignement of LED_ON in the enum
- added Pavel's ack

Andi

 include/linux/leds.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 569cb531094c..bb50d0151e75 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -27,6 +27,7 @@ struct device;
 
 enum led_brightness {
 	LED_OFF		= 0,
+	LED_ON		= 1,
 	LED_HALF	= 127,
 	LED_FULL	= 255,
 };
-- 
2.11.0
