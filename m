From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 1/2] dt: bindings: lm3692x: Add bindings for lm3692x LED driver
Date: Tue, 28 Nov 2017 14:40:20 -0600
Message-ID: <20171128204021.12699-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

This adds the devicetree bindings for the LM3692x
I2C LED string driver.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v4 - Fix example node, added trigger entry, removed ambiguous x for compatible and
added common.txt pointer for label - https://patchwork.kernel.org/patch/10060107
v3 - No changes
v2 - No changes - https://patchwork.kernel.org/patch/10056677/

 .../devicetree/bindings/leds/leds-lm3692x.txt      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
new file mode 100644
index 000000000000..c259cde2226f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
@@ -0,0 +1,39 @@
+* Texas Instruments - LM3692x Highly Efficient White LED Driver
+
+The LM3692x is an ultra-compact, highly efficient,
+white-LED driver designed for LCD display backlighting.
+
+The main difference between the LM36922 and LM36923 is the number of
+LED strings it supports.  The LM36922 supports two strings while the LM36923
+supports three strings.
+
+Required properties:
+	- compatible:
+		"ti,lm36922"
+		"ti,lm36923"
+	- reg :  I2C slave address
+
+Optional properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- enable-gpios : gpio pin to enable/disable the device.
+	- vled-supply : LED supply
+	- linux,default-trigger : (optional)
+	   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+lm3692x@36 {
+	compatible = "ti,lm3692x";
+	reg = <0x36>;
+
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	vled-supply = <&vbatt>;
+
+	backlight: backlight@0 {
+		label = "backlight_cluster";
+		linux,default-trigger = "backlight";
+	};
+}
+
+For more product information please see the link below:
+http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
-- 
2.15.0.124.g7668cbc60
