From: Rob Herring <robh@kernel.org>
Subject: [PATCH] leds: Convert to using %pOFn instead of device_node.name
Date: Mon, 27 Aug 2018 20:52:26 -0500
Message-ID: <20180828015252.28511-25-robh@kernel.org>
References: <20180828015252.28511-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828015252.28511-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Cc: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/leds/leds-as3645a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index f883616d9e60..98a69b1a43f9 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -529,7 +529,7 @@ static int as3645a_parse_node(struct as3645a *flash,
 		strlcpy(names->flash, name, sizeof(names->flash));
 	else
 		snprintf(names->flash, sizeof(names->flash),
-			 "%s:flash", node->name);
+			 "%pOFn:flash", node);
 
 	rval = of_property_read_u32(flash->flash_node, "flash-timeout-us",
 				    &cfg->flash_timeout_us);
@@ -573,7 +573,7 @@ static int as3645a_parse_node(struct as3645a *flash,
 		strlcpy(names->indicator, name, sizeof(names->indicator));
 	else
 		snprintf(names->indicator, sizeof(names->indicator),
-			 "%s:indicator", node->name);
+			 "%pOFn:indicator", node);
 
 	rval = of_property_read_u32(flash->indicator_node, "led-max-microamp",
 				    &cfg->indicator_max_ua);
-- 
2.17.1
