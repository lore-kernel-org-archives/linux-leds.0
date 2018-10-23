From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 5/7] dt-bindings: ti-lmu: Modify dt bindings for the LM3633
Date: Tue, 23 Oct 2018 12:06:21 -0500
Message-ID: <20181023170623.31820-5-dmurphy@ti.com>
References: <20181023170623.31820-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023170623.31820-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

The LM3633 is a single function LED driver. The single function LED
driver needs to reside in the LED directory as a dedicated LED driver
and not as a MFD device.  The device does have common brightness and ramp
features and those can be accomodated by a TI LMU framework.

The LM3633 dt binding needs to be moved from the ti-lmu.txt and a dedicated
LED dt binding needs to be added.  The new LM3633 LED dt binding will then
reside in the Documentation/devicetree/bindings/leds directory and follow the
current LED and general bindings guidelines.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v4 - Squashed removal and addition of the dt bindings into a single patch - https://lore.kernel.org/patchwork/patch/998703/

 .../devicetree/bindings/leds/leds-lm3633.txt  | 102 ++++++++++++++++++
 .../devicetree/bindings/mfd/ti-lmu.txt        |  48 ---------
 2 files changed, 102 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3633.txt b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
new file mode 100644
index 000000000000..d791b891ea6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
@@ -0,0 +1,102 @@
+* Texas Instruments - LM3633 Lighting Power Solution for Smartphone Handsets
+
+The LM3633 is a complete power source for
+backlight, keypad, and indicator LEDs in smartphone
+handsets.
+
+This device is suitable for display and keypad Lighting
+
+Required properties:
+	- compatible:
+		"ti,lm3633"
+	- reg :  I2C slave address
+	- #address-cells : 1
+	- #size-cells : 0
+
+Optional properties:
+	- enable-gpios : GPIO pin to enable/disable the device
+	- vled-supply : LED supply
+
+Required child properties:
+	- reg : 0 - HVLED is Controlled by bank A
+		1 - HVLED is Controlled by bank B
+		2,3,4 - LVLED1, 2 and 3 are Controlled by bank C, D and E
+		5,6,7 - LVLED4, 5 and 6 are Controlled by bank F, G and H
+	- led-sources : Indicates which LED string is associated to which
+			control bank.
+			0 - LED is not active in this control bank
+			1 - LED string is controlled by this control bank
+
+Optional child properties:
+	- runtime-ramp-up-msec: Current ramping from one brightness level to
+				the a higher brightness level.
+				Range from 2048 us - 117.44 s
+	- runtime-ramp-down-msec: Current ramping from one brightness level to
+				  the a lower brightness level.
+				  Range from 2048 us - 117.44 s
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger :
+	   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+Control bank C output to 3 LVLEDs and Control F, G and H have independent
+controls of the LVLEDs.
+
+led-controller@36 {
+	compatible = "ti,lm3633";
+	reg = <0x36>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	led@0 {
+		reg = <0>;
+		led-sources = < 1 0 1 >;
+		label = "white:backlight";
+		ramp-up-ms = <100000>;
+		ramp-down-ms = <1000>;
+		linux,default-trigger = "backlight";
+	};
+
+	led@1 {
+		reg = <1>;
+		led-sources = < 0 1 0 >;
+		label = "white:light";
+		ramp-up-ms = <100000>;
+		ramp-down-ms = <1000>;
+	};
+
+	led@2 {
+		reg = <2>;
+		led-sources = <1>;
+		ramp-up-ms = <100000>;
+		ramp-down-ms = <1000>;
+		label = "white:indicator1";
+	};
+
+	led@5 {
+		reg = <5>;
+		led-sources = <1>;
+		ramp-up-ms = <100000>;
+		ramp-down-ms = <1000>;
+		label = "red:light";
+	};
+
+	led@6 {
+		reg = <6>;
+		led-sources = <1>;
+		ramp-up-ms = <41940>;
+		ramp-down-ms = <1000>;
+		label = "green:light";
+	};
+
+	led@7 {
+		reg = <7>;
+		led-sources = <1>;
+		ramp-up-ms = <100000>;
+		ramp-down-ms = <1000>;
+		label = "blue:light";
+	};
+};
+For more product information please see the link below:
+http://www.ti.com/lit/ds/symlink/lm3633.pdf
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
