Return-Path: <SRS0=3VIc=57=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C82FC2BA19
	for <linux-leds@archiver.kernel.org>; Wed, 15 Apr 2020 12:31:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 295C62074F
	for <linux-leds@archiver.kernel.org>; Wed, 15 Apr 2020 12:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gPMgqctA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369607AbgDOMbz (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 15 Apr 2020 08:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369593AbgDOMbw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Apr 2020 08:31:52 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D258AC061A0C
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 05:31:51 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m19so2439653lfq.13
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zH0RTL+TNnlMglnKnwKKDMYeBOlBDieoGnDtsqRFB3g=;
        b=gPMgqctA+xLaYLoBWjgy9M8UsHOTedAYOue8ILLzCY/dDntfd8InPekuDNjSlZRdOq
         GK3O3z1rH1r4zmhfQm8tTfkVqWzjW/4kzeseAv6aXSqy2J4B8J3QjSm240KnqFbxV5Pt
         ozm1VWdmGJKMTy/STQLAgMWuKtkCILYySQhrMViqu1OnRy5+2Slh85R83EjMk5t3b2Rm
         /iL8MWkkNHwiWmNHgsyasztefZSwEjCIJL5uzr5z0YkL/QofBIV02JzmZ0dvIqKRXX4/
         zq+bPt6Zeb+UGogvXA/7/PXUO05dJeoAeoGkwCuIMNiNFFiooBTniosJzfZL5vL5wxfZ
         yZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zH0RTL+TNnlMglnKnwKKDMYeBOlBDieoGnDtsqRFB3g=;
        b=apJq7UaNKYwaEYh76GsE0gvJBhEKUVkL8dFIrhCPsBMgIGSibc3/oLXDtHTw2pt5Ej
         7U58B3Xt7ffmqDVbQe3GxdpuBMUYGGHgo3HDt/qE9bH/LQfvBUkDQRufqpoBxZcPCsYo
         6BsVv2Cvl6klgrPZ+1ikXdfX8xsYYw8zWf2R+eDN/OQXJ45qvQnfvF3sRE8oIdMbFHPz
         zQLmEp3C2hvWHdxdjr2/4qs0nZx/nB4TwNs+QG/0uL+DPl66bc+5lE86HE4VlwO6DLTg
         J1flIjtL3yeN//iwFVwKsTPImCOiT+EKLaamIOmwOwEnH4VhzaQzaNazZt9qjqqL37Td
         kJYw==
X-Gm-Message-State: AGi0PubDMLP1yECakUh9573ITe3sr+ge8S3hOwFO7A1opzP5SZqZrqDX
        n+W9XP0MEBnIlamJnIDp1Ym7lg==
X-Google-Smtp-Source: APiQypJvApYp88oFOfv0utmKKMLhveTRq5zr9kHx816tbjcOnpgFWFmcQlP2oTybC85R1RSI6YRvUA==
X-Received: by 2002:ac2:5192:: with SMTP id u18mr2926368lfi.114.1586953910357;
        Wed, 15 Apr 2020 05:31:50 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id s22sm10041240ljp.69.2020.04.15.05.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:31:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        "G . Shark Jeong" <gshark.jeong@gmail.com>
Subject: [PATCH] leds: lm355x: Drop surplus include
Date:   Wed, 15 Apr 2020 14:29:45 +0200
Message-Id: <20200415122945.113112-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver includes <linux/gpio.h> but does not use
any symbols from that file, so drop the include.

Cc: G.Shark Jeong <gshark.jeong@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-lm355x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index a5abb499574b..11ce05249751 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -7,7 +7,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-- 
2.25.2

