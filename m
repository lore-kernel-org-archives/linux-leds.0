From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v3 1/2] dt-bindings: leds: document Panasonic AN30259A bindings
Date: Sun, 22 Jul 2018 00:12:26 +1000
Message-ID: <20180721141228.2283-2-simon@lineageos.org>
References: <20180721141228.2283-1-simon@lineageos.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180721141228.2283-1-simon@lineageos.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Simon Shields <simon@lineageos.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Signed-off-by: Simon Shields <simon@lineageos.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/leds/leds-an30259a.txt           | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
new file mode 100644
index 000000000000..6ffb861083c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
@@ -0,0 +1,43 @@
+* Panasonic AN30259A 3-channel LED driver
+
+The AN30259A is a LED controller capable of driving three LEDs independently. It supports
+constant current output and sloping current output modes. The chip is connected over I2C.
+
+Required properties:
+	- compatible: Must be "panasonic,an30259a".
+	- reg: I2C slave address.
+	- #address-cells: Must be 1.
+	- #size-cells: Must be 0.
+
+Each LED is represented as a sub-node of the panasonic,an30259a node.
+
+Required sub-node properties:
+	- reg: Pin that the LED is connected to. Must be 1, 2, or 3.
+
+Optional sub-node properties:
+	- label: see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+led-controller@30 {
+	compatible = "panasonic,an30259a";
+	reg = <0x30>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led@1 {
+		reg = <1>;
+		linux,default-trigger = "heartbeat";
+		label = "red:indicator";
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "green:indicator";
+	};
+
+	led@3 {
+		reg = <3>;
+		label = "blue:indicator";
+	};
+};
-- 
2.18.0
