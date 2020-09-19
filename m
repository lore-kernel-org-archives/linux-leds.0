Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A36C43464
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 22:15:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2023920665
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 22:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="YsI9W0fo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgISWPz (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 18:15:55 -0400
Received: from mail.nic.cz ([217.31.204.67]:50116 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgISWPy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 18:15:54 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id A2CDB140A95;
        Sun, 20 Sep 2020 00:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553751; bh=ciK44SgWm/0erGft2af72dTBuEF0hx6Ckl3+Gl9aV+g=;
        h=From:To:Date;
        b=YsI9W0foU8Z88sij9Ib/K+YioDPTfl+ZxmB1QrVh4Qr5J/iuOcM6e3UepzLKb/E5/
         OVjw2SoCsdHopHqQkBlHlTYDwcynth/w1XtVpaH5a7kVYDf61jfwiZ/B0bsCt+4QLR
         bEw5VyUAvNMYEOHWJn8H8v9xTcj2J/fLdyYHn6ZE=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 11/13] leds: tca6507: fail on reg value conflict
Date:   Sun, 20 Sep 2020 00:15:46 +0200
Message-Id: <20200919221548.29984-12-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fail if two child nodes have the same `reg` property value.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 77a36e4da2508..e32e628f2e460 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -643,7 +643,7 @@ static int tca6507_register_gpios(struct device *dev,
 static int tca6507_register_leds_and_gpios(struct device *dev,
 					   struct tca6507_chip *tca)
 {
-	unsigned long gpio_bitmap = 0;
+	unsigned long gpio_bitmap = 0, led_bitmap = 0;
 	struct fwnode_handle *child;
 	int count, ret;
 
@@ -662,12 +662,18 @@ static int tca6507_register_leds_and_gpios(struct device *dev,
 			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
 				child);
 			goto err;
+		} else if ((gpio_bitmap | led_bitmap) & BIT(reg)) {
+			dev_err(dev, "LED channel already used for node %pfw\n",
+				child);
+			goto err;
 		}
 
 		if (fwnode_property_match_string(child, "compatible",
 						 "gpio") >= 0) {
 			gpio_bitmap |= BIT(reg);
 			continue;
+		} else {
+			led_bitmap |= BIT(reg);
 		}
 
 		led = &tca->leds[reg];
-- 
2.26.2

