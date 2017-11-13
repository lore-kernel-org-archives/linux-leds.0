From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] dt: bindings: lm3692x: Add bindings for lm3692x LED driver
Date: Mon, 13 Nov 2017 14:50:51 -0600
Message-ID: <20171113205052.25884-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

This adds the devicetree bindings for the LM3692x
I2C LED string driver.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/leds/leds-lm3692x.txt      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
new file mode 100644
index 000000000000..cfef67bd4100
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
@@ -0,0 +1,28 @@
+* Texas Instruments - LM3692x Highly Efficient Dual-String White LED Driver
+
+The LM36922 is an ultra-compact, highly efficient,
+two string white-LED driver designed for LCD display
+backlighting.
+
+Required properties:
+	- compatible:
+		"ti,lm3692x"
+	- reg -  I2C slave address
+
+Optional properties:
+	- label - Used for naming LEDs
+	- enable-gpio - gpio pin to enable/disable the device.
+	- supply - "vled" - LED supply
+
+Example:
+
+leds: leds@6 {
+	compatible = "ti,lm3692x";
+	reg = <0x36>;
+	label = "backlight_cluster";
+	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	vled-supply = <&vbatt>;
+}
+
+For more product information please see the link below:
+http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
-- 
2.15.0.124.g7668cbc60
