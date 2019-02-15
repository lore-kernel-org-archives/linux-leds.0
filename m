From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH v2 8/8] ARM: dts: sun8i: a33: Enable AXP223 CHGLED for A33-OLinuXino
Date: Fri, 15 Feb 2019 13:50:13 +0200
Message-ID: <20190215115013.11098-9-stefan@olimex.com>
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

A33-OLinuXino comes with populated CHGLED LED indicating battery
charging status. By default the control is set to manual mode,
which doesn't indicate battery status. So it makes sense to set
the control to automatic mode 0 ( FULL - charging, OFF - no battery
or battery full).

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
index 3d78169cdeed..a1e36ee51bbb 100644
--- a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
+++ b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
@@ -111,6 +111,12 @@
 	status = "okay";
 };
 
+&axp_led {
+	label = "a33-olinuxino:yellow:chgled";
+	status = "okay";
+	x-powers,charger-mode = <0>;
+};
+
 &battery_power_supply {
 	status = "okay";
 };
-- 
2.17.1
