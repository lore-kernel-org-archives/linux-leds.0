Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA1B3AE6F3
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870047; cv=none; b=PrCG6Hd/CBGBciywU2KAGHwGO8ZybuMgH+/Jr8QwFPW76nr8q/mfDaJy6aoMlh8NUf74UcM4LFPkqLb5uAVIAPShUVXvjMoOilZ4NiVglJYCi2V6yNLRLOYVXArsnmm5Jiw2KwLhpCLBrXBFFBPYVVgubYeHxBoUdbwMFrVc6uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870047; c=relaxed/simple;
	bh=Yhr6zMst/Eecg3Talz4GjKubCS6QiW9pY5cWswdRvXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icQgW3y47d3x2FcUmkQnIpWtrDLhUGIf/RmznZKZhoz55PuaPjk4JZurqgbo4TgrxMYS2irK227xbycVMCcYYDAYk689FWMG7rEK6PzB9K3tbEJDCMajfHREBMGe5C922ynMSCXE9O2QxrTlr5FJ280By6t1NDZXRh6oyFoAQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=kurGWWgw; arc=none smtp.client-ip=91.218.175.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="kurGWWgw"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Yhr6zMst/Eecg3Talz4GjKubCS6QiW9pY5cWswdRvXg=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791870044; v=1; x=1792474844;
 b=kurGWWgwTSORO/hBXnggOV2jbB2Fsb4RsRGZkEQVVorgVofftLuMSDAqYvmFUVFelAclEhfB
 uf1lXWj6hbBA5KY/xVzZDHGs6MkwkyMAL3UGldzLpb5qF5F4y9fI6EgSCapUpfHyY3fKpSsnFad
 nFqfYxg+td44zwOq6+WO4iqecUuACJyrjXGe4Dp8VOszI8tk895xn8NEeAoILGM03VuYIfkjZ6K
 /1y/4S93x2n3cXD+LXC5HiYSS8l7/Q2VkJWOk3oQCDqx7CQ9f0xbnVVG5pfZxZdU87MyKBx/Br+
 K4eHjJXTXV5jtJo7FnPKu6QIfeShw3qE/4eOSNVb+pDVg==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 710ac0e63af7254b;
	Tue, 13 Oct 2026 05:40:25 +0000
X-Mizu-Trace-ID: 710ac0e63af7254b
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 12 Oct 2026 22:39:56 -0700
Subject: [PATCH v3 2/6] leds: aw2013: Add AW2027 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-aw2013-aw20xx-rename-v3-2-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791869999; l=8496;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=Yhr6zMst/Eecg3Talz4GjKubCS6QiW9pY5cWswdRvXg=;
 b=ij14bWjzXBAgnPW3iHBYjzUEJCK/so9/rQFdW6WfBrMEOB5ijNr5Vgb5GprtvFQbRWfA0uJ2K
 bZRrdU0DpGuBFf2HhJoGLP44xqen1S04Z0uqqnxZyuGeTso4rZ7Idra
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=

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
 drivers/leds/leds-aw2013.c | 137 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 117 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 216755d6010f..4da33a86af16 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-// Driver for Awinic AW2013 3-channel LED driver
+// Driver for Awinic AW2013/AW2027 3-channel LED drivers
 
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -20,13 +20,15 @@
 #define AW2013_GCR 0x01
 #define AW2013_GCR_ENABLE BIT(0)
 
+#define AW20XX_GCR2 0x04
+#define AW2013_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
+
 /* LED channel enable register */
 #define AW2013_LCTR 0x30
 #define AW2013_LCTR_LE(x) BIT((x))
 
 /* LED channel control registers */
 #define AW2013_LCFG(x) (0x31 + (x))
-#define AW2013_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
 #define AW2013_LCFG_MD BIT(4)
 #define AW2013_LCFG_FI BIT(5)
 #define AW2013_LCFG_FO BIT(6)
@@ -50,6 +52,13 @@
 #define AW2013_REG_MAX 0x77
 
 #define AW2013_TIME_STEP 130 /* ms */
+#define AW2027_RSTR_CHIP_ID 0x09
+#define AW2027_REG_MAX 0x7F /* copied from vendor driver, but only up to 0x3F is documented */
+
+#define AW2027_IMAX_15MA (0)
+#define AW2027_IMAX_30MA (1)
+#define AW2027_IMAX_5MA  (2)
+#define AW2027_IMAX_10MA (3)
 
 struct aw2013;
 
@@ -60,16 +69,70 @@ struct aw2013_led {
 	unsigned int imax;
 };
 
+struct aw2013_chipdef {
+	u8 chip_id;
+	const struct regmap_config *regmap_cfg;
+	u32 default_imax;
+	bool gcr2_imax;
+	unsigned int current_levels;
+	unsigned int current_max;
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
+	.default_imax = 1, // 5mA
+	.gcr2_imax = false,
+	.current_levels = 4,
+	.current_max = 15000,
+};
+
+static const struct aw2013_chipdef aw2027_chipdef = {
+	.chip_id = AW2027_RSTR_CHIP_ID,
+	.regmap_cfg = &aw2027_regmap_config,
+	.default_imax = 3, // 6mA
+	.gcr2_imax = true,
+	.current_levels = 16,
+	.current_max = 30000,
+};
+
+/**
+ * aw2013_microamp_to_imax() - Finds the closest current step to the given microamp
+ * @microamp: Desired current in microamps
+ * @cdef: Chip definition
+ *
+ * Return: The closest current-step to the given microamp
+ */
+static inline u32 aw2013_microamp_to_imax(u32 microamp, const struct aw2013_chipdef *cdef)
+{
+	return min_t(u32, (microamp * (cdef->current_levels - 1))
+			  / cdef->current_max,
+		     cdef->current_levels - 1);
+}
+
 static int aw2013_chip_init(struct aw2013 *chip)
 {
 	int i, ret;
@@ -81,17 +144,50 @@ static int aw2013_chip_init(struct aw2013 *chip)
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
-					 AW2013_LCFG(chip->leds[i].num),
-					 AW2013_LCFG_IMAX_MASK,
-					 chip->leds[i].imax);
+				AW20XX_GCR2,
+				AW2013_IMAX_MASK,
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
+	} else {
+		/* AW2013 only supports 4-step individual current per LED */
+		for (i = 0; i < chip->num_leds; i++) {
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
@@ -292,9 +388,9 @@ static int aw2013_probe_dt(struct aw2013 *chip)
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
@@ -323,18 +419,18 @@ static void aw2013_chip_disable_action(void *data)
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
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
@@ -346,9 +442,10 @@ static int aw2013_probe(struct i2c_client *client)
 	mutex_lock(&chip->mutex);
 
 	chip->client = client;
+	chip->cdef = cdef;
 	i2c_set_clientdata(client, chip);
 
-	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
+	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
@@ -382,8 +479,7 @@ static int aw2013_probe(struct i2c_client *client)
 			ret);
 		goto error_reg;
 	}
-
-	if (chipid != AW2013_RSTR_CHIP_ID) {
+	if (chipid != chip->cdef->chip_id) {
 		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
 			chipid);
 		ret = -ENODEV;
@@ -420,7 +516,8 @@ static int aw2013_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id aw2013_match_table[] = {
-	{ .compatible = "awinic,aw2013", },
+	{ .compatible = "awinic,aw2013", .data = &aw2013_chipdef },
+	{ .compatible = "awinic,aw2027", .data = &aw2027_chipdef },
 	{ /* sentinel */ },
 };
 
@@ -437,5 +534,5 @@ static struct i2c_driver aw2013_driver = {
 module_i2c_driver(aw2013_driver);
 
 MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
-MODULE_DESCRIPTION("AW2013 LED driver");
+MODULE_DESCRIPTION("AW2013/AW2027 LED driver");
 MODULE_LICENSE("GPL v2");

-- 
2.55.0

