From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 10/25] dt-bindings: lp8860: Add function and color properties
Date: Sun, 10 Mar 2019 19:28:21 +0100
Message-ID: <20190310182836.20841-11-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index 5f0e892ad759..623065a55ed8 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -20,12 +20,16 @@ Required child properties:
 	- reg : 0
 
 Optional child properties:
-	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- function : see Documentation/devicetree/bindings/leds/common.txt
+	- color : see Documentation/devicetree/bindings/leds/common.txt
+	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 	- linux,default-trigger :
 	   see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
+#include <dt-bindings/leds/common.h>
+
 led-controller@2d {
 	compatible = "ti,lp8860";
 	#address-cells = <1>;
@@ -36,7 +40,8 @@ led-controller@2d {
 
 	led@0 {
 		reg = <0>;
-		label = "white:backlight";
+		function = LED_FUNCTION_BACKLIGHT;
+		color = LED_COLOR_NAME_WHITE;
 		linux,default-trigger = "backlight";
 	};
 }
-- 
2.11.0
