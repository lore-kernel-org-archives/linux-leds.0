Return-Path: <SRS0=i1Fh=EF=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D2FC4363A
	for <linux-leds@archiver.kernel.org>; Fri, 30 Oct 2020 02:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CEC620BED
	for <linux-leds@archiver.kernel.org>; Fri, 30 Oct 2020 02:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604025560;
	bh=7ApjWrbK+81tG2Jo9OLTPOnAWPvl1ezzu8+HgeLFjZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=EBHcKKooBVUu4gDqgvNbgD9NX2KUbi1+qhNtRHGNCHKwZG/4BbpWRopM8gyTqHpki
	 G5bKTKpZaxTbat9VUmZJACsh1DBGDESWh2BsKVPKba7i6IDsleSR3R5vBXBRFHAfjA
	 JlzO/iG3AhsS61C7YlNtzWL3mg7F7mE+L85G00T0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgJ3CjU (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 29 Oct 2020 22:39:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:38624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbgJ3CjT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 22:39:19 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D2872087D;
        Fri, 30 Oct 2020 02:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604025559;
        bh=7ApjWrbK+81tG2Jo9OLTPOnAWPvl1ezzu8+HgeLFjZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I0ery7OYRMBGifrzZgb+6JmSXsi2JLlCWREB++RQ39WGIYkQvZ4g2wb1IR4SyRcRE
         PoEm4CydFu6scr2z6bdHCrfat9n3ckTjelayiU7usLtmYKw8aM+kPunGo2Be+kUOmn
         07tYEnJ9SHyDWeRxP0YkRvxT3hAz4CbxEozZY9hQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 3/5] leds: turris-omnia: fix checkpatch warning
Date:   Fri, 30 Oct 2020 03:39:04 +0100
Message-Id: <20201030023906.24259-3-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201030023906.24259-1-kabel@kernel.org>
References: <20201030023906.24259-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use kstrtoul instead of sscanf to satisfy checkpatch.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 096ed7b81957..c0b4e1e0e945 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -174,10 +174,10 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct omnia_leds *leds = i2c_get_clientdata(client);
-	unsigned int brightness;
+	unsigned long brightness;
 	int ret;
 
-	if (sscanf(buf, "%u", &brightness) != 1)
+	if (kstrtoul(buf, 10, &brightness))
 		return -EINVAL;
 
 	if (brightness > 100)
-- 
2.26.2

