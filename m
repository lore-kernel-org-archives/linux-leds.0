From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH, RESEND] leds: ipaq needs LEDS_CLASS
Date: Wed, 18 Feb 2015 22:10:53 +0100
Message-ID: <6859961.SRiBVu7Ycu@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:57576 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726AbbBRVLB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 18 Feb 2015 16:11:01 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Philipp Zabel <philipp.zabel@gmail.com>, Paul Parsons <lost.distance@yahoo.com>, linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org

All other drivers have a dependency on this already, but this one
does not, which can lead to a link error when LEDS_CLASS is not set.

drivers/built-in.o: In function `micro_leds_remove':
:(.text+0x13d1bc): undefined reference to `led_classdev_unregister'
drivers/built-in.o: In function `micro_leds_probe':
:(.text+0x13d3d0): undefined reference to `led_classdev_register'

This patch adds the missing dependency.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
----
Originally sent on 2015-01-28, but has not appeared in linux-next

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 95029dfd311a..927bb4491e1c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -144,6 +144,7 @@ config LEDS_SUNFIRE
 
 config LEDS_IPAQ_MICRO
 	tristate "LED Support for the Compaq iPAQ h3xxx"
+	depends on LEDS_CLASS
 	depends on MFD_IPAQ_MICRO
 	help
 	  Choose this option if you want to use the notification LED on
