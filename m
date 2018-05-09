From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 1/2] dt: bindings: lm3601x: Introduce the lm3601x driver
Date: Wed, 9 May 2018 06:57:26 -0500
Message-ID: <20180509115727.12070-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, jacek.anaszewski@gmail.com, pavel@ucw.cz, afd@ti.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Introduce the device tree bindings for the lm3601x
family of LED torch, flash and IR drivers.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - Removed wildcard compatible - https://patchwork.kernel.org/patch/10386241/
v2 - No changes - https://patchwork.kernel.org/patch/10384587/

 .../devicetree/bindings/leds/leds-lm3601x.txt | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3601x.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
new file mode 100644
index 000000000000..a2fc350bc5f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
@@ -0,0 +1,50 @@
+* Texas Instruments - lm3601x Single-LED Flash Driver
+
+The LM3601X are ultra-small LED flash drivers that
+provides a high level of adjustability.
+
+Required properties:
+	- compatible : Can be one of the following
+		"ti,lm36010"
+		"ti,lm36011"
+	- reg : I2C slave address
+	- #address-cells : 1
+	- #size-cells : 0
+
+Required child properties:
+	- reg : 0 - Indicates to support and register a torch interface
+		1 - Indicates to support and register a strobe interface
+		2 - Indicates to support and register an ir interface
+
+Optional child properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+led-controller@64 {
+	compatible = "ti,lm36010";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x64>;
+
+	led@0 {
+		reg = <0>;
+		label = "white:torch";
+		led-max-microamp=<10000>;
+	};
+
+	led@1 {
+		reg = <1>;
+		label = "white:strobe";
+		flash-max-microamp=<10000>;
+		flash-max-timeout-us=<800>;
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "invisible:ir";
+	};
+}
+
+For more product information please see the links below:
+http://www.ti.com/product/LM36010
+http://www.ti.com/product/LM36011
-- 
2.17.0.582.gccdcbd54c
