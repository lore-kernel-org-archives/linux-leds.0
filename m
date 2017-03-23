From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] DT: leds: Add Qualcomm Light Pulse Generator binding
Date: Wed, 22 Mar 2017 22:54:35 -0700
Message-ID: <20170323055435.29197-2-bjorn.andersson@linaro.org>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:35535 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753679AbdCWHhW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2017 03:37:22 -0400
Received: by mail-pf0-f175.google.com with SMTP id 20so54116525pfk.2
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2017 00:37:20 -0700 (PDT)
In-Reply-To: <20170323055435.29197-1-bjorn.andersson@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org

This adds the binding document describing the three hardware blocks
related to the Light Pulse Generator found in a wide range of Qualcomm
PMICs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 194 +++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
new file mode 100644
index 000000000000..fb9edd89119d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
@@ -0,0 +1,194 @@
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
+- cell-index:
+	Usage: required, when referencing a LUT
+	Value type: <u32>
+	Definition: id of the LPG, used to associate the LPG with a particular
+		    ramp generator in the LUT block
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
+- qcom,pattern:
+	Usage: optional
+	Value type: <u16-list>
+	Definition: list of 16 bit duty cycle values to make up the pattern to
+		    be programmed into the LUT. Values should be in the range
+		    [0,512).
+
+- qcom,pattern-length-ms:
+	Usage: optional
+	Value type: <u32>
+	Definition: duration, in milliseconds, of the ramp generator running
+		    one pass over the defined pattern
+
+- qcom,pattern-pause-lo-ms:
+	Usage: optional
+	Value type: <u32>
+	Definition: duration, in milliseconds, for the ramp generator to pause
+		    before iterating over the pattern
+
+- qcom,pattern-pause-hi-ms:
+	Usage: optional
+	Value type: <u32>
+	Definition: duration, in milliseconds, for the ramp generator to pause
+		    after iterating over the pattern
+
+- qcom,pattern-ping-pong:
+	Usage: optional
+	Value type: <boolean>
+	Definition: denotes that the ramp generator should reverse direction
+		    when reaching the end of the pattern, instead of wrapping
+		    to the beginning
+
+- qcom,pattern-oneshot:
+	Usage: optional
+	Value type: <boolean>
+	Definition: denotes that the ramp generator should stop after a single
+		    pass over the pattern
+
+- qcom,pattern-reverse:
+	Usage: optional
+	Value type: <boolean>
+	Definition: denotes that the ramp generator should operate backwards
+		    over the pattern
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
+into a LED in a natural pulsating pattern:
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
+			qcom,pattern = /bits/ 16 <9 20 42 86 158 256 353
+						  425 469 491 502 507>;
+			qcom,pattern-length-ms = <1337>;
+			qcom,pattern-ping-pong;
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
