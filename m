From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 1/2] leds: add DT binding for BCM6358 LED controller
Date: Thu, 21 May 2015 19:11:09 +0200
Message-ID: <1432228270-21891-2-git-send-email-noltari@gmail.com>
References: <1432055578-14089-1-git-send-email-noltari@gmail.com>
 <1432228270-21891-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:33649 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754119AbbEURK6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 May 2015 13:10:58 -0400
In-Reply-To: <1432228270-21891-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, j.anaszewski@samsung.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This adds device tree binding documentation for the Broadcom BCM6358 LE=
D controller.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: resend, no changes.

 .../devicetree/bindings/leds/leds-bcm6358.txt      | 145 +++++++++++++=
++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358=
=2Etxt

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt b/=
Documentation/devicetree/bindings/leds/leds-bcm6358.txt
new file mode 100644
index 0000000..b22a55b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
@@ -0,0 +1,145 @@
+LEDs connected to Broadcom BCM6358 controller
+
+This controller is present on BCM6358 and BCM6368.
+In these SoCs there are Serial LEDs (LEDs connected to a 74x164 contro=
ller),
+which can either be controlled by software (exporting the 74x164 as sp=
i-gpio.
+See Documentation/devicetree/bindings/gpio/gpio-74x164.txt), or
+by hardware using this driver.
+
+Required properties:
+  - compatible : should be "brcm,bcm6358-leds".
+  - #address-cells : must be 1.
+  - #size-cells : must be 0.
+  - reg : BCM6358 LED controller address and size.
+
+Optional properties:
+  - brcm,clk-div : SCK signal divider. Possible values are 1, 2, 4 and=
 8.
+    Default : 1
+  - brcm,clk-dat-low : Boolean, makes clock and data signals active lo=
w.
+    Default : false
+
+Each LED is represented as a sub-node of the brcm,bcm6358-leds device.
+
+LED sub-node required properties:
+  - reg : LED pin number (only LEDs 0 to 31 are valid).
+
+LED sub-node optional properties:
+  - label : see Documentation/devicetree/bindings/leds/common.txt
+  - active-low : Boolean, makes LED active low.
+    Default : false
+  - default-state : see
+    Documentation/devicetree/bindings/leds/leds-gpio.txt
+  - linux,default-trigger : see
+    Documentation/devicetree/bindings/leds/common.txt
+
+Examples:
+Scenario 1 : BCM6358
+	leds0: led-controller@fffe00d0 {
+		compatible =3D "brcm,bcm6358-leds";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		reg =3D <0xfffe00d0 0x8>;
+
+		alarm_white {
+			reg =3D <0>;
+			active-low;
+			label =3D "white:alarm";
+		};
+		tv_white {
+			reg =3D <2>;
+			active-low;
+			label =3D "white:tv";
+		};
+		tel_white {
+			reg =3D <3>;
+			active-low;
+			label =3D "white:tel";
+		};
+		adsl_white {
+			reg =3D <4>;
+			active-low;
+			label =3D "white:adsl";
+		};
+	};
+
+Scenario 2 : BCM6368
+	leds0: led-controller@100000d0 {
+		compatible =3D "brcm,bcm6358-leds";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		reg =3D <0x100000d0 0x8>;
+		brcm,pol-low;
+		brcm,clk-div =3D <4>;
+
+		power_red {
+			reg =3D <0>;
+			active-low;
+			label =3D "red:power";
+		};
+		power_green {
+			reg =3D <1>;
+			active-low;
+			label =3D "green:power";
+			default-state =3D "on";
+		};
+		power_blue {
+			reg =3D <2>;
+			label =3D "blue:power";
+		};
+		broadband_red {
+			reg =3D <3>;
+			active-low;
+			label =3D "red:broadband";
+		};
+		broadband_green {
+			reg =3D <4>;
+			label =3D "green:broadband";
+		};
+		broadband_blue {
+			reg =3D <5>;
+			active-low;
+			label =3D "blue:broadband";
+		};
+		wireless_red {
+			reg =3D <6>;
+			active-low;
+			label =3D "red:wireless";
+		};
+		wireless_green {
+			reg =3D <7>;
+			active-low;
+			label =3D "green:wireless";
+		};
+		wireless_blue {
+			reg =3D <8>;
+			label =3D "blue:wireless";
+		};
+		phone_red {
+			reg =3D <9>;
+			active-low;
+			label =3D "red:phone";
+		};
+		phone_green {
+			reg =3D <10>;
+			active-low;
+			label =3D "green:phone";
+		};
+		phone_blue {
+			reg =3D <11>;
+			label =3D "blue:phone";
+		};
+		upgrading_red {
+			reg =3D <12>;
+			active-low;
+			label =3D "red:upgrading";
+		};
+		upgrading_green {
+			reg =3D <13>;
+			active-low;
+			label =3D "green:upgrading";
+		};
+		upgrading_blue {
+			reg =3D <14>;
+			label =3D "blue:upgrading";
+		};
+	};
--=20
1.9.1
