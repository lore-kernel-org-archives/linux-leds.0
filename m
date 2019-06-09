From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 06/26] dt-bindings: sc27xx-blt: Add function and color properties
Date: Sun,  9 Jun 2019 21:07:43 +0200
Message-ID: <20190609190803.14815-7-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com, Baolin Wang <baolin.wang@linaro.org>
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
index dddf84f9c7ea..df2b4e1c492b 100644
--- a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
+++ b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
@@ -14,7 +14,9 @@ Required child properties:
 - reg: Port this LED is connected to.
 
 Optional child properties:
-- label: See Documentation/devicetree/bindings/leds/common.txt.
+- function: See Documentation/devicetree/bindings/leds/common.txt.
+- color: See Documentation/devicetree/bindings/leds/common.txt.
+- label: See Documentation/devicetree/bindings/leds/common.txt (deprecated).
 
 Examples:
 
@@ -25,17 +27,17 @@ led-controller@200 {
 	reg = <0x200>;
 
 	led@0 {
-		label = "red";
+		color = <LED_COLOR_ID_RED>;
 		reg = <0x0>;
 	};
 
 	led@1 {
-		label = "green";
+		color = <LED_COLOR_ID_GREEN>;
 		reg = <0x1>;
 	};
 
 	led@2 {
-		label = "blue";
+		color = <LED_COLOR_ID_BLUE>;
 		reg = <0x2>;
 	};
 };
-- 
2.11.0
