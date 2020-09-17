Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2942EC43466
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:36:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1303214D8
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:36:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="Zn9ENpkQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIQWgN (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:36:13 -0400
Received: from lists.nic.cz ([217.31.204.67]:35704 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgIQWeH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:07 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id A89F6140ADF;
        Fri, 18 Sep 2020 00:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382036; bh=K/Gkdy4QgBWvqCoLfNLDWzOzbRHVEkEYHbPEn4pgyvw=;
        h=From:To:Date;
        b=Zn9ENpkQU3V4FPbbpJ7sbhOx3ktVzX+jXnBukocPPEacMTEo6k4It12Y73Kv42Sbo
         dqI5jBjck9WNDFc2l+oLCqrIlwGBH7KKBaCgm54cbQr3rnOqq25I3AtJR9syL90XM6
         kv7S35jbndXhiG8mwyAdntlLvMGvl1rLHPJ/6Dvk=
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
Subject: [PATCH leds v2 19/50] leds: mt6323: cosmetic change: use helper variable
Date:   Fri, 18 Sep 2020 00:33:07 +0200
Message-Id: <20200917223338.14164-20-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use helper variable dev instead of always writing &pdev->dev.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: John Crispin <john@phrozen.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/leds/leds-mt6323.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index f6c71fd691bb8..5119dcc0aef24 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -368,9 +368,9 @@ static int mt6323_led_set_dt_default(struct led_classdev *cdev,
 static int mt6323_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev_of_node(&pdev->dev);
+	struct device_node *np = dev_of_node(dev);
 	struct device_node *child;
-	struct mt6397_chip *hw = dev_get_drvdata(pdev->dev.parent);
+	struct mt6397_chip *hw = dev_get_drvdata(dev->parent);
 	struct mt6323_leds *leds;
 	struct mt6323_led *led;
 	int ret;
@@ -443,8 +443,7 @@ static int mt6323_led_probe(struct platform_device *pdev)
 		ret = devm_led_classdev_register_ext(dev, &leds->led[reg]->cdev,
 						     &init_data);
 		if (ret) {
-			dev_err(&pdev->dev, "Failed to register LED: %d\n",
-				ret);
+			dev_err(dev, "Failed to register LED: %d\n", ret);
 			goto put_child_node;
 		}
 	}
-- 
2.26.2

