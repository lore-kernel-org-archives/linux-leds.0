From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/3] DT: leds: Add Qualcomm Light Pulse Generator binding
Date: Fri, 14 Jul 2017 15:45:20 -0700
Message-ID: <20170714224520.467-4-bjorn.andersson@linaro.org>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170714224520.467-1-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This adds the binding document describing the three hardware blocks
related to the Light Pulse Generator found in a wide range of Qualcomm
PMICs.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

Changes since v1:
- Dropped custom pattern properties
- Renamed cell-index to qcom,lpg-channel to clarify its purpose

 .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
new file mode 100644
index 000000000000..cc9ffee6586b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
@@ -0,0 +1,145 @@
+Binding for Qualcomm Light Pulse Generator
+
+The Qualcomm Light Pulse Generator consists of three different hardware blocks;
+a ramp generator with lookup table, the light pulse generator and a three
+channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
+Each of these are described individually below.
+
+= Lookup Table (LUT)
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,spmi-lpg-lut"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: base address of the LUT block
+
+- qcom,lut-size:
+	Usage: required
+	Value type: <u32>
+	Definition: number of elements available in the lookup table
+
+= Light Pulse Generator (LPG)
+The Light Pulse Generator can operate either as a standard PWM controller or in
+a more advanced lookup-table based mode. These are described separately below.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,spmi-lpg"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: base address of the LPG block
+
+== PWM mode
+
+- #pwm-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 1
+
+== Lookup-table mode
+
+- qcom,lpg-channel:
+	Usage: required, when referencing a LUT
+	Value type: <u32>
+	Definition: identifier of the LPG channel, used to associate the LPG
+		    with a particular ramp generator in the LUT block
+
+- default-state:
+	Usage: optional
+	Value type: <string>
+	Definition: default state, as defined in common.txt
+
+- label:
+	Usage: optional
+	Value type: <string>
+	Definition: label of the LED, as defined in common.txt
+
+- linux,default-trigger:
+	Usage: optional
+	Value type: <string>
+	Definition: default trigger, as defined in common.txt
+
+- qcom,tri-led:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: a phandle of a TRILED node and a single u32 denoting which
+		    output channel to control
+
+- qcom,lut:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: phandle of a LUT node
+
+- qcom,dtest:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: configures the output into an internal test line of the
+		    pmic. A first u32 defines which test line to use and the
+		    second cell configures how the value should be outputed
+		    (available lines and configuration differs between PMICs)
+
+= LED Current Sink (TRILED)
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,spmi-tri-led"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: base address of the TRILED block
+
+- qcom,power-source:
+	Usage: required
+	Value type: <u32>
+	Definition: power-source used to drive the output, as defined in the
+		    datasheet
+
+= EXAMPLE:
+The following example defines a single output of the PMI8994, sinking current
+into a LED.
+
+&spmi_bus {
+	pmic@3 {
+		compatible = "qcom,pmi8994", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmi8994_lpg_lut: lpg-lut@b000 {
+			compatible = "qcom,spmi-lpg-lut";
+			reg = <0xb000>;
+
+			qcom,lut-size = <24>;
+		};
+
+		lpg@b200 {
+			compatible = "qcom,spmi-lpg";
+			reg = <0xb200>;
+
+			cell-index = <2>;
+
+			label = "lpg:green:user0";
+
+			qcom,tri-led = <&pmi8994_tri_led 1>;
+			qcom,lut = <&pmi8994_lpg_lut>;
+
+			default-state = "on";
+		};
+
+		pmi8994_tri_led: tri-led@d000 {
+			compatible = "qcom,spmi-tri-led";
+			reg = <0xd000>;
+
+			qcom,power-source = <1>;
+		};
+	};
+};
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
