From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] leds: dac124s085: Remove redundant spi_set_drvdata
Date: Fri, 20 Sep 2013 09:57:59 +0530
Message-ID: <1379651279-24338-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:42865 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752166Ab3ITE1t (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2013 00:27:49 -0400
Received: by mail-pa0-f49.google.com with SMTP id ld10so236294pab.36
        for <linux-leds@vger.kernel.org>; Thu, 19 Sep 2013 21:27:48 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, sachin.kamat@linaro.org, Guennadi Liakhovetski <lg@denx.de>

Driver core sets driver data to NULL upon failure or remove.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Guennadi Liakhovetski <lg@denx.de>
---
 drivers/leds/leds-dac124s085.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-dac124s085.c b/drivers/leds/leds-dac124s085.c
index 1f9d8e6..db3ba8b 100644
--- a/drivers/leds/leds-dac124s085.c
+++ b/drivers/leds/leds-dac124s085.c
@@ -101,7 +101,6 @@ eledcr:
 	while (i--)
 		led_classdev_unregister(&dac->leds[i].ldev);
 
-	spi_set_drvdata(spi, NULL);
 	return ret;
 }
 
@@ -115,8 +114,6 @@ static int dac124s085_remove(struct spi_device *spi)
 		cancel_work_sync(&dac->leds[i].work);
 	}
 
-	spi_set_drvdata(spi, NULL);
-
 	return 0;
 }
 
-- 
1.7.9.5

