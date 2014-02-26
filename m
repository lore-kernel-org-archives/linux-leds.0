From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 3/5] leds: lp5562: remove unnecessary parentheses
Date: Wed, 26 Feb 2014 14:11:41 +0900
Message-ID: <000d01cf32b1$3c15de20$b4419a60$%han@samsung.com>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36679 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752646AbaBZFLm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2014 00:11:42 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N1L006EC7RH0W80@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 26 Feb 2014 14:11:41 +0900 (KST)
In-reply-to: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Content-language: ko
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: 'Bryan Wu' <cooloney@gmail.com>
Cc: linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jingoo Han' <jg1.han@samsung.com>, 'Kim Milo' <Milo.Kim@ti.com>

Remove unnecessary parentheses in order to fix the following
checkpatch error.

  ERROR: return is not a function, parentheses are not required

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/leds/leds-lp5562.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 315d3ca..ca85724 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -346,9 +346,9 @@ static void lp5562_write_program_memory(struct lp55xx_chip *chip,
 /* check the size of program count */
 static inline bool _is_pc_overflow(struct lp55xx_predef_pattern *ptn)
 {
-	return (ptn->size_r >= LP5562_PROGRAM_LENGTH ||
-		ptn->size_g >= LP5562_PROGRAM_LENGTH ||
-		ptn->size_b >= LP5562_PROGRAM_LENGTH);
+	return ptn->size_r >= LP5562_PROGRAM_LENGTH ||
+	       ptn->size_g >= LP5562_PROGRAM_LENGTH ||
+	       ptn->size_b >= LP5562_PROGRAM_LENGTH;
 }
 
 static int lp5562_run_predef_led_pattern(struct lp55xx_chip *chip, int mode)
-- 
1.7.10.4
