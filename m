From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/4] dt: lm3532: Add lm3532 dt doc and update ti_lmu doc
Date: Thu, 21 Mar 2019 09:28:35 -0500
Message-ID: <20190321142838.22985-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add the lm3532 device tree documentation.
Remove lm3532 device tree reference from the ti_lmu devicetree
documentation.

With the addition of the dedicated lm3532 documentation the device
can be removed from the ti_lmu.txt.

The reason for this is that the lm3532 dt documentation now defines
the ability to control LED output strings against different control
banks or groups multiple strings to be controlled by a single control
bank.

Another addition was for ALS lighting control and configuration.  The
LM3532 has a feature that can take in the ALS reading from 2 separate
ALS devices and adjust the brightness on the strings that are configured
to support this feature.

Finally the device specific properties were moved to the parent node as these
properties are not control bank configurable.  These include the runtime ramp
and the ALS configuration.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v5 - Moved ramping range to below property definition, updated keyboard label -
https://lore.kernel.org/patchwork/patch/1050412/

v4 - Appended "ti," to TI specific properties, add enable gpio documentation,
removed an example, moved ramp to optional parent properties - https://lore.kernel.org/patchwork/patch/1050122/
v3 - No changes - https://lore.kernel.org/patchwork/patch/1049026/
v2 - Fixed ramp-up and ramp-down properties, removed hard coded property values,
added ranges for variable properties, I did not change the label - https://lore.kernel.org/patchwork/patch/1048805/

 .../devicetree/bindings/leds/leds-lm3532.txt  | 101 ++++++++++++++++++
 .../devicetree/bindings/mfd/ti-lmu.txt        |  20 ----
 2 files changed, 101 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3532.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3532.txt b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
new file mode 100644
index 000000000000..5bd0c025850f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
@@ -0,0 +1,101 @@
+* Texas Instruments - lm3532 White LED driver with ambient light sensing
+capability.
+
+The LM3532 provides the 3 high-voltage, low-side current sinks. The device is
+programmable over an I2C-compatible interface and has independent
+current control for all three channels. The adaptive current regulation
+method allows for different LED currents in each current sink thus allowing
+for a wide variety of backlight and keypad applications.
+
+The main features of the LM3532 include dual ambient light sensor inputs
+each with 32 internal voltage setting resistors, 8-bit logarithmic and linear
+brightness control, dual external PWM brightness control inputs, and up to
+1000:1 dimming ratio with programmable fade in and fade out settings.
+
+Required properties:
+	- compatible : "ti,lm3532"
+	- reg : I2C slave address
+	- #address-cells : 1
+	- #size-cells : 0
+
+Optional properties:
+	- enable-gpios : gpio pin to enable (active high)/disable the device.
+	- ramp-up-us - The Run time ramp rates/step are from one current
+		       set-point to another after the device has reached its
+		       initial target set point from turn-on
+	- ramp-down-us - The Run time ramp rates/step are from one current
+			 set-point to another after the device has reached its
+			 initial target set point from turn-on
+	Range for ramp settings: 8us - 65536us
+
+Optional properties if ALS mode is used:
+	- ti,als-vmin - Minimum ALS voltage defined in Volts
+	- ti,als-vmax - Maximum ALS voltage defined in Volts
+	Per the data sheet the max ALS voltage is 2V and the min is 0V
+
+	- ti,als1-imp-sel - ALS1 impedance resistor selection in Ohms
+	- ti,als2-imp-sel - ALS2 impedance resistor selection in Ohms
+	Range for impedance select: 37000 Ohms - 1190 Ohms
+	Values above 37kohms will be set to the "High Impedance" setting
+
+	- ti,als-avrg-time-us - Determines the length of time the device needs to
+			  average the two ALS inputs.  This is only used if
+			  the input mode is LM3532_ALS_INPUT_AVRG.
+			     Range: 17920us - 2293760us
+	- ti,als-input-mode - Determines how the device uses the attached ALS
+			   devices.
+			   0x00 - ALS1 and ALS2 input average
+			   0x01 - ALS1 Input
+			   0x02 - ALS2 Input
+			   0x03 - Max of ALS1 and ALS2
+
+Required child properties:
+	- reg : Indicates control bank the LED string is controlled by
+	- led-sources : see Documentation/devicetree/bindings/leds/common.txt
+	- ti,led-mode : Defines if the LED strings are manually controlled or
+			if the LED strings are controlled by the ALS.
+			0x00 - LED strings are I2C controlled via full scale
+			       brightness control register
+			0x01 - LED strings are ALS controlled
+
+Optional LED child properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger :
+	   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+led-controller@38 {
+	compatible = "ti,lm3532";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x38>;
+
+	enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+	ramp-up-us = <1024>;
+	ramp-down-us = <65536>;
+
+	ti,als-vmin = <0>;
+	ti,als-vmax = <2000>;
+	ti,als1-imp-sel = <4110>;
+	ti,als2-imp-sel = <2180>;
+	ti,als-avrg-time-us = <17920>;
+	ti,als-input-mode = <0x00>;
+
+	lcd_backlight: led@0 {
+		reg = <0>;
+		led-sources = <2>;
+		ti,led-mode = <1>;
+		label = "backlight";
+		linux,default-trigger = "backlight";
+	};
+
+	led@1 {
+		reg = <1>;
+		led-sources = <1>;
+		ti,led-mode = <0>;
+		label = "platform::kbd_backlight";
+	};
+};
+
+For more product information please see the links below:
+http://www.ti.com/product/LM3532
diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index c885cf89b8ce..980394d701a7 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -4,7 +4,6 @@ TI LMU driver supports lighting devices below.
 
    Name                  Child nodes
   ------      ---------------------------------
-  LM3532       Backlight
   LM3631       Backlight and regulator
   LM3632       Backlight and regulator
   LM3633       Backlight, LED and fault monitor
@@ -13,7 +12,6 @@ TI LMU driver supports lighting devices below.
 
 Required properties:
   - compatible: Should be one of:
-                "ti,lm3532"
                 "ti,lm3631"
                 "ti,lm3632"
                 "ti,lm3633"
@@ -23,7 +21,6 @@ Required properties:
          0x11 for LM3632
          0x29 for LM3631
          0x36 for LM3633, LM3697
-         0x38 for LM3532
          0x63 for LM3695
 
 Optional property:
@@ -47,23 +44,6 @@ Optional nodes:
 [2] ../leds/leds-lm3633.txt
 [3] ../regulator/lm363x-regulator.txt
 
-lm3532@38 {
-	compatible = "ti,lm3532";
-	reg = <0x38>;
-
-	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
-
-	backlight {
-		compatible = "ti,lm3532-backlight";
-
-		lcd {
-			led-sources = <0 1 2>;
-			ramp-up-msec = <30>;
-			ramp-down-msec = <0>;
-		};
-	};
-};
-
 lm3631@29 {
 	compatible = "ti,lm3631";
 	reg = <0x29>;
-- 
2.21.0.5.gaeb582a983
