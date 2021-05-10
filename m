Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FD3C433B4
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:51:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7623613DC
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:51:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhEJJwY (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 10 May 2021 05:52:24 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:42506 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230455AbhEJJwS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:18 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 3df29334-b175-11eb-9eb8-005056bdd08f;
        Mon, 10 May 2021 12:51:07 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 11/28] leds: lgm-sso: Remove explicit managed resource cleanups
Date:   Mon, 10 May 2021 12:50:28 +0300
Message-Id: <20210510095045.3299382-12-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The idea of managed resources that they will be cleaned up automatically
and in the proper order. Remove explicit cleanups.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/blink/leds-lgm-sso.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index e76be25480b4..a7f2e5436ba2 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -606,16 +606,10 @@ static void sso_led_shutdown(struct sso_led *led)
 {
 	struct sso_led_priv *priv = led->priv;
 
-	/* unregister led */
-	devm_led_classdev_unregister(priv->dev, &led->cdev);
-
 	/* clear HW control bit */
 	if (led->desc.hw_trig)
 		regmap_update_bits(priv->mmap, SSO_CON3, BIT(led->desc.pin), 0);
 
-	if (led->gpiod)
-		devm_gpiod_put(priv->dev, led->gpiod);
-
 	led->priv = NULL;
 }
 
-- 
2.31.1

