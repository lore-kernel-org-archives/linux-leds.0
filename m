From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 20/25] dt-bindings: as3645a: Add function and color properties
Date: Sun, 10 Mar 2019 19:28:31 +0100
Message-ID: <20190310182836.20841-21-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Also, fix malformed syntax of address-cells and size-cells
in the example.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../devicetree/bindings/leds/ams,as3645a.txt       | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
index fdc40e354a64..4af2987b25e9 100644
--- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
+++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
@@ -39,7 +39,9 @@ ams,input-max-microamp: Maximum flash controller input current. The
 Optional properties of the flash child node
 ===========================================
 
-label		: The label of the flash LED.
+function	:  See Documentation/devicetree/bindings/leds/common.txt.
+color		:  See Documentation/devicetree/bindings/leds/common.txt.
+label		:  See Documentation/devicetree/bindings/leds/common.txt (deprecated).
 
 
 Required properties of the indicator child node (1)
@@ -52,28 +54,32 @@ led-max-microamp: Maximum indicator current. The allowed values are
 Optional properties of the indicator child node
 ===============================================
 
-label		: The label of the indicator LED.
+function	:  See Documentation/devicetree/bindings/leds/common.txt.
+color		:  See Documentation/devicetree/bindings/leds/common.txt.
+label		:  See Documentation/devicetree/bindings/leds/common.txt (deprecated).
 
 
 Example
 =======
 
+#include <dt-bindings/leds/common.h>
+
 	as3645a@30 {
-		#address-cells: 1
-		#size-cells: 0
+		#address-cells = <1>;
+		#size-cells = <0>;
 		reg = <0x30>;
 		compatible = "ams,as3645a";
-		flash@0 {
+		led@0 {
 			reg = <0x0>;
 			flash-timeout-us = <150000>;
 			flash-max-microamp = <320000>;
 			led-max-microamp = <60000>;
 			ams,input-max-microamp = <1750000>;
-			label = "as3645a:flash";
+			function = LED_FUNCTION_FLASH;
 		};
-		indicator@1 {
+		led@1 {
 			reg = <0x1>;
 			led-max-microamp = <10000>;
-			label = "as3645a:indicator";
+			function = LED_FUNCTION_INDICATOR;
 		};
 	};
-- 
2.11.0
