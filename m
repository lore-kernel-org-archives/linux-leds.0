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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F776C47091
	for <linux-leds@archiver.kernel.org>; Sun, 30 May 2021 20:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11F4461205
	for <linux-leds@archiver.kernel.org>; Sun, 30 May 2021 20:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhE3UgO (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 30 May 2021 16:36:14 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:48607 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229756AbhE3UgO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 30 May 2021 16:36:14 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 70ecd793-c186-11eb-ba24-005056bd6ce9;
        Sun, 30 May 2021 23:34:33 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v1 1/1] leds: lm36274: Add missed property.h
Date:   Sun, 30 May 2021 23:32:28 +0300
Message-Id: <20210530203228.3958241-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

It appears that property.h has been included in some configurations implicitly,
but in some it's not and hence build may fail. Add missed property.h explicitly.

Fixes: e2e8e4e81875 ("leds: lm36274: Correct headers (of*.h -> mod_devicetable.h)")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-lm36274.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index 90dc5cbebed4..e009b6d17915 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -10,6 +10,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include <linux/mfd/ti-lmu.h>
 #include <linux/mfd/ti-lmu-register.h>
-- 
2.31.1

