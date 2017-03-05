From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: motorola-cpcap-mapphone: add LEDs
Date: Sun,  5 Mar 2017 18:22:34 +0100
Message-ID: <20170305172234.24120-2-sre@kernel.org>
References: <20170305172234.24120-1-sre@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170305172234.24120-1-sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
index 9970985e685b..e02982d69854 100644
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -38,6 +38,36 @@
 
 			interrupts = <23 IRQ_TYPE_NONE>;
 		};
+
+		led_red: led-red {
+			compatible = "motorola,cpcap-led-red";
+			vdd-supply = <&sw5>;
+			label = "status-led:red";
+		};
+
+		led_green: led-green {
+			compatible = "motorola,cpcap-led-green";
+			vdd-supply = <&sw5>;
+			label = "status-led:green";
+		};
+
+		led_blue: led-blue {
+			compatible = "motorola,cpcap-led-blue";
+			vdd-supply = <&sw5>;
+			label = "status-led:blue";
+		};
+
+		led_adl: led-adl {
+			compatible = "motorola,cpcap-led-adl";
+			vdd-supply = <&sw5>;
+			label = "button-backlight";
+		};
+
+		led_cp: led-cp {
+			compatible = "motorola,cpcap-led-cp";
+			vdd-supply = <&sw5>;
+			label = "shift-key-light";
+		};
 	};
 };
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
