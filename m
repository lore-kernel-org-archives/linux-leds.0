From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [PATCHv5 1/2] leds: tlc591xx: Document binding for the TI 8/16 Channel i2c LED driver
Date: Wed, 21 Jan 2015 23:29:23 +0100
Message-ID: <1421879364-8573-2-git-send-email-andrew@lunn.ch>
References: <1421879364-8573-1-git-send-email-andrew@lunn.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421879364-8573-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, vigneshr-l0cyMroinI0@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Document the binding for the TLC591xx LED driver.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org
---
 .../devicetree/bindings/leds/leds-tlc591xx.txt     | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591xx.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt b/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
new file mode 100644
index 000000000000..3bbbf7024411
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
@@ -0,0 +1,40 @@
+LEDs connected to tlc59116 or tlc59108
+
+Required properties
+- compatible: should be "ti,tlc59116" or "ti,tlc59108"
+- #address-cells: must be 1
+- #size-cells: must be 0
+- reg: typically 0x68
+
+Each led is represented as a sub-node of the ti,tlc59116.
+See Documentation/devicetree/bindings/leds/common.txt
+
+LED sub-node properties:
+- reg: number of LED line, 0 to 15 or 0 to 7
+- label: (optional) name of LED
+- linux,default-trigger : (optional)
+
+Examples:
+
+tlc59116@68 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "ti,tlc59116";
+	reg = <0x68>;
+
+	wan@0 {
+		label = "wrt1900ac:amber:wan";
+		reg = <0x0>;
+	};
+
+	2g@2 {
+		label = "wrt1900ac:white:2g";
+		reg = <0x2>;
+	};
+
+	alive@9 {
+		label = "wrt1900ac:green:alive";
+		reg = <0x9>;
+		linux,default_trigger = "heartbeat";
+	};
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
