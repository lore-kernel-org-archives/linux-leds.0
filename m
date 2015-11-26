From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH v2 1/9] Documentation: dt-bindings: mfd: add TI LMU device binding information
Date: Thu, 26 Nov 2015 15:56:57 +0900
Message-ID: <1448521025-2796-2-git-send-email-milo.kim@ti.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:38326 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751249AbbKZG6s (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 26 Nov 2015 01:58:48 -0500
In-Reply-To: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, lee.jones@linaro.org, j.anaszewski@samsung.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>

This patch describes overall binding for TI LMU MFD devices.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org> 
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 Documentation/devicetree/bindings/mfd/ti-lmu.txt | 243 +++++++++++++++++++++++
 1 file changed, 243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti-lmu.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
new file mode 100644
index 0000000..c885cf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -0,0 +1,243 @@
+TI LMU (Lighting Management Unit) device tree bindings
+
+TI LMU driver supports lighting devices below.
+
+   Name                  Child nodes
+  ------      ---------------------------------
+  LM3532       Backlight
+  LM3631       Backlight and regulator
+  LM3632       Backlight and regulator
+  LM3633       Backlight, LED and fault monitor
+  LM3695       Backlight
+  LM3697       Backlight and fault monitor
+
+Required properties:
+  - compatible: Should be one of:
+                "ti,lm3532"
+                "ti,lm3631"
+                "ti,lm3632"
+                "ti,lm3633"
+                "ti,lm3695"
+                "ti,lm3697"
+  - reg: I2C slave address.
+         0x11 for LM3632
+         0x29 for LM3631
+         0x36 for LM3633, LM3697
+         0x38 for LM3532
+         0x63 for LM3695
+
+Optional property:
+  - enable-gpios: A GPIO specifier for hardware enable pin.
+
+Required node:
+  - backlight: All LMU devices have backlight child nodes.
+               For the properties, please refer to [1].
+
+Optional nodes:
+  - fault-monitor: Hardware fault monitoring driver for LM3633 and LM3697.
+    Required properties:
+      - compatible: Should be one of:
+                    "ti,lm3633-fault-monitor"
+                    "ti,lm3697-fault-monitor"
+  - leds: LED properties for LM3633. Please refer to [2].
+  - regulators: Regulator properties for LM3631 and LM3632.
+                Please refer to [3].
+
+[1] ../leds/backlight/ti-lmu-backlight.txt
+[2] ../leds/leds-lm3633.txt
+[3] ../regulator/lm363x-regulator.txt
+
+lm3532@38 {
+	compatible = "ti,lm3532";
+	reg = <0x38>;
+
+	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
+
+	backlight {
+		compatible = "ti,lm3532-backlight";
+
+		lcd {
+			led-sources = <0 1 2>;
+			ramp-up-msec = <30>;
+			ramp-down-msec = <0>;
+		};
+	};
+};
+
+lm3631@29 {
+	compatible = "ti,lm3631";
+	reg = <0x29>;
+
+	regulators {
+		compatible = "ti,lm363x-regulator";
+
+		vboost {
+			regulator-name = "lcd_boost";
+			regulator-min-microvolt = <4500000>;
+			regulator-max-microvolt = <6350000>;
+			regulator-always-on;
+		};
+
+		vcont {
+			regulator-name = "lcd_vcont";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		voref {
+			regulator-name = "lcd_voref";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+		};
+
+		vpos {
+			regulator-name = "lcd_vpos";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+			regulator-boot-on;
+		};
+
+		vneg {
+			regulator-name = "lcd_vneg";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+			regulator-boot-on;
+		};
+	};
+
+	backlight {
+		compatible = "ti,lm3631-backlight";
+
+		lcd_bl {
+			led-sources = <0 1>;
+			ramp-up-msec = <300>;
+		};
+	};
+};
+
+lm3632@11 {
+	compatible = "ti,lm3632";
+	reg = <0x11>;
+
+	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>; /* PC2 */
+
+	regulators {
+		compatible = "ti,lm363x-regulator";
+
+		ti,lcm-en1-gpio = <&pioC 0 GPIO_ACTIVE_HIGH>; /* PC0 */
+		ti,lcm-en2-gpio = <&pioC 1 GPIO_ACTIVE_HIGH>; /* PC1 */
+
+		vboost {
+			regulator-name = "lcd_boost";
+			regulator-min-microvolt = <4500000>;
+			regulator-max-microvolt = <6400000>;
+			regulator-always-on;
+		};
+
+		vpos {
+			regulator-name = "lcd_vpos";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+		};
+
+		vneg {
+			regulator-name = "lcd_vneg";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+		};
+	};
+
+	backlight {
+		compatible = "ti,lm3632-backlight";
+
+		pwms = <&pwm0 0 10000 0>; /* pwm number, period, polarity */
+		pwm-names = "lmu-backlight";
+
+		lcd {
+			led-sources = <0 1>;
+			pwm-period = <10000>;
+		};
+	};
+};
+
+lm3633@36 {
+	compatible = "ti,lm3633";
+	reg = <0x36>;
+
+	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
+
+	backlight {
+		compatible = "ti,lm3633-backlight";
+
+		main {
+			label = "main_lcd";
+			led-sources = <1 2>;
+			ramp-up-msec = <500>;
+			ramp-down-msec = <500>;
+		};
+
+		front {
+			label = "front_lcd";
+			led-sources = <0>;
+			ramp-up-msec = <1000>;
+			ramp-down-msec = <0>;
+		};
+	};
+
+	leds {
+		compatible = "ti,lm3633-leds";
+
+		chan1 {
+			label = "status";
+			led-sources = <1>;
+			led-max-microamp = <6000>;
+		};
+
+		chan345 {
+			label = "rgb";
+			led-sources = <3 4 5>;
+			led-max-microamp = <10000>;
+		};
+	};
+
+	fault-monitor {
+		compatible = "ti,lm3633-fault-monitor";
+	};
+};
+
+lm3695@63 {
+	compatible = "ti,lm3695";
+	reg = <0x63>;
+
+	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
+
+	backlight {
+		compatible = "ti,lm3695-backlight";
+
+		lcd {
+			label = "bl";
+			led-sources = <0 1>;
+		};
+	};
+};
+
+lm3697@36 {
+	compatible = "ti,lm3697";
+	reg = <0x36>;
+
+	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
+
+	backlight {
+		compatible = "ti,lm3697-backlight";
+
+		lcd {
+			led-sources = <0 1 2>;
+			ramp-up-msec = <200>;
+			ramp-down-msec = <200>;
+		};
+	};
+
+	fault-monitor {
+		compatible = "ti,lm3697-fault-monitor";
+	};
+};
-- 
1.9.1
