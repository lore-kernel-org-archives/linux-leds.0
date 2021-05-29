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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79572C4708E
	for <linux-leds@archiver.kernel.org>; Sat, 29 May 2021 11:19:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BEDD613DD
	for <linux-leds@archiver.kernel.org>; Sat, 29 May 2021 11:19:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhE2LV0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 29 May 2021 07:21:26 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:27417 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229775AbhE2LVW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:22 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id c424a5a6-c06f-11eb-ba24-005056bd6ce9;
        Sat, 29 May 2021 14:19:43 +0300 (EEST)
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
Subject: [PATCH v2 07/13] leds: lgm-sso: Convert to use list_for_each_entry*() API
Date:   Sat, 29 May 2021 14:19:29 +0300
Message-Id: <20210529111935.3849707-7-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert to use list_for_each_entry*() API insted of open coded variants.
It saves few lines of code and makes iteasier to read and maintain.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: no change
 drivers/leds/blink/leds-lgm-sso.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 24f4057d5a05..77c933051d67 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -623,7 +623,6 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 	struct device *dev = priv->dev;
 	struct sso_led_desc *desc;
 	struct sso_led *led;
-	struct list_head *p;
 	const char *tmp;
 	u32 prop;
 	int ret;
@@ -709,10 +708,8 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 __dt_err:
 	fwnode_handle_put(fwnode_child);
 	/* unregister leds */
-	list_for_each(p, &priv->led_list) {
-		led = list_entry(p, struct sso_led, list);
+	list_for_each_entry(led, &priv->led_list, list)
 		sso_led_shutdown(led);
-	}
 
 	return -EINVAL;
 }
@@ -843,14 +840,12 @@ static int intel_sso_led_probe(struct platform_device *pdev)
 static int intel_sso_led_remove(struct platform_device *pdev)
 {
 	struct sso_led_priv *priv;
-	struct list_head *pos, *n;
-	struct sso_led *led;
+	struct sso_led *led, *n;
 
 	priv = platform_get_drvdata(pdev);
 
-	list_for_each_safe(pos, n, &priv->led_list) {
-		list_del(pos);
-		led = list_entry(pos, struct sso_led, list);
+	list_for_each_entry_safe(led, n, &priv->led_list, list) {
+		list_del(&led->list);
 		sso_led_shutdown(led);
 	}
 
-- 
2.31.1

