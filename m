From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 50/51] leds: sunfire: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:36 +0200
Message-ID: <1437122857-6765-51-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David S. Miller <davem@davemloft.net>
---
 drivers/leds/leds-sunfire.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
index c2553c5..4d08e44 100644
--- a/drivers/leds/leds-sunfire.c
+++ b/drivers/leds/leds-sunfire.c
@@ -146,6 +146,7 @@ static int sunfire_led_generic_probe(struct platform_device *pdev,
 		lp->brightness = LED_FULL;
 		lp->brightness_set = types[i].handler;
 		lp->default_trigger = types[i].default_trigger;
+		lp->flags |= LED_BRIGHTNESS_FAST;
 
 		err = led_classdev_register(&pdev->dev, lp);
 		if (err) {
-- 
1.7.9.5
