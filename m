From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v3 12/25] dt-bindings: lm3692x: Add function and color properties
Date: Sun, 31 Mar 2019 19:54:48 +0200
Message-ID: <20190331175501.23471-13-jacek.anaszewski@gmail.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
index 08b352840bd7..4c2d923f8758 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
@@ -26,12 +26,16 @@ Required child properties:
 		3 - Will enable the LED3 sync (LM36923 only)
 
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
 led-controller@36 {
 	compatible = "ti,lm3692x";
 	reg = <0x36>;
@@ -43,7 +47,8 @@ led-controller@36 {
 
 	led@0 {
 		reg = <0>;
-		label = "white:backlight_cluster";
+		function = LED_FUNCTION_BACKLIGHT;
+		color = <LED_COLOR_ID_WHITE>;
 		linux,default-trigger = "backlight";
 	};
 }
-- 
2.11.0
