From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] leds: pm8058: Silence pointer to integer size warning
Date: Thu, 30 Nov 2017 21:16:56 -0800
Message-ID: <20171201051656.31694-1-bjorn.andersson@linaro.org>
References: <20171130113516.42c8bde2@canb.auug.org.au>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:39653 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbdLAFRC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Dec 2017 00:17:02 -0500
Received: by mail-pl0-f65.google.com with SMTP id bi12so5656438plb.6
        for <linux-leds@vger.kernel.org>; Thu, 30 Nov 2017 21:17:02 -0800 (PST)
In-Reply-To: <20171130113516.42c8bde2@canb.auug.org.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>

The pointer returned by of_device_get_match_data() doesn't have the same
size as u32 on 64-bit architectures, causing a compile warning when
compile-testing the driver on such platform.

Cast the return value of of_device_get_match_data() to unsigned long and
then to u32 to silence this warning.

Cc: Linus Walleij <linus.walleij@linaro.org>
Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/leds/leds-pm8058.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index a52674327857..8988ba3b2d65 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -106,7 +106,7 @@ static int pm8058_led_probe(struct platform_device *pdev)
 	if (!led)
 		return -ENOMEM;
 
-	led->ledtype = (u32)of_device_get_match_data(&pdev->dev);
+	led->ledtype = (u32)(unsigned long)of_device_get_match_data(&pdev->dev);
 
 	map = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!map) {
-- 
2.15.0
