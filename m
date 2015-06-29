From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: fix max77693-led build errors
Date: Mon, 29 Jun 2015 16:45:23 +0200
Message-ID: <1435589123-23545-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36030 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752033AbbF2Ope (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jun 2015 10:45:34 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NQP035CINNV8F80@mailout1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 29 Jun 2015 23:45:31 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

Fix build errors when LEDS_MAX77693=y and V4L2_FLASH_LED_CLASS=m
by restricting LEDS_MAX77693 to =m if V4L2_FLASH_LED_CLASS=m.

drivers/leds/leds-max77693.c:1062: undefined reference to `v4l2_flash_release'
drivers/leds/leds-max77693.c:1068: undefined reference to `v4l2_flash_release'
drivers/built-in.o: In function `max77693_register_led':
drivers/leds/leds-max77693.c:968: undefined reference to `v4l2_flash_init'
drivers/built-in.o: In function `max77693_led_probe':
drivers/leds/leds-max77693.c:1048: undefined reference to `v4l2_flash_release'

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/leds/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a817a13..9ad35f7 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -502,6 +502,7 @@ config LEDS_TLC591XX
 config LEDS_MAX77693
 	tristate "LED support for MAX77693 Flash"
 	depends on LEDS_CLASS_FLASH
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
 	depends on MFD_MAX77693
 	depends on OF
 	help
-- 
1.7.9.5
