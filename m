Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E42C433B4
	for <linux-leds@archiver.kernel.org>; Wed, 12 May 2021 06:32:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47049617C9
	for <linux-leds@archiver.kernel.org>; Wed, 12 May 2021 06:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhELGdg (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 12 May 2021 02:33:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3726 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhELGdf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 May 2021 02:33:35 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fg4cw6GYkzmgKX;
        Wed, 12 May 2021 14:29:04 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 14:32:16 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <kabel@kernel.org>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] leds: turris-omnia: add missing MODULE_DEVICE_TABLE
Date:   Wed, 12 May 2021 14:49:18 +0800
Message-ID: <1620802158-19377-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/leds/leds-turris-omnia.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 2f9a289..1adfed1 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -274,6 +274,7 @@ static const struct i2c_device_id omnia_id[] = {
 	{ "omnia", 0 },
 	{ }
 };
+MODULE_DEVICE_TABLE(i2c, omnia_id);
 
 static struct i2c_driver omnia_leds_driver = {
 	.probe		= omnia_leds_probe,
-- 
2.6.2

