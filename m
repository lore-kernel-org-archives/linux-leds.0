From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] leds: pwm: Remove redundant of_match_ptr
Date: Sat, 28 Sep 2013 17:08:31 +0530
Message-ID: <1380368311-27529-2-git-send-email-sachin.kamat@linaro.org>
References: <1380368311-27529-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:38397 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753722Ab3I1Lil (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 28 Sep 2013 07:38:41 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so3695664pde.9
        for <linux-leds@vger.kernel.org>; Sat, 28 Sep 2013 04:38:41 -0700 (PDT)
In-Reply-To: <1380368311-27529-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, sachin.kamat@linaro.org

The data structure of_match_ptr() protects is always compiled in.
Hence of_match_ptr() is not needed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/leds/leds-pwm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index bb6f948..2848171 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -232,7 +232,7 @@ static struct platform_driver led_pwm_driver = {
 	.driver		= {
 		.name	= "leds_pwm",
 		.owner	= THIS_MODULE,
-		.of_match_table = of_match_ptr(of_pwm_leds_match),
+		.of_match_table = of_pwm_leds_match,
 	},
 };
 
-- 
1.7.9.5

