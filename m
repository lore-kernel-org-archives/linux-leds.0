From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 6/6] leds: adp5520: Remove duplicated OOM message for individual driver
Date: Wed, 30 Apr 2014 16:07:25 +0800
Message-ID: <1398845245-26344-7-git-send-email-Li.Xiubo@freescale.com>
References: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bl2lp0205.outbound.protection.outlook.com ([207.46.163.205]:1238
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932739AbaD3Iwl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 30 Apr 2014 04:52:41 -0400
In-Reply-To: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, michael.hennerich@analog.com
Cc: Xiubo Li <Li.Xiubo@freescale.com>

The OOM message of individual driver is unnecessary, and this is
duplicate the memory subsystem generic OOM message.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-adp5520.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/leds/leds-adp5520.c b/drivers/leds/leds-adp5520.c
index 7e311a1..9982691 100644
--- a/drivers/leds/leds-adp5520.c
+++ b/drivers/leds/leds-adp5520.c
@@ -121,13 +121,10 @@ static int adp5520_led_probe(struct platform_device *pdev)
 
 	led = devm_kzalloc(&pdev->dev, sizeof(*led) * pdata->num_leds,
 				GFP_KERNEL);
-	if (led == NULL) {
-		dev_err(&pdev->dev, "failed to alloc memory\n");
+	if (!led)
 		return -ENOMEM;
-	}
 
 	ret = adp5520_led_prepare(pdev);
-
 	if (ret) {
 		dev_err(&pdev->dev, "failed to write\n");
 		return ret;
-- 
1.8.4
