From: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
Subject: [PATCH v2] leds-pca963x: add bindings to invert polarity
Date: Thu, 27 Apr 2017 08:37:33 +0200
Message-ID: <20170427063733.32323-1-anders@chargestorm.se>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Add a new DT property, nxp,inverted-out, to invert the polarity of the output.

Tested on PCA9634.

Signed-off-by: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/pca963x.txt |  1 +
 drivers/leds/leds-pca963x.c                        | 17 +++++++++++++++--
 include/linux/platform_data/leds-pca963x.h         |  6 ++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
index dfbdb123a9bf..4eee41482041 100644
--- a/Documentation/devicetree/bindings/leds/pca963x.txt
+++ b/Documentation/devicetree/bindings/leds/pca963x.txt
@@ -10,6 +10,7 @@ Optional properties:
 - nxp,period-scale : In some configurations, the chip blinks faster than expected.
 		     This parameter provides a scaling ratio (fixed point, decimal divided
 		     by 1000) to compensate, e.g. 1300=1.3x and 750=0.75x.
+- nxp,inverted-out: invert the polarity of the generated PWM
 
 Each led is represented as a sub-node of the nxp,pca963x device.
 
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index ded1e4dac36a..3bf9a1271819 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -342,6 +342,12 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
 	if (of_property_read_u32(np, "nxp,period-scale", &chip->scaling))
 		chip->scaling = 1000;
 
+	/* default to non-inverted output, unless inverted is specified */
+	if (of_property_read_bool(np, "nxp,inverted-out"))
+		pdata->dir = PCA963X_INVERTED;
+	else
+		pdata->dir = PCA963X_NORMAL;
+
 	return pdata;
 }
 
@@ -452,11 +458,18 @@ static int pca963x_probe(struct i2c_client *client,
 	i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
 
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
index e731f0036329..54e845ffb5ed 100644
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
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
