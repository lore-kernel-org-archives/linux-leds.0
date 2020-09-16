Return-Path: <SRS0=SVvq=CZ=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0F9C43461
	for <linux-leds@archiver.kernel.org>; Wed, 16 Sep 2020 23:17:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D457D22208
	for <linux-leds@archiver.kernel.org>; Wed, 16 Sep 2020 23:17:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="KfbvsnSP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgIPXRn (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 16 Sep 2020 19:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbgIPXQ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2020 19:16:57 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B96EC06178A;
        Wed, 16 Sep 2020 16:16:56 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id E1D431409E8;
        Thu, 17 Sep 2020 01:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298213; bh=ikxpzf3wICdcK+yMuEdRy/OOF3e2Dp+p6C7zCXktDwo=;
        h=From:To:Date;
        b=KfbvsnSP3X10+0ghHiGydNaGKQc/JsXf5cVwubFXmqjMWKDUdWCgcWQkW+tnNnkYH
         C9re3Db9737/f/Pi1dBBCKegJPfJZnQULV8fiKSqPUPFuOeoLxEWOb2/wlPITtv37f
         wl9EbHExrJ9GuKAn+AKgrCz7STLXyjES2GShtRk4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Sean Wang <sean.wang@mediatek.com>,
        John Crispin <john@phrozen.org>,
        Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH leds v1 05/10] leds: mt6323: use struct led_init_data when registering
Date:   Thu, 17 Sep 2020 01:16:45 +0200
Message-Id: <20200916231650.11484-6-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916231650.11484-1-marek.behun@nic.cz>
References: <20200916231650.11484-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

By using struct led_init_data when registering we do not need to parse
`label` DT property nor `linux,default-trigger` property.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: John Crispin <john@phrozen.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/leds/leds-mt6323.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 7b240771e45bb..c2dfafb694cfe 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -342,11 +342,6 @@ static int mt6323_led_set_dt_default(struct led_classdev *cdev,
 	const char *state;
 	int ret = 0;
 
-	led->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
-	led->cdev.default_trigger = of_get_property(np,
-						    "linux,default-trigger",
-						    NULL);
-
 	state = of_get_property(np, "default-state", NULL);
 	if (state) {
 		if (!strcmp(state, "keep")) {
@@ -402,6 +397,8 @@ static int mt6323_led_probe(struct platform_device *pdev)
 	}
 
 	for_each_available_child_of_node(np, child) {
+		struct led_init_data init_data = {};
+
 		ret = of_property_read_u32(child, "reg", &reg);
 		if (ret) {
 			dev_err(dev, "Failed to read led 'reg' property\n");
@@ -437,13 +434,15 @@ static int mt6323_led_probe(struct platform_device *pdev)
 			goto put_child_node;
 		}
 
-		ret = devm_led_classdev_register(dev, &leds->led[reg]->cdev);
+		init_data.fwnode = of_fwnode_handle(child);
+
+		ret = devm_led_classdev_register_ext(dev, &leds->led[reg]->cdev,
+						     &init_data);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register LED: %d\n",
 				ret);
 			goto put_child_node;
 		}
-		leds->led[reg]->cdev.dev->of_node = child;
 	}
 
 	return 0;
-- 
2.26.2

