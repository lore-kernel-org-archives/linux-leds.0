Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD36C4346A
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 18:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BDD321707
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 18:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="R2/j3Vgs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgISSDK (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 14:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgISSDK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 14:03:10 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2CEC0613CF
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 11:03:10 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 9C96C140A85;
        Sat, 19 Sep 2020 20:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538586; bh=N5bHgoLF/XOzGTwNJvrniKckmV2Q2kQtYgiiGCEMwfY=;
        h=From:To:Date;
        b=R2/j3Vgswrh+JHzo3U6r4H+zerjakZkSEi20+ZHqgvawzSKiBFl7iSAGJUikXk/zK
         YcvPCz1xdkcEFHoq1JxJJoZ5+2Zno62pZm7awnbewedyluM/rllUsRyWsacBybeVBB
         yMhdESOY5giARfSM+5h7PHOivHeq+gRBoyB8MAos=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH leds v3 8/9] leds: syscon: use struct led_init_data when registering
Date:   Sat, 19 Sep 2020 20:03:03 +0200
Message-Id: <20200919180304.2885-9-marek.behun@nic.cz>
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

By using struct led_init_data when registering we do not need to parse
`label` DT property. Moreover `label` is deprecated and if it is not
present but `color` and `function` are, LED core will compose a name
from these properties instead.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-syscon.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index d7230da815430..f54935fa650a7 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -55,6 +55,7 @@ static void syscon_led_set(struct led_classdev *led_cdev,
 
 static int syscon_led_probe(struct platform_device *pdev)
 {
+	struct led_init_data init_data = {};
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct device *parent;
@@ -84,8 +85,6 @@ static int syscon_led_probe(struct platform_device *pdev)
 		return -EINVAL;
 	if (of_property_read_u32(np, "mask", &sled->mask))
 		return -EINVAL;
-	sled->cdev.name =
-		of_get_property(np, "label", NULL) ? : np->name;
 	sled->cdev.default_trigger =
 		of_get_property(np, "linux,default-trigger", NULL);
 
@@ -115,7 +114,9 @@ static int syscon_led_probe(struct platform_device *pdev)
 	}
 	sled->cdev.brightness_set = syscon_led_set;
 
-	ret = devm_led_classdev_register(dev, &sled->cdev);
+	init_data.fwnode = of_fwnode_handle(np);
+
+	ret = devm_led_classdev_register_ext(dev, &sled->cdev, &init_data);
 	if (ret < 0)
 		return ret;
 
-- 
2.26.2

