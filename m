From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 3/3] arm: dts: omap3: N9/N950: Add AS3645A camera flash
Date: Wed, 23 Aug 2017 11:11:00 +0300
Message-ID: <20170823081100.11733-4-sakari.ailus@linux.intel.com>
References: <20170823081100.11733-1-sakari.ailus@linux.intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170823081100.11733-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, javier@dowhile0.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Add the as3645a flash controller to the DT source.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm/boot/dts/omap3-n950-n9.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3-n950-n9.dtsi
index df3366fa5409..cb47ae79a5f9 100644
--- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
+++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
@@ -265,6 +265,20 @@
 
 &i2c2 {
 	clock-frequency = <400000>;
+
+	as3645a@30 {
+		reg = <0x30>;
+		compatible = "ams,as3645a";
+		flash {
+			flash-timeout-us = <150000>;
+			flash-max-microamp = <320000>;
+			led-max-microamp = <60000>;
+			peak-current-limit = <1750000>;
+		};
+		indicator {
+			led-max-microamp = <10000>;
+		};
+	};
 };
 
 &i2c3 {
-- 
2.11.0
