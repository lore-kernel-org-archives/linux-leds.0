From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 3/5] dt-bindings: ti-lmu: Modify dt bindings for the LM3697
Date: Mon, 25 Mar 2019 09:24:01 -0500
Message-ID: <20190325142403.30447-4-dmurphy@ti.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325142403.30447-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

The LM3697 is a single function LED driver. The single function LED
driver needs to reside in the LED directory as a dedicated LED driver
and not as a MFD device.  The device does have common brightness and ramp
features and those can be accomodated by a TI LMU framework.

The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicated
LED dt binding needs to be added.  The new LM3697 LED dt binding will then
reside in the Documentation/devicetree/bindings/leds directory and follow the
current LED and general bindings guidelines.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/leds/leds-lm3697.txt  | 77 +++++++++++++++++++
 .../devicetree/bindings/mfd/ti-lmu.txt        | 26 +------
 2 files changed, 78 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
new file mode 100644
index 000000000000..a780f11acd38
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
@@ -0,0 +1,77 @@
+* Texas Instruments - LM3697 Highly Efficient White LED Driver
+
+The LM3697 11-bit LED driver provides high-
+performance backlight dimming for 1, 2, or 3 series
+LED strings while delivering up to 90% efficiency.
+
+This device is suitable for display and keypad Lighting
+
+Required properties:
+	- compatible:
+		"ti,lm3697"
+	- reg :  I2C slave address
+	- #address-cells : 1
+	- #size-cells : 0
+
+Optional properties:
+	- enable-gpios : GPIO pin to enable/disable the device
+	- vled-supply : LED supply
+
+Required child properties:
+	- reg : 0 - LED is Controlled by bank A
+		1 - LED is Controlled by bank B
+	- led-sources : Indicates which HVLED string is associated to which
+			control bank.  This is a zero based property so
+			HVLED1 = 0, HVLED2 = 1, HVLED3 = 2.
+			Additional information is contained
+			in Documentation/devicetree/bindings/leds/common.txt
+
+Optional child properties:
+	- max_brightness - This determines whether to use 8 bit brightness mode
+			   or 11 bit brightness mode.  If this value is not
+			   set the device is defaulted to the preferred 8bit
+			   brightness mode per 7.3.4.1 of the data sheet.
+			   The values are 255 (8bit) or 2047 (11bit).
+	- ramp-up-ms: see Documentation/devicetree/bindings/mfd/ti-lmu.txt
+	- ramp-down-ms: see Documentation/devicetree/bindings/mfd/ti-lmu.txt
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger :
+	   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+HVLED string 1 and 3 are controlled by control bank A and HVLED 2 string is
+controlled by control bank B.
+
+led-controller@36 {
+	compatible = "ti,lm3697";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x36>;
+
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	vled-supply = <&vbatt>;
+
+	led@0 {
+		reg = <0>;
+		led-sources = <0 2>;
+		max_brightness = <2047>;
+		ramp-up-ms = <5000>;
+		ramp-down-ms = <1000>;
+		label = "white:first_backlight_cluster";
+		linux,default-trigger = "backlight";
+	};
+
+	led@1 {
+		reg = <1>;
+		led-sources = <1>;
+		max_brightness = <255>;
+		ramp-up-ms = <500>;
+		ramp-down-ms = <1000>;
+		label = "white:second_backlight_cluster";
+		linux,default-trigger = "backlight";
+	};
+}
+
+For more product information please see the link below:
+http://www.ti.com/lit/ds/symlink/lm3697.pdf
diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index d9d529de6dc1..4b2dc0ccfe26 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -8,7 +8,6 @@ TI LMU driver supports lighting devices below.
   LM3632       Backlight and regulator
   LM3633       Backlight, LED and fault monitor
   LM3695       Backlight
-  LM3697       Backlight and fault monitor
 
 Required properties:
   - compatible: Should be one of:
@@ -16,11 +15,10 @@ Required properties:
                 "ti,lm3632"
                 "ti,lm3633"
                 "ti,lm3695"
-                "ti,lm3697"
   - reg: I2C slave address.
          0x11 for LM3632
          0x29 for LM3631
-         0x36 for LM3633, LM3697
+         0x36 for LM3633
          0x63 for LM3695
 
 Optional property:
@@ -41,7 +39,6 @@ Optional nodes:
     Required properties:
       - compatible: Should be one of:
                     "ti,lm3633-fault-monitor"
-                    "ti,lm3697-fault-monitor"
   - leds: LED properties for LM3633. Please refer to [2].
   - regulators: Regulator properties for LM3631 and LM3632.
                 Please refer to [3].
@@ -206,24 +203,3 @@ lm3695@63 {
 		};
 	};
 };
-
-lm3697@36 {
-	compatible = "ti,lm3697";
-	reg = <0x36>;
-
-	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
-
-	backlight {
-		compatible = "ti,lm3697-backlight";
-
-		lcd {
-			led-sources = <0 1 2>;
-			ramp-up-ms = <200>;
-			ramp-down-ms = <200>;
-		};
-	};
-
-	fault-monitor {
-		compatible = "ti,lm3697-fault-monitor";
-	};
-};
-- 
2.19.0
