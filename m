Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA2FC43464
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 18:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D499721741
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 18:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="R4lMoWY+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgISSDI (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 14:03:08 -0400
Received: from lists.nic.cz ([217.31.204.67]:52594 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgISSDH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 14:03:07 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id B1866140A46;
        Sat, 19 Sep 2020 20:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538585; bh=SXNjItpHJm2u9vyr5Sn4JZbCGVR05CZj84BN2k2cn+I=;
        h=From:To:Date;
        b=R4lMoWY+zhxqHtjiUoUi6j+qzsqctPc7AC0PJ/4z+YnToi1r9AJoNXdWbQ4LBTwyg
         JXc690EzYm1KMjOYr33a+w1vjBw+YnXUO6oxqkUrMLrDrHzon3XK43Dw9q3+1OwhcY
         X/dBUYKGRZpbL/RJ1Bhw3wEZPmA6qAvIo1rwUgpM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v3 2/9] leds: lm36274: don't iterate through children since there is only one
Date:   Sat, 19 Sep 2020 20:02:57 +0200
Message-Id: <20200919180304.2885-3-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919180304.2885-1-marek.behun@nic.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Do not use device_for_each_child_node. Since this driver works only with
once child node present, use device_get_next_child_node instead.
This also saves one level of indentation.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 50 +++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index 4a9f786bb9727..e0fce74a76675 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -72,40 +72,36 @@ static int lm36274_parse_dt(struct lm36274 *chip)
 	char label[LED_MAX_NAME_SIZE];
 	struct device *dev = &chip->pdev->dev;
 	const char *name;
-	int child_cnt;
-	int ret = -EINVAL;
+	int ret;
 
 	/* There should only be 1 node */
-	child_cnt = device_get_child_node_count(dev);
-	if (child_cnt != 1)
+	if (device_get_child_node_count(dev) != 1)
 		return -EINVAL;
 
-	device_for_each_child_node(dev, child) {
-		ret = fwnode_property_read_string(child, "label", &name);
-		if (ret)
-			snprintf(label, sizeof(label), "%s::",
-				 chip->pdev->name);
-		else
-			snprintf(label, sizeof(label), "%s:%s",
-				 chip->pdev->name, name);
-
-		chip->num_leds = fwnode_property_count_u32(child, "led-sources");
-		if (chip->num_leds <= 0)
-			return -ENODEV;
-
-		ret = fwnode_property_read_u32_array(child, "led-sources",
-						     chip->led_sources,
-						     chip->num_leds);
-		if (ret) {
-			dev_err(dev, "led-sources property missing\n");
-			return ret;
-		}
-
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &chip->led_dev.default_trigger);
+	child = device_get_next_child_node(dev, NULL);
+
+	ret = fwnode_property_read_string(child, "label", &name);
+	if (ret)
+		snprintf(label, sizeof(label), "%s::", chip->pdev->name);
+	else
+		snprintf(label, sizeof(label), "%s:%s", chip->pdev->name, name);
 
+	chip->num_leds = fwnode_property_count_u32(child, "led-sources");
+	if (chip->num_leds <= 0)
+		return -ENODEV;
+
+	ret = fwnode_property_read_u32_array(child, "led-sources",
+					     chip->led_sources, chip->num_leds);
+	if (ret) {
+		dev_err(dev, "led-sources property missing\n");
+		return ret;
 	}
 
+	fwnode_property_read_string(child, "linux,default-trigger",
+				    &chip->led_dev.default_trigger);
+
+	fwnode_handle_put(child);
+
 	chip->lmu_data.regmap = chip->regmap;
 	chip->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
 	chip->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
-- 
2.26.2

