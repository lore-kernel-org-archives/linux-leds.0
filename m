From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 5/6] dt-bindings: leds: Add LED bindings for the LM36274
Date: Wed, 10 Apr 2019 08:38:32 -0500
Message-ID: <20190410133833.28859-5-dmurphy@ti.com>
References: <20190410133833.28859-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410133833.28859-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add the LM36274 LED specific bindings.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - Changed 29-V to 29V - https://lore.kernel.org/patchwork/patch/1058779/

 .../devicetree/bindings/leds/leds-lm36274.txt | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.txt b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
new file mode 100644
index 000000000000..329393700191
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
@@ -0,0 +1,82 @@
+* Texas Instruments LM36274 4-Channel LCD Backlight Driver w/Integrated Bias
+
+The LM36274 is an integrated four-channel WLED driver and LCD bias supply.
+The backlight boost provides the power to bias four parallel LED strings with
+up to 29V total output voltage. The 11-bit LED current is programmable via
+the I2C bus and/or controlled via a logic level PWM input from 60 μA to 30 mA.
+
+Parent device properties are documented in ../mfd/ti_lmu.txt
+Regulator properties are documented in ../regulator/lm363x-regulator.txt
+
+Required backlight properties:
+	- compatible:
+		"ti,lm36274-backlight"
+	- reg : 0
+	- #address-cells : 1
+	- #size-cells : 0
+	- led-sources : Indicates which LED strings will be enabled.
+			Values from 0-3, sources is 0 based so strings will be
+			source value + 1.
+
+Optional backlight properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger :
+	   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+HVLED string 1 and 3 are controlled by control bank A and HVLED 2 string is
+controlled by control bank B.
+
+lm36274@11 {
+	compatible = "ti,lm36274";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x11>;
+
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+
+	regulators {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "ti,lm363x-regulator";
+
+		enable-gpios = <&pioC 0 GPIO_ACTIVE_HIGH>,
+			       <&pioC 1 GPIO_ACTIVE_HIGH>;
+
+		vboost {
+			regulator-name = "lcd_boost";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <7150000>;
+			regulator-always-on;
+		};
+
+		vpos {
+			regulator-name = "lcd_vpos";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6500000>;
+		};
+
+		vneg {
+			regulator-name = "lcd_vneg";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6500000>;
+		};
+	};
+
+	backlight {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "ti,lm36274-backlight";
+
+		led@0 {
+			reg = <0>;
+			led-sources = <0 2>;
+			label = "white:backlight_cluster";
+			linux,default-trigger = "backlight";
+		};
+	};
+};
+
+For more product information please see the link below:
+http://www.ti.com/lit/ds/symlink/lm36274.pdf
-- 
2.21.0.5.gaeb582a983
