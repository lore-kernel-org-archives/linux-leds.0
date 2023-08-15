Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B391C41513
	for <linux-leds@archiver.kernel.org>; Tue, 15 Aug 2023 08:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235520AbjHOIAc (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 15 Aug 2023 04:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235519AbjHOIAI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2023 04:00:08 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D2E10D8
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2023 01:00:05 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RQ3Yb2xtYzrS2f;
        Tue, 15 Aug 2023 15:58:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 15 Aug
 2023 16:00:02 +0800
From:   Li Zetao <lizetao1@huawei.com>
To:     <pavel@ucw.cz>, <lee@kernel.org>, <andrew@lunn.ch>,
        <ansuelsmth@gmail.com>, <davem@davemloft.net>, <kuba@kernel.org>,
        <dan.carpenter@linaro.org>
CC:     <lizetao1@huawei.com>, <yang.lee@linux.alibaba.com>,
        <linux-leds@vger.kernel.org>
Subject: [PATCH -next 1/2] leds: trigger: netdev: Use module_led_trigger macro to simplify the code
Date:   Tue, 15 Aug 2023 15:59:43 +0800
Message-ID: <20230815075944.1089298-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815075944.1089298-1-lizetao1@huawei.com>
References: <20230815075944.1089298-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use the module_led_trigger macro to simplify the code, which is the
same as declaring with module_init() and module_exit().

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index c9bc5a91ec83..a2835f9fed9d 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -605,18 +605,7 @@ static struct led_trigger netdev_led_trigger = {
 	.groups = netdev_trig_groups,
 };
 
-static int __init netdev_trig_init(void)
-{
-	return led_trigger_register(&netdev_led_trigger);
-}
-
-static void __exit netdev_trig_exit(void)
-{
-	led_trigger_unregister(&netdev_led_trigger);
-}
-
-module_init(netdev_trig_init);
-module_exit(netdev_trig_exit);
+module_led_trigger(netdev_led_trigger);
 
 MODULE_AUTHOR("Ben Whitten <ben.whitten@gmail.com>");
 MODULE_AUTHOR("Oliver Jowett <oliver@opencloud.com>");
-- 
2.34.1

