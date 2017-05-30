From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [EXAMPLE V4 3/2] ARM: BCM53573: Specify ports for USB LED for Tenda AC9
Date: Tue, 30 May 2017 11:27:06 +0200
Message-ID: <20170530092706.927-4-zajec5@gmail.com>
References: <20170529140142.13496-2-zajec5@gmail.com>
 <20170530092706.927-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530092706.927-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
This patch *should not* be applied. It's only an EXAMPLE and that's why it uses
that weird 3/2 number.

It's a proof of concept, it was tested & will be submitted through ARM tree if
previous patches get accepted.

V3: Switch to the new binding
---
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts | 1 +
 arch/arm/boot/dts/bcm53573.dtsi          | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
index 34417dac1cd0..ee44dec7d7ec 100644
--- a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
+++ b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
@@ -26,6 +26,7 @@
 		usb {
 			label = "bcm53xx:blue:usb";
 			gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
+			trigger-sources = <&ohci_port1>, <&ehci_port1>;
 		};
 
 		wps {
diff --git a/arch/arm/boot/dts/bcm53573.dtsi b/arch/arm/boot/dts/bcm53573.dtsi
index eae623f76401..5c0b9b4d679a 100644
--- a/arch/arm/boot/dts/bcm53573.dtsi
+++ b/arch/arm/boot/dts/bcm53573.dtsi
@@ -138,10 +138,12 @@
 
 				ehci_port1: port@1 {
 					reg = <1>;
+					#source-cells = <0>;
 				};
 
 				ehci_port2: port@2 {
 					reg = <2>;
+					#source-cells = <0>;
 				};
 			};
 
@@ -158,10 +160,12 @@
 
 				ohci_port1: port@1 {
 					reg = <1>;
+					#source-cells = <0>;
 				};
 
 				ohci_port2: port@2 {
 					reg = <2>;
+					#source-cells = <0>;
 				};
 			};
 		};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
