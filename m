From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 1/2] leds: leds-ss4200: remove unnecessary __initdata marker
Date: Fri, 28 Feb 2014 16:25:07 +0900
Message-ID: <000c01cf3456$34b8ecc0$9e2ac640$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33689 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750993AbaB1HZJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2014 02:25:09 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N1P00EJH39VNV30@mailout4.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 28 Feb 2014 16:25:08 +0900 (KST)
Content-language: ko
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: 'Bryan Wu' <cooloney@gmail.com>
Cc: linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jingoo Han' <jg1.han@samsung.com>, 'Dave Hansen' <dave@linux.vnet.ibm.com>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>

Remove unnecessary __initdata marker, because it is not right
for a module parameter. It may make the kernel oops problem.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/leds/leds-ss4200.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 2bdf642..2eb3ef6 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -78,7 +78,7 @@ static int __init ss4200_led_dmi_callback(const struct dmi_system_id *id)
 	return 1;
 }
 
-static bool __initdata nodetect;
+static bool nodetect;
 module_param_named(nodetect, nodetect, bool, 0);
 MODULE_PARM_DESC(nodetect, "Skip DMI-based hardware detection");
 
-- 
1.7.10.4
