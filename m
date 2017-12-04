From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/5] dt: bindings: lp8860: Update DT label binding
Date: Mon, 4 Dec 2017 15:20:22 -0600
Message-ID: <20171204212026.14214-2-dmurphy@ti.com>
References: <20171204212026.14214-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204212026.14214-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Update the lp8860 label binding to the LED
standard as documented in

Documentation/devicetree/bindings/leds/common.txt

Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index aad38dd94d4b..e3a5e91f965b 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -9,9 +9,9 @@ Required properties:
 	- compatible:
 		"ti,lp8860"
 	- reg -  I2C slave address
-	- label - Used for naming LEDs
 
 Optional properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
 	- enable-gpio - gpio pin to enable/disable the device.
 	- supply - "vled" - LED supply
 
@@ -20,9 +20,12 @@ Example:
 leds: leds@6 {
 	compatible = "ti,lp8860";
 	reg = <0x2d>;
-	label = "display_cluster";
 	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	vled-supply = <&vbatt>;
+
+	display_cluster: display_cluster@0 {
+		label = "display_cluster";
+	};
 }
 
 For more product information please see the link below:
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
