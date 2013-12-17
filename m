From: Ben Gamari <bgamari.foss@gmail.com>
Subject: [PATCH] leds/leds-pwm: Display error code on request_pwm failure
Date: Mon, 16 Dec 2013 19:08:52 -0500
Message-ID: <1387238932-18982-1-git-send-email-bgamari.foss@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qa0-f43.google.com ([209.85.216.43]:41811 "EHLO
	mail-qa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901Ab3LQAI5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2013 19:08:57 -0500
Received: by mail-qa0-f43.google.com with SMTP id ii20so2081403qab.16
        for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2013 16:08:56 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Ben Gamari <bgamari.foss@gmail.com>

This can be useful in debugging devicetrees.

Signed-off-by: Ben Gamari <bgamari.foss@gmail.com>
---
 drivers/leds/leds-pwm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index b31d8e9..707a82a 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -165,8 +165,8 @@ static int led_pwm_probe(struct platform_device *pdev)
 			if (IS_ERR(led_dat->pwm)) {
 				ret = PTR_ERR(led_dat->pwm);
 				dev_err(&pdev->dev,
-					"unable to request PWM for %s\n",
-					cur_led->name);
+					"unable to request PWM for %s: error=%d\n",
+					cur_led->name, ret);
 				goto err;
 			}
 
-- 
1.8.3.2
