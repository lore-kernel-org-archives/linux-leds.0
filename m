From: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: [PATCH v5 2/2] Bindings documentation for ISSI is31fl319x driver
Date: Tue, 19 Jul 2016 11:40:05 +0200
Message-ID: <d7598fd1396f37a501b5d4c2d4997e268d81c525.1468921204.git.hns@goldelico.com>
References: <cover.1468921204.git.hns@goldelico.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1468921204.git.hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
In-Reply-To: <cover.1468921204.git.hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
References: <cover.1468921204.git.hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-Jl6IXVxNIMRxAtABVqVhTwC/G2K4zDHf@public.gmane.org, marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org, letux-kernel-S0jZdbWzriLCfDggNXIi3w@public.gmane.org, Andrey Utkin <andrey_utkin-97jfqw80gc5Wk0Htik3J/w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Signed-off-by: H. Nikolaus Schaller <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
---
 .../devicetree/bindings/leds/is31fl319x.txt        | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt

diff --git a/Documentation/devicetree/bindings/leds/is31fl319x.txt b/Documentation/devicetree/bindings/leds/is31fl319x.txt
new file mode 100644
index 0000000..03287c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/is31fl319x.txt
@@ -0,0 +1,59 @@
+LEDs connected to is31fl319x LED controller chip
+
+Required properties:
+- compatible : Should be any of
+	"issi,is31fl3190"
+	"issi,is31fl3191"
+	"issi,is31fl3193"
+	"issi,is31fl3196"
+	"issi,is31fl3199"
+	"si-en,sn3199".
+- #address-cells: Must be 1.
+- #size-cells: Must be 0.
+- reg: 0x64, 0x65, 0x66, 0x67.
+
+Optional properties:
+- audio-gain-db : audio gain selection for external analog modulation input.
+	Valid values: 0 - 21, step by 3 (rounded down)
+	Default: 0
+
+Each led is represented as a sub-node of the issi,is31fl319x device.
+There can be less leds subnodes than the chip can support but not more.
+
+Required led sub-node properties:
+- reg : number of LED line
+	Valid values: 1 - number of leds supported by the chip variant.
+
+Optional led sub-node properties:
+- label : see Documentation/devicetree/bindings/leds/common.txt.
+- linux,default-trigger :
+	see Documentation/devicetree/bindings/leds/common.txt.
+- led-max-microamp : (optional)
+	Valid values: 5000 - 40000, step by 5000 (rounded down)
+	Default: 20000 (20 mA)
+	Note: a driver will take the lowest of all led limits since the
+	chip has a single global setting. The lowest value will be chosen
+	due to the PWM specificity, where lower brightness is achieved
+	by reducing the dury-cycle of pulses and not the current, which
+	will always have its peak value equal to led-max-microamp.
+
+Examples:
+
+fancy_leds: leds@65 {
+	compatible = "issi,is31fl3196";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x65>;
+
+	red_aux: led@1 {
+		label = "red:aux";
+		reg = <1>;
+		led-max-microamp = <10000>;
+	};
+
+	green_power: led@5 {
+		label = "green:power";
+		reg = <5>;
+		linux,default-trigger = "default-on";
+	};
+};
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
