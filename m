From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] leds: pm8058: add device tree bindings
Date: Wed, 29 Jun 2016 16:21:58 +0200
Message-ID: <1467210120-8829-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-leds@vger.kernel.org

This adds the device tree bindings for the PM8058 LEDs.

Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/leds/leds-pm8058.txt       | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-pm8058.txt b/Documentation/devicetree/bindings/leds/leds-pm8058.txt
new file mode 100644
index 000000000000..5d4e6369b9f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pm8058.txt
@@ -0,0 +1,67 @@
+Qualcomm PM8058 LED driver
+
+The Qualcomm PM8058 is a multi-functional device which contain
+a LED driver block for up to six LEDs: three normal LEDs, two
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
+- compatible: on of
+  "qcom,pm8058-led" (for the normal LEDs at 0x131, 0x132 and 0x133)
+  "qcom,pm8058-keypad-led" (for the "keypad" LED at 0x48)
+  "qcom,pm8058-flash-led" (for the "flash" LEDs at 0x49 and 0xFB)
+
+Optional properties:
+- label: descriptive name for the LED see common.txt
+- default-state: The initial state of the LED see common.txt
+- linux,default-trigger: Linux trigger, see common.txt
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
2.4.11
