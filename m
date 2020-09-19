Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B657C43469
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 18:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A580C21741
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 18:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="qfzLMrBH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgISSDJ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 14:03:09 -0400
Received: from mail.nic.cz ([217.31.204.67]:52644 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbgISSDJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 14:03:09 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5B976140A7F;
        Sat, 19 Sep 2020 20:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538586; bh=M94NQEYxOEI8MV4Jxv5nXxeGOUP99OKbgtmoNh5U1b8=;
        h=From:To:Date;
        b=qfzLMrBHbr7OK610bEyLsdaoVWlqsSU4x4meraGgQ4K6qsKQz0FnHNhaBsPmB8ck7
         s6jv85YmsWH0iaLsf9ra7G6x2W1YTicvK1/egXyWCNJtDsEdsREEtg7RLASsaiHDsm
         3vkumk+5NUOwlPxzucJrCPkRITtDGNcG96cEjQAg=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v3 6/9] leds: lm36274: use devres LED registering function
Date:   Sat, 19 Sep 2020 20:03:01 +0200
Message-Id: <20200919180304.2885-7-marek.behun@nic.cz>
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

Now that the potential use-after-free issue is resolved we can use
devres for LED registration in this driver.

By using devres version of LED registering function we can remove the
.remove method from this driver.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index 74c236d1a60c8..10a63b7f2ecce 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -142,7 +142,8 @@ static int lm36274_probe(struct platform_device *pdev)
 	chip->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
 	chip->led_dev.brightness_set_blocking = lm36274_brightness_set;
 
-	ret = led_classdev_register_ext(chip->dev, &chip->led_dev, &init_data);
+	ret = devm_led_classdev_register_ext(chip->dev, &chip->led_dev,
+					     &init_data);
 	if (ret)
 		dev_err(chip->dev, "Failed to register LED for node %pfw\n",
 			init_data.fwnode);
@@ -152,15 +153,6 @@ static int lm36274_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int lm36274_remove(struct platform_device *pdev)
-{
-	struct lm36274 *chip = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&chip->led_dev);
-
-	return 0;
-}
-
 static const struct of_device_id of_lm36274_leds_match[] = {
 	{ .compatible = "ti,lm36274-backlight", },
 	{},
@@ -169,7 +161,6 @@ MODULE_DEVICE_TABLE(of, of_lm36274_leds_match);
 
 static struct platform_driver lm36274_driver = {
 	.probe  = lm36274_probe,
-	.remove = lm36274_remove,
 	.driver = {
 		.name = "lm36274-leds",
 	},
-- 
2.26.2

