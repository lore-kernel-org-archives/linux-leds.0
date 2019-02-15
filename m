From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH v2 5/8] arm64: dts: allwinner: Enable AXP803 CHGLED for Olimex boards
Date: Fri, 15 Feb 2019 13:50:10 +0200
Message-ID: <20190215115013.11098-6-stefan@olimex.com>
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

Teres-I and A64-OLinuXino commes with populated LED connected
to AXP803. So to be used as battery indication, pass the LED control
to the charger itself in mode 0 ( FULL while charging, OFF no battery
or completed).

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 6 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts   | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index f7a4bccaa5d4..7d6930319fba 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -177,6 +177,12 @@
 
 #include "axp803.dtsi"
 
+&axp_led {
+	label = "a64-olinuxino:yellow:chgled";
+	status = "okay";
+	x-powers,charger-mode = <0>;
+};
+
 &reg_aldo1 {
 	regulator-always-on;
 	regulator-min-microvolt = <2800000>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index c455b24dd079..cdffdd4e4561 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -145,6 +145,12 @@
 
 #include "axp803.dtsi"
 
+&axp_led {
+	label = "teres-i:yellow:chgled";
+	status = "okay";
+	x-powers,charger-mode = <0>;
+};
+
 &reg_aldo1 {
 	regulator-always-on;
 	regulator-min-microvolt = <2800000>;
-- 
2.17.1
