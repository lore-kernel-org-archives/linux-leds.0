Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11902C4361B
	for <linux-leds@archiver.kernel.org>; Wed, 16 Dec 2020 13:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA06C2339E
	for <linux-leds@archiver.kernel.org>; Wed, 16 Dec 2020 13:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgLPNRQ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 16 Dec 2020 08:17:16 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9216 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgLPNRQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Dec 2020 08:17:16 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cwwbz1yDZzkqJg;
        Wed, 16 Dec 2020 21:15:43 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:16:21 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] leds: leds-lm3533: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:16:53 +0800
Message-ID: <20201216131653.14827-1-zhengyongjun3@huawei.com>
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
 drivers/leds/leds-lm3533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index b3edee703193..9dd205870525 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -679,7 +679,7 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->cdev.brightness_get = lm3533_led_get;
 	led->cdev.blink_set = lm3533_led_blink_set;
 	led->cdev.brightness = LED_OFF;
-	led->cdev.groups = lm3533_led_attribute_groups,
+	led->cdev.groups = lm3533_led_attribute_groups;
 	led->id = pdev->id;
 
 	mutex_init(&led->mutex);
-- 
2.22.0

