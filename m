From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 1/2] leds: as3645a: Fix quoted string split warning
Date: Thu, 14 Dec 2017 11:37:26 -0600
Message-ID: <20171214173727.10070-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Fix a warning for a split quoted string across
lines.

WARNING: quoted string split across lines
459: FILE: drivers/leds/leds-as3645a.c:459:
		dev_err(dev, "AS3645A not detected "
			"(model %d rfu %d)\n", model, rfu);

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - Split the warning fixes into 2 patches and fixed commit message -
https://patchwork.kernel.org/patch/10108325/

 drivers/leds/leds-as3645a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 9a257f969300..49fdd7c0a6f6 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -455,8 +455,8 @@ static int as3645a_detect(struct as3645a *flash)
 
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
