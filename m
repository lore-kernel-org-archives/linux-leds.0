From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Fri, 26 Jan 2018 09:38:28 +0200
Message-ID: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:31056 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750730AbeAZHib (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Jan 2018 02:38:31 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

LM3555 is supported by AS3645A.
Clarify this in Kconfig by referencing to AS3645A.

No functional change.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 3e763d2a0cb3..0961882fa57f 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -601,6 +601,8 @@ config LEDS_LM355x
 	  This option enables support for LEDs connected to LM355x.
 	  LM355x includes Torch, Flash and Indicator functions.
 
+	  Note, LM3555 is driven by AS3645A.
+
 config LEDS_OT200
 	tristate "LED support for the Bachmann OT200"
 	depends on LEDS_CLASS && HAS_IOMEM && (X86_32 || COMPILE_TEST)
-- 
2.15.1
