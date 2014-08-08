From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: lp3944: fix sparse warning
Date: Fri, 08 Aug 2014 09:09:44 +0200
Message-ID: <1407481784-24057-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52910 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756435AbaHHHJx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 8 Aug 2014 03:09:53 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9Z004K97WFA2D0@mailout4.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 08 Aug 2014 16:09:51 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

Fix sparse warning appeared after changing brightness
type in the leds.h from int to enum led_brightness.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/leds/leds-lp3944.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 8e1abdc..53144fb 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -335,7 +335,8 @@ static int lp3944_configure(struct i2c_client *client,
 			}
 
 			/* to expose the default value to userspace */
-			led->ldev.brightness = led->status;
+			led->ldev.brightness =
+					(enum led_brightness) led->status;
 
 			/* Set the default led status */
 			err = lp3944_led_set(led, led->status);
-- 
1.7.9.5
