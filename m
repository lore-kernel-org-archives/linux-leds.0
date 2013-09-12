From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] leds: blinkm: Remove redundant break
Date: Thu, 12 Sep 2013 09:50:29 +0530
Message-ID: <1378959629-19523-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:42218 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752592Ab3ILEif (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2013 00:38:35 -0400
Received: by mail-pd0-f175.google.com with SMTP id q10so10095400pdj.20
        for <linux-leds@vger.kernel.org>; Wed, 11 Sep 2013 21:38:34 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, jansimon.moeller@gmx.de, sachin.kamat@linaro.org

'break' after return is redundant. Remove it.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/leds/leds-blinkm.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index a502678..66d0a57 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -161,13 +161,10 @@ static ssize_t show_color_common(struct device *dev, char *buf, int color)
 	switch (color) {
 	case RED:
 		return scnprintf(buf, PAGE_SIZE, "%02X\n", data->red);
-		break;
 	case GREEN:
 		return scnprintf(buf, PAGE_SIZE, "%02X\n", data->green);
-		break;
 	case BLUE:
 		return scnprintf(buf, PAGE_SIZE, "%02X\n", data->blue);
-		break;
 	default:
 		return -EINVAL;
 	}
-- 
1.7.9.5

