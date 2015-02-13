From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: flash: remove stray include directive
Date: Fri, 13 Feb 2015 17:06:47 +0100
Message-ID: <1423843607-3840-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62475 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753606AbbBMQHA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 13 Feb 2015 11:07:00 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJP00840WRMNA20@mailout4.samsung.com> for
 linux-leds@vger.kernel.org; Sat, 14 Feb 2015 01:06:58 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, rpurdie@rpsys.net, Jacek Anaszewski <j.anaszewski@samsung.com>

Avoid including v4l2-controls.h, as this is stray code from the early
versions of the LED / V4L2 flash API integration patches. LED Flash
class doesn't depend on V4L2 subsystem.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 include/linux/led-class-flash.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 5ba2fac..3b5b964 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -13,7 +13,6 @@
 #define __LINUX_FLASH_LEDS_H_INCLUDED
 
 #include <linux/leds.h>
-#include <uapi/linux/v4l2-controls.h>
 
 struct device_node;
 struct led_classdev_flash;
-- 
1.7.9.5
