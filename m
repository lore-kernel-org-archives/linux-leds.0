From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 1/1] leds: leds-mlxcpld: Allow compilation for 32 bit arch
Date: Thu,  1 Feb 2018 08:10:34 +0000
Message-ID: <1517472634-110307-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:39874 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750979AbeBAGOF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Feb 2018 01:14:05 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

It makes leds-mlxcpld available for 32 bit architecture.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Reported-by: Jiri Pirko <jiri@mellanox.com>
---
 drivers/leds/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 3e763d2..fe52436a7 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -688,7 +688,7 @@ config LEDS_PM8058
 
 config LEDS_MLXCPLD
 	tristate "LED support for the Mellanox boards"
-	depends on X86_64 && DMI
+	depends on X86 && DMI
 	depends on LEDS_CLASS
 	help
 	  This option enabled support for the LEDs on the Mellanox
-- 
2.1.4
