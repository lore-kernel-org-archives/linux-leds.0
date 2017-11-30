From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Wed, 29 Nov 2017 19:05:43 -0800
Message-ID: <20171130030543.1071-1-bjorn.andersson@linaro.org>
References: <20171130113516.42c8bde2@canb.auug.org.au>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:41481 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753356AbdK3DFt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Nov 2017 22:05:49 -0500
Received: by mail-pl0-f65.google.com with SMTP id g2so3388025pli.8
        for <linux-leds@vger.kernel.org>; Wed, 29 Nov 2017 19:05:49 -0800 (PST)
In-Reply-To: <20171130113516.42c8bde2@canb.auug.org.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>

The pointer returned by of_device_get_match_data() doesn't have the same
size as u32 on 64-bit architectures, causing issues when compile testing
the driver on such platform. Make ledtype unsigned long instead, to
solve this problem.

Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/leds/leds-pm8058.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index a52674327857..cc2afe81720d 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -29,7 +29,7 @@
 struct pm8058_led {
 	struct regmap *map;
 	u32 reg;
-	u32 ledtype;
+	unsigned long ledtype;
 	struct led_classdev cdev;
 };
 
@@ -106,7 +106,7 @@ static int pm8058_led_probe(struct platform_device *pdev)
 	if (!led)
 		return -ENOMEM;
 
-	led->ledtype = (u32)of_device_get_match_data(&pdev->dev);
+	led->ledtype = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	map = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!map) {
-- 
2.15.0
