Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABC1C4708F
	for <linux-leds@archiver.kernel.org>; Sat, 29 May 2021 11:19:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38EAB613DD
	for <linux-leds@archiver.kernel.org>; Sat, 29 May 2021 11:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhE2LVW (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 29 May 2021 07:21:22 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:13939 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229737AbhE2LVU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:20 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id c3b53ab9-c06f-11eb-8ccd-005056bdfda7;
        Sat, 29 May 2021 14:19:42 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] leds: lgm-sso: Remove explicit managed GPIO resource cleanup
Date:   Sat, 29 May 2021 14:19:28 +0300
Message-Id: <20210529111935.3849707-6-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The idea of managed resources is that they will be cleaned up automatically
and in the proper order. Remove explicit GPIO cleanup.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: dropped one part of the change, i.e. LED unregistration (Pavel)
 drivers/leds/blink/leds-lgm-sso.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 877b44594b26..24f4057d5a05 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -613,9 +613,6 @@ static void sso_led_shutdown(struct sso_led *led)
 	if (led->desc.hw_trig)
 		regmap_update_bits(priv->mmap, SSO_CON3, BIT(led->desc.pin), 0);
 
-	if (led->gpiod)
-		devm_gpiod_put(priv->dev, led->gpiod);
-
 	led->priv = NULL;
 }
 
-- 
2.31.1

