From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 5/6] leds: sunfire: Remove duplicated OOM message for individual driver
Date: Wed, 30 Apr 2014 16:07:24 +0800
Message-ID: <1398845245-26344-6-git-send-email-Li.Xiubo@freescale.com>
References: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from [207.46.163.237] ([207.46.163.237]:33304 "EHLO
	na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1758525AbaD3JGz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 30 Apr 2014 05:06:55 -0400
In-Reply-To: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, michael.hennerich@analog.com
Cc: Xiubo Li <Li.Xiubo@freescale.com>

The OOM message of individual driver is unnecessary, and this is
duplicate the memory subsystem generic OOM message.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-sunfire.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
index 388632d..0b8cc4a 100644
--- a/drivers/leds/leds-sunfire.c
+++ b/drivers/leds/leds-sunfire.c
@@ -135,10 +135,8 @@ static int sunfire_led_generic_probe(struct platform_device *pdev,
 	}
 
 	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
-	if (!p) {
-		dev_err(&pdev->dev, "Could not allocate struct sunfire_drvdata\n");
+	if (!p)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < NUM_LEDS_PER_BOARD; i++) {
 		struct led_classdev *lp = &p->leds[i].led_cdev;
-- 
1.8.4
