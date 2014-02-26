From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 1/5] leds: leds-ss4200: fix incorrect placement of __initdata
 marker
Date: Wed, 26 Feb 2014 14:09:25 +0900
Message-ID: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57131 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751635AbaBZFJ1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2014 00:09:27 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N1L000JC7NQ2Q10@mailout2.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 26 Feb 2014 14:09:26 +0900 (KST)
Content-language: ko
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: 'Bryan Wu' <cooloney@gmail.com>
Cc: linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jingoo Han' <jg1.han@samsung.com>, 'Dave Hansen' <dave@linux.vnet.ibm.com>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>

The __initdata marker can be virtually anywhere on the line,
EXCEPT right after "struct". The preferred location is before
the "=" sign if there is one, or before the trailing ";"
otherwise. It also fixes the following chechpatch warning.

  WARNING: __initdata should be placed after nodetect

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/leds/leds-ss4200.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 5b8f938..3faf550 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -78,7 +78,7 @@ static int __init ss4200_led_dmi_callback(const struct dmi_system_id *id)
 	return 1;
 }
 
-static bool __initdata nodetect;
+static bool nodetect __initdata;
 module_param_named(nodetect, nodetect, bool, 0);
 MODULE_PARM_DESC(nodetect, "Skip DMI-based hardware detection");
 
-- 
1.7.10.4
