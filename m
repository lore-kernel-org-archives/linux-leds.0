Received: from mta0.migadu.com (out-241.mta0.migadu.com [91.218.175.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12623128CC
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 03:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258390; cv=none; b=czgjERbXy+S19vWQE8F+KDfLmg4a5LDWTmn/vkryIieagctux+9XLbcTu0lgo7XLsmx8W6Nfu5wqBX0Ml6oR/UotzQlcwzlhuYkT9RODKj6/aVkO2NPuixCMWD4KVmhQeCEKe1Y9rQp2iBF/NSXk7ReEZ8NnZsNHI1dGx5WmurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258390; c=relaxed/simple;
	bh=xTv5H6O8iUht62NTT9WXWUqgihwFkxRrTaqtVM5zm7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AS0UPyMGZtUvRdyCY6V5vIDg7t20rS9B57VkOzte5txbf0VG+dDeULl+xPuK989Gqt552sGwxeTXJWuTBU6SQ/eH/lihqALKIUunQeWGE3KZ3JUyvATydrWNAoVaBDo7IuNCA4gQ2nrjRYGZC8f1rZSRs93NJJLH1/DqCwQKz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=YmXH6ylc; arc=none smtp.client-ip=91.218.175.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="YmXH6ylc"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xTv5H6O8iUht62NTT9WXWUqgihwFkxRrTaqtVM5zm7Q=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791258385; v=1; x=1791863185;
 b=YmXH6ylc28A16GCWL6RocHB2rKnoMCuXbY3xDZnuYpXCd+663/nT4tsEqOMe2zRIWV7Umy5L
 66K4FkirbAmIlzk1RiF5dFdjQujwCgGRzhFI1QQNnT+RUBRZRii9NnD/AqpwwLSmF8Z5q9IdmDi
 vlI/Gb9T2/B7WwzniJASnXHR/fmodAcF4TVsNKmbDrc9ZzUSxoVPvjayJGSM35R7SpDQfX2NEFi
 4xIyq+4/87/hQZnQ/S/miuF0RLGtG4l5NPO8JHQ8H0kdOWYeEED1U1dRbQumGxQAp7cU1AK7cDv
 IQKRbFENwzMhNsjCQk+ap48v1H+So0jrTtMDjRdow3ygQ==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 736016c68e42235d;
	Tue, 06 Oct 2026 03:46:25 +0000
X-Mizu-Trace-ID: 736016c68e42235d
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 05 Oct 2026 20:46:04 -0700
Subject: [PATCH v2 3/7] leds: aw2013: Add AW2027 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-aw2013-aw20xx-rename-v2-3-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791258374; l=8666;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=xTv5H6O8iUht62NTT9WXWUqgihwFkxRrTaqtVM5zm7Q=;
 b=Nc/vCG2cjoLqq9ev3b4BRmsd1RGla9yZv1JlWrH19OtnA+JN9J9DTQoSbo9A9Eh4ZQYYVrrd9
 7eqMmL/EeFuB7F4H3VlgNze4KOz3drrt9RbLOST3HPEfCT1vyrmDmDY
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
 drivers/leds/leds-aw2013.c | 142 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 120 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index ae3c8131efb4..340eefdda04f 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-// Driver for Awinic AW2013 3-channel LED driver
+// Driver for Awinic AW2013/AW2027 3-channel LED drivers
 
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -19,16 +19,19 @@
 #define AW20XX_GCR 0x01
 #define AW20XX_GCR_ENABLE BIT(0)
 
+#define AW20XX_GCR2 0x04
+#define AW20XX_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
+
 /* LED channel enable register */
 #define AW20XX_LCTR 0x30
 #define AW20XX_LCTR_LE(x) BIT((x))
 
 /* LED channel control registers */
 #define AW20XX_LCFG(x) (0x31 + (x))
-#define AW20XX_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
 #define AW20XX_LCFG_MD BIT(4)
 #define AW20XX_LCFG_FI BIT(5)
 #define AW20XX_LCFG_FO BIT(6)
+#define AW20XX_LCFG_CUR_MASK GENMASK(3, 0)
 
 /* LED channel PWM registers */
 #define AW20XX_REG_PWM(x) (0x34 + (x))
@@ -51,6 +54,14 @@
 #define AW2013_RSTR_CHIP_ID 0x33
 #define AW2013_REG_MAX 0x77
 
+#define AW2027_RSTR_CHIP_ID 0x09
+#define AW2027_REG_MAX 0x7F /* copied from vendor driver, but only up to 0x3F is documented */
+
+#define AW2027_IMAX_15MA (0)
+#define AW2027_IMAX_30MA (1)
+#define AW2027_IMAX_5MA  (2)
+#define AW2027_IMAX_10MA (3)
+
 struct aw20xx;
 
 struct aw20xx_led {
@@ -60,16 +71,70 @@ struct aw20xx_led {
 	unsigned int imax;
 };
 
+struct aw20xx_chipdef {
+	u8 chip_id;
+	const struct regmap_config *regmap_cfg;
+	u32 default_imax;
+	bool gcr2_imax;
+	unsigned int current_levels;
+	unsigned int current_max;
+};
+
 struct aw20xx {
 	struct mutex mutex; /* held when writing to registers */
 	struct regulator_bulk_data regulators[2];
+	struct regmap *regmap;
 	struct i2c_client *client;
 	struct aw20xx_led leds[AW20XX_MAX_LEDS];
-	struct regmap *regmap;
+	const struct aw20xx_chipdef *cdef;
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
+static const struct aw20xx_chipdef aw2013_chipdef = {
+	.chip_id = AW2013_RSTR_CHIP_ID,
+	.regmap_cfg = &aw2013_regmap_config,
+	.default_imax = 1, // 5mA
+	.gcr2_imax = false,
+	.current_levels = 4,
+	.current_max = 15000,
+};
+
+static const struct aw20xx_chipdef aw2027_chipdef = {
+	.chip_id = AW2027_RSTR_CHIP_ID,
+	.regmap_cfg = &aw2027_regmap_config,
+	.default_imax = 3, // 6mA
+	.gcr2_imax = true,
+	.current_levels = 16,
+	.current_max = 30000,
+};
+
+/**
+ * aw20xx_microamp_to_imax() - Finds the closest current step to the given microamp
+ * @microamp: Desired current in microamps
+ * @cdef: Chip definition
+ *
+ * Return: The closest current-step to the given microamp
+ */
+static inline u32 aw20xx_microamp_to_imax(u32 microamp, const struct aw20xx_chipdef *cdef)
+{
+	return min_t(u32, (microamp * (cdef->current_levels - 1))
+			  / cdef->current_max,
+		     cdef->current_levels - 1);
+}
+
 static int aw20xx_chip_init(struct aw20xx *chip)
 {
 	int i, ret;
@@ -81,17 +146,50 @@ static int aw20xx_chip_init(struct aw20xx *chip)
 		return ret;
 	}
 
-	for (i = 0; i < chip->num_leds; i++) {
+	if (chip->cdef->gcr2_imax) {
+		/*
+		 * AW2027 supports 4-step global imax, and also a 16-step control for limiting
+		 * individual current per LED. This doesn't map to the single value the
+		 * devicetree provides super well, so set global imax to maximum, and
+		 * local imax to whatever gets us closest to the value in the devicetree.
+		 */
 		ret = regmap_update_bits(chip->regmap,
-					 AW20XX_LCFG(chip->leds[i].num),
-					 AW20XX_LCFG_IMAX_MASK,
-					 chip->leds[i].imax);
+				AW20XX_GCR2,
+				AW20XX_IMAX_MASK,
+				AW2027_IMAX_30MA);
 		if (ret) {
 			dev_err(&chip->client->dev,
-				"Failed to set maximum current for led %d: %d\n",
-				chip->leds[i].num, ret);
+				"Failed to set maximum global current: %d\n",
+				ret);
 			return ret;
 		}
+
+		for (i = 0; i < chip->num_leds; i++) {
+			ret = regmap_update_bits(chip->regmap,
+						 AW20XX_LCFG(chip->leds[i].num),
+						 AW20XX_LCFG_CUR_MASK,
+						 chip->leds[i].imax);
+			if (ret) {
+				dev_err(&chip->client->dev,
+					"Failed to set maximum current for led %d: %d\n",
+					chip->leds[i].num, ret);
+				return ret;
+			}
+		}
+	} else {
+		/* AW2013 only supports 4-step individual current per LED */
+		for (i = 0; i < chip->num_leds; i++) {
+			ret = regmap_update_bits(chip->regmap,
+						 AW20XX_LCFG(chip->leds[i].num),
+						 AW20XX_IMAX_MASK,
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
@@ -292,9 +390,9 @@ static int aw20xx_probe_dt(struct aw20xx *chip)
 		init_data.fwnode = of_fwnode_handle(child);
 
 		if (!of_property_read_u32(child, "led-max-microamp", &imax)) {
-			led->imax = min_t(u32, imax / 5000, 3);
+			led->imax = aw20xx_microamp_to_imax(imax, chip->cdef);
 		} else {
-			led->imax = 1; // 5mA
+			led->imax = chip->cdef->default_imax;
 			dev_info(&chip->client->dev,
 				 "DT property led-max-microamp is missing\n");
 		}
@@ -323,18 +421,17 @@ static void aw20xx_chip_disable_action(void *data)
 	aw20xx_chip_disable(data);
 }
 
-static const struct regmap_config aw20xx_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.max_register = AW2013_REG_MAX,
-};
-
 static int aw20xx_probe(struct i2c_client *client)
 {
 	struct aw20xx *chip;
+	const struct aw20xx_chipdef *cdef;
 	int ret;
 	unsigned int chipid;
 
+	cdef = device_get_match_data(&client->dev);
+	if (!cdef)
+		return -ENODEV;
+
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
@@ -346,9 +443,10 @@ static int aw20xx_probe(struct i2c_client *client)
 	mutex_lock(&chip->mutex);
 
 	chip->client = client;
+	chip->cdef = cdef;
 	i2c_set_clientdata(client, chip);
 
-	chip->regmap = devm_regmap_init_i2c(client, &aw20xx_regmap_config);
+	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
@@ -382,8 +480,7 @@ static int aw20xx_probe(struct i2c_client *client)
 			ret);
 		goto error_reg;
 	}
-
-	if (chipid != AW2013_RSTR_CHIP_ID) {
+	if (chipid != chip->cdef->chip_id) {
 		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
 			chipid);
 		ret = -ENODEV;
@@ -420,7 +517,8 @@ static int aw20xx_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id aw20xx_match_table[] = {
-	{ .compatible = "awinic,aw2013", },
+	{ .compatible = "awinic,aw2013", .data = &aw2013_chipdef },
+	{ .compatible = "awinic,aw2027", .data = &aw2027_chipdef },
 	{ /* sentinel */ },
 };
 
@@ -437,5 +535,5 @@ static struct i2c_driver aw20xx_driver = {
 module_i2c_driver(aw20xx_driver);
 
 MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
-MODULE_DESCRIPTION("AW2013 LED driver");
+MODULE_DESCRIPTION("AW2013/AW2027 LED driver");
 MODULE_LICENSE("GPL v2");

-- 
2.55.0

