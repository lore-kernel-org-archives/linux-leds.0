Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CED9C4346A
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 22:15:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6A7723119
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 22:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="wZFD9Aop"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgISWPx (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 18:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgISWPx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 18:15:53 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5450BC0613CF
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 15:15:53 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 70154140A7F;
        Sun, 20 Sep 2020 00:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553750; bh=mn1uz3a/cqd1n4pf2mznvoddQKgS8gffCJSxhBO/cdw=;
        h=From:To:Date;
        b=wZFD9AopnGRWIuWog8QZxRj5aiGgpoyBQIp6etNtMjTfzL+QvC5w2VwHDw8dCPCMu
         f0ogqfKo6qplCy4K3asRuqOFFn2J4CAvWlzQL4fO6/4Vzinxy6Vake364UU1mB00Kr
         npi+OdEZmxLEiQFVC/tYKaJeR8a9Es/ehjUfhfo0=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 05/13] leds: tca6507: do not set GPIO names
Date:   Sun, 20 Sep 2020 00:15:40 +0200
Message-Id: <20200919221548.29984-6-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Do not set GPIO names. Let gpiolib determine GPIO names from the DT
property `gpio-line-names`.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 3e01fe2510f7c..58dcbddfa0b27 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -197,7 +197,6 @@ struct tca6507_chip {
 	} leds[NUM_LEDS];
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip		gpio;
-	const char			*gpio_name[NUM_LEDS];
 	int				gpio_map[NUM_LEDS];
 #endif
 };
@@ -647,7 +646,6 @@ static int tca6507_probe_gpios(struct i2c_client *client,
 	for (i = 0; i < NUM_LEDS; i++)
 		if (pdata->leds.leds[i].name && pdata->leds.leds[i].flags) {
 			/* Configure as a gpio */
-			tca->gpio_name[gpios] = pdata->leds.leds[i].name;
 			tca->gpio_map[gpios] = i;
 			gpios++;
 		}
@@ -656,7 +654,6 @@ static int tca6507_probe_gpios(struct i2c_client *client,
 		return 0;
 
 	tca->gpio.label = "gpio-tca6507";
-	tca->gpio.names = tca->gpio_name;
 	tca->gpio.ngpio = gpios;
 	tca->gpio.base = pdata->gpio_base;
 	tca->gpio.owner = THIS_MODULE;
-- 
2.26.2

