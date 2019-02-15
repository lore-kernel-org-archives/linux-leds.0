From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH v2 7/8] ARM: dts: sun7i: Enable AXP209 CHGLED for Olimex boards
Date: Fri, 15 Feb 2019 13:50:12 +0200
Message-ID: <20190215115013.11098-8-stefan@olimex.com>
References: <20190215115013.11098-1-stefan@olimex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215115013.11098-1-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC
        DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Allwinner
        sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Cc: Stefan Mavrodiev <stefan@olimex.com>
List-Id: linux-leds@vger.kernel.org

Olimex A20-OLinuXino based boards (MICRO, SOM, SOM204, LIME2)
commes with populated LED connected to AXP209.

By default the LED is controlled by AXP209, so this binding
actually doesn't modify any registers. However this can can be
used as general purpose LED, if the control mode is overridden.

Also this binding is enabled only for OLIMEX boards, since I have
no knowlegde if the other manifactures are populating this LED.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts    | 6 ++++++
 arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts | 6 ++++++
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts   | 6 ++++++
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts   | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
index f0e6a96e5785..677ee1c2795a 100644
--- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
@@ -243,6 +243,12 @@
 
 #include "axp209.dtsi"
 
+&axp_led {
+	label = "a20-olimex-som-evb:yellow:chgled";
+	status = "okay";
+	x-powers,charger-mode = <0>;
+};
+
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts
index 823aabce0462..31a3ab5ad4e3 100644
--- a/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts
@@ -205,6 +205,12 @@
 	status = "okay";
 };
 
+&axp_led {
+	label = "a20-som204-evb:yellow:chgled";
+	status = "okay";
+	x-powers,charger-mode = <0>;
+};
+
 &battery_power_supply {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
index 4e1c590eb098..66dd80ced1fa 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -200,6 +200,12 @@
 
 #include "axp209.dtsi"
 
+&axp_led {
+	label = "a20-olinuxino-lime2:yellow:chgled";
+	status = "okay";
+	x-powers,charger-mode = <0>;
+};
+
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
index 840ae1194a66..700de909eb49 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
@@ -272,6 +272,12 @@
 	status = "okay";
 };
 
+&axp_led {
+	label = "a20-olinuxino-micro:yellow:chgled";
+	status = "okay";
+	x-powers,charger-mode = <0>;
+};
+
 &battery_power_supply {
 	status = "okay";
 };
-- 
2.17.1
