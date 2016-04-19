From: Martin Dummer <martin.dummer@gmx.net>
Subject: [PATCH v2] drivers/leds/leds-ss4200.c: add DMI data for FSC SCALEO Home Server
Date: Tue, 19 Apr 2016 07:51:48 +0200
Message-ID: <1461045108-3125-1-git-send-email-martin.dummer@gmx.net>
References: <1460891675-6994-1-git-send-email-martin.dummer@gmx.net>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:58809 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751770AbcDSFye (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 19 Apr 2016 01:54:34 -0400
In-Reply-To: <1460891675-6994-1-git-send-email-martin.dummer@gmx.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com
Cc: Martin Dummer <martin.dummer@gmx.net>, rpurdie@rpsys.net, linux-leds@vger.kernel.org

The Intel NAS SS4200 was also sold by Fujitsu Siemens (FSC) under
the name "SCALEO Home Server". The hardware is equivalent.

This patch adds the DMI data of this rebranded device.

Signed-off-by: Martin Dummer <martin.dummer@gmx.net>
---
 drivers/leds/leds-ss4200.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 046cb70..732eb86 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -101,6 +101,19 @@ static struct dmi_system_id nas_led_whitelist[] __initdata = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "1.00.00")
 		}
 	},
+	{
+		/*
+		 * FUJITSU SIEMENS SCALEO Home Server/SS4200-E
+		 * BIOS V090L 12/19/2007
+		 */
+		.callback = ss4200_led_dmi_callback,
+		.ident = "Fujitsu Siemens SCALEO Home Server",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SCALEO Home Server"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "1.00.00")
+		}
+	},
 	{}
 };
 
-- 
2.7.3
