From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/5] dt: bindings: lp8860: Add trigger binding to the lp8860
Date: Mon, 4 Dec 2017 15:20:24 -0600
Message-ID: <20171204212026.14214-4-dmurphy@ti.com>
References: <20171204212026.14214-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204212026.14214-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Add a default trigger optional node to the child node.
This will allow the driver to set the trigger for a backlight.

Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index e3a5e91f965b..40543e62da48 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -6,25 +6,28 @@ current sinks that can be controlled by a PWM input
 signal, a SPI/I2C master, or both.
 
 Required properties:
-	- compatible:
+	- compatible :
 		"ti,lp8860"
-	- reg -  I2C slave address
+	- reg :  I2C slave address
 
 Optional properties:
 	- label : see Documentation/devicetree/bindings/leds/common.txt
-	- enable-gpio - gpio pin to enable/disable the device.
-	- supply - "vled" - LED supply
+	- enable-gpios : gpio pin to enable/disable the device.
+	- supply : "vled" - LED supply
+	- linux,default-trigger : (optional)
+	   see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
 leds: leds@6 {
 	compatible = "ti,lp8860";
 	reg = <0x2d>;
-	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	vled-supply = <&vbatt>;
 
 	display_cluster: display_cluster@0 {
 		label = "display_cluster";
+		linux,default-trigger = "backlight";
 	};
 }
 
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
