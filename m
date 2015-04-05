From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 1/2] leds: add DT binding for BCM6328 LED controller
Date: Sun,  5 Apr 2015 17:08:04 +0200
Message-ID: <1428246485-32305-2-git-send-email-noltari@gmail.com>
References: <1427975661-29964-1-git-send-email-noltari@gmail.com>
 <1428246485-32305-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:35285 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751989AbbDEPIG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 5 Apr 2015 11:08:06 -0400
Received: by wgdm6 with SMTP id m6so10126649wgd.2
        for <linux-leds@vger.kernel.org>; Sun, 05 Apr 2015 08:08:05 -0700 (PDT)
In-Reply-To: <1428246485-32305-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This adds device tree binding documentation for the Broadcom BCM6328 LE=
D
controller.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
v2: Introduce changes suggested by Florian and Jonas.
 - Change compatible string to "brcm,bcm6328-leds-ctrl".
 - Make valid LEDs statement more strict.
 - Remove compatible strings from LED subnodes.
 - Clarify that LEDs are active high by default.
 - Add a better description for brcm,link-signal-sources and brcm,activ=
ity-signal-sources.

 .../devicetree/bindings/leds/leds-bcm6328.txt      | 162 +++++++++++++=
++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328=
=2Etxt

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/=
Documentation/devicetree/bindings/leds/leds-bcm6328.txt
new file mode 100644
index 0000000..6e4f5563a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
@@ -0,0 +1,162 @@
+LEDs connected to Broadcom BCM6328 controller
+
+Required properties:
+- compatible: should be : "brcm,bcm6328-leds-ctrl".
+- #address-cells: must be 1
+- #size-cells: must be 0
+- reg: BCM6328 LED controller address and size.
+
+Optional properties:
+- brcm,serial-leds: boolean which enables Serial LEDs.
+
+Each LED is represented as a sub-node of the brcm,bcm6328-leds device.
+
+LED sub-node properties:
+- reg: LED pin number (only LEDs 0 to 23 are valid).
+
+Normal LED:
+LEDs are active high by default.
+- label (optional): see Documentation/devicetree/bindings/leds/common.=
txt
+- active-low (optional): boolean that makes LED active low.
+- default-state (optional): see
+  Documentation/devicetree/bindings/leds/leds-gpio.txt
+- linux,default-trigger (optional): see
+  Documentation/devicetree/bindings/leds/common.txt
+
+Hardware controlled LED:
+- brcm,hardware-controlled (optional): boolean that makes this LED har=
dware
+  controlled.
+- brcm,link-signal-sources (optional): An array of hardware link
+  signal sources. Up to four link hardware signals can get muxed into
+  these LEDs. Only valid for LEDs 0 to 7, where LED signals 0 to 3 may
+  be muxed to LEDs 0 to 3, and signals 4 to 7 may be muxed to LEDs
+  4 to 7. A signal can be muxed to more than one LED, and one LED can
+  have more than one source signal.
+- brcm,activity-signal-sources (optional): An array of hardware activi=
ty
+  signal sources. Up to four activity hardware signals can get muxed i=
nto
+  these LEDs. Only valid for LEDs 0 to 7, where LED signals 0 to 3 may
+  be muxed to LEDs 0 to 3, and signals 4 to 7 may be muxed to LEDs
+  4 to 7. A signal can be muxed to more than one LED, and one LED can
+  have more than one source signal.
+
+example 1) BCM6328
+
+leds0: led-controller@10000800 {
+	compatible =3D "brcm,bcm6328-leds-ctrl";
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+	reg =3D <0x10000800 0x24>;
+
+	alarm_red@2 {
+		reg =3D <2>;
+		active-low;
+		label =3D "red:alarm";
+	};
+	inet_green@3 {
+		reg =3D <3>;
+		active-low;
+		label =3D "green:inet";
+	};
+	power_green@4 {
+		reg =3D <4>;
+		active-low;
+		label =3D "green:power";
+		default-state =3D "on";
+	};
+	ephy0_spd@17 {
+		reg =3D <17>;
+		brcm,hardware-controlled;
+	};
+	ephy1_spd@18 {
+		reg =3D <18>;
+		brcm,hardware-controlled;
+	};
+	ephy2_spd@19 {
+		reg =3D <19>;
+		brcm,hardware-controlled;
+	};
+	ephy3_spd@20 {
+		reg =3D <20>;
+		brcm,hardware-controlled;
+	};
+};
+
+example 2) BCM63268
+
+leds0: led-controller@10001900 {
+	compatible =3D "brcm,bcm6328-leds-ctrl";
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+	reg =3D <0x10001900 0x24>;
+	brcm,serial-leds;
+
+	gphy0_spd0@0 {
+		reg =3D <0>;
+		brcm,hardware-controlled;
+		brcm,link-signal-sources =3D <0>;
+	};
+	gphy0_spd1@1 {
+		reg =3D <1>;
+		brcm,hardware-controlled;
+		brcm,link-signal-sources =3D <1>;
+	};
+	inet_red@2 {
+		reg =3D <2>;
+		active-low;
+		label =3D "red:inet";
+	};
+	dsl_green@3 {
+		reg =3D <3>;
+		active-low;
+		label =3D "green:dsl";
+	};
+	usb_green@4 {
+		reg =3D <4>;
+		active-low;
+		label =3D "green:usb";
+	};
+	wps_green@7 {
+		reg =3D <7>;
+		active-low;
+		label =3D "green:wps";
+	};
+	inet_green@8 {
+		reg =3D <8>;
+		active-low;
+		label =3D "green:inet";
+	};
+	ephy0_act@9 {
+		reg =3D <9>;
+		brcm,hardware-controlled;
+	};
+	ephy1_act@10 {
+		reg =3D <10>;
+		brcm,hardware-controlled;
+	};
+	ephy2_act@11 {
+		reg =3D <11>;
+		brcm,hardware-controlled;
+	};
+	gphy0_act@12 {
+		reg =3D <12>;
+		brcm,hardware-controlled;
+	};
+	ephy0_spd@13 {
+		reg =3D <13>;
+		brcm,hardware-controlled;
+	};
+	ephy1_spd@14 {
+		reg =3D <14>;
+		brcm,hardware-controlled;
+	};
+	ephy2_spd@15 {
+		reg =3D <15>;
+		brcm,hardware-controlled;
+	};
+	power_green@20 {
+		reg =3D <20>;
+		active-low;
+		label =3D "green:power";
+		default-state =3D "on";
+	};
+};
--=20
1.9.1
