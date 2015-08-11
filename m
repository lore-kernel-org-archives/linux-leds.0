From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 43/57] leds: s3c24xx: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:37:56 +0200
Message-ID: <1439285890-27329-44-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Ben Dooks <ben@simtec.co.uk>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ben Dooks <ben@simtec.co.uk>
---
 drivers/leds/leds-s3c24xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 83641a7..ae4b223 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -81,7 +81,7 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 	platform_set_drvdata(dev, led);
 
-	led->cdev.brightness_set = s3c24xx_led_set;
+	led->cdev.brightness_set_nonblocking = s3c24xx_led_set;
 	led->cdev.default_trigger = pdata->def_trigger;
 	led->cdev.name = pdata->name;
 	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
-- 
1.7.9.5
