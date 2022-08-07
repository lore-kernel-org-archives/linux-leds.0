Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481D5C19F2A
	for <linux-leds@archiver.kernel.org>; Sun,  7 Aug 2022 10:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbiHGKkr (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 7 Aug 2022 06:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbiHGKkr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 7 Aug 2022 06:40:47 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C840F22E;
        Sun,  7 Aug 2022 03:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1659868838; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=q0iCh5uIlcUWx769Xlap9uF9I3kZ/wVQv4SF/RfY30c=;
        b=jBkPtZmLIjOBQMs6R/bHNoG+8VDe3eBGaXRXxMv6asYSibty24L+lnLis1EcqP/zcfRIe2
        FAGlSVF8hsCld/vFy2zfLy30CHt3IsA1rbO5t9Bs6qvj3z8drKnZ+F8PGXF8lzNBXZ14W7
        TqJ9hq7bBfhZIP1T3O1ht2HBU8VAQp4=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] leds: max8997: Don't error if there is no pdata
Date:   Sun,  7 Aug 2022 12:40:27 +0200
Message-Id: <20220807104027.10808-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver will works just fine if no platform data was supplied.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
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

