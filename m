From: Luis de Bethencourt <luis@debethencourt.com>
Subject: [PATCH 1/6] leds: aat1290: Fix module autoload for OF platform driver
Date: Tue, 1 Sep 2015 23:35:07 +0200
Message-ID: <20150901213507.GA14276@goodgumbo.baconseed.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-leds@vger.kernel.org

This platform driver has a OF device ID table but the OF module
alias information is not created so module autoloading won't work.

Signed-off-by: Luis de Bethencourt <luis@debethencourt.com>
---
 drivers/leds/leds-aat1290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index fd7c25f..8ceb471 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -559,6 +559,7 @@ static const struct of_device_id aat1290_led_dt_match[] = {
 	{ .compatible = "skyworks,aat1290" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, aat1290_led_dt_match);
 
 static struct platform_driver aat1290_led_driver = {
 	.probe		= aat1290_led_probe,
-- 
2.4.6
