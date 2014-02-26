From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 5/5] leds: blinkm: remove unnecessary spaces
Date: Wed, 26 Feb 2014 14:16:11 +0900
Message-ID: <000f01cf32b1$dd460ef0$97d22cd0$%han@samsung.com>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37637 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750745AbaBZFQO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2014 00:16:14 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N1L008Z27Z15460@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 26 Feb 2014 14:16:13 +0900 (KST)
In-reply-to: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Content-language: ko
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: 'Bryan Wu' <cooloney@gmail.com>
Cc: linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jingoo Han' <jg1.han@samsung.com>, =?ISO-8859-1?Q?'Jan-Simon_M=F6ller'?= <dl9pf@gmx.de>

Remove unnecessary space in order to fix the following
checkpatch issues.

  WARNING: space prohibited before semicolon

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/leds/leds-blinkm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 0c50860..d0452b0 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -443,7 +443,7 @@ static void led_work(struct work_struct *work)
 {
 	int ret;
 	struct blinkm_led *led;
-	struct blinkm_data *data ;
+	struct blinkm_data *data;
 	struct blinkm_work *blm_work = work_to_blmwork(work);
 
 	led = blm_work->blinkm_led;
-- 
1.7.10.4
