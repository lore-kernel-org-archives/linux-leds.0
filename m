Return-Path: <SRS0=BIkm=DD=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FD1C2D0A8
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 16:27:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21A9C21527
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 16:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729871AbgIZQ15 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 26 Sep 2020 12:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZQ15 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 12:27:57 -0400
Received: from agrajag.zerfleddert.de (agrajag.zerfleddert.de [IPv6:2a01:4f8:bc:1de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851EDC0613CE;
        Sat, 26 Sep 2020 09:27:57 -0700 (PDT)
Received: by agrajag.zerfleddert.de (Postfix, from userid 1000)
        id 1B0415B2053C; Sat, 26 Sep 2020 18:27:56 +0200 (CEST)
Date:   Sat, 26 Sep 2020 18:27:56 +0200
From:   Tobias Jordan <kernel@cdqe.de>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH v3] leds: tlc591xx: fix leak of device node iterator
Message-ID: <20200926162755.GA26532@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In one of the error paths of the for_each_child_of_node loop in
tlc591xx_probe, add missing call to of_node_put.

Fixes: 1ab4531ad132 ("leds: tlc591xx: simplify driver by using the managed led API")
Signed-off-by: Tobias Jordan <kernel@cdqe.de>
Reviewed-by: Marek Behún <kabel@kernel.org>

---
v3: removed linebreak from Fixes: tag in commit message
v2: rebased to Pavel's for-next branch

 drivers/leds/leds-tlc591xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 0929f1275814..a8cc49752cd5 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -214,6 +214,7 @@ tlc591xx_probe(struct i2c_client *client,
 		err = devm_led_classdev_register_ext(dev, &led->ldev,
 						     &init_data);
 		if (err < 0) {
+			of_node_put(child);
 			if (err != -EPROBE_DEFER)
 				dev_err(dev, "couldn't register LED %s\n",
 					led->ldev.name);
-- 
2.20.1

