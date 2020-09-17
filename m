Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E518C43466
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05DFC2087D
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:34:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="awyN4ix0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgIQWen (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:34:43 -0400
Received: from lists.nic.cz ([217.31.204.67]:35704 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726342AbgIQWeS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:18 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 7094014206E;
        Fri, 18 Sep 2020 00:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382042; bh=LFh/7x/a6jP9SP/JWoHkIz0HQI9v5xpkbyjZVeFXhFg=;
        h=From:To:Date;
        b=awyN4ix07/mSxuL3b/j+qYX9WJJNeORnjM1ZmBM6DAEVWtQeKpsmgkCWZ6VUTaeSr
         My+bsf47vA6kh01D2tHJdP6UL1Eyob1xT9Xft1IWDWwWKZ5m80MiD4kNBVRchDPI5M
         lpaEcdMeFEem3nRghwpzRuPt9NmklJF1eJPkVSFM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH leds v2 48/50] leds: ns2: reorder headers alphabetically
Date:   Fri, 18 Sep 2020 00:33:36 +0200
Message-Id: <20200917223338.14164-49-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Reorder #includes alphabetically.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 40f36c53d9e87..01c54ab0aa00e 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -9,13 +9,13 @@
  * Based on leds-gpio.c by Raphael Assenat <raph@8d.com>
  */
 
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 #include "leds.h"
 
 enum ns2_led_modes {
-- 
2.26.2

