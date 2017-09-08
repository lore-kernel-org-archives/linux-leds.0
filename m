From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH 1/3] as3645a: Use ams,input-max-microamp as documented in DT bindings
Date: Fri,  8 Sep 2017 15:42:11 +0300
Message-ID: <20170908124213.18904-2-sakari.ailus@linux.intel.com>
References: <20170908124213.18904-1-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908124213.18904-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

DT bindings document the property "ams,input-max-microamp" that limits the
chip's maximum input current. The driver and the DTS however used
"peak-current-limit" property. Fix this by using the property documented
in DT binding documentation.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 arch/arm/boot/dts/omap3-n950-n9.dtsi | 2 +-
 drivers/leds/leds-as3645a.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3-n950-n9.dtsi
index cb47ae79a5f9..b86fc83a5a65 100644
--- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
+++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
@@ -273,7 +273,7 @@
 			flash-timeout-us = <150000>;
 			flash-max-microamp = <320000>;
 			led-max-microamp = <60000>;
-			peak-current-limit = <1750000>;
+			ams,input-max-microamp = <1750000>;
 		};
 		indicator {
 			led-max-microamp = <10000>;
diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index bbbbe0898233..e3f89c6130d2 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -534,7 +534,7 @@ static int as3645a_parse_node(struct as3645a *flash,
 	of_property_read_u32(flash->flash_node, "voltage-reference",
 			     &cfg->voltage_reference);
 
-	of_property_read_u32(flash->flash_node, "peak-current-limit",
+	of_property_read_u32(flash->flash_node, "ams,input-max-microamp",
 			     &cfg->peak);
 	cfg->peak = AS_PEAK_mA_TO_REG(cfg->peak);
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
