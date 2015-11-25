From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 2/2] leds: max77693: Add missing of_node_put
Date: Wed, 25 Nov 2015 09:46:27 +0100
Message-ID: <1448441187-13255-2-git-send-email-j.anaszewski@samsung.com>
References: <1448441187-13255-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58837 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753244AbbKYIqp (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2015 03:46:45 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYD01GNA4DESE00@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 25 Nov 2015 17:46:44 +0900 (KST)
In-reply-to: <1448441187-13255-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>

Each break out of the for_each_available_child_of_node loop requires
of_node_put().

This patch adds missing of_node_put() when loop breaks on conflicting
values of led-sources DT property.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/leds-max77693.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index 9401e33..1eb58ef 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -648,6 +648,7 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 		if (sub_nodes[fled_id]) {
 			dev_err(dev,
 				"Conflicting \"led-sources\" DT properties\n");
+			of_node_put(child_node);
 			return -EINVAL;
 		}
 
-- 
1.7.9.5
