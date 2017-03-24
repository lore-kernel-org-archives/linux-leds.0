From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv3 1/2] mfd: cpcap: Add missing include dependencies
Date: Fri, 24 Mar 2017 09:47:31 +0100
Message-ID: <20170324084732.31255-1-sre@kernel.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750952AbdCXIrk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 24 Mar 2017 04:47:40 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes compilation for files, that try to include the
cpcap header in alphabetically sorted #include lists.

Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
Changes since PATCHv2:
 - Add Acked-by from Tony & Pavel
---
 include/linux/mfd/motorola-cpcap.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
index 793aa695faa0..aefc49cb7ba9 100644
--- a/include/linux/mfd/motorola-cpcap.h
+++ b/include/linux/mfd/motorola-cpcap.h
@@ -14,6 +14,9 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/device.h>
+#include <linux/regmap.h>
+
 #define CPCAP_VENDOR_ST		0
 #define CPCAP_VENDOR_TI		1
 
-- 
2.11.0
