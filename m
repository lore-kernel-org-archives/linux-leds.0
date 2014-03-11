From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] leds-ot200: Fix dependencies
Date: Tue, 11 Mar 2014 17:30:53 +0100
Message-ID: <20140311173053.7b030522@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58928 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753306AbaCKQa4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 11 Mar 2014 12:30:56 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

The Bachmann OT200 is a Geode-based device, so OT200-specific drivers
are only useful on X86_32, except for build testing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/leds/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.14-rc6.orig/drivers/leds/Kconfig	2014-03-11 17:20:25.505429515 +0100
+++ linux-3.14-rc6/drivers/leds/Kconfig	2014-03-11 17:21:57.843560506 +0100
@@ -474,7 +474,7 @@ config LEDS_LM355x
 
 config LEDS_OT200
 	tristate "LED support for the Bachmann OT200"
-	depends on LEDS_CLASS && HAS_IOMEM
+	depends on LEDS_CLASS && HAS_IOMEM && (X86_32 || COMPILE_TEST)
 	help
 	  This option enables support for the LEDs on the Bachmann OT200.
 	  Say Y to enable LEDs on the Bachmann OT200.


-- 
Jean Delvare
SUSE L3 Support
