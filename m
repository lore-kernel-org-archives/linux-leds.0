From: Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V4 2/8] backlight: qcom-wled: restructure the qcom-wled bindings
Date: Mon,  9 Jul 2018 15:52:15 +0530
Message-ID: <1531131741-19971-3-git-send-email-kgunda@codeaurora.org>
References: <1531131741-19971-1-git-send-email-kgunda@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531131741-19971-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

Restructure the qcom-wled bindings for the better readability.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Changes from V3:
	Added Reviewed-by and Acked-by tags.

 .../bindings/leds/backlight/qcom-wled.txt          | 110 ++++++++++++++++-----
 1 file changed, 85 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
index fb39e32..14f28f2 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
@@ -1,30 +1,90 @@
 Binding for Qualcomm Technologies, Inc. WLED driver
 
-Required properties:
-- compatible: should be "qcom,pm8941-wled"
-- reg: slave address
-
-Optional properties:
-- default-brightness: brightness value on boot, value from: 0-4095
-	default: 2048
-- label: The name of the backlight device
-- qcom,cs-out: bool; enable current sink output
-- qcom,cabc: bool; enable content adaptive backlight control
-- qcom,ext-gen: bool; use externally generated modulator signal to dim
-- qcom,current-limit: mA; per-string current limit; value from 0 to 25
-	default: 20mA
-- qcom,current-boost-limit: mA; boost current limit; one of:
-	105, 385, 525, 805, 980, 1260, 1400, 1680
-	default: 805mA
-- qcom,switching-freq: kHz; switching frequency; one of:
-	600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371,
-	1600, 1920, 2400, 3200, 4800, 9600,
-	default: 1600kHz
-- qcom,ovp: V; Over-voltage protection limit; one of:
-	27, 29, 32, 35
-	default: 29V
-- qcom,num-strings: #; number of led strings attached; value from 1 to 3
-	default: 2
+WLED (White Light Emitting Diode) driver is used for controlling display
+backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
+platforms. The PMIC is connected to the host processor via SPMI bus.
+
+- compatible
+	Usage:        required
+	Value type:   <string>
+	Definition:   should be one of:
+			"qcom,pm8941-wled"
+			"qcom,pmi8998-wled"
+			"qcom,pm660l-wled"
+
+- reg
+	Usage:        required
+	Value type:   <prop encoded array>
+	Definition:   Base address of the WLED modules.
+
+- default-brightness
+	Usage:        optional
+	Value type:   <u32>
+	Definition:   brightness value on boot, value from: 0-4095
+		      Default: 2048
+
+- label
+	Usage:        required
+	Value type:   <string>
+	Definition:   The name of the backlight device
+
+- qcom,cs-out
+	Usage:        optional
+	Value type:   <bool>
+	Definition:   enable current sink output.
+		      This property is supported only for PM8941.
+
+- qcom,cabc
+	Usage:        optional
+	Value type:   <bool>
+	Definition:   enable content adaptive backlight control.
+
+- qcom,ext-gen
+	Usage:        optional
+	Value type:   <bool>
+	Definition:   use externally generated modulator signal to dim.
+		      This property is supported only for PM8941.
+
+- qcom,current-limit
+	Usage:        optional
+	Value type:   <u32>
+	Definition:   mA; per-string current limit
+		      value: For pm8941: from 0 to 25 with 5 mA step
+			     Default 20 mA.
+			     For pmi8998: from 0 to 30 with 5 mA step
+			     Default 25 mA.
+
+- qcom,current-boost-limit
+	Usage:        optional
+	Value type:   <u32>
+	Definition:   mA; boost current limit.
+		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
+		      1680. Default: 805 mA
+		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
+		      1500. Default: 970 mA
+
+- qcom,switching-freq
+	Usage:        optional
+	Value type:   <u32>
+	 Definition:   kHz; switching frequency; one of: 600, 640, 685, 738,
+		       800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
+		       4800, 9600.
+		       Default: for pm8941: 1600 kHz
+				for pmi8998: 800 kHz
+
+- qcom,ovp
+	Usage:        optional
+	Value type:   <u32>
+	Definition:   V; Over-voltage protection limit; one of:
+		      27, 29, 32, 35. default: 29V
+		      This property is supported only for PM8941.
+
+- qcom,num-strings
+	Usage:        optional
+	Value type:   <u32>
+	Definition:   #; number of led strings attached;
+		      value from 1 to 3. default: 2
+		      This property is supported only for PM8941.
 
 Example:
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
