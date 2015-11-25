From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 1/2] leds: aat1290: Add missing of_node_put
Date: Wed, 25 Nov 2015 09:46:26 +0100
Message-ID: <1448441187-13255-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40026 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752547AbbKYIqh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2015 03:46:37 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYD02UDQ4DNP3E0@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 25 Nov 2015 17:46:35 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>

The refcount of device_node increases after of_get_next_available_child()
is called. Make sure it is decremented also in case of DT parsing error.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/leds-aat1290.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index f225930..def3cf9 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -275,7 +275,7 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	if (ret < 0) {
 		dev_err(dev,
 			"flash-max-microamp DT property missing\n");
-		return ret;
+		goto err_parse_dt;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
@@ -283,13 +283,14 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	if (ret < 0) {
 		dev_err(dev,
 			"flash-max-timeout-us DT property missing\n");
-		return ret;
+		goto err_parse_dt;
 	}
 
-	of_node_put(child_node);
-
 	*sub_node = child_node;
 
+err_parse_dt:
+	of_node_put(child_node);
+
 	return ret;
 }
 
-- 
1.7.9.5
