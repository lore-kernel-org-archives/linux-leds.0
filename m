From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [RESEND PATCH v3 2/4] dt: bindings: as3645a: Use LED number to refer to LEDs
Date: Fri, 22 Sep 2017 12:34:51 +0300
Message-ID: <20170922093453.13250-3-sakari.ailus@linux.intel.com>
References: <20170922093453.13250-1-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170922093453.13250-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Use integers (reg property) to tell the number of the LED to the driver
instead of the node name. While both of these approaches are currently
used by the LED bindings, using integers will require less driver changes
for ACPI support. Additionally, it will make possible LED naming using
chip and LED node names, effectively making the label property most useful
for human-readable names only.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Acked-by: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/leds/ams,as3645a.txt       | 28 ++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
index 12c5ef26ec73..fdc40e354a64 100644
--- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
+++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
@@ -15,11 +15,14 @@ Required properties
 
 compatible	: Must be "ams,as3645a".
 reg		: The I2C address of the device. Typically 0x30.
+#address-cells	: 1
+#size-cells	: 0
 
 
-Required properties of the "flash" child node
-=============================================
+Required properties of the flash child node (0)
+===============================================
 
+reg: 0
 flash-timeout-us: Flash timeout in microseconds. The value must be in
 		  the range [100000, 850000] and divisible by 50000.
 flash-max-microamp: Maximum flash current in microamperes. Has to be
@@ -33,20 +36,21 @@ ams,input-max-microamp: Maximum flash controller input current. The
 			and divisible by 50000.
 
 
-Optional properties of the "flash" child node
-=============================================
+Optional properties of the flash child node
+===========================================
 
 label		: The label of the flash LED.
 
 
-Required properties of the "indicator" child node
-=================================================
+Required properties of the indicator child node (1)
+===================================================
 
+reg: 1
 led-max-microamp: Maximum indicator current. The allowed values are
 		  2500, 5000, 7500 and 10000.
 
-Optional properties of the "indicator" child node
-=================================================
+Optional properties of the indicator child node
+===============================================
 
 label		: The label of the indicator LED.
 
@@ -55,16 +59,20 @@ Example
 =======
 
 	as3645a@30 {
+		#address-cells: 1
+		#size-cells: 0
 		reg = <0x30>;
 		compatible = "ams,as3645a";
-		flash {
+		flash@0 {
+			reg = <0x0>;
 			flash-timeout-us = <150000>;
 			flash-max-microamp = <320000>;
 			led-max-microamp = <60000>;
 			ams,input-max-microamp = <1750000>;
 			label = "as3645a:flash";
 		};
-		indicator {
+		indicator@1 {
+			reg = <0x1>;
 			led-max-microamp = <10000>;
 			label = "as3645a:indicator";
 		};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
