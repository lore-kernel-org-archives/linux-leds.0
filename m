From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v4 4/4] leds-pca963x: Fix device tree parsing
Date: Wed, 14 Aug 2013 09:14:29 +0200
Message-ID: <1376464470-6845-9-git-send-email-ricardo.ribalda@gmail.com>
References: <1376464470-6845-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376464470-6845-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Peter Meerwald <p.meerwald@bct-electronic.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-leds@vger.kernel.org

A malformed device tree could lead into a segmentation fault if the reg
value of a led is bigger than the number of leds.

A valid device tree could have only information about the last led of the
chip. Fix the device tree parsing to handle those cases.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/leds/leds-pca963x.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 2bbaff9..9441b19 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -284,13 +284,13 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
 		u32 reg;
 		int res;
 
+		res = of_property_read_u32(child, "reg", &reg);
+		if ((res != 0) || (reg >= chip->n_leds))
+			continue;
 		led.name =
 			of_get_property(child, "label", NULL) ? : child->name;
 		led.default_trigger =
 			of_get_property(child, "linux,default-trigger", NULL);
-		res = of_property_read_u32(child, "reg", &reg);
-		if (res != 0)
-			continue;
 		pca963x_leds[reg] = led;
 	}
 	pdata = devm_kzalloc(&client->dev,
@@ -299,7 +299,7 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
 		return ERR_PTR(-ENOMEM);
 
 	pdata->leds.leds = pca963x_leds;
-	pdata->leds.num_leds = count;
+	pdata->leds.num_leds = chip->n_leds;
 
 	/* default to open-drain unless totem pole (push-pull) is specified */
 	if (of_property_read_bool(np, "nxp,totem-pole"))
-- 
1.7.10.4
