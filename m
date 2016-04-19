From: Olliver Schinagl <oliver@schinagl.nl>
Subject: [PATCH 5/6] leds: pca963x: Inform the output that it is inverted
Date: Tue, 19 Apr 2016 09:40:49 +0200
Message-ID: <1461051650-18824-6-git-send-email-oliver@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
List-Id: linux-leds@vger.kernel.org

When leds are connected in a totem-pole configuration, they can be
connected either in a active-high, or active-low manor. The driver
currently always assumes active-high. This patch adds the
'nxp,inverted-out' boolean property to tell the driver that the leds
are driven active-low, or rather, that the behavior is inverted to what
is normally expected.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 Documentation/devicetree/bindings/leds/pca963x.txt |  1 +
 drivers/leds/leds-pca963x.c                        | 20 +++++++++++++-------
 include/linux/platform_data/leds-pca963x.h         |  1 +
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
index dafbe99..7b23725 100644
--- a/Documentation/devicetree/bindings/leds/pca963x.txt
+++ b/Documentation/devicetree/bindings/leds/pca963x.txt
@@ -6,6 +6,7 @@ Required properties:
 Optional properties:
 - nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
   to open-drain, newer chips to totem pole)
+  nxp,inverted-out: the connected leds are active-low, default to active-high
 - nxp,hw-blink : use hardware blinking instead of software blinking
 
 Each led is represented as a sub-node of the nxp,pca963x device.
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 14690f2..85dd506 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -370,6 +370,9 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
 	else
 		pdata->outdrv = PCA963X_OPEN_DRAIN;
 
+	/* default to normal output unless inverted output is specified */
+	pdata->inverted_out = of_property_read_bool(np, "nxp,inverted-out");
+
 	/* default to software blinking unless hardware blinking is specified */
 	if (of_property_read_bool(np, "nxp,hw-blink"))
 		pdata->blink_type = PCA963X_HW_BLINK;
@@ -478,14 +481,17 @@ static int pca963x_probe(struct i2c_client *client,
 	i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
 
 	if (pdata) {
+		/* Always enable LED output */
+		u8 mode2 = PCA963X_MODE2_OUTNE_OUTDRV;
+
 		/* Configure output: open-drain or totem pole (push-pull) */
-		if (pdata->outdrv == PCA963X_OPEN_DRAIN)
-			i2c_smbus_write_byte_data(client, PCA963X_MODE2,
-					PCA963X_MODE2_OUTNE_OUTDRV);
-		else
-			i2c_smbus_write_byte_data(client, PCA963X_MODE2,
-					PCA963X_MODE2_OUTNE_OUTDRV |
-					PCA963X_MODE2_OUTDRV_TOTEM_POLE);
+		if (pdata->outdrv == PCA963X_TOTEM_POLE)
+			mode2 |= PCA963X_MODE2_OUTDRV_TOTEM_POLE;
+		/* Configure output: inverted output */
+		if (pdata->inverted_out)
+			mode2 |= PCA963X_MODE2_INVRT;
+
+		i2c_smbus_write_byte_data(client, PCA963X_MODE2, mode2);
 	}
 
 	return 0;
diff --git a/include/linux/platform_data/leds-pca963x.h b/include/linux/platform_data/leds-pca963x.h
index e731f00..6f784d4 100644
--- a/include/linux/platform_data/leds-pca963x.h
+++ b/include/linux/platform_data/leds-pca963x.h
@@ -36,6 +36,7 @@ enum pca963x_blink_type {
 struct pca963x_platform_data {
 	struct led_platform_data leds;
 	enum pca963x_outdrv outdrv;
+	bool inverted_out;
 	enum pca963x_blink_type blink_type;
 };
 
-- 
2.8.0.rc3
