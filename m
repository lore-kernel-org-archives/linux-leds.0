From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 14/26] dt-bindings: lm36010: Add function and color properties
Date: Sun,  9 Jun 2019 21:07:51 +0200
Message-ID: <20190609190803.14815-15-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-lm3601x.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
index a88b2c41e75b..095dafb6ec7f 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
@@ -22,9 +22,14 @@ Required properties for flash LED child nodes:
 	- led-max-microamp : Range from 2.4mA - 376mA
 
 Optional child properties:
-	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- function : see Documentation/devicetree/bindings/leds/common.txt
+	- color : see Documentation/devicetree/bindings/leds/common.txt
+	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 
 Example:
+
+#include <dt-bindings/leds/common.h>
+
 led-controller@64 {
 	compatible = "ti,lm36010";
 	#address-cells = <1>;
@@ -33,7 +38,8 @@ led-controller@64 {
 
 	led@0 {
 		reg = <1>;
-		label = "white:torch";
+		function = LED_FUNCTION_TORCH;
+		color = <LED_COLOR_ID_WHITE>;
 		led-max-microamp = <376000>;
 		flash-max-microamp = <1500000>;
 		flash-max-timeout-us = <1600000>;
-- 
2.11.0
