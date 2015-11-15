From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH 1/2] leds-bcm6328: Reuse bcm6328_led_set() instead of copying
 its functionality
Date: Sun, 15 Nov 2015 13:32:24 +0000
Message-ID: <56488968.3070103@simon.arlott.org.uk>
References: <562BB799.7000708@simon.arlott.org.uk>
 <562DE832.6070903@samsung.com>
 <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5630A9C1.5060907@samsung.com> <56327821.8020508@simon.arlott.org.uk>
 <563A2731.40204@samsung.com> <563A2850.5000506@gmail.com>
 <563B3240.9010804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from proxima.lp0.eu ([81.2.80.65]:49467 "EHLO proxima.lp0.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751335AbbKONch (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 15 Nov 2015 08:32:37 -0500
In-Reply-To: <563B3240.9010804@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Cc: Jonas Gorski <jogo@openwrt.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

When ensuring a consistent initial LED state in bcm6328_led (as they may
be blinking instead of on/off), the LED register is set using an inverted
copy of bcm6328_led_set(). To avoid further errors relating to active low
handling, call this function directly instead.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
I've decided not to move the locking as it should really cover the
setting of led->cdev.brightness too (not that it matters as the device
is not yet registered).

 drivers/leds/leds-bcm6328.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index c7ea5c6..95d0cf9 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -314,14 +314,10 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 	} else {
 		led->cdev.brightness = LED_OFF;
 	}
-
-	if ((led->active_low && led->cdev.brightness == LED_FULL) ||
-	    (!led->active_low && led->cdev.brightness == LED_OFF))
-		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
-	else
-		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
 	spin_unlock_irqrestore(lock, flags);
 
+	bcm6328_led_set(&led->cdev, led->cdev.brightness);
+
 	led->cdev.brightness_set = bcm6328_led_set;
 	led->cdev.blink_set = bcm6328_blink_set;
 
-- 
2.1.4

-- 
Simon Arlott
