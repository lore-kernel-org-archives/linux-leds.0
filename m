From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v5 1/6] dt: bindings: lp8860: Update bindings for lp8860
Date: Mon, 18 Dec 2017 14:23:02 -0600
Message-ID: <20171218202307.4913-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Update the lp8860 bindings to fix various issues
found.  Rename enable-gpio to enable-gpios,
update the node name to the device name and
indent the node example.

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
---

v5 - Update commit message to remove address and size cells - https://patchwork.kernel.org/patch/10108357/

v4 - No changes
v3 - Indicatd enable-gpios is active high, moved address and size cells to child
node patch and updated parent DT node name - https://patchwork.kernel.org/patch/10093745/
v2 - New patch

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index aad38dd94d4b..b9d09acbaa73 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -6,22 +6,22 @@ current sinks that can be controlled by a PWM input
 signal, a SPI/I2C master, or both.
 
 Required properties:
-	- compatible:
+	- compatible :
 		"ti,lp8860"
-	- reg -  I2C slave address
-	- label - Used for naming LEDs
+	- reg : I2C slave address
+	- label : Used for naming LEDs
 
 Optional properties:
-	- enable-gpio - gpio pin to enable/disable the device.
-	- supply - "vled" - LED supply
+	- enable-gpios : gpio pin to enable (active high)/disable the device.
+	- vled-supply : LED supply
 
 Example:
 
-leds: leds@6 {
+led-controller@2d {
 	compatible = "ti,lp8860";
 	reg = <0x2d>;
 	label = "display_cluster";
-	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	vled-supply = <&vbatt>;
 }
 
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
