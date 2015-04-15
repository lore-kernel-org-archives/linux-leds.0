From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 02/10] DT: Add documentation for the mfd Maxim max77693
Date: Wed, 15 Apr 2015 08:48:32 +0200
Message-ID: <1429080520-10687-3-git-send-email-j.anaszewski@samsung.com>
References: <1429080520-10687-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1429080520-10687-1-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

This patch adds device tree binding documentation for
the flash cell of the Maxim max77693 multifunctional device.

Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/mfd/max77693.txt |   67 ++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
index 38e6440..d342584 100644
--- a/Documentation/devicetree/bindings/mfd/max77693.txt
+++ b/Documentation/devicetree/bindings/mfd/max77693.txt
@@ -76,7 +76,60 @@ Optional properties:
     Valid values: 4300000, 4700000, 4800000, 4900000
     Default: 4300000
 
+- led : the LED submodule device node
+
+There are two LED outputs available - FLED1 and FLED2. Each of them can
+control a separate LED or they can be connected together to double
+the maximum current for a single connected LED. One LED is represented
+by one child node.
+
+Required properties:
+- compatible : Must be "maxim,max77693-led".
+
+Optional properties:
+- maxim,boost-mode :
+	In boost mode the device can produce up to 1.2A of total current
+	on both outputs. The maximum current on each output is reduced
+	to 625mA then. If not enabled explicitly, boost setting defaults to
+	LEDS_BOOST_FIXED in case both current sources are used.
+	Possible values:
+		LEDS_BOOST_OFF (0) - no boost,
+		LEDS_BOOST_ADAPTIVE (1) - adaptive mode,
+		LEDS_BOOST_FIXED (2) - fixed mode.
+- maxim,boost-mvout : Output voltage of the boost module in millivolts.
+	Valid values: 3300 - 5500, step by 25 (rounded down)
+	Default: 3300
+- maxim,mvsys-min : Low input voltage level in millivolts. Flash is not fired
+	if chip estimates that system voltage could drop below this level due
+	to flash power consumption.
+	Valid values: 2400 - 3400, step by 33 (rounded down)
+	Default: 2400
+
+Required properties for the LED child node:
+- led-sources : see Documentation/devicetree/bindings/leds/common.txt;
+		device current output identifiers: 0 - FLED1, 1 - FLED2
+- led-max-microamp : see Documentation/devicetree/bindings/leds/common.txt
+	Valid values for a LED connected to one FLED output:
+		15625 - 250000, step by 15625 (rounded down)
+	Valid values for a LED connected to both FLED outputs:
+		15625 - 500000, step by 15625 (rounded down)
+- flash-max-microamp : see Documentation/devicetree/bindings/leds/common.txt
+	Valid values for a single LED connected to one FLED output:
+	(boost mode must be turned off):
+		15625 - 1000000, step by 15625 (rounded down)
+	Valid values for a single LED connected to both FLED outputs:
+		15625 - 1250000, step by 15625 (rounded down)
+	Valid values for two LEDs case:
+		15625 - 625000, step by 15625 (rounded down)
+- flash-max-timeout-us : see Documentation/devicetree/bindings/leds/common.txt
+	Valid values: 62500 - 1000000, step by 62500 (rounded down)
+
+Optional properties for the LED child node:
+- label : see Documentation/devicetree/bindings/leds/common.txt
+
 Example:
+#include <dt-bindings/leds/common.h>
+
 	max77693@66 {
 		compatible = "maxim,max77693";
 		reg = <0x66>;
@@ -117,5 +170,19 @@ Example:
 			maxim,thermal-regulation-celsius = <75>;
 			maxim,battery-overcurrent-microamp = <3000000>;
 			maxim,charge-input-threshold-microvolt = <4300000>;
+
+		led {
+			compatible = "maxim,max77693-led";
+			maxim,boost-mode = <LEDS_BOOST_FIXED>;
+			maxim,boost-mvout = <5000>;
+			maxim,mvsys-min = <2400>;
+
+			camera_flash: flash-led {
+				label = "max77693-flash";
+				led-sources = <0>, <1>;
+				led-max-microamp = <500000>;
+				flash-max-microamp = <1250000>;
+				flash-max-timeout-us = <1000000>;
+			};
 		};
 	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
