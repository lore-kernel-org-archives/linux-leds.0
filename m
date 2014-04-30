From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 4/6] leds: s3c24xx: Remove duplicated OOM message for individual driver
Date: Wed, 30 Apr 2014 16:07:23 +0800
Message-ID: <1398845245-26344-5-git-send-email-Li.Xiubo@freescale.com>
References: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-by2lp0238.outbound.protection.outlook.com ([207.46.163.238]:52270
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757533AbaD3IwS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 30 Apr 2014 04:52:18 -0400
In-Reply-To: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, michael.hennerich@analog.com
Cc: Xiubo Li <Li.Xiubo@freescale.com>

The OOM message of individual driver is unnecessary, and this is
duplicate the memory subsystem generic OOM message.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-s3c24xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 98174e7..37a6a92 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -77,10 +77,8 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 	led = devm_kzalloc(&dev->dev, sizeof(struct s3c24xx_gpio_led),
 			   GFP_KERNEL);
-	if (led == NULL) {
-		dev_err(&dev->dev, "No memory for device\n");
+	if (!led)
 		return -ENOMEM;
-	}
 
 	platform_set_drvdata(dev, led);
 
-- 
1.8.4
