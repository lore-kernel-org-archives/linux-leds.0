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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39ACC4360C
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:51:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 996B761433
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhEJJwO (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 10 May 2021 05:52:14 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:14395 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230481AbhEJJwM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:12 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 3aa10d04-b175-11eb-8ccd-005056bdfda7;
        Mon, 10 May 2021 12:51:01 +0300 (EEST)
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
Subject: [PATCH v1 04/28] leds: el15203000: Make error handling more robust
Date:   Mon, 10 May 2021 12:50:21 +0300
Message-Id: <20210510095045.3299382-5-andy.shevchenko@gmail.com>
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
 drivers/leds/leds-el15203000.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index 912451db05e6..bcdbbbc9c187 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -246,16 +246,13 @@ static int el15203000_probe_dt(struct el15203000 *priv)
 		ret = fwnode_property_read_u32(child, "reg", &led->reg);
 		if (ret) {
 			dev_err(priv->dev, "LED without ID number");
-			fwnode_handle_put(child);
-
-			break;
+			goto err_child_out;
 		}
 
 		if (led->reg > U8_MAX) {
 			dev_err(priv->dev, "LED value %d is invalid", led->reg);
-			fwnode_handle_put(child);
-
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_child_out;
 		}
 
 		led->priv			  = priv;
@@ -277,14 +274,16 @@ static int el15203000_probe_dt(struct el15203000 *priv)
 			dev_err(priv->dev,
 				"failed to register LED device %s, err %d",
 				led->ldev.name, ret);
-			fwnode_handle_put(child);
-
-			break;
+			goto err_child_out;
 		}
 
 		led++;
 	}
 
+	return 0;
+
+err_child_out:
+	fwnode_handle_put(child);
 	return ret;
 }
 
-- 
2.31.1

