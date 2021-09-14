Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F539C433EF
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 16:06:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3084C60F11
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 16:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235348AbhINQII (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 14 Sep 2021 12:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbhINQIH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Sep 2021 12:08:07 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0ECC061574;
        Tue, 14 Sep 2021 09:06:50 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id b64so15466572qkg.0;
        Tue, 14 Sep 2021 09:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=TqrdcKpbBibte7IvBMJ+zO8G/JHJWLDdIHFJtogMMNk=;
        b=X1X5CVT8V2b3vlKs5EINTvaCl41rFSMn4uYtByAK1gNJDIabfTJy7I1XF5AVgA+3BE
         XK0y7skplhAdw3NjKczh5GenSOgmZ1tYfpQR5nVG0yUEmSMTv7tRDGWGsTyaGqywlqOe
         zveynzqYWt7OF/urAxMX3yWCW1aIjJIw4+eMHeQpSrknEnvQCOQduKzuu5EtG9vWbsLY
         1LNOdqTHL8FJYSpzh0c/x6yg2NVwMp3JHru8em3v6Wb6tHXAdGsxIi5B3veNnTc1vGNl
         3QnW1QcU9vhsMhoyUV0pLOVprPbzyyB/hBN2UeiBssOaFqJ9FU/MJf2yJoBbgXC7rwKg
         C/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TqrdcKpbBibte7IvBMJ+zO8G/JHJWLDdIHFJtogMMNk=;
        b=WKMHeUEAHsH00aNWoAu0OdYtnxztXJBnC6qUnopb4MTvFF/twvIh/6PBoNw1x8mrTS
         mxYUJr5jD4/axdXIJQujJRGS9FpI/ws00K96jNzAiOHxW0g5nw1wnSYSGKc7cNLDXdZl
         2WNVayjvzYSeiwADAVHP/JlYIX1c6Qb8Q6WzSLAbme+1ZIFWhWO7/nGYzv255dYwz3XZ
         sn0mkMbJ4ke2+aLLoyk/QBL4VO7qPqBKLLnxR6EdnvDIw6nSgS/P8lhrFH6NqSiWxYPU
         liCrPmTqBPjSq6BrLPRh4y2Qygln5xVAvKpVYL4aSoVwVNZKGWlAUmWyPgsVYmd0YgYT
         DZJA==
X-Gm-Message-State: AOAM532STPlZPKr0ZeovQOVeKOXy3GdLxLsrBdP1vMB28UpH7QoxIQR9
        QU4FYzIZzRjKDk1m+bNa5CA=
X-Google-Smtp-Source: ABdhPJwVh5OSF+Oo9TNmN5ue8vSh0oWm8vw1qCgTvgXonvdlr7z8FTbYhG9/hhD4QPP7AcVmhHQ5NA==
X-Received: by 2002:a37:758:: with SMTP id 85mr5738239qkh.85.1631635609466;
        Tue, 14 Sep 2021 09:06:49 -0700 (PDT)
Received: from donovan-FR.attlocal.net ([2600:1700:3ec0:6ec0:95a8:c42c:53f7:972e])
        by smtp.googlemail.com with ESMTPSA id t188sm7978207qkf.22.2021.09.14.09.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 09:06:48 -0700 (PDT)
From:   DonDrews <donovancarldrews@gmail.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, donovancarldrews@gmail.com
Subject: [PATCH] Fixes: leds: lp50xx: Fix bank enable mask
Date:   Tue, 14 Sep 2021 09:06:31 -0700
Message-Id: <20210914160631.3204-1-donovancarldrews@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fixes an issue where previously 0 is used as a sentinel when
moving device tree configuration into the bank enable mask. This
prevented the first LED from being added to bank control.

Signed-off-by: Donovan Drews <donovancarldrews@gmail.com>
---
 drivers/leds/leds-lp50xx.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 401df1e2e05d..45f56caea182 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -347,17 +347,15 @@ static int lp50xx_brightness_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
+static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[], int num_leds)
 {
 	u8 led_config_lo, led_config_hi;
 	u32 bank_enable_mask = 0;
 	int ret;
 	int i;
 
-	for (i = 0; i < priv->chip_info->max_modules; i++) {
-		if (led_banks[i])
-			bank_enable_mask |= (1 << led_banks[i]);
-	}
+	for (i = 0; i < num_leds; i++)
+		bank_enable_mask |= (1 << led_banks[i]);
 
 	led_config_lo = bank_enable_mask;
 	led_config_hi = bank_enable_mask >> 8;
@@ -413,7 +411,7 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 			return ret;
 		}
 
-		ret = lp50xx_set_banks(priv, led_banks);
+		ret = lp50xx_set_banks(priv, led_banks, num_leds);
 		if (ret) {
 			dev_err(priv->dev, "Cannot setup banked LEDs\n");
 			return ret;
-- 
2.17.1

