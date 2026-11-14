Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696967;
	b=EF9R9Y2vB/EdHtT8h+tNX3PRbrVpVPNLoJFxUXlqtgcWdYPb96P39ikwzoxPf8Qc3stt
	 8a13lisF2u0v7URwbwgDsNqe2/vU5XBLjBszN0UDSbbVDm5qlQ2XYtX3KuoAGvSEi2x7c
	 SpZ7TJlJgg6O1DER7UPIkuEdUCfLBJ1LGXx9zS17dZWRvW+lBsKJvHvR57s5e7xwtDSGa
	 VtJoXcQFvtv6UPWxInMJBkq9ruHJ2FDd1vYgq7SlOwSS22Mbe/8Mx2sj2uxzIGLbH//UF
	 p5umjuXZ0vliJWDrB6y6bqnEs7c0RuxWA7k0bevDhuJ1qH8XDERMly3/Gc7ouFIOFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696967;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OzDWU+/44APl7FccwqKTLJhdGMU07DikqM2kFdTqNVQ=;
	b=exJ7G+B4PR7sGnzPYPgx7ac5k1kXeDCIx/KJxUzR69qFq04834SqjeVo1ZmP4/TIPDNk
	 bwmS+E2/9ZgwQEyzLIaFJZ7yocJeGNp35Bcx2M/iK2BkbC2p/JEaZO5w4X1scD/tBZrj1
	 9rVLP3HpzZseuNjGEiO9G5hnfmDiPBSi76YQ2dB5qAKqGywu2sihnVRwafvxoB8zOOziZ
	 mBzrsh9taOKiAEFzkx/ISdpbcsULM9L9cjp5xhyNplZvxIhzwOtaQ1p8vgBx1HaGBFzWg
	 6UjuYWHxNe6PiIouC0+1Ld+IzjP3oDFsmWgPA1r4A+wHoLaJkl6zoPYrWRw2qXr/9nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=G7S9otey;
	arc=none smtp.remote-ip=91.218.175.164
Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5C606A332
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 22:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C5C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=G7S9otey
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+HGcf6S4biX0Ali4Ypap1DV5TgQXG/uDxNASJZi4aSI=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696963; v=1; x=1795301763;
 b=G7S9oteyJySThg3VZoV2cUVx0r5BQel2Xz3Kuq2qtorZiXBNCKjsn7KnQn+D+uiUcoPIshiu
 GCZjHIwmycJ8qi9zFeJDRM7vgrDG5Oek4gIueC5f/cZ7HpfB1aDPRidXObNdapnnpoUm2uZlsHM
 6lIMiCQ0S3cCwkYkCCZ221yH5zBsed1Ejt8TzyrbNoPCwooJMcwf3sQf6wKevoGKQO1xsk9Oo3X
 +j3DinQ1twZQu8WyFH1ZiYMy0q5DGfFGsSRKKe/El3O/fCFuAIu6iUR0raek5nfarugCs+eAK3d
 phSI26D7hBwsbVXn1toKHhF1ihq4jzwwnppOadGCFhBnw==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a40fd943220a26bc;
	Sat, 14 Nov 2026 22:56:03 +0000
X-Mizu-Trace-ID: a40fd943220a26bc
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 14 Nov 2026 15:55:17 -0700
Subject: [PATCH v7 4/4] leds: aw2013: Add AW2027 support
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-aw2013-aw20xx-rename-v7-4-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=11497;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=+HGcf6S4biX0Ali4Ypap1DV5TgQXG/uDxNASJZi4aSI=;
 b=8f5ouk3VvL0FeRIbyzwAAJoWarWy5YYQ+6cDqwsD2u8gzuLTiHmkvhO47HK+KJWVcrcCsZKpW
 LHyEu/w/EN3CkqvScEM8xhtLB3wGRTKIIYTQEeOIxnmcm4cC8pz5q99
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

The AW2027 is basically the same as the AW2013.

It differs in:
- the max current (30mA rather than 15)
- the number of current levels for colour-mixing (16 rather than 4)
- the supply voltage max
- the charge indicator (unsupported by our driver at this time)

The max current register (imax) also moves from LCFG to GCR2, and the
selectable current levels for colour-mixing (LCFG_CUR) take their place.

The current driver implementation provided here sets the global imax to
it's maximum, and scales each led to the closest value using the local
imax. It's the best result achievable short of adding custom sysfs
entries and mucking up the linux interfaces.

Comparison of all AW20XX chips https://www.awinic.com/en/productCompareList?id=47&ids=1022,74,96,75,72,71,928,927,73,76,578
AW2027 datasheet: https://doc.awinic.com/doc/202507/77b87097-27bf-48cd-af9b-9b615064c1e1.pdf
Vendor driver: https://www.awinic.com/en/driver/AW2027DNR/454

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 206 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 175 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 7fe7e9dae903..f62f977e2bfe 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-// Driver for Awinic AW2013 3-channel LED driver
+// Driver for Awinic AW20XX 3-channel LED drivers
 
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -20,13 +20,15 @@
 #define AW2013_GCR 0x01
 #define AW2013_GCR_ENABLE BIT(0)
 
+#define AW20XX_GCR2 0x04
+
 /* LED channel enable register */
 #define AW2013_LCTR 0x30
 #define AW2013_LCTR_LE(x) BIT((x))
 
 /* LED channel control registers */
 #define AW2013_LCFG(x) (0x31 + (x))
-#define AW2013_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
+#define AW2013_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
 #define AW2013_LCFG_MD BIT(4)
 #define AW2013_LCFG_FI BIT(5)
 #define AW2013_LCFG_FO BIT(6)
@@ -51,6 +53,16 @@
 
 #define AW2013_TIME_STEP 130 /* ms */
 
+/* AW2027-specific defines */
+#define AW2016_23_27_33_CHIPID 0x09 /* vendor shared same chipid between several chips */
+#define AW2027_REG_MAX 0x7f /* copied from vendor driver, but only up to 0x3F is documented */
+#define AW2027_LOCAL_IMAX_MASK GENMASK(3, 0)
+
+#define AW2027_GLOBAL_IMAX_15MA 0
+#define AW2027_GLOBAL_IMAX_30MA 1
+#define AW2027_GLOBAL_IMAX_5MA  2
+#define AW2027_GLOBAL_IMAX_10MA 3
+
 struct aw2013;
 
 struct aw2013_led {
@@ -60,16 +72,88 @@ struct aw2013_led {
 	unsigned int imax;
 };
 
+struct aw2013_chipdef {
+	u8 chip_id;
+	const struct regmap_config *regmap_cfg;
+	u32 default_imax;
+	bool gcr2_imax;
+	unsigned int current_levels;
+	unsigned int current_max_ua;
+};
+
 struct aw2013 {
 	struct mutex mutex; /* held when writing to registers */
 	struct regulator_bulk_data regulators[2];
 	struct i2c_client *client;
 	struct aw2013_led leds[AW2013_MAX_LEDS];
 	struct regmap *regmap;
+	const struct aw2013_chipdef *cdef;
 	int num_leds;
 	bool enabled;
 };
 
+static const struct regmap_config aw2013_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AW2013_REG_MAX,
+};
+
+static const struct regmap_config aw2027_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AW2027_REG_MAX,
+};
+
+static const struct aw2013_chipdef aw2013_chipdef = {
+	.chip_id = AW2013_RSTR_CHIP_ID,
+	.regmap_cfg = &aw2013_regmap_config,
+	.default_imax = 1, /* 5mA */
+	.gcr2_imax = false,
+	.current_levels = 4,
+	.current_max_ua = 15000,
+};
+
+static const struct aw2013_chipdef aw2027_chipdef = {
+	.chip_id = AW2016_23_27_33_CHIPID,
+	.regmap_cfg = &aw2027_regmap_config,
+	.default_imax = 3, /* 6mA */
+	.gcr2_imax = true,
+	.current_levels = 16,
+	.current_max_ua = 30000,
+};
+
+/**
+ * aw2013_microamp_to_imax() - Finds the closest current step to the given microamp
+ * @microamp: Desired current in microamps
+ * @cdef: Chip definition
+ *
+ * Return: The closest current-step to the given microamp, rounded down
+ * and limited by the max current step possible for the chip.
+ */
+static inline u32 aw2013_microamp_to_imax(u32 microamp, const struct aw2013_chipdef *cdef)
+{
+	u32 max_current_step = cdef->current_levels - 1;
+	u32 closest_current_step_floor = (microamp * max_current_step) / cdef->current_max_ua;
+
+	return min_t(u32, closest_current_step_floor, max_current_step);
+}
+
+static int aw2027_set_global_imax(struct aw2013 *chip)
+{
+	return regmap_update_bits(chip->regmap,
+				 AW20XX_GCR2,
+				 AW2013_IMAX_MASK,
+				 AW2027_GLOBAL_IMAX_30MA);
+}
+
+static int aw2027_set_local_imax(struct aw2013 *chip, struct aw2013_led *led, u32 imax)
+{
+	return regmap_update_bits(chip->regmap,
+				 AW2013_LCFG(led->num),
+				 AW2027_LOCAL_IMAX_MASK,
+				 imax);
+}
+
 static int aw2013_chip_init(struct aw2013 *chip)
 {
 	int ret;
@@ -81,17 +165,47 @@ static int aw2013_chip_init(struct aw2013 *chip)
 		return ret;
 	}
 
-	for (int i = 0; i < chip->num_leds; i++) {
-		ret = regmap_update_bits(chip->regmap,
-					 AW2013_LCFG(chip->leds[i].num),
-					 AW2013_LCFG_IMAX_MASK,
-					 chip->leds[i].imax);
+	if (chip->cdef->gcr2_imax) {
+		/*
+		 * AW2027 supports 4-step global imax, and also a 16-step control for limiting
+		 * individual current per LED. This doesn't map to the single value the
+		 * devicetree provides super well, so set global imax to maximum, and
+		 * local imax to whatever gets us closest to the value in the devicetree.
+		 */
+		ret = aw2027_set_global_imax(chip);
 		if (ret) {
 			dev_err(&chip->client->dev,
-				"Failed to set maximum current for led %d: %d\n",
-				chip->leds[i].num, ret);
+				"Failed to set maximum global current: %d\n",
+				ret);
 			return ret;
 		}
+		/*
+		 * This still needs to be here despite also being in aw2013_probe_dt,
+		 * for cases where chip is disabled and re-enabled.
+		 */
+		for (int i = 0; i < chip->num_leds; i++) {
+			ret = aw2027_set_local_imax(chip, &chip->leds[i], chip->leds[i].imax);
+			if (ret) {
+				dev_err(&chip->client->dev,
+					"Failed to set maximum current for led %d: %d\n",
+					chip->leds[i].num, ret);
+				return ret;
+			}
+		}
+	} else {
+		/* AW2013 only supports 4-step individual current per LED */
+		for (int i = 0; i < chip->num_leds; i++) {
+			ret = regmap_update_bits(chip->regmap,
+						 AW2013_LCFG(chip->leds[i].num),
+						 AW2013_IMAX_MASK,
+						 chip->leds[i].imax);
+			if (ret) {
+				dev_err(&chip->client->dev,
+					"Failed to set maximum current for led %d: %d\n",
+					chip->leds[i].num, ret);
+				return ret;
+			}
+		}
 	}
 
 	return ret;
@@ -291,9 +405,9 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 		init_data.fwnode = of_fwnode_handle(child);
 
 		if (!of_property_read_u32(child, "led-max-microamp", &imax)) {
-			led->imax = min_t(u32, imax / 5000, 3);
+			led->imax = aw2013_microamp_to_imax(imax, chip->cdef);
 		} else {
-			led->imax = 1; // 5mA
+			led->imax = chip->cdef->default_imax;
 			dev_info(&chip->client->dev,
 				 "DT property led-max-microamp is missing\n");
 		}
@@ -303,14 +417,30 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 
 		mutex_lock(&chip->mutex);
 		chip->num_leds = ++i;
-		if (chip->enabled) {
+		/*
+		 * needs to be here and in aw2013_chip_init because chip->num_leds increments
+		 * just above here while we're parsing the devicetree, and chip->enabled
+		 * ensures chip_init runs as little as possible.
+		 * Requires this function to have regulators enabled.
+		 */
+		if (chip->cdef->gcr2_imax) {
+			ret = aw2027_set_local_imax(chip, led, led->imax);
+			if (ret) {
+				mutex_unlock(&chip->mutex);
+				return dev_err_probe(&chip->client->dev, ret,
+						     "Failed to set maximum current for led %d\n",
+						     led->num);
+			}
+		} else {
 			ret = regmap_update_bits(chip->regmap,
 						 AW2013_LCFG(led->num),
-						 AW2013_LCFG_IMAX_MASK,
+						 AW2013_IMAX_MASK,
 						 led->imax);
 			if (ret) {
 				mutex_unlock(&chip->mutex);
-				return ret;
+				return dev_err_probe(&chip->client->dev, ret,
+						     "Failed to set maximum current for led %d\n",
+						     led->num);
 			}
 		}
 		mutex_unlock(&chip->mutex);
@@ -332,18 +462,18 @@ static void aw2013_chip_disable_action(void *data)
 	aw2013_chip_disable(data);
 }
 
-static const struct regmap_config aw2013_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.max_register = AW2013_REG_MAX,
-};
 
 static int aw2013_probe(struct i2c_client *client)
 {
 	struct aw2013 *chip;
+	const struct aw2013_chipdef *cdef;
 	int ret;
 	unsigned int chipid;
 
+	cdef = device_get_match_data(&client->dev);
+	if (!cdef)
+		return -ENODEV;
+
 	chip = devm_kzalloc_obj(&client->dev, *chip);
 	if (!chip)
 		return -ENOMEM;
@@ -355,9 +485,10 @@ static int aw2013_probe(struct i2c_client *client)
 	mutex_lock(&chip->mutex);
 
 	chip->client = client;
+	chip->cdef = cdef;
 	i2c_set_clientdata(client, chip);
 
-	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
+	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
 		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
 				    "Failed to allocate register map\n");
@@ -390,7 +521,7 @@ static int aw2013_probe(struct i2c_client *client)
 		goto error_reg;
 	}
 
-	if (chipid != AW2013_RSTR_CHIP_ID) {
+	if (chipid != chip->cdef->chip_id) {
 		ret = dev_err_probe(&client->dev, -ENODEV,
 				    "Chip reported wrong ID: %x\n",
 				     chipid);
@@ -403,21 +534,28 @@ static int aw2013_probe(struct i2c_client *client)
 		goto error_reg;
 	}
 
+	mutex_unlock(&chip->mutex);
+
+	ret = devm_add_action(&client->dev, aw2013_chip_disable_action, chip);
+	if (ret)
+		goto error_reg_no_mutex;
+
+	ret = aw2013_probe_dt(chip);
+	if (ret) {
+		dev_err_probe(&client->dev, ret,
+			      "Failed to parse devicetree\n");
+		goto error_reg_no_mutex;
+	}
+
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
 	if (ret) {
 		dev_err_probe(&client->dev, ret,
 			      "Failed to disable regulators\n");
-		goto error;
-	}
-
-	mutex_unlock(&chip->mutex);
-
-	ret = devm_add_action(&client->dev, aw2013_chip_disable_action, chip);
-	if (ret)
 		return ret;
+	}
 
-	return aw2013_probe_dt(chip);
+	return 0;
 
 error_reg:
 	regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
@@ -426,10 +564,16 @@ static int aw2013_probe(struct i2c_client *client)
 error:
 	mutex_unlock(&chip->mutex);
 	return ret;
+
+error_reg_no_mutex:
+	regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
+			       chip->regulators);
+	return ret;
 }
 
 static const struct of_device_id aw2013_match_table[] = {
-	{ .compatible = "awinic,aw2013", },
+	{ .compatible = "awinic,aw2013", .data = &aw2013_chipdef },
+	{ .compatible = "awinic,aw2027", .data = &aw2027_chipdef },
 	{ /* sentinel */ },
 };
 
@@ -446,5 +590,5 @@ static struct i2c_driver aw2013_driver = {
 module_i2c_driver(aw2013_driver);
 
 MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
-MODULE_DESCRIPTION("AW2013 LED driver");
+MODULE_DESCRIPTION("AW20XX LED driver");
 MODULE_LICENSE("GPL v2");

-- 
2.56.1

