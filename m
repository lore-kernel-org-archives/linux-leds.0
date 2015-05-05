From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 09/27] leds: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue,  5 May 2015 18:32:25 +0200
Message-ID: <1430843563-18615-9-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:54785 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761321AbbEEQcy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 5 May 2015 12:32:54 -0400
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/Kconfig         | 2 +-
 drivers/leds/trigger/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 966b9605f5f0660c..8161cddc3f8d597a 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -395,7 +395,7 @@ config LEDS_INTEL_SS4200
 config LEDS_LT3593
 	tristate "LED driver for LT3593 controllers"
 	depends on LEDS_CLASS
-	depends on GPIOLIB
+	depends on GPIOLIB || COMPILE_TEST
 	help
 	  This option enables support for LEDs driven by a Linear Technology
 	  LT3593 controller. This controller uses a special one-wire pulse
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 49794b47b51c498d..5bda6a9b56bbd90b 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -72,7 +72,7 @@ config LEDS_TRIGGER_CPU
 config LEDS_TRIGGER_GPIO
 	tristate "LED GPIO Trigger"
 	depends on LEDS_TRIGGERS
-	depends on GPIOLIB
+	depends on GPIOLIB || COMPILE_TEST
 	help
 	  This allows LEDs to be controlled by gpio events. It's good
 	  when using gpios as switches and triggering the needed LEDs
-- 
1.9.1
