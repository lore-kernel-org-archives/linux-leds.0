From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 16/26] dt-bindings: cr0014114: Add function and color properties
Date: Sun,  9 Jun 2019 21:07:53 +0200
Message-ID: <20190609190803.14815-17-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com, Oleh Kravchenko <oleg@kaa.org.ua>
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-cr0014114.txt    | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
index 4255b19ad25c..f8de7516a39b 100644
--- a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
+++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
@@ -11,14 +11,20 @@ Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
 apply. In particular, "reg" and "spi-max-frequency" properties must be given.
 
 LED sub-node properties:
-- label :
+- function :
+	see Documentation/devicetree/bindings/leds/common.txt
+- color :
 	see Documentation/devicetree/bindings/leds/common.txt
+- label :
+	see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 - linux,default-trigger : (optional)
 	see Documentation/devicetree/bindings/leds/common.txt
 
 Example
 -------
 
+#include <dt-bindings/leds/common.h>
+
 led-controller@0 {
 	compatible = "crane,cr0014114";
 	reg = <0>;
@@ -28,27 +34,33 @@ led-controller@0 {
 
 	led@0 {
 		reg = <0>;
-		label = "red:coin";
+		function = "coin";
+		color = <LED_COLOR_ID_RED>;
 	};
 	led@1 {
 		reg = <1>;
-		label = "green:coin";
+		function = "coin";
+		color = <LED_COLOR_ID_GREEN>;
 	};
 	led@2 {
 		reg = <2>;
-		label = "blue:coin";
+		function = "coin";
+		color = <LED_COLOR_ID_BLUE>;
 	};
 	led@3 {
 		reg = <3>;
-		label = "red:bill";
+		function = "bill";
+		color = <LED_COLOR_ID_RED>;
 	};
 	led@4 {
 		reg = <4>;
-		label = "green:bill";
+		function = "bill";
+		color = <LED_COLOR_ID_GREEN>;
 	};
 	led@5 {
 		reg = <5>;
-		label = "blue:bill";
+		function = "bill";
+		color = <LED_COLOR_ID_BLUE>;
 	};
 	...
 };
-- 
2.11.0
