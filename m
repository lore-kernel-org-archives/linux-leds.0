From: Luis de Bethencourt <luis@debethencourt.com>
Subject: [PATCH 5/6] leds: max77693: Fix module autoload for OF platform
 driver
Date: Tue, 1 Sep 2015 23:36:41 +0200
Message-ID: <20150901213641.GA14396@goodgumbo.baconseed.org>
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
 drivers/leds/leds-max77693.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index df348a0..afbb140 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -1080,6 +1080,7 @@ static const struct of_device_id max77693_led_dt_match[] = {
 	{ .compatible = "maxim,max77693-led" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, max77693_led_dt_match);
 
 static struct platform_driver max77693_led_driver = {
 	.probe		= max77693_led_probe,
-- 
2.4.6
