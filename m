From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] leds: as3645a: Fix checkpatch warnings
Date: Tue, 12 Dec 2017 15:50:11 -0600
Message-ID: <20171212215011.30066-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:55663 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752564AbdLLVwK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Dec 2017 16:52:10 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Fix two checkpatch warnings for 80 char
length and for a quoted string across multiple
line warnings.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-as3645a.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 9a257f969300..f883616d9e60 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -360,7 +360,8 @@ static int as3645a_set_flash_brightness(struct led_classdev_flash *fled,
 {
 	struct as3645a *flash = fled_to_as3645a(fled);
 
-	flash->flash_current = as3645a_current_to_reg(flash, true, brightness_ua);
+	flash->flash_current = as3645a_current_to_reg(flash, true,
+						      brightness_ua);
 
 	return as3645a_set_current(flash);
 }
@@ -455,8 +456,8 @@ static int as3645a_detect(struct as3645a *flash)
 
 	/* Verify the chip model and version. */
 	if (model != 0x01 || rfu != 0x00) {
-		dev_err(dev, "AS3645A not detected "
-			"(model %d rfu %d)\n", model, rfu);
+		dev_err(dev, "AS3645A not detected (model %d rfu %d)\n",
+			model, rfu);
 		return -ENODEV;
 	}
 
-- 
2.15.0.124.g7668cbc60
