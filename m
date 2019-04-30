From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 2/7] dt-bindings: mfd: LMU: Add the ramp up/down property
Date: Tue, 30 Apr 2019 14:17:25 -0500
Message-ID: <20190430191730.19450-3-dmurphy@ti.com>
References: <20190430191730.19450-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430191730.19450-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
List-Id: linux-leds@vger.kernel.org

Document the ramp-up and ramp-down property in the binding.
Removing the "sec" from the property definition as seconds is
implied.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058759/

v2 - Fixed commit message as this was not just a modification but adding documentation
https://lore.kernel.org/patchwork/patch/1054504/

 .../devicetree/bindings/mfd/ti-lmu.txt        | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index 86ca786d54fc..adae96c79d39 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -25,6 +25,12 @@ Required properties:
 
 Optional property:
   - enable-gpios: A GPIO specifier for hardware enable pin.
+  - ramp-up-ms: Current ramping from one brightness level to
+		the a higher brightness level.
+		Range from 2048 us - 117.44 s
+  - ramp-down-ms: Current ramping from one brightness level to
+		  the a lower brightness level.
+		  Range from 2048 us - 117.44 s
 
 Required node:
   - backlight: All LMU devices have backlight child nodes.
@@ -90,7 +96,7 @@ lm3631@29 {
 
 		lcd_bl {
 			led-sources = <0 1>;
-			ramp-up-msec = <300>;
+			ramp-up-ms = <300>;
 		};
 	};
 };
@@ -152,15 +158,15 @@ lm3633@36 {
 		main {
 			label = "main_lcd";
 			led-sources = <1 2>;
-			ramp-up-msec = <500>;
-			ramp-down-msec = <500>;
+			ramp-up-ms = <500>;
+			ramp-down-ms = <500>;
 		};
 
 		front {
 			label = "front_lcd";
 			led-sources = <0>;
-			ramp-up-msec = <1000>;
-			ramp-down-msec = <0>;
+			ramp-up-ms = <1000>;
+			ramp-down-ms = <0>;
 		};
 	};
 
@@ -212,8 +218,8 @@ lm3697@36 {
 
 		lcd {
 			led-sources = <0 1 2>;
-			ramp-up-msec = <200>;
-			ramp-down-msec = <200>;
+			ramp-up-ms = <200>;
+			ramp-down-ms = <200>;
 		};
 	};
 
-- 
2.21.0.5.gaeb582a983
