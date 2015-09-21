From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 30/38] leds: flash: remove invalid check
Date: Mon, 21 Sep 2015 15:34:02 +0200
Message-ID: <1442842450-29769-31-git-send-email-a.hajda@samsung.com>
References: <1442842450-29769-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40457 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932477AbbIUNg2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2015 09:36:28 -0400
In-reply-to: <1442842450-29769-1-git-send-email-a.hajda@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Unsigned cannot be lesser than zero.

The problem has been detected using proposed semantic patch
scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2038576

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/leds/led-class-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 3b25734..c209077 100644
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
1.9.1
