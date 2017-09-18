From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v2 5/6] as3645a: Add colour to LED name
Date: Mon, 18 Sep 2017 13:17:55 +0300
Message-ID: <20170918101756.8562-6-sakari.ailus@linux.intel.com>
References: <20170918101756.8562-1-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170918101756.8562-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-media-u79uwXL29TZ1PvR9WOhUig@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Add the colour of the LED to the LED name, as specified in
Documentation/leds/leds-class.txt.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/leds/leds-as3645a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 605e0c64e974..edeb0a499f6c 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -528,7 +528,7 @@ static int as3645a_parse_node(struct as3645a *flash,
 		strlcpy(names->flash, name, sizeof(names->flash));
 	else
 		snprintf(names->flash, sizeof(names->flash),
-			 "%s:flash", node->name);
+			 "%s:white:flash", node->name);
 
 	rval = of_property_read_u32(flash->flash_node, "flash-timeout-us",
 				    &cfg->flash_timeout_us);
@@ -572,7 +572,7 @@ static int as3645a_parse_node(struct as3645a *flash,
 		strlcpy(names->indicator, name, sizeof(names->indicator));
 	else
 		snprintf(names->indicator, sizeof(names->indicator),
-			 "%s:indicator", node->name);
+			 "%s:red:indicator", node->name);
 
 	rval = of_property_read_u32(flash->indicator_node, "led-max-microamp",
 				    &cfg->indicator_max_ua);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
