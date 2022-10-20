Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44722C433FE
	for <linux-leds@archiver.kernel.org>; Thu, 20 Oct 2022 11:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbiJTLpE (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 20 Oct 2022 07:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbiJTLpD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Oct 2022 07:45:03 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CF43846A;
        Thu, 20 Oct 2022 04:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1666266291; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=KWh0qYj9ci/7l0SX9GJj178mtuBeJCrc8Rr6rhBv1Jc=;
        b=u83sYt3GAv6rj/z9kDSku4S97vyjayKoxcYlVSdoKPNL/KY3brawOXpGYHm4rObisxIstC
        l6mglpeBzZ5d9fTxnPNgopGjabTMtIDybi+x6J6UF5tSUMs+petIMQSGBYp0r4sZnUOwFp
        L6e4gPyLTaKccL986vLX5YQHEaz1N9w=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2] leds: max8997: Don't error if there is no pdata
Date:   Thu, 20 Oct 2022 12:44:42 +0100
Message-Id: <20221020114442.22215-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver works just fine if no platform data is supplied.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 v2: Add Andy's reviewed-by and reword the commit description.

 drivers/leds/leds-max8997.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
index c0bddb33888d..c8d7f55c9dec 100644
--- a/drivers/leds/leds-max8997.c
+++ b/drivers/leds/leds-max8997.c
@@ -238,11 +238,6 @@ static int max8997_led_probe(struct platform_device *pdev)
 	char name[20];
 	int ret = 0;
 
-	if (pdata == NULL) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -ENODEV;
-	}
-
 	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
 	if (led == NULL)
 		return -ENOMEM;
@@ -258,7 +253,7 @@ static int max8997_led_probe(struct platform_device *pdev)
 	led->iodev = iodev;
 
 	/* initialize mode and brightness according to platform_data */
-	if (pdata->led_pdata) {
+	if (pdata && pdata->led_pdata) {
 		u8 mode = 0, brightness = 0;
 
 		mode = pdata->led_pdata->mode[led->id];
-- 
2.35.1

