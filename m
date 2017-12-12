From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 2/6] dt: bindings: lp8860: Update DT label binding
Date: Tue, 12 Dec 2017 16:01:39 -0600
Message-ID: <20171212220143.31210-3-dmurphy@ti.com>
References: <20171212220143.31210-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171212220143.31210-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Update the lp8860 label binding to the LED
standard as documented in

Documentation/devicetree/bindings/leds/common.txt

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v4 - No changes

v3 - Added address and size cells, updated label with color and inserted spaces
around the reg node - https://patchwork.kernel.org/patch/10093749/
v2 - Added reg to child node and made it required

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index b9d09acbaa73..c3d64ade1e26 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -9,20 +9,33 @@ Required properties:
 	- compatible :
 		"ti,lp8860"
 	- reg : I2C slave address
-	- label : Used for naming LEDs
+	- #address-cells : 1
+	- #size-cells : 0
 
 Optional properties:
 	- enable-gpios : gpio pin to enable (active high)/disable the device.
 	- vled-supply : LED supply
 
+Required child properties:
+	- reg : 0
+
+Optional child properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+
 Example:
 
 led-controller@2d {
 	compatible = "ti,lp8860";
+	#address-cells = <1>;
+	#size-cells = <0>;
 	reg = <0x2d>;
-	label = "display_cluster";
 	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	vled-supply = <&vbatt>;
+
+	led@0 {
+		reg = <0>;
+		label = "white:display_cluster";
+	};
 }
 
 For more product information please see the link below:
-- 
2.15.0.124.g7668cbc60
