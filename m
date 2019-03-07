From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/4] ARM: dts: omap4-droid4: Update backlight dt properties
Date: Thu, 7 Mar 2019 16:09:45 -0600
Message-ID: <20190307220947.20057-2-dmurphy@ti.com>
References: <20190307220947.20057-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307220947.20057-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Update the properties for the lm3532 device node for droid4.
With this change the backlight LED string and the keypad
LED strings will be controlled separately.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts | 27 +++++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
index e21ec929f096..94e3d53dbcf3 100644
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/leds-lm3532.h>
 #include "omap443x.dtsi"
 #include "motorola-cpcap-mapphone.dtsi"
 
@@ -383,20 +384,30 @@
 };
 
 &i2c1 {
-	lm3532@38 {
+	led-controller@38 {
 		compatible = "ti,lm3532";
+		#address-cells = <1>;
+		#size-cells = <0>;
 		reg = <0x38>;
 
 		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
 
-		lcd_backlight: backlight {
-			compatible = "ti,lm3532-backlight";
+		ramp-up-ms = <LM3532_RAMP_1024us>;
+		ramp-down-ms = <LM3532_RAMP_65536us>;
 
-			lcd {
-				led-sources = <0 1 2>;
-				ramp-up-msec = <1>;
-				ramp-down-msec = <0>;
-			};
+		lcd_backlight: led@0 {
+			reg = <0>;
+			led-sources = <2>;
+			ti,led-mode = <LM3532_BL_MODE_MANUAL>;
+			label = "backlight";
+			linux,default-trigger = "backlight";
+		};
+
+		led@1 {
+			reg = <1>;
+			led-sources = <1>;
+			ti,led-mode = <LM3532_BL_MODE_MANUAL>;
+			label = "keypad";
 		};
 	};
 };
-- 
2.20.1.390.gb5101f9297
