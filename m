From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 3/6] leds: da9052: Remove duplicated OOM message for individual driver
Date: Wed, 30 Apr 2014 16:07:22 +0800
Message-ID: <1398845245-26344-4-git-send-email-Li.Xiubo@freescale.com>
References: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from [207.46.163.140] ([207.46.163.140]:23409 "EHLO
	na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754070AbaD3JI0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 30 Apr 2014 05:08:26 -0400
In-Reply-To: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, michael.hennerich@analog.com
Cc: Xiubo Li <Li.Xiubo@freescale.com>

The OOM message of individual driver is unnecessary, and this is
duplicate the memory subsystem generic OOM message.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-da9052.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-da9052.c b/drivers/leds/leds-da9052.c
index 865d4fa..5aa7e31 100644
--- a/drivers/leds/leds-da9052.c
+++ b/drivers/leds/leds-da9052.c
@@ -127,8 +127,7 @@ static int da9052_led_probe(struct platform_device *pdev)
 	led = devm_kzalloc(&pdev->dev,
 			   sizeof(struct da9052_led) * pled->num_leds,
 			   GFP_KERNEL);
-	if (led == NULL) {
-		dev_err(&pdev->dev, "Failed to alloc memory\n");
+	if (!led) {
 		error = -ENOMEM;
 		goto err;
 	}
-- 
1.8.4
