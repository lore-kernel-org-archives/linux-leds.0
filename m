Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21054C43464
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5EDC2137B
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="o4O8qM2l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgIQWgE (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgIQWeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:11 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2970C061797;
        Thu, 17 Sep 2020 15:33:58 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 4DDC4140AC2;
        Fri, 18 Sep 2020 00:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382036; bh=lll6H8Nup3NnWWOQvF+j9iYGFIJQ2yr+fuQjp7/sNHs=;
        h=From:To:Date;
        b=o4O8qM2lQv99xgrhRj2TkhH3Gx9FOU0MPWJRrNtS23SwRR/Bf3lwNtaUK6qd3Ftwg
         EcnrBibtUkTjT047W94YofcH8WOrIAgwXLuEEus9zcLwj0oPVgC1w0vn9kWTuTteSk
         nOEyY+d2kufr8feZB/wDvQ2pXurBqVcErU6XNhFg=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH leds v2 17/50] leds: max77650: use reverse christmas tree
Date:   Fri, 18 Sep 2020 00:33:05 +0200
Message-Id: <20200917223338.14164-18-marek.behun@nic.cz>
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

Only a cosmetic change: use reverse christmas tree variables
declaration.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/leds/leds-max77650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index f2090d3ebfd53..bed620fc1b82e 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -62,8 +62,8 @@ static int max77650_led_brightness_set(struct led_classdev *cdev,
 
 static int max77650_led_probe(struct platform_device *pdev)
 {
-	struct fwnode_handle *child;
 	struct max77650_led *leds, *led;
+	struct fwnode_handle *child;
 	struct device *dev;
 	struct regmap *map;
 	int rv, num_leds;
-- 
2.26.2

