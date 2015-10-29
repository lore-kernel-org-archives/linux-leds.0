From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH] leds-bcm6328: Reuse bcm6328_led_set() instead of copying its
 functionality
Date: Thu, 29 Oct 2015 19:48:49 +0000
Message-ID: <56327821.8020508@simon.arlott.org.uk>
References: <562BB799.7000708@simon.arlott.org.uk>
 <562DE832.6070903@samsung.com>
 <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5630A9C1.5060907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from proxima.lp0.eu ([81.2.80.65]:60706 "EHLO proxima.lp0.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751055AbbJ2Ts5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 29 Oct 2015 15:48:57 -0400
In-Reply-To: <5630A9C1.5060907@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>

When ensuring a consistent initial LED state in bcm6328_led (as they may
be blinking instead of on/off), the LED register is set using a copy of
bcm6328_led_set(). To avoid further errors relating to active low handling,
call this function directly instead.

As bcm6328_led_set() expects to acquire the spinlock, narrow the locking
to only cover reading of the current state. There is no need to hold the
spinlock between reading the current value and setting it again because
the LED device has not yet been registered.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 drivers/leds/leds-bcm6328.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index c7ea5c6..db327bd 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -264,7 +264,6 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 		       unsigned long *blink_leds, unsigned long *blink_delay)
 {
 	struct bcm6328_led *led;
-	unsigned long flags;
 	const char *state;
 	int rc;
 
@@ -286,13 +285,12 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 						    "linux,default-trigger",
 						    NULL);
 
-	spin_lock_irqsave(lock, flags);
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness = LED_FULL;
 		} else if (!strcmp(state, "keep")) {
 			void __iomem *mode;
-			unsigned long val, shift;
+			unsigned long val, shift, flags;
 
 			shift = bcm6328_pin2shift(led->pin);
 			if (shift / 16)
@@ -300,9 +298,12 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 			else
 				mode = mem + BCM6328_REG_MODE_LO;
 
+			spin_lock_irqsave(lock, flags);
 			val = bcm6328_led_read(mode) >>
 			      BCM6328_LED_SHIFT(shift % 16);
 			val &= BCM6328_LED_MODE_MASK;
+			spin_unlock_irqrestore(lock, flags);
+
 			if ((led->active_low && val == BCM6328_LED_MODE_ON) ||
 			    (!led->active_low && val == BCM6328_LED_MODE_OFF))
 				led->cdev.brightness = LED_FULL;
@@ -315,12 +316,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 		led->cdev.brightness = LED_OFF;
 	}
 
-	if ((led->active_low && led->cdev.brightness == LED_FULL) ||
-	    (!led->active_low && led->cdev.brightness == LED_OFF))
-		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
-	else
-		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
-	spin_unlock_irqrestore(lock, flags);
+	bcm6328_led_set(&led->cdev, led->cdev.brightness);
 
 	led->cdev.brightness_set = bcm6328_led_set;
 	led->cdev.blink_set = bcm6328_blink_set;
-- 
2.1.4

-- 
Simon Arlott
