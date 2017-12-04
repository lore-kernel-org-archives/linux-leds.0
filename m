From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 4/5] leds: lp8860: Add DT parsing to retrieve the trigger node
Date: Mon, 4 Dec 2017 15:20:25 -0600
Message-ID: <20171204212026.14214-5-dmurphy@ti.com>
References: <20171204212026.14214-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:41303 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752557AbdLDVUr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Dec 2017 16:20:47 -0500
In-Reply-To: <20171204212026.14214-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Add the ability to parse the DT and set the default
trigger mode for the LED.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp8860.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 13d6210cba85..4fed603ee728 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -372,6 +372,10 @@ static int lp8860_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	for_each_available_child_of_node(np, child_node) {
+		led->led_dev.default_trigger = of_get_property(child_node,
+						    "linux,default-trigger",
+						    NULL);
+
 		ret = of_property_read_string(child_node, "label", &name);
 		if (!ret)
 		    snprintf(led->label, sizeof(led->label), "%s:%s",
-- 
2.15.0.124.g7668cbc60
