From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 2/6] dt: bindings: lp8860: Update DT label binding
Date: Tue, 5 Dec 2017 14:43:23 -0600
Message-ID: <20171205204327.12111-3-dmurphy@ti.com>
References: <20171205204327.12111-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205204327.12111-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Update the lp8860 label binding to the LED
standard as documented in

Documentation/devicetree/bindings/leds/common.txt

Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
---

v2 - Added reg to child node and made it required

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index 1b2fab05ec6a..22b594d95162 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -9,7 +9,6 @@ Required properties:
 	- compatible :
 		"ti,lp8860"
 	- reg : I2C slave address
-	- label : Used for naming LEDs
 	- #address-cells : 1
 	- #size-cells : 0
 
@@ -17,6 +16,12 @@ Optional properties:
 	- enable-gpios : gpio pin to enable/disable the device.
 	- supply : "vled" - LED supply
 
+Required child properties:
+	- reg : 0
+
+Optional child properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+
 Example:
 
 	lp8860@2d {
@@ -24,9 +29,12 @@ Example:
 		#address-cells: 1
 		#size-cells: 0
 		reg = <0x2d>;
-		label = "display_cluster";
 		enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 		vled-supply = <&vbatt>;
+		display_cluster: display_cluster@0 {
+			reg=<0>;
+			label = "display_cluster";
+		};
 	}
 
 For more product information please see the link below:
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
