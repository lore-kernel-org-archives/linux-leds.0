From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH] drivers: leds: Kconfig: pedantic cleanups
Date: Wed,  6 Mar 2019 19:15:46 +0100
Message-ID: <1551896146-17719-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/leds/Kconfig | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a72f97f..2b5ae50 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -56,7 +56,7 @@ config LEDS_AAT1290
 	depends on OF
 	depends on PINCTRL
 	help
-	 This option enables support for the LEDs on the AAT1290.
+	  This option enables support for the LEDs on the AAT1290.
 
 config LEDS_AN30259A
 	tristate "LED support for Panasonic AN30259A"
@@ -413,13 +413,13 @@ config LEDS_CLEVO_MAIL
 
 	  This module can drive the mail LED for the following notebooks:
 
-	  	Clevo D400P
-	  	Clevo D410J
-	  	Clevo D410V
-	  	Clevo D400V/D470V (not tested, but might work)
-	  	Clevo M540N
-	  	Clevo M5x0N (not tested, but might work)
-	  	Positivo Mobile (Clevo M5x0V)
+	        Clevo D400P
+	        Clevo D410J
+	        Clevo D410V
+	        Clevo D400V/D470V (not tested, but might work)
+	        Clevo M540N
+	        Clevo M5x0N (not tested, but might work)
+	        Positivo Mobile (Clevo M5x0V)
 
 	  If your model is not listed here you can try the "nodetect"
 	  module parameter.
@@ -462,7 +462,7 @@ config LEDS_WM831X_STATUS
 	depends on MFD_WM831X
 	help
 	  This option enables support for the status LEDs of the WM831x
-          series of PMICs.
+	  series of PMICs.
 
 config LEDS_WM8350
 	tristate "LED Support for WM8350 AudioPlus PMIC"
-- 
1.9.1
