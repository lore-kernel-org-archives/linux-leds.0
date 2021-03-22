Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACBAC433C1
	for <linux-leds@archiver.kernel.org>; Mon, 22 Mar 2021 02:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DAF561930
	for <linux-leds@archiver.kernel.org>; Mon, 22 Mar 2021 02:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCVChF (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 21 Mar 2021 22:37:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14118 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhCVCgn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Mar 2021 22:36:43 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F3dr40mDTz19GmC
        for <linux-leds@vger.kernel.org>; Mon, 22 Mar 2021 10:34:44 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 10:36:39 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>
Subject: [PATCH] leds: trigger: pattern: Switch to using the new API kobj_to_dev()
Date:   Mon, 22 Mar 2021 10:37:16 +0800
Message-ID: <1616380636-7613-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch to using the new API kobj_to_dev() to fix the below warnning:
./drivers/leds/trigger/ledtrig-pattern.c:336:60-61: WARNING opportunity
for kobj_to_dev()

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/leds/trigger/ledtrig-pattern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 4d138d5..43a265d 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -333,7 +333,7 @@ static DEVICE_ATTR_RW(hw_pattern);
 static umode_t pattern_trig_attrs_mode(struct kobject *kobj,
 				       struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 
 	if (attr == &dev_attr_repeat.attr || attr == &dev_attr_pattern.attr)
-- 
2.7.4

