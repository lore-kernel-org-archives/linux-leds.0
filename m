From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv2 1/2] mfd: cpcap: Add missing include dependencies
Date: Wed, 22 Mar 2017 01:09:11 +0100
Message-ID: <20170322000912.24210-1-sre@kernel.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933087AbdCVAPz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 21 Mar 2017 20:15:55 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes compilation for files, that try to include the
cpcap header in alphabetically sorted #include lists.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
This patch is new, since PATCHv1 did not order the includes
in the led driver alphabetically.
---
 include/linux/mfd/motorola-cpcap.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
index 7629e0d24d26..b8916953a537 100644
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
