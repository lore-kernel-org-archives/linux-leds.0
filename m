From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 23/24] dt-bindings: an30259a: Add function and color properties
Date: Tue,  6 Nov 2018 23:07:31 +0100
Message-ID: <1541542052-10081-24-git-send-email-jacek.anaszewski@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Simon Shields <simon@lineageos.org>
---
 .../devicetree/bindings/leds/leds-an30259a.txt     | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
index 6ffb861..43da93b 100644
--- a/Documentation/devicetree/bindings/leds/leds-an30259a.txt
+++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
@@ -15,10 +15,19 @@ Required sub-node properties:
 	- reg: Pin that the LED is connected to. Must be 1, 2, or 3.
 
 Optional sub-node properties:
-	- label: see Documentation/devicetree/bindings/leds/common.txt
-	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
+	- function :
+		see Documentation/devicetree/bindings/leds/common.txt
+	- color :
+		see Documentation/devicetree/bindings/leds/common.txt
+	- label :
+		see Documentation/devicetree/bindings/leds/common.txt (deprecated)
+	- linux,default-trigger :
+		see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
+
+#include <dt-bindings/leds/functions.h>
+
 led-controller@30 {
 	compatible = "panasonic,an30259a";
 	reg = <0x30>;
@@ -28,16 +37,19 @@ led-controller@30 {
 	led@1 {
 		reg = <1>;
 		linux,default-trigger = "heartbeat";
-		label = "red:indicator";
+		function = LED_FUNCTION_INDICATOR;
+		color = "red";
 	};
 
 	led@2 {
 		reg = <2>;
-		label = "green:indicator";
+		function = LED_FUNCTION_INDICATOR;
+		color = "green";
 	};
 
 	led@3 {
 		reg = <3>;
-		label = "blue:indicator";
+		function = LED_FUNCTION_INDICATOR;
+		color = "blue";
 	};
 };
-- 
2.1.4
