From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH] leds: ktd2692: Add missing of_node_put
Date: Tue, 10 Nov 2015 12:00:24 +0900
Message-ID: <1447124424-16525-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53584 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750997AbbKJDAh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Nov 2015 22:00:37 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, j.anaszewski@samsung.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>

The refcount of device_node increases after of_node_get() is called.
So, a break out of the loop requires of_node_put().

This patch adds missing of_node_put() when loop breaks.

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 drivers/leds/leds-ktd2692.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index feca07b..dbf37ce 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -332,21 +332,26 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 				   &cfg->movie_max_microamp);
 	if (ret) {
 		dev_err(dev, "failed to parse led-max-microamp\n");
-		return ret;
+		goto err_parse_dt;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-microamp",
 				   &cfg->flash_max_microamp);
 	if (ret) {
 		dev_err(dev, "failed to parse flash-max-microamp\n");
-		return ret;
+		goto err_parse_dt;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
 				   &cfg->flash_max_timeout);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "failed to parse flash-max-timeout-us\n");
+		goto err_parse_dt;
+	}
+
+	return 0;
 
+err_parse_dt:
 	of_node_put(child_node);
 	return ret;
 }
-- 
2.0.5
