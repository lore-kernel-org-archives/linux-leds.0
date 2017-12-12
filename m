From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC PATCH 2/2] leds: as3645a: Update LED label generation
Date: Tue, 12 Dec 2017 15:50:24 -0600
Message-ID: <20171212215024.30116-2-dmurphy@ti.com>
References: <20171212215024.30116-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:55680 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752570AbdLLVwY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Dec 2017 16:52:24 -0500
In-Reply-To: <20171212215024.30116-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Generate the LED label based off either the
DT label node or off the I2C ID in the
i2c device id struct.

If the label is used then this should denote
the LED function.  As an example it would
be as3645a:<function>

 Otherwise if the label is not
used the LED label will be as3645a:flash and
as3645a:indicator.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-as3645a.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index f883616d9e60..197acd69ddcc 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -526,10 +526,11 @@ static int as3645a_parse_node(struct as3645a *flash,
 
 	rval = of_property_read_string(flash->flash_node, "label", &name);
 	if (!rval)
-		strlcpy(names->flash, name, sizeof(names->flash));
+		snprintf(names->flash, sizeof(names->flash), "%s:%s",
+			 id->name, name);
 	else
 		snprintf(names->flash, sizeof(names->flash),
-			 "%s:flash", node->name);
+			 "%s:flash", id->name);
 
 	rval = of_property_read_u32(flash->flash_node, "flash-timeout-us",
 				    &cfg->flash_timeout_us);
@@ -570,10 +571,11 @@ static int as3645a_parse_node(struct as3645a *flash,
 
 	rval = of_property_read_string(flash->indicator_node, "label", &name);
 	if (!rval)
-		strlcpy(names->indicator, name, sizeof(names->indicator));
+		snprintf(names->indicator, sizeof(names->indicator), "%s:%s",
+			 id->name, name);
 	else
 		snprintf(names->indicator, sizeof(names->indicator),
-			 "%s:indicator", node->name);
+			 "%s:indicator", id->name);
 
 	rval = of_property_read_u32(flash->indicator_node, "led-max-microamp",
 				    &cfg->indicator_max_ua);
-- 
2.15.0.124.g7668cbc60
