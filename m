Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBC2C77B7A
	for <linux-leds@archiver.kernel.org>; Wed, 31 May 2023 02:40:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjEaCkh (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 30 May 2023 22:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbjEaCkg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 May 2023 22:40:36 -0400
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835FB113;
        Tue, 30 May 2023 19:40:34 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VjvYWmU_1685500821;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VjvYWmU_1685500821)
          by smtp.aliyun-inc.com;
          Wed, 31 May 2023 10:40:31 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     pavel@ucw.cz
Cc:     lee@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] leds: cht-wcove: remove unneeded semicolon
Date:   Wed, 31 May 2023 10:40:20 +0800
Message-Id: <20230531024020.106641-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

No functional modification involved.

./drivers/leds/leds-cht-wcove.c:193:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5343
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/leds/leds-cht-wcove.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 0cfebee98910..e35a25990048 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -190,7 +190,7 @@ static unsigned long cht_wc_leds_get_period(int ctrl)
 		return 1000;
 	case CHT_WC_LED_F_2_HZ:
 		return 1000 / 2;
-	};
+	}
 
 	return 0;
 }
-- 
2.20.1.7.g153144c

