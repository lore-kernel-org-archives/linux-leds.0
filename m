From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] leds: fix aat1290 build errors
Date: Fri, 26 Jun 2015 12:00:20 -0700
Message-ID: <558DA144.6050203@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37212 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751919AbbFZTAY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jun 2015 15:00:24 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors when LEDS_AAT1290=y and V4L2_FLASH_LED_CLASS=m
by restricting LEDS_AAT1290 to =m if V4L2_FLASH_LED_CLASS=m.

drivers/built-in.o: In function `aat1290_led_remove':
leds-aat1290.c:(.text+0xe5d77): undefined reference to `v4l2_flash_release'
drivers/built-in.o: In function `aat1290_led_probe':
leds-aat1290.c:(.text+0xe6494): undefined reference to `v4l2_flash_init'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/leds/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20150626.orig/drivers/leds/Kconfig
+++ linux-next-20150626/drivers/leds/Kconfig
@@ -42,6 +42,7 @@ config LEDS_88PM860X
 config LEDS_AAT1290
 	tristate "LED support for the AAT1290"
 	depends on LEDS_CLASS_FLASH
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
 	depends on GPIOLIB
 	depends on OF
 	depends on PINCTRL
