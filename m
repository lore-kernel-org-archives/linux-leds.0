From: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] leds: rt5033: add DT binding for RT5033
Date: Fri, 02 Oct 2015 18:41:14 +0900
Message-ID: <1443778875-18261-2-git-send-email-ingi2.kim@samsung.com>
References: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1443778875-18261-1-git-send-email-ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patch adds the device tree bindings for RT5033 flash LEDs.

Signed-off-by: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/leds/leds-rt5033.txt       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-rt5033.txt b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
new file mode 100644
index 0000000..2ef7bdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
@@ -0,0 +1,38 @@
+* Richtek Technology Corporation - RT5033 Flash LED Driver
+
+The RT5033 Flash LED Circuit is designed for one or two LEDs driving
+for torch and strobe applications, it provides an I2C software command
+to trigger the torch and strobe operation.
+
+Required properties:
+- compatible : Must be "richtek,rt5033-led".
+
+A discrete LED element connected to the device must be represented by a child
+node - see Documentation/devicetree/bindings/leds/common.txt.
+
+Required properties of the LED child node:
+  See Documentation/devicetree/bindings/leds/common.txt
+- led-max-microamp : Minimum Threshold for Timer protection
+  is defined internally (Maximum 200mA).
+- flash-max-microamp : Flash LED maximum current
+- flash-max-timeout-us : Flash LED maximum timeout
+
+Optional properties of the LED child node:
+- label : see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+rt5033 {
+	compatible = "richtek,rt5033";
+
+	led {
+		compatible = "richtek,rt5033-led";
+
+		flash-led {
+			label = "rt5033-flash";
+			led-max-microamp = <200000>;
+			flash-max-microamp = <800000>;
+			flash-max-timeout-us = <1216000>;
+		};
+	};
+}
-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
