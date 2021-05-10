Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A849C43611
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EC136144F
	for <linux-leds@archiver.kernel.org>; Mon, 10 May 2021 09:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhEJJwN (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 10 May 2021 05:52:13 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:17019 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230478AbhEJJwL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:11 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 3a2fe202-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:51:01 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 03/28] leds: el15203000: Give better margin for usleep_range()
Date:   Mon, 10 May 2021 12:50:20 +0300
Message-Id: <20210510095045.3299382-4-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

1 microsecond with 20 millisecond parameter is too low margin for
usleep_range(). Give 100 to make scheduler happier.

While at it, fix indentation in cases where EL_FW_DELAY_USEC is in use.
In the loop, move it to the end to avoid a conditional.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-el15203000.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index 6ca47f2a2004..912451db05e6 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -95,27 +95,22 @@ static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
 
 	/* to avoid SPI mistiming with firmware we should wait some time */
 	if (time_after(led->priv->delay, jiffies)) {
-		dev_dbg(led->priv->dev, "Wait %luus to sync",
-			EL_FW_DELAY_USEC);
+		dev_dbg(led->priv->dev, "Wait %luus to sync", EL_FW_DELAY_USEC);
 
-		usleep_range(EL_FW_DELAY_USEC,
-			     EL_FW_DELAY_USEC + 1);
+		usleep_range(EL_FW_DELAY_USEC, EL_FW_DELAY_USEC + 100);
 	}
 
 	cmd[0] = led->reg;
 	cmd[1] = brightness;
 
 	for (i = 0; i < ARRAY_SIZE(cmd); i++) {
-		if (i)
-			usleep_range(EL_FW_DELAY_USEC,
-				     EL_FW_DELAY_USEC + 1);
-
 		ret = spi_write(led->priv->spi, &cmd[i], sizeof(cmd[i]));
 		if (ret) {
 			dev_err(led->priv->dev,
 				"spi_write() error %d", ret);
 			break;
 		}
+		usleep_range(EL_FW_DELAY_USEC, EL_FW_DELAY_USEC + 100);
 	}
 
 	led->priv->delay = jiffies + usecs_to_jiffies(EL_FW_DELAY_USEC);
@@ -313,8 +308,7 @@ static int el15203000_probe(struct spi_device *spi)
 	priv->count	= count;
 	priv->dev	= &spi->dev;
 	priv->spi	= spi;
-	priv->delay	= jiffies -
-			  usecs_to_jiffies(EL_FW_DELAY_USEC);
+	priv->delay	= jiffies - usecs_to_jiffies(EL_FW_DELAY_USEC);
 
 	spi_set_drvdata(spi, priv);
 
-- 
2.31.1

