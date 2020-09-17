Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE799C43464
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F99B2087D
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="PtBS+c6d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgIQWeO (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:34:14 -0400
Received: from mail.nic.cz ([217.31.204.67]:35544 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbgIQWeN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:13 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 3B085140A68;
        Fri, 18 Sep 2020 00:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382040; bh=GseXY09FBjE5LnJaECozU1UxFWKA+J/VLk7tyCbUgoo=;
        h=From:To:Date;
        b=PtBS+c6dfhOfAxobTmPvjFGu8fO461gCOBhIe0qHFtuaP/kxtEvKAIXVO0Aj6ro03
         hRkVhKklZ+j8QZCOUoELlZTOwRFuqubce/CmmEEngcDSi75qUu2SAHQY+NQ/KWZeTt
         wlkabPcyh2NPbepUHWSE2QimpHUCVrvmWcAEW1uU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH leds v2 38/50] leds: ns2: support OF probing only, forget platdata
Date:   Fri, 18 Sep 2020 00:33:26 +0200
Message-Id: <20200917223338.14164-39-marek.behun@nic.cz>
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

Move forward from platform data to device tree only.

Since commit c7896490dd1a ("leds: ns2: Absorb platform data") the
platform data structure is absorbed into the driver, because nothing
else in the source tree uses it. Since nobody complained and all usage
of this driver is via device tree, change the code to work with device
tree only. As Linus Walleij wrote, the device tree should be the
preferred way forward anyway.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 40 +++++++++++++++-------------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 8cd020b340840..0e9c2f49b6350 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -39,7 +39,7 @@ struct ns2_led {
 	struct ns2_led_modval *modval;
 };
 
-struct ns2_led_platform_data {
+struct ns2_led_of {
 	int		num_leds;
 	struct ns2_led	*leds;
 };
@@ -230,12 +230,11 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	return devm_led_classdev_register(&pdev->dev, &led_dat->cdev);
 }
 
-#ifdef CONFIG_OF_GPIO
 /*
  * Translate OpenFirmware node properties into platform_data.
  */
 static int
-ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
+ns2_leds_parse_of(struct device *dev, struct ns2_led_of *ofdata)
 {
 	struct device_node *np = dev_of_node(dev);
 	struct device_node *child;
@@ -317,8 +316,8 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 		led++;
 	}
 
-	pdata->leds = leds;
-	pdata->num_leds = num_leds;
+	ofdata->leds = leds;
+	ofdata->num_leds = num_leds;
 
 	return 0;
 
@@ -332,40 +331,31 @@ static const struct of_device_id of_ns2_leds_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
-#endif /* CONFIG_OF_GPIO */
 
 static int ns2_led_probe(struct platform_device *pdev)
 {
-	struct ns2_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct ns2_led_of *ofdata;
 	struct ns2_led_data *leds;
 	int i;
 	int ret;
 
-#ifdef CONFIG_OF_GPIO
-	if (!pdata) {
-		pdata = devm_kzalloc(&pdev->dev,
-				     sizeof(struct ns2_led_platform_data),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
+	ofdata = devm_kzalloc(&pdev->dev, sizeof(struct ns2_led_of),
+			      GFP_KERNEL);
+	if (!ofdata)
+		return -ENOMEM;
 
-		ret = ns2_leds_get_of_pdata(&pdev->dev, pdata);
-		if (ret)
-			return ret;
-	}
-#else
-	if (!pdata)
-		return -EINVAL;
-#endif /* CONFIG_OF_GPIO */
+	ret = ns2_leds_parse_of(&pdev->dev, ofdata);
+	if (ret)
+		return ret;
 
 	leds = devm_kzalloc(&pdev->dev, array_size(sizeof(*leds),
-						   pdata->num_leds),
+						   ofdata->num_leds),
 			    GFP_KERNEL);
 	if (!leds)
 		return -ENOMEM;
 
-	for (i = 0; i < pdata->num_leds; i++) {
-		ret = create_ns2_led(pdev, &leds[i], &pdata->leds[i]);
+	for (i = 0; i < ofdata->num_leds; i++) {
+		ret = create_ns2_led(pdev, &leds[i], &ofdata->leds[i]);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.26.2

