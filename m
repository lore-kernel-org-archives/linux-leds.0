Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBA4C19F29
	for <linux-leds@archiver.kernel.org>; Sat,  6 Aug 2022 05:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239213AbiHFFih (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 6 Aug 2022 01:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbiHFFig (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Aug 2022 01:38:36 -0400
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3E515A15
        for <linux-leds@vger.kernel.org>; Fri,  5 Aug 2022 22:38:35 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id KCW8oBsZYPMmaKCW8o8cFN; Sat, 06 Aug 2022 07:38:33 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 06 Aug 2022 07:38:33 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-leds@vger.kernel.org
Subject: [PATCH] leds: pwm-multicolor: Simplify some error message
Date:   Sat,  6 Aug 2022 07:38:30 +0200
Message-Id: <d6cdd8ce642be2a2737d6c1ac16653f2e79831d8.1659764274.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

dev_err_probe() already prints the error code in a human readable way, so
there is no need to duplicate it as a numerical value at the end of the
message.

Fixes: 9fa2762110dd ("usb: common: usb-conn-gpio: use dev_err_probe() to print log")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is also likely that there should be "goto release_mcnode;" instead of a
direct return.
I've not been able to fully track it down, so I leave it as-is.
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index da9d2218ae18..454afa00735c 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -158,8 +158,8 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 	ret = led_pwm_mc_set(cdev, cdev->brightness);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
-				     "failed to set led PWM value for %s: %d",
-				     cdev->name, ret);
+				     "failed to set led PWM value for %s",
+				     cdev->name);
 
 	platform_set_drvdata(pdev, priv);
 	return 0;
-- 
2.34.1

