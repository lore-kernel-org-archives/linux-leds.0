Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E0DC4361B
	for <linux-leds@archiver.kernel.org>; Mon, 14 Dec 2020 13:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3F96229EF
	for <linux-leds@archiver.kernel.org>; Mon, 14 Dec 2020 13:46:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438047AbgLNNqJ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 14 Dec 2020 08:46:09 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9528 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438193AbgLNNqF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Dec 2020 08:46:05 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CvjLR1PfYzhtJG;
        Mon, 14 Dec 2020 21:44:47 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 21:45:14 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] leds: leds-ariel: convert comma to semicolon
Date:   Mon, 14 Dec 2020 21:45:45 +0800
Message-ID: <20201214134545.4884-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/leds/leds-ariel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
index bb68ba23a7d4..49e1bddaa15e 100644
--- a/drivers/leds/leds-ariel.c
+++ b/drivers/leds/leds-ariel.c
@@ -96,14 +96,14 @@ static int ariel_led_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	leds[0].ec_index = EC_BLUE_LED;
-	leds[0].led_cdev.name = "blue:power",
+	leds[0].led_cdev.name = "blue:power";
 	leds[0].led_cdev.default_trigger = "default-on";
 
 	leds[1].ec_index = EC_AMBER_LED;
-	leds[1].led_cdev.name = "amber:status",
+	leds[1].led_cdev.name = "amber:status";
 
 	leds[2].ec_index = EC_GREEN_LED;
-	leds[2].led_cdev.name = "green:status",
+	leds[2].led_cdev.name = "green:status";
 	leds[2].led_cdev.default_trigger = "default-on";
 
 	for (i = 0; i < NLEDS; i++) {
-- 
2.22.0

