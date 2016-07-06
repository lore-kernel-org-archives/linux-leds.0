From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3 v2] leds: pm8058: add device tree bindings
Date: Wed,  6 Jul 2016 23:42:00 +0200
Message-ID: <1467841320-11251-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This adds the device tree bindings for the PM8058 LEDs.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
ChangeLog v1->v2:
- Fix some spelling mistakes
- Reference common bindings directly without any local descriptions
---
 .../devicetree/bindings/leds/leds-pm8058.txt       | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-pm8058.txt b/Documentation/devicetree/bindings/leds/leds-pm8058.txt
new file mode 100644
index 000000000000..ee070e23fe61
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pm8058.txt
@@ -0,0 +1,67 @@
+Qualcomm PM8058 LED driver
+
+The Qualcomm PM8058 is a multi-functional device which contains
+an LED driver block for up to six LEDs: three normal LEDs, two
+"flash" LEDs and one "keypad backlight" LED. The names are
+quoted because sometimes these LED drivers are used for wildly
+different things than flash or keypad backlight: their names
+are more of a suggestion than a hard-wired usecase.
+
+Hardware-wise the different LEDs support slightly different
+output currents. The "flash" LEDs do not need to charge nor
+do they support external triggers. They are just powerful LED
+drivers.
+
+The LEDs appear as children to the PM8058 device, with the
+proper compatible string. For the PM8058 bindings see:
+mfd/qcom-pm8xxx.txt.
+
+Each LED is represented as a sub-node of the syscon device. Each
+node's name represents the name of the corresponding LED.
+
+LED sub-node properties:
+
+Required properties:
+- compatible: one of
+  "qcom,pm8058-led" (for the normal LEDs at 0x131, 0x132 and 0x133)
+  "qcom,pm8058-keypad-led" (for the "keypad" LED at 0x48)
+  "qcom,pm8058-flash-led" (for the "flash" LEDs at 0x49 and 0xFB)
+
+Optional properties:
+- label: see Documentation/devicetree/bindings/leds/common.txt
+- default-state: see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+qcom,ssbi@500000 {
+	pmicintc: pmic@0 {
+		compatible = "qcom,pm8058";
+		led@48 {
+			compatible = "qcom,pm8058-keypad-led";
+			reg = <0x48>;
+			label = "keypad";
+			default-state = "off";
+		};
+		led@131 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x131>;
+			label = "pm8058:red";
+			default-state = "off";
+		};
+		led@132 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x132>;
+			label = "pm8058:yellow";
+			default-state = "off";
+			linux,default-trigger = "mmc0";
+		};
+		led@133 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x133>;
+			label = "pm8058:green";
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
