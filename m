Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68EBC43464
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F508214D8
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="Z7KdQ2N8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgIQWfQ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:35:16 -0400
Received: from lists.nic.cz ([217.31.204.67]:35524 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgIQWeN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:13 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 9E7DB14205F;
        Fri, 18 Sep 2020 00:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382040; bh=QCP2wLMmyumTwoOiIgbl7vvdMWG8GVtVNf+P0fK63Q0=;
        h=From:To:Date;
        b=Z7KdQ2N8E/YUa9YZlM1g5neLzYJRc0vCN5v5+RkyxEG9r3z0cWtem7HTwavFiW6ns
         o/ypoUMK8TJKzGoBvagozhPans/1tL4AXlYOp9bGRWAT8PMVhB0fKMO1v3Y/P8Vop1
         YzcYskLbwoP9Qg0l8kGjeSgG3/l5s2CJpY9Q1i8A=
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
Subject: [PATCH leds v2 40/50] leds: ns2: use devres API for getting GPIO descriptors
Date:   Fri, 18 Sep 2020 00:33:28 +0200
Message-Id: <20200917223338.14164-41-marek.behun@nic.cz>
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

This drivers leaks GPIO descriptors on driver removal. Use devres API
function devm_gpiod_get_from_of_node instead of gpiod_get_from_of_node
to avoid this.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 46d4f7e963c04..fa06ab40ee143 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -240,13 +240,13 @@ static int ns2_leds_parse_one(struct device *dev, struct device_node *np,
 	if (ret)
 		led->name = np->name;
 
-	led->cmd = gpiod_get_from_of_node(np, "cmd-gpio", 0, GPIOD_ASIS,
-					  led->name);
+	led->cmd = devm_gpiod_get_from_of_node(dev, np, "cmd-gpio", 0,
+					       GPIOD_ASIS, led->name);
 	if (IS_ERR(led->cmd))
 		return PTR_ERR(led->cmd);
 
-	led->slow = gpiod_get_from_of_node(np, "slow-gpio", 0, GPIOD_ASIS,
-					   led->name);
+	led->slow = devm_gpiod_get_from_of_node(dev, np, "slow-gpio", 0,
+						GPIOD_ASIS, led->name);
 	if (IS_ERR(led->slow))
 		return PTR_ERR(led->slow);
 
-- 
2.26.2

