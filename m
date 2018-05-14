From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: leds: Add SC27xx breathing light controller documentation
Date: Mon, 14 May 2018 14:34:50 +0800
Message-ID: <392631974080542c43b8e280a225d430d73b5ed4.1526279287.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: xiaotong.lu@spreadtrum.com, baolin.wang@linaro.org, broonie@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This patch adds the binding documentation for Spreadtrum SC27xx series
breathing light controller, which supports 3 outputs: red LED, green
LED and blue LED.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
Changes since v3:
 - Fix some grammar issues.
 - Add acked-by from Pavel.

Changes since v2:
 - Add reviewed-tag from Rob.

Changes since v1:
 - Change the compatible string to be one explicit SoC name.
 - Change the child node name.
 - Change to be upper case for the first character.
---
 .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  |   41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
new file mode 100644
index 0000000..dddf84f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
@@ -0,0 +1,41 @@
+LEDs connected to Spreadtrum SC27XX PMIC breathing light controller
+
+The SC27xx breathing light controller supports to 3 outputs:
+red LED, green LED and blue LED. Each LED can work at normal
+PWM mode or breath light mode.
+
+Required properties:
+- compatible: Should be "sprd,sc2731-bltc".
+- #address-cells: Must be 1.
+- #size-cells: Must be 0.
+- reg: Specify the controller address.
+
+Required child properties:
+- reg: Port this LED is connected to.
+
+Optional child properties:
+- label: See Documentation/devicetree/bindings/leds/common.txt.
+
+Examples:
+
+led-controller@200 {
+	compatible = "sprd,sc2731-bltc";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x200>;
+
+	led@0 {
+		label = "red";
+		reg = <0x0>;
+	};
+
+	led@1 {
+		label = "green";
+		reg = <0x1>;
+	};
+
+	led@2 {
+		label = "blue";
+		reg = <0x2>;
+	};
+};
-- 
1.7.9.5
