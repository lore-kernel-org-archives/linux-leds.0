From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v7 1/2] leds: fix Kconfig text for MLXCPLD and SYSCON
Date: Thu, 15 Feb 2018 08:15:24 +0000
Message-ID: <1518682525-101578-2-git-send-email-vadimp@mellanox.com>
References: <1518682525-101578-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:57844 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1754769AbeBOGTG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Feb 2018 01:19:06 -0500
In-Reply-To: <1518682525-101578-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

It fixes grammatical errors in Kconfig file for LEDS_SYSCON and
LEDS_MLXCPLD.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Reported-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a3fdf83..ed44013 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -674,7 +674,7 @@ config LEDS_SYSCON
 	depends on MFD_SYSCON
 	depends on OF
 	help
-	  This option enabled support for the LEDs on syscon type
+	  This option enable support for the LEDs on syscon type
 	  devices. This will only work with device tree enabled
 	  devices.
 
@@ -691,8 +691,8 @@ config LEDS_MLXCPLD
 	depends on X86 && DMI
 	depends on LEDS_CLASS
 	help
-	  This option enabled support for the LEDs on the Mellanox
-	  boards. Say Y to enabled these.
+	  This option enables support for the LEDs on the Mellanox
+	  boards. Say Y to enable these.
 
 config LEDS_USER
 	tristate "Userspace LED support"
-- 
2.1.4
