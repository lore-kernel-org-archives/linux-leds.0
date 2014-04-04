From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] leds: 88pm860x: Use of_get_child_by_name
Date: Fri, 04 Apr 2014 09:51:19 +0200
Message-ID: <1396597880-2325-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15135 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752337AbaDDHvb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Apr 2014 03:51:31 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Use of_get_child_by_name to obtain reference to charger node instead of
of_find_node_by_name which can walk outside of the parent node.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/leds/leds-88pm860x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 5f588c0a376e..2f9ee538f30d 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -134,7 +134,7 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
 	nproot = of_node_get(pdev->dev.parent->of_node);
 	if (!nproot)
 		return -ENODEV;
-	nproot = of_find_node_by_name(nproot, "leds");
+	nproot = of_get_child_by_name(nproot, "leds");
 	if (!nproot) {
 		dev_err(&pdev->dev, "failed to find leds node\n");
 		return -ENODEV;
-- 
1.7.9.5
