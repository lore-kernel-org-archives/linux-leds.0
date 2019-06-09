From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 08/26] dt-bindings: lt3593: Add function and color properties
Date: Sun,  9 Jun 2019 21:07:45 +0200
Message-ID: <20190609190803.14815-9-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com, Daniel Mack <daniel@zonque.org>
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Daniel Mack <daniel@zonque.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-lt3593.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
index 6b2cabc36c0c..24eccdaa6322 100644
--- a/Documentation/devicetree/bindings/leds/leds-lt3593.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
@@ -9,8 +9,10 @@ The hardware supports only one LED. The properties of this LED are
 configured in a sub-node in the device node.
 
 Optional sub-node properties:
-- label:	A label for the LED. If none is given, the LED will be
-		named "lt3595::".
+- function:		See Documentation/devicetree/bindings/leds/common.txt
+- color:		See Documentation/devicetree/bindings/leds/common.txt
+- label:		A label for the LED. If none is given, the LED will be
+			named "lt3595::" (deprecated)
 - linux,default-trigger: The default trigger for the LED.
 			See Documentation/devicetree/bindings/leds/common.txt
 - default-state:	The initial state of the LED.
@@ -21,12 +23,15 @@ be handled by its own device node.
 
 Example:
 
+#include <dt-bindings/leds/common.h>
+
 led-controller {
 	compatible = "lltc,lt3593";
 	lltc,ctrl-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
 
 	led {
-		label = "white:backlight";
+		function = LED_FUNCTION_BACKLIGHT;
+		color = <LED_COLOR_ID_WHITE>;
 		default-state = "on";
 	};
 };
-- 
2.11.0
