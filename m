From: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] leds: ncp5623: Add device tree binding documentation
Date: Tue, 21 Jun 2016 09:29:13 +0200
Message-ID: <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466494154-3786-1-git-send-email-florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Add device tree binding documentation for On Semiconductor NCP5623 I2C
LED driver. The driver can independently control the PWM of the 3
channels with 32 levels of intensity.

The current delivered by the current source can be controlled using the
led-max-microamp property. In order to control this value, it is also
necessary to know the current on the Iref pin, hence the
onnn,led-iref-microamp property. It is usually set using an external
bias resistor, following Iref = Vref/Rbias with Vref=0.6V.

Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
---
 .../devicetree/bindings/leds/leds-ncp5623.txt      | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp5623.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.txt b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
new file mode 100644
index 0000000..0dc8345
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
@@ -0,0 +1,44 @@
+* ON Semiconductor - NCP5623 3-Channel LED Driver
+
+The NCP5623 is a 3-channel I2C LED driver. The brightness of each
+channel can be independently set using 32 levels. Each LED is represented
+as a sub-node of the device.
+
+Required properties:
+  - compatible: Should be "onnn,ncp5623"
+  - reg: I2C slave address (fixed to 0x38)
+  - #address-cells: must be 1
+  - #size-cells: must be 0
+  - onnn,led-iref-microamp: Current on the Iref pin in microampere
+  - led-max-microamp: Desired maximum current for each LED in microampere
+                      (maximum 30000uA)
+
+LED sub-node properties:
+  - reg : LED channel number (0..2)
+  - For other LED properties see:
+      Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+led1: ncp5623@38 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "onnn,ncp5623";
+	reg = <0x38>;
+
+	led1_r@0 {
+		label = "ncp:power:red";
+		reg = <0>;
+		linux,default-trigger = "default-on";
+	};
+
+	led1_b@1 {
+		label = "ncp:power:blue";
+		reg = <1>;
+	};
+
+	led1_g@2 {
+		label = "ncp:power:green";
+		reg = <2>;
+	};
+};
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
