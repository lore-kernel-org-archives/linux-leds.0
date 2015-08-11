From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 55/57] leds: sunfire: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:38:08 +0200
Message-ID: <1439285890-27329-56-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David S. Miller <davem@davemloft.net>
---
 drivers/leds/leds-sunfire.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
index c2553c5..0debc56 100644
--- a/drivers/leds/leds-sunfire.c
+++ b/drivers/leds/leds-sunfire.c
@@ -144,7 +144,7 @@ static int sunfire_led_generic_probe(struct platform_device *pdev,
 		p->leds[i].reg = (void __iomem *) pdev->resource[0].start;
 		lp->name = types[i].name;
 		lp->brightness = LED_FULL;
-		lp->brightness_set = types[i].handler;
+		lp->brightness_set_nonblocking = types[i].handler;
 		lp->default_trigger = types[i].default_trigger;
 
 		err = led_classdev_register(&pdev->dev, lp);
-- 
1.7.9.5
