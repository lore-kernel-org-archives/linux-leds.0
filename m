Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1733FC433FE
	for <linux-leds@archiver.kernel.org>; Wed,  9 Nov 2022 08:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiKII2F (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 9 Nov 2022 03:28:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiKII1y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Nov 2022 03:27:54 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4786B13D16;
        Wed,  9 Nov 2022 00:27:53 -0800 (PST)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N6dPW0SvtzHvk6;
        Wed,  9 Nov 2022 16:27:27 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 16:27:51 +0800
From:   Wang Yufen <wangyufen@huawei.com>
To:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <pavel@ucw.cz>, Wang Yufen <wangyufen@huawei.com>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 07/13] leds: lp8860: Fix devm vs. non-devm ordering
Date:   Wed, 9 Nov 2022 16:48:08 +0800
Message-ID: <1667983694-15040-8-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667983694-15040-1-git-send-email-wangyufen@huawei.com>
References: <1667983694-15040-1-git-send-email-wangyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When non-devm resources are allocated they mustn't be followed by devm
allocations, otherwise it will break the tear down ordering and might
lead to crashes or other bugs during ->remove() stage. Fix this by
wrapping mutex_destroy() call with devm_add_action_or_reset().

Fixes: a2169c9b762a ("leds: lp8860: Various fixes to align with LED framework")
Signed-off-by: Wang Yufen <wangyufen@huawei.com>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp8860.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index e2b36d3..ca73d91 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -375,6 +375,11 @@ static int lp8860_init(struct lp8860_led *led)
 	.cache_type = REGCACHE_NONE,
 };
 
+static void lp8860_mutex_destroy(void *lock)
+{
+	mutex_destroy(lock);
+}
+
 static int lp8860_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -408,6 +413,10 @@ static int lp8860_probe(struct i2c_client *client,
 	led->led_dev.brightness_set_blocking = lp8860_brightness_set;
 
 	mutex_init(&led->lock);
+	ret = devm_add_action_or_reset(&client->dev, lp8860_mutex_destroy,
+				       &led->lock);
+	if (ret)
+		return ret;
 
 	i2c_set_clientdata(client, led);
 
@@ -459,8 +468,6 @@ static void lp8860_remove(struct i2c_client *client)
 			dev_err(&led->client->dev,
 				"Failed to disable regulator\n");
 	}
-
-	mutex_destroy(&led->lock);
 }
 
 static const struct i2c_device_id lp8860_id[] = {
-- 
1.8.3.1

