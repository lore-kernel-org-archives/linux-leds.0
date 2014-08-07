From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 2/3] leds: make brightness type consistent across whole
 subsystem
Date: Thu, 07 Aug 2014 14:10:23 +0200
Message-ID: <1407413424-30087-3-git-send-email-j.anaszewski@samsung.com>
References: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16469 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754909AbaHGMKh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Aug 2014 08:10:37 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9X002YMR5N2D70@mailout4.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 07 Aug 2014 21:10:35 +0900 (KST)
In-reply-to: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

Documentations states that brightness units type is enum led_brightness
and this is the type used by the led API functions. Adjust the type
of brightness variables in the struct led_classdev accordingly.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 include/linux/leds.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index bc959c5..bc221d11 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -30,8 +30,8 @@ enum led_brightness {
 
 struct led_classdev {
 	const char		*name;
-	int			 brightness;
-	int			 max_brightness;
+	enum led_brightness	 brightness;
+	enum led_brightness	 max_brightness;
 	int			 flags;
 
 	/* Lower 16 bits reflect status */
-- 
1.7.9.5
