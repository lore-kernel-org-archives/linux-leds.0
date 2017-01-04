From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH] leds: add LED_ON brightness as boolean value
Date: Wed, 04 Jan 2017 22:41:07 +0900
Message-ID: <20170104134107.24902-1-andi.shyti@samsung.com>
References: <CGME20170104134122epcas1p48ee63a75c2e159b06d792ec8bc7d4e6d@epcas1p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>
List-Id: linux-leds@vger.kernel.org

Some devices do not handle the led brightness or simply don't
care about it. Conceptually said devices want to just switch on
or off the led. It is useless in this case to have a 255 range
of brightness, while just having an LED_ON and LED_OFF improves
the boolean meaning of the led status.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 include/linux/leds.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 569cb531094c..0258f9c49034 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -27,6 +27,7 @@ struct device;
 
 enum led_brightness {
 	LED_OFF		= 0,
+	LED_ON,
 	LED_HALF	= 127,
 	LED_FULL	= 255,
 };
-- 
2.11.0
