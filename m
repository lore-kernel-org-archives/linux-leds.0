Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AD5C433ED
	for <linux-leds@archiver.kernel.org>; Mon, 12 Apr 2021 10:55:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D888061288
	for <linux-leds@archiver.kernel.org>; Mon, 12 Apr 2021 10:55:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239267AbhDLKzW (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 12 Apr 2021 06:55:22 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:56233 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239063AbhDLKzV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 12 Apr 2021 06:55:21 -0400
X-Greylist: delayed 965 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Apr 2021 06:55:21 EDT
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 4837d188-9b7b-11eb-9eb8-005056bdd08f;
        Mon, 12 Apr 2021 13:38:56 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v1 1/1] leds: as3645a: Keep fwnode reference count balanced
Date:   Mon, 12 Apr 2021 13:38:38 +0300
Message-Id: <20210412103838.2055499-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The commit 88b7e9ffe594 ("leds: as3645a: Switch to fwnode property API")
missed the point that loop counter should be put after use. Otherwise
the reference count of it will become unbalanced.

Fixes: 88b7e9ffe594 ("leds: as3645a: Switch to fwnode property API")
Fixes: 22cb0a76e005 ("leds-as3645a: Drop fwnode reference on ignored node")
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-as3645a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index e8922fa03379..50454d1c6090 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -505,6 +505,7 @@ static int as3645a_parse_node(struct as3645a *flash,
 			break;
 		}
 	}
+	fwnode_handle_put(fwnode);
 
 	if (!flash->flash_node) {
 		dev_err(&flash->client->dev, "can't find flash node\n");
-- 
2.31.1

