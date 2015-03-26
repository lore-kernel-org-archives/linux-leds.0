From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v2] leds: start numerating duplicated devices from 2
Date: Thu, 26 Mar 2015 15:59:49 +0100
Message-ID: <1427381989-17365-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43924 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752934AbbCZPAK (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 11:00:10 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NLT004RMR08K750@mailout2.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 27 Mar 2015 00:00:09 +0900 (KST)
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
 drivers/leds/led-class.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4ca37b8..07fcb35 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -222,14 +222,14 @@ static int match_name(struct device *dev, const void *data)
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
-	int i = 0;
+	int i = 1;
 
 	strncpy(name, init_name, len);
 
 	while (class_find_device(leds_class, NULL, name, match_name))
 		snprintf(name, len, "%s_%d", init_name, ++i);
 
-	return i;
+	return i > 1 ? i : 0;
 }
 
 /**
-- 
1.7.9.5
