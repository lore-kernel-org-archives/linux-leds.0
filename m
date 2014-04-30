From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 2/6] leds: da903x: Remove duplicated OOM message for individual driver
Date: Wed, 30 Apr 2014 16:07:21 +0800
Message-ID: <1398845245-26344-3-git-send-email-Li.Xiubo@freescale.com>
References: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from [207.46.163.237] ([207.46.163.237]:33304 "EHLO
	na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757475AbaD3JGy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 30 Apr 2014 05:06:54 -0400
In-Reply-To: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, michael.hennerich@analog.com
Cc: Xiubo Li <Li.Xiubo@freescale.com>

The OOM message of individual driver is unnecessary, and this is
duplicate the memory subsystem generic OOM message.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-da903x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 2a4b87f..180bbd8 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -109,10 +109,8 @@ static int da903x_led_probe(struct platform_device *pdev)
 	}
 
 	led = devm_kzalloc(&pdev->dev, sizeof(struct da903x_led), GFP_KERNEL);
-	if (led == NULL) {
-		dev_err(&pdev->dev, "failed to alloc memory for LED%d\n", id);
+	if (!led)
 		return -ENOMEM;
-	}
 
 	led->cdev.name = pdata->name;
 	led->cdev.default_trigger = pdata->default_trigger;
-- 
1.8.4
