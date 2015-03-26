From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: start numerating duplicated devices from 2
Date: Thu, 26 Mar 2015 15:03:10 +0100
Message-ID: <1427378590-24219-2-git-send-email-j.anaszewski@samsung.com>
References: <1427378590-24219-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40385 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752391AbbCZOD2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 10:03:28 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NLT002FAODRVD50@mailout2.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 26 Mar 2015 23:03:27 +0900 (KST)
In-reply-to: <1427378590-24219-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>

Duplicated devices are currently given numerical suffixes
starting from 1. Since duplication means that one instance
of a device already exists in the system, then it is more
intuitive for the next device to get the suffix "_2".

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>
---
 drivers/leds/led-class.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4ca37b8..d4973fd 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -222,7 +222,7 @@ static int match_name(struct device *dev, const void *data)
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
-	int i = 0;
+	int i = 1;
 
 	strncpy(name, init_name, len);
 
-- 
1.7.9.5
