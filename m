Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E274C43468
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1101820795
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="iQhyU+Il"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgIQWff (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:35:35 -0400
Received: from lists.nic.cz ([217.31.204.67]:35966 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726245AbgIQWeM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:12 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id D716114204F;
        Fri, 18 Sep 2020 00:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382039; bh=eylOQwNosH/+MyVb6B6nwrcWha3E/L2/PYtCFaINitQ=;
        h=From:To:Date;
        b=iQhyU+IlP4KS61v6ki2GZPU4Ua1sXoO++IO2lnECdkJKXYkd9ICBqGySB25JmM9hh
         F7UxZ+kQlqGUlCQ6WbGTGFQbHi4IZkpopxQCIHzI4B5rhDU1Ktz69jOaY+z0W5ooh3
         7HWE0P/tluLzpVfnxuvbCaFrJNDtBhXLEWobnkbs=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v2 31/50] leds: lm36274: use devres LED registering function
Date:   Fri, 18 Sep 2020 00:33:19 +0200
Message-Id: <20200917223338.14164-32-marek.behun@nic.cz>
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

By using devres version of LED registering function we can remove the
.remove method from this driver.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index bfeee03a0053c..1390c71267cc2 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -147,16 +147,8 @@ static int lm36274_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return led_classdev_register(lm36274_data->dev, &lm36274_data->led_dev);
-}
-
-static int lm36274_remove(struct platform_device *pdev)
-{
-	struct lm36274 *lm36274_data = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&lm36274_data->led_dev);
-
-	return 0;
+	return devm_led_classdev_register(lm36274_data->dev,
+					  &lm36274_data->led_dev);
 }
 
 static const struct of_device_id of_lm36274_leds_match[] = {
@@ -167,7 +159,6 @@ MODULE_DEVICE_TABLE(of, of_lm36274_leds_match);
 
 static struct platform_driver lm36274_driver = {
 	.probe  = lm36274_probe,
-	.remove = lm36274_remove,
 	.driver = {
 		.name = "lm36274-leds",
 	},
-- 
2.26.2

