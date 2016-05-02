From: Anders Darander <anders@chargestorm.se>
Subject: [PATCH] leds-pca963x: add bindings to invert polarity
Date: Mon,  2 May 2016 11:41:44 +0200
Message-ID: <1462182104-21450-1-git-send-email-anders@chargestorm.se>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33977 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753351AbcEBJmL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 May 2016 05:42:11 -0400
Received: by mail-lf0-f52.google.com with SMTP id m64so28314323lfd.1
        for <linux-leds@vger.kernel.org>; Mon, 02 May 2016 02:42:10 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, j.anaszewski@samsung.com
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Anders Darander <anders@chargestorm.se>

Add a new DT property, nxp,inverted, to invert the polarity of the output.

Tested on PCA9634.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 Documentation/devicetree/bindings/leds/pca963x.txt |  1 +
 drivers/leds/leds-pca963x.c                        | 17 +++++++++++++++--
 include/linux/platform_data/leds-pca963x.h         |  6 ++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
index dafbe99..68579c5 100644
--- a/Documentation/devicetree/bindings/leds/pca963x.txt
+++ b/Documentation/devicetree/bindings/leds/pca963x.txt
@@ -7,6 +7,7 @@ Optional properties:
 - nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
   to open-drain, newer chips to totem pole)
 - nxp,hw-blink : use hardware blinking instead of software blinking
+- nxp,inverted: invert the polarity of the generated PWM
 
 Each led is represented as a sub-node of the nxp,pca963x device.
 
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 407eba1..41b7648 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -294,6 +294,12 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
 	else
 		pdata->blink_type = PCA963X_SW_BLINK;
 
+	/* default to non-inverted output, unless inverted is specified */
+	if (of_property_read_bool(np, "nxp,inverted"))
+		pdata->dir = PCA963X_INVERTED;
+	else
+		pdata->dir = PCA963X_NORMAL;
+
 	return pdata;
 }
 
@@ -395,11 +401,18 @@ static int pca963x_probe(struct i2c_client *client,
 	i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
 
 	if (pdata) {
+		u8 mode2 = i2c_smbus_read_byte_data(pca963x->chip->client,
+						    PCA963X_MODE2);
 		/* Configure output: open-drain or totem pole (push-pull) */
 		if (pdata->outdrv == PCA963X_OPEN_DRAIN)
-			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x01);
+			mode2 |= 0x01;
 		else
-			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x05);
+			mode2 |= 0x05;
+		/* Configure direction: normal or inverted */
+		if (pdata->dir == PCA963X_INVERTED)
+			mode2 |= 0x10;
+		i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
+					  mode2);
 	}
 
 	return 0;
diff --git a/include/linux/platform_data/leds-pca963x.h b/include/linux/platform_data/leds-pca963x.h
index e731f00..54e845f 100644
--- a/include/linux/platform_data/leds-pca963x.h
+++ b/include/linux/platform_data/leds-pca963x.h
@@ -33,10 +33,16 @@ enum pca963x_blink_type {
 	PCA963X_HW_BLINK,
 };
 
+enum pca963x_direction {
+	PCA963X_NORMAL,
+	PCA963X_INVERTED,
+};
+
 struct pca963x_platform_data {
 	struct led_platform_data leds;
 	enum pca963x_outdrv outdrv;
 	enum pca963x_blink_type blink_type;
+	enum pca963x_direction dir;
 };
 
 #endif /* __LINUX_PCA963X_H*/
-- 
2.8.1
