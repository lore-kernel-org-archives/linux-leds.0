From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 1/6] dt: bindings: lp8860: Update bindings for lp8860
Date: Tue, 5 Dec 2017 14:43:22 -0600
Message-ID: <20171205204327.12111-2-dmurphy@ti.com>
References: <20171205204327.12111-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205204327.12111-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Update the lp8860 bindings to fix various issues
found.  Add address-cells and size-cells, rename
enable-gpio to enable-gpios, update the node name
to the device name and indent the node example.

Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
---

v2 - New patch

 .../devicetree/bindings/leds/leds-lp8860.txt       | 28 ++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index aad38dd94d4b..1b2fab05ec6a 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -6,24 +6,28 @@ current sinks that can be controlled by a PWM input
 signal, a SPI/I2C master, or both.
 
 Required properties:
-	- compatible:
+	- compatible :
 		"ti,lp8860"
-	- reg -  I2C slave address
-	- label - Used for naming LEDs
+	- reg : I2C slave address
+	- label : Used for naming LEDs
+	- #address-cells : 1
+	- #size-cells : 0
 
 Optional properties:
-	- enable-gpio - gpio pin to enable/disable the device.
-	- supply - "vled" - LED supply
+	- enable-gpios : gpio pin to enable/disable the device.
+	- supply : "vled" - LED supply
 
 Example:
 
-leds: leds@6 {
-	compatible = "ti,lp8860";
-	reg = <0x2d>;
-	label = "display_cluster";
-	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	vled-supply = <&vbatt>;
-}
+	lp8860@2d {
+		compatible = "ti,lp8860";
+		#address-cells: 1
+		#size-cells: 0
+		reg = <0x2d>;
+		label = "display_cluster";
+		enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+		vled-supply = <&vbatt>;
+	}
 
 For more product information please see the link below:
 http://www.ti.com/product/lp8860-q1
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
