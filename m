From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] led: flash: Remove checking for state < 1 in
 flash_strobe_store()
Date: Wed, 18 Nov 2015 16:33:17 +0100
Message-ID: <1447860797-18969-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38447 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755301AbbKRPd0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2015 10:33:26 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY000MI3OJOH8C0@mailout4.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 19 Nov 2015 00:33:24 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: dcb314@hotmail.com, Jacek Anaszewski <j.anaszewski@samsung.com>

Strobe state variable is declared as unsigned long, remove
the check for values less than zero then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Reported-by: David Binderman <dcb314@hotmail.com>
---
 drivers/leds/led-class-flash.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index f53783b..cf39827 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -108,7 +108,7 @@ static ssize_t flash_strobe_store(struct device *dev,
 	if (ret)
 		goto unlock;
 
-	if (state < 0 || state > 1) {
+	if (state > 1) {
 		ret = -EINVAL;
 		goto unlock;
 	}
-- 
1.7.9.5
