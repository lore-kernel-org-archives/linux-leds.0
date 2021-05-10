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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890E0C43616
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 634CC61433
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhEJJxD (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 10 May 2021 05:53:03 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:14826 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231192AbhEJJwh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:37 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 46772dca-b175-11eb-8ccd-005056bdfda7;
        Mon, 10 May 2021 12:51:21 +0300 (EEST)
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
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v1 28/28] leds: sgm3140: Put fwnode in any case during ->probe()
Date:   Mon, 10 May 2021 12:50:45 +0300
Message-Id: <20210510095045.3299382-29-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

fwnode_get_next_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Cc: Luca Weiss <luca@z3ntu.xyz>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-sgm3140.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
index f4f831570f11..df9402071695 100644
--- a/drivers/leds/leds-sgm3140.c
+++ b/drivers/leds/leds-sgm3140.c
@@ -266,12 +266,8 @@ static int sgm3140_probe(struct platform_device *pdev)
 					   child_node,
 					   fled_cdev, NULL,
 					   &v4l2_sd_cfg);
-	if (IS_ERR(priv->v4l2_flash)) {
-		ret = PTR_ERR(priv->v4l2_flash);
-		goto err;
-	}
-
-	return ret;
+	fwnode_handle_put(child_node);
+	return PTR_ERR_OR_ZERO(priv->v4l2_flash);
 
 err:
 	fwnode_handle_put(child_node);
-- 
2.31.1

