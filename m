From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] led: leds-ipaq-micro: Add LEDS_CLASS dependency
Date: Mon, 07 Sep 2015 17:04:44 +0200
Message-ID: <1441638284-19203-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50176 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbbIGPFO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 11:05:14 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NUB02H55B8NZF40@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 08 Sep 2015 00:05:11 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>

Fix missing Kconfig LEDS_CLASS dependency

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 23408bd..78ae3c2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -170,6 +170,7 @@ config LEDS_SUNFIRE
 
 config LEDS_IPAQ_MICRO
 	tristate "LED Support for the Compaq iPAQ h3xxx"
+	depends on LEDS_CLASS
 	depends on MFD_IPAQ_MICRO
 	help
 	  Choose this option if you want to use the notification LED on
-- 
1.7.9.5
