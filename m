From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v8 1/2] leds: fix Kconfig text for MLXCPLD, SYSCON, MC13783, NETXBIG
Date: Thu, 15 Feb 2018 18:11:37 +0000
Message-ID: <1518718298-105286-2-git-send-email-vadimp@mellanox.com>
References: <1518718298-105286-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:51328 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1425733AbeBOQYe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Feb 2018 11:24:34 -0500
In-Reply-To: <1518718298-105286-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

It fixes grammatical errors in Kconfig file for LEDS_SYSCON,
LEDS_MLXCPLD, LEDS_MC13783, LEDS_NETXBIG.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Reported-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
v7->v8
  Comments pointed out by Pavel:
  - Change "enable" to enables for LEDS_SYSCON Kconfig text;
  Fixed added by Vadim:
  - Change "enable" to enables for LEDS_MC13783, LEDS_NETXBIG Kconfig
    text;
---
 drivers/leds/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a3fdf83..4b95aed 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -521,7 +521,7 @@ config LEDS_MC13783
 	depends on LEDS_CLASS
 	depends on MFD_MC13XXX
 	help
-	  This option enable support for on-chip LED drivers found
+	  This option enables support for on-chip LED drivers found
 	  on Freescale Semiconductor MC13783/MC13892/MC34708 PMIC.
 
 config LEDS_NS2
@@ -544,7 +544,7 @@ config LEDS_NETXBIG
 	depends on MACH_KIRKWOOD
 	default y
 	help
-	  This option enable support for LEDs found on the LaCie 2Big
+	  This option enables support for LEDs found on the LaCie 2Big
 	  and 5Big Network v2 boards. The LEDs are wired to a CPLD and are
 	  controlled through a GPIO extension bus.
 
@@ -674,7 +674,7 @@ config LEDS_SYSCON
 	depends on MFD_SYSCON
 	depends on OF
 	help
-	  This option enabled support for the LEDs on syscon type
+	  This option enables support for the LEDs on syscon type
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
