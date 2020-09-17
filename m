Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6DDC43465
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B524A20707
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="iwY4iYXt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgIQWeM (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgIQWeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:11 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5410C061351;
        Thu, 17 Sep 2020 15:33:58 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id DCC33140B01;
        Fri, 18 Sep 2020 00:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382037; bh=B7cn78RkSXn32ihMhDkeA5HTyA02Mxx1cSSRI4SAV7I=;
        h=From:To:Date;
        b=iwY4iYXt3Rcin1C/gHjbZG+W5bnkJw3nkeSVeZv7Jj65xJ1p1vmZTpC73BWV+vwSk
         fpJxkev2kqlgB5l2sURP58EWWyakbpvqc3At/7t4Hi3hH7eA9UtvGU4mb9s/dSGq/W
         6Ti1oqJ0CnB5sYKwZyJXoZqHE1SidwOqu8Qj/7zU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH leds v2 20/50] leds: pm8058: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:33:08 +0200
Message-Id: <20200917223338.14164-21-marek.behun@nic.cz>
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

By using struct led_init_data when registering we do not need to parse
`label` DT property. Moreover `label` is deprecated and if it is not
present but `color` and `function` are, LED core will compose a name
from these properties instead.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/leds/leds-pm8058.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index dcd7d8c3d6b44..e085bf9ffc1de 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -87,6 +87,7 @@ static enum led_brightness pm8058_led_get(struct led_classdev *cled)
 
 static int pm8058_led_probe(struct platform_device *pdev)
 {
+	struct led_init_data init_data = {};
 	struct pm8058_led *led;
 	struct device_node *np = dev_of_node(&pdev->dev);
 	int ret;
@@ -113,8 +114,6 @@ static int pm8058_led_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Use label else node name */
-	led->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
 	led->cdev.default_trigger =
 		of_get_property(np, "linux,default-trigger", NULL);
 	led->cdev.brightness_set = pm8058_led_set;
@@ -142,10 +141,12 @@ static int pm8058_led_probe(struct platform_device *pdev)
 	    led->ledtype == PM8058_LED_TYPE_FLASH)
 		led->cdev.flags	= LED_CORE_SUSPENDRESUME;
 
-	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
+	init_data.fwnode = of_fwnode_handle(np);
+
+	ret = devm_led_classdev_register_ext(&pdev->dev, &led->cdev,
+					     &init_data);
 	if (ret) {
-		dev_err(&pdev->dev, "unable to register led \"%s\"\n",
-			led->cdev.name);
+		dev_err(&pdev->dev, "Failed to register LED for %pOF\n", np);
 		return ret;
 	}
 
-- 
2.26.2

