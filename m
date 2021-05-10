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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32AAC43460
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:51:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5D096157E
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:51:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhEJJwx (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 10 May 2021 05:52:53 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:17563 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231173AbhEJJwa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:30 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 4327664a-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:51:16 +0300 (EEST)
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
Subject: [PATCH v1 21/28] leds: lm3697: Make error handling more robust
Date:   Mon, 10 May 2021 12:50:38 +0300
Message-Id: <20210510095045.3299382-22-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

It's easy to miss necessary clean up, e.g. firmware node reference counting,
during error path in ->probe(). Make it more robust by moving to a single
point of return.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-lm3697.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 9d35dd2a9bf0..6262ae69591e 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -224,14 +224,12 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(dev, "reg property missing\n");
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
 		if (control_bank > LM3697_CONTROL_B) {
 			dev_err(dev, "reg property is invalid\n");
 			ret = -EINVAL;
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
@@ -262,7 +260,6 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 						    led->num_leds);
 		if (ret) {
 			dev_err(dev, "led-sources property missing\n");
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
@@ -287,7 +284,6 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 						     &init_data);
 		if (ret) {
 			dev_err(dev, "led register err: %d\n", ret);
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
@@ -295,6 +291,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 	}
 
 child_out:
+	fwnode_handle_put(child);
 	return ret;
 }
 
-- 
2.31.1

