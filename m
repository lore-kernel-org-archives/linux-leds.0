Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A239BC43464
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:36:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62B132137B
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:36:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="yFd/N2ou"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgIQWgM (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:36:12 -0400
Received: from lists.nic.cz ([217.31.204.67]:35722 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgIQWeI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:08 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 485F9140A6A;
        Fri, 18 Sep 2020 00:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382037; bh=GkF2a5oLuMgdV4ONYLyFQ/fTmYs3E7o3B8KAlu9YJws=;
        h=From:To:Date;
        b=yFd/N2outGKMA7gZDIJDUFRJOH+Ytzq1rpyE0oua7Vm/R2V4yY8KSTPdu/T5JPveK
         8tMRVTwDY1vqntje8NxshqVDTltSLMR5NlFsPep5CM2Md06WiicLigfp7RP3GA/WkA
         9uU93yh1wfZ2XfjKzdM4JwR7B9ITocZGsdGnXJpw=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH leds v2 22/50] leds: pm8058: cosmetic change: no need to return in if guard
Date:   Fri, 18 Sep 2020 00:33:10 +0200
Message-Id: <20200917223338.14164-23-marek.behun@nic.cz>
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

We can return the last ret value.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/leds/leds-pm8058.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index 70b4d06488fec..193780a8c0522 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -147,12 +147,10 @@ static int pm8058_led_probe(struct platform_device *pdev)
 	init_data.fwnode = of_fwnode_handle(np);
 
 	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Failed to register LED for %pOF\n", np);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static const struct of_device_id pm8058_leds_id_table[] = {
-- 
2.26.2

