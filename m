From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 6/9] dt-bindings: ti-lmu: Remove LM3633
Date: Thu, 11 Oct 2018 11:51:20 -0500
Message-ID: <20181011165123.32198-7-dmurphy@ti.com>
References: <20181011165123.32198-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011165123.32198-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: lee.jones@linaro.org, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Remove support for the LM3633 LED device
from the ti-lmu.  The LM3633 will be supported
via a stand alone LED driver.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/mfd/ti-lmu.txt        | 48 -------------------
 1 file changed, 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index 920f910be4e9..573e88578d3d 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -7,7 +7,6 @@ TI LMU driver supports lighting devices below.
   LM3532       Backlight
   LM3631       Backlight and regulator
   LM3632       Backlight and regulator
-  LM3633       Backlight, LED and fault monitor
   LM3695       Backlight
 
 Required properties:
@@ -15,12 +14,10 @@ Required properties:
                 "ti,lm3532"
                 "ti,lm3631"
                 "ti,lm3632"
-                "ti,lm3633"
                 "ti,lm3695"
   - reg: I2C slave address.
          0x11 for LM3632
          0x29 for LM3631
-         0x36 for LM3633
          0x38 for LM3532
          0x63 for LM3695
 
@@ -157,51 +154,6 @@ lm3632@11 {
 	};
 };
 
-lm3633@36 {
-	compatible = "ti,lm3633";
-	reg = <0x36>;
-
-	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
-
-	backlight {
-		compatible = "ti,lm3633-backlight";
-
-		main {
-			label = "main_lcd";
-			led-sources = <1 2>;
-			ramp-up-msec = <500>;
-			ramp-down-msec = <500>;
-		};
-
-		front {
-			label = "front_lcd";
-			led-sources = <0>;
-			ramp-up-msec = <1000>;
-			ramp-down-msec = <0>;
-		};
-	};
-
-	leds {
-		compatible = "ti,lm3633-leds";
-
-		chan1 {
-			label = "status";
-			led-sources = <1>;
-			led-max-microamp = <6000>;
-		};
-
-		chan345 {
-			label = "rgb";
-			led-sources = <3 4 5>;
-			led-max-microamp = <10000>;
-		};
-	};
-
-	fault-monitor {
-		compatible = "ti,lm3633-fault-monitor";
-	};
-};
-
 lm3695@63 {
 	compatible = "ti,lm3695";
 	reg = <0x63>;
-- 
2.19.0
