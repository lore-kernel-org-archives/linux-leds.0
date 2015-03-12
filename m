From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH v4 1/2] leds: add DT binding for Qualcomm PM8941 WLED block
Date: Thu, 12 Mar 2015 08:47:07 -0700
Message-ID: <1426175228-29208-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

From: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

This adds device tree binding documentation for the WLED ('White' LED)
block on Qualcomm's PM8941 PMICs.

Signed-off-by: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
Changes since v3:
- None

Changes since v2:
- None

Changes since v1:
- None

 .../devicetree/bindings/leds/leds-pm8941-wled.txt  | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt b/Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt
new file mode 100644
index 0000000..a85a964
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt
@@ -0,0 +1,43 @@
+Binding for Qualcomm PM8941 WLED driver
+
+Required properties:
+- compatible: should be "qcom,pm8941-wled"
+- reg: slave address
+
+Optional properties:
+- label: The label for this led
+  See Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger: Default trigger assigned to the LED
+  See Documentation/devicetree/bindings/leds/common.txt
+- qcom,cs-out: bool; enable current sink output
+- qcom,cabc: bool; enable content adaptive backlight control
+- qcom,ext-gen: bool; use externally generated modulator signal to dim
+- qcom,current-limit: mA; per-string current limit; value from 0 to 25
+	default: 20mA
+- qcom,current-boost-limit: mA; boost current limit; one of:
+	105, 385, 525, 805, 980, 1260, 1400, 1680
+	default: 805mA
+- qcom,switching-freq: kHz; switching frequency; one of:
+	600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371,
+	1600, 1920, 2400, 3200, 4800, 9600,
+	default: 1600kHz
+- qcom,ovp: V; Over-voltage protection limit; one of:
+	27, 29, 32, 35
+	default: 29V
+- qcom,num-strings: #; number of led strings attached; value from 1 to 3
+	default: 2
+
+Example:
+
+pm8941-wled@d800 {
+	compatible = "qcom,pm8941-wled";
+	reg = <0xd800>;
+	label = "backlight";
+
+	qcom,cs-out;
+	qcom,current-limit = <20>;
+	qcom,current-boost-limit = <805>;
+	qcom,switching-freq = <1600>;
+	qcom,ovp = <29>;
+	qcom,num-strings = <2>;
+};
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
