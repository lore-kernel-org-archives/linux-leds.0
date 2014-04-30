From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 1/6] leds: bd2802: Remove duplicated OOM message for individual driver
Date: Wed, 30 Apr 2014 16:07:20 +0800
Message-ID: <1398845245-26344-2-git-send-email-Li.Xiubo@freescale.com>
References: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bl2lp0204.outbound.protection.outlook.com ([207.46.163.204]:9569
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1758177AbaD3IwW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 30 Apr 2014 04:52:22 -0400
In-Reply-To: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, michael.hennerich@analog.com
Cc: Xiubo Li <Li.Xiubo@freescale.com>

The OOM message of individual driver is unnecessary, and this is
duplicate the memory subsystem generic OOM message.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-bd2802.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index fb5a347..6078c15 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -678,10 +678,8 @@ static int bd2802_probe(struct i2c_client *client,
 	int ret, i;
 
 	led = devm_kzalloc(&client->dev, sizeof(struct bd2802_led), GFP_KERNEL);
-	if (!led) {
-		dev_err(&client->dev, "failed to allocate driver data\n");
+	if (!led)
 		return -ENOMEM;
-	}
 
 	led->client = client;
 	pdata = led->pdata = dev_get_platdata(&client->dev);
-- 
1.8.4
