From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: aat1290: add 'static' modifier to init_mm_current_scale
Date: Fri, 04 Sep 2015 13:54:40 +0200
Message-ID: <1441367680-29120-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53314 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296AbbIDLyx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Sep 2015 07:54:53 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NU500VO2ID8BU70@mailout2.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 04 Sep 2015 20:54:52 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>

Function init_mm_current_scale is used only locally. Make it static then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-aat1290.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 8ceb471..ac77d36 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -331,7 +331,7 @@ static void aat1290_led_validate_mm_current(struct aat1290_led *led,
 	cfg->max_brightness = b + 1;
 }
 
-int init_mm_current_scale(struct aat1290_led *led,
+static int init_mm_current_scale(struct aat1290_led *led,
 			struct aat1290_led_config_data *cfg)
 {
 	int max_mm_current_percent[] = { 20, 22, 25, 28, 32, 36, 40, 45, 50, 56,
-- 
1.7.9.5
