Return-Path: <SRS0=zpnR=W2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCA6C3A59B
	for <linux-leds@archiver.kernel.org>; Fri, 30 Aug 2019 18:36:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9E4C23430
	for <linux-leds@archiver.kernel.org>; Fri, 30 Aug 2019 18:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="nHEwYYT1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbfH3Sgw (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 30 Aug 2019 14:36:52 -0400
Received: from gateway24.websitewelcome.com ([192.185.51.56]:29319 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727914AbfH3Sgw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Aug 2019 14:36:52 -0400
X-Greylist: delayed 1320 seconds by postgrey-1.27 at vger.kernel.org; Fri, 30 Aug 2019 14:36:51 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id CAC075DBF1
        for <linux-leds@vger.kernel.org>; Fri, 30 Aug 2019 13:14:50 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 3lQAiH8PBiQer3lQAiaH4R; Fri, 30 Aug 2019 13:14:50 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FvxkqczR+A1t/cFp9JibpXsNBR3Ts73/K/qlmM3yxeo=; b=nHEwYYT1ZkeN4QEQCXUjEiNKjH
        raYuW8hBKhZcskRrW+68HmzCeM+oYA8kDcPBggzJFy5/fMO2AwJJnDTdtQFdMY/ix7DcPiC6e6/12
        MNwlv+8WKVm5wRyrxhSGZgYYSB9aFZPm69MPqujl6HO9EUmRObfHmNQLO1d2bLjFmnzJ6QksnMn0d
        WiUBdhJdSEp67TbI19BbW80Nz8pVdJRVTfPcvyx3mg8A+7NgXS+v/rbrPqxa0XKqoaV+L4uP/ReSG
        mehAvDJrfUvmc0D/3wAoMiLTLVCpjOZaT1lC2LRWHlApcOAWaULHQBqu1wJFaGFJL1hlbJ0F27Ccq
        6A1lKYXw==;
Received: from [189.152.216.116] (port=37172 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1i3lQ9-001tMY-A8; Fri, 30 Aug 2019 13:14:49 -0500
Date:   Fri, 30 Aug 2019 13:14:48 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] leds: is31fl32xx: Use struct_size() helper
Message-ID: <20190830181448.GA24483@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.152.216.116
X-Source-L: No
X-Exim-ID: 1i3lQ9-001tMY-A8
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.152.216.116]:37172
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct is31fl32xx_priv {
	...
        struct is31fl32xx_led_data leds[0];
};

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following function:

static inline size_t sizeof_is31fl32xx_priv(int num_leds)
{
       return sizeof(struct is31fl32xx_priv) +
                     (sizeof(struct is31fl32xx_led_data) * num_leds);
}

with:

struct_size(priv, leds, count)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/leds/leds-is31fl32xx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 6fbab70dfb04..6f29b8943913 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -324,12 +324,6 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 	return 0;
 }
 
-static inline size_t sizeof_is31fl32xx_priv(int num_leds)
-{
-	return sizeof(struct is31fl32xx_priv) +
-		      (sizeof(struct is31fl32xx_led_data) * num_leds);
-}
-
 static int is31fl32xx_parse_child_dt(const struct device *dev,
 				     const struct device_node *child,
 				     struct is31fl32xx_led_data *led_data)
@@ -450,7 +444,7 @@ static int is31fl32xx_probe(struct i2c_client *client,
 	if (!count)
 		return -EINVAL;
 
-	priv = devm_kzalloc(dev, sizeof_is31fl32xx_priv(count),
+	priv = devm_kzalloc(dev, struct_size(priv, leds, count),
 			    GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.23.0

