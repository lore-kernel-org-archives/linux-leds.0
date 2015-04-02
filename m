From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 1/2] leds: add DT binding for BCM6328 LED controller
Date: Thu,  2 Apr 2015 13:54:20 +0200
Message-ID: <1427975661-29964-2-git-send-email-noltari@gmail.com>
References: <1427975661-29964-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:34751 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252AbbDBLyV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 2 Apr 2015 07:54:21 -0400
Received: by wgbdm7 with SMTP id dm7so82879964wgb.1
        for <linux-leds@vger.kernel.org>; Thu, 02 Apr 2015 04:54:20 -0700 (PDT)
In-Reply-To: <1427975661-29964-1-git-send-email-noltari@gmail.com>
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
 .../devicetree/bindings/leds/leds-bcm6328.txt      | 173 +++++++++++++=
++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328=
=2Etxt

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/=
Documentation/devicetree/bindings/leds/leds-bcm6328.txt
new file mode 100644
index 0000000..e63d27f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
@@ -0,0 +1,173 @@
+LEDs connected to Broadcom BCM6328 controller
+
+Required properties:
+- compatible : should be : "brcm,bcm6328-leds".
+- #address-cells: must be 1
+- #size-cells: must be 0
+- reg: BCM6328 LED controller address and size.
+
+Optional properties:
+- brcm,serial-leds: enable Serial LEDs.
+
+Each led is represented as a sub-node of the brcm,bcm6328-leds device.
+
+LED sub-node properties:
+- reg : LED pin number (could be from 0 to 23).
+- compatible : should be : "brcm,bcm6328-led".
+
+Normal LED:
+- label (optional) : see Documentation/devicetree/bindings/leds/common=
=2Etxt
+- active-low (optional) : LED is active low.
+- default-state (optional): see
+  Documentation/devicetree/bindings/leds/leds-gpio.txt
+- linux,default-trigger (optional): see
+  Documentation/devicetree/bindings/leds/common.txt
+
+Hardware controlled LED:
+- brcm,hardware-controlled (optional) : LED is hardware controlled.
+- brcm,link-selection (optional) : LED link selection values.
+- brcm,activity-selection (optional) : LED activity selection values.
+
+example 1) BCM6328
+
+leds0: led-controller@10000800 {
+	compatible =3D "brcm,bcm6328-leds";
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+	reg =3D <0x10000800 0x24>;
+
+	alarm_red@2 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <2>;
+		active-low;
+		label =3D "red:alarm";
+	};
+	inet_green@3 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <3>;
+		active-low;
+		label =3D "green:inet";
+	};
+	power_green@4 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <4>;
+		active-low;
+		label =3D "green:power";
+		default-state =3D "on";
+	};
+	ephy0_spd@17 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <17>;
+		brcm,hardware-controlled;
+	};
+	ephy1_spd@18 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <18>;
+		brcm,hardware-controlled;
+	};
+	ephy2_spd@19 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <19>;
+		brcm,hardware-controlled;
+	};
+	ephy3_spd@20 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <20>;
+		brcm,hardware-controlled;
+	};
+};
+
+example 2) BCM63268
+
+leds0: led-controller@10001900 {
+	compatible =3D "brcm,bcm6328-leds";
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+	reg =3D <0x10001900 0x24>;
+	brcm,serial-leds;
+
+	gphy0_spd0@0 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <0>;
+		brcm,hardware-controlled;
+		brcm,link-selection =3D <0>;
+	};
+	gphy0_spd1@1 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <1>;
+		brcm,hardware-controlled;
+		brcm,link-selection =3D <1>;
+	};
+	inet_red@2 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <2>;
+		active-low;
+		label =3D "red:inet";
+	};
+	dsl_green@3 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <3>;
+		active-low;
+		label =3D "green:dsl";
+	};
+	usb_green@4 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <4>;
+		active-low;
+		label =3D "green:usb";
+	};
+	wps_green@7 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <7>;
+		active-low;
+		label =3D "green:wps";
+	};
+	inet_green@8 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <8>;
+		active-low;
+		label =3D "green:inet";
+	};
+	ephy0_act@9 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <9>;
+		brcm,hardware-controlled;
+	};
+	ephy1_act@10 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <10>;
+		brcm,hardware-controlled;
+	};
+	ephy2_act@11 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <11>;
+		brcm,hardware-controlled;
+	};
+	gphy0_act@12 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <12>;
+		brcm,hardware-controlled;
+	};
+	ephy0_spd@13 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <13>;
+		brcm,hardware-controlled;
+	};
+	ephy1_spd@14 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <14>;
+		brcm,hardware-controlled;
+	};
+	ephy2_spd@15 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <15>;
+		brcm,hardware-controlled;
+	};
+	power_green@20 {
+		compatible =3D "brcm,bcm6328-led";
+		reg =3D <20>;
+		active-low;
+		label =3D "green:power";
+		default-state =3D "on";
+	};
+};
--=20
1.9.1
