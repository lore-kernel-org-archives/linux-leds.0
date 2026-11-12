Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794518588;
	b=QnlNAtI4Nn1rJ8jt0dXQRRC4NxGTnLjA+Oxct4/XsQUM+2BRV4rZix+HggteGY4Cwqg7
	 C8pi2BM222XLdnMU3kNMI685hCKWaIyD+gtaeXcppew2WLXUoJPgf/y8QD33s/OMX5RQK
	 Tev5hkVQsQu9avSKfgZDATaGPQLgknyQCnFWuXdqednQgkFmBYujtrNcF3uPdPw/gMKSd
	 PdBYQrFq5HQXYYcn6277sWxKSmXwsUbrkcydZOUbSYKfK1Khgwmti3pXX8KRzb1D0EDq9
	 zCowUudvWcYJTyrOPy5xiHyeaxaZNEslLmw5JK/AI7GHNRUtOBxvGUp1XbhgaQQjXuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518588;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+PcxU8xtF/OhTQyS35HzHN2hhvMd6i1nLVblqjuh0Uc=;
	b=J35VCtkydjRKvwvddwAjOgssqrD3SyvHC4m7axQI+ofODBNbi5F+Q9ezFfuJNZfl3Gh6
	 vioiQCXczfqzBIsMbapGWiExIXJabr/j9EmJgJh0lKPkUAaW+qEA74407Gu9u8uv4AoO3
	 CU23CSYUwt6kcD+ZKqLUivPvhfOf20Wgqtrg+zDPSJe3H+xrf8PYa1mdiECgayRWezlaU
	 RufdHP7wbDdEQqkhoEZB6GoNzSasWm2B27p2hZVC4WH0WPIgyQx0ugGwvyn8goSt4Xv3j
	 jQCT7syBSA7LBo9cdWTeD7illZ/urRk8LoAkLcdARl/Q7eIQFH8mVo6uF5t7R/u1cCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KR90oDSO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB9B60A2622;
	Thu, 12 Nov 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KR90oDSO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794518588;
	b=qvm+ScvyfsXaJzj0vDtMRYyyVF4rsFAHUK/Mi93upC/OLwN1lA2ObX++E7VsXMDfRRJk
	 4dQLuV7bH98fpovEt8uCgEoNn3FQxHpHuA45MVrVm5K91N19F37bpNkUnDi40UD1eUPUx
	 ZViggEiahuAWzDDKkCMSmMASlnPeJimOAKW+zmEay3YFymZ923X4xwdT6WHvQQ5kLH7CZ
	 et58Vsiopw+R+Kg2+3kZHqc7Fknta+7X4nWTcv2UZUqXbi62KL9tdbUM4ruBDcpxC5ket
	 QjYyJRenG/K4SqKmCWrWhfOL/MMB0Pq8hihxywu39nysbUzwyDNaeCCpadYDaK9XCOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794518588;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+PcxU8xtF/OhTQyS35HzHN2hhvMd6i1nLVblqjuh0Uc=;
	b=IO8LUE+P8l9JrmjRcJAnsVeETbJgW7R4PutEdVL3DhDhi9P+F2GCGRR8+OI73+afFtty
	 1QEWNkOSRmnsp1fMkZhrVfre1R3icy0f9u+eG9O5ZqnblZJAwVZubAz2AnNne0/72tNsa
	 gmdx+l04UsGbytF0PGeDRjucRHOFgNu7DsuqpIBQeJt6STnBU2MZLXMezRnhL51YmXNec
	 1zKlSGrmPoW2sQU3xoSaJPyZzuqqVU+1BE17xfGO7uBrY+a6oauDultyHZilIUNeNX1V7
	 +Da68qoIkZPv+0FmZk/jL7sC3FaZVXBJQkB3VBSAl4419SpVNrB78fj0vdf/8+Zn3DA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E822A1F000C7;
	Thu, 12 Nov 2026 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518588;
	bh=+PcxU8xtF/OhTQyS35HzHN2hhvMd6i1nLVblqjuh0Uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KR90oDSOTw+8KDqbVx8oKTERFKHZiBHRErJT6jkp7i0pICR++qQ7w6wVygj8sTLbQ
	 njRsCZSwakEs6n/dXzUWE0lM9let54+PCG7eHC2+P30OTvaPgOmZaQTPcEtGK4Cf+i
	 9yO4vNhUYRGDbVJkofqZb9WforNYaHjYra9rUZc4DLq+gvRZMCdA0+vH4MzUjqrmbU
	 nPjnZYvsodn8UShEZJFAyg2ctJJLBHzpxPeA7KOVAZh0sP0f314tERMPugOQqwDWBv
	 jP5rJ778GQ2a1pcA2QsBDFpMucF5x0CDIeQPpeiYH3fyxkXxbMeBhUNGfzBfpmHpX+
	 16y96k/xPV16A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 730C947502;
	Thu, 12 Nov 2026 21:23:06 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Thu, 12 Nov 2026 14:22:57 -0700
Subject: [PATCH v5 2/3] leds: aw2013: Add AW2027 support
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
Message-Id: <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
In-Reply-To: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794518585; l=9106;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=2eiooE13n4hKf+4tc9jLxzI6K57GPdGHk2TQou8hvfE=;
 b=x5ECFVPddLrM7ez9k/AH5EvT9bIxXD1rfe7pcPIkrNLDegDUWOjN7pmNkjxr2+xaaujKC2kT+
 qytHY5pXbiGB/7LjdYszPMBeUZYVtn4uc6nd0UfFhnUhpRiRTahdnHl
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org
Content-Transfer-Encoding: 7bit

From: Paul Sajna <sajattack@postmarketos.org>

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
 drivers/leds/leds-aw2013.c | 147 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 129 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index cf20e94920fd..d3858b06e594 100644
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
+#define AW2027_REG_MAX 0x7F /* copied from vendor driver, but only up to 0x3F is documented */
+#define AW2027_LOCAL_IMAX_MASK GENMASK(3, 0)
+
+#define AW2027_GLOBAL_IMAX_15MA 0
+#define AW2027_GLOBAL_IMAX_30MA 1
+#define AW2027_GLOBAL_IMAX_5MA  2
+#define AW2027_GLOBAL_IMAX_10MA 3
+
 struct aw2013;
 
 struct aw2013_led {
@@ -60,23 +72,89 @@ struct aw2013_led {
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
 
-static int aw2013_chip_init(struct aw2013 *chip)
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
+	.current_max_ua = 15000,
+};
+
+static const struct aw2013_chipdef aw2027_chipdef = {
+	.chip_id = AW2016_23_27_33_CHIPID,
+	.regmap_cfg = &aw2027_regmap_config,
+	.default_imax = 3, // 6mA
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
+static int aw2027_set_imax(struct aw2013 *chip)
 {
 	int i, ret;
 
-	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
+	/*
+	 * AW2027 supports 4-step global imax, and also a 16-step control for limiting
+	 * individual current per LED. This doesn't map to the single value the
+	 * devicetree provides super well, so set global imax to maximum, and
+	 * local imax to whatever gets us closest to the value in the devicetree.
+	 */
+	ret = regmap_update_bits(chip->regmap,
+				 AW20XX_GCR2,
+				 AW2013_IMAX_MASK,
+				 AW2027_GLOBAL_IMAX_30MA);
 	if (ret) {
-		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
+		dev_err(&chip->client->dev,
+			"Failed to set maximum global current: %d\n",
 			ret);
 		return ret;
 	}
@@ -84,7 +162,7 @@ static int aw2013_chip_init(struct aw2013 *chip)
 	for (i = 0; i < chip->num_leds; i++) {
 		ret = regmap_update_bits(chip->regmap,
 					 AW2013_LCFG(chip->leds[i].num),
-					 AW2013_LCFG_IMAX_MASK,
+					 AW2027_LOCAL_IMAX_MASK,
 					 chip->leds[i].imax);
 		if (ret) {
 			dev_err(&chip->client->dev,
@@ -97,6 +175,38 @@ static int aw2013_chip_init(struct aw2013 *chip)
 	return ret;
 }
 
+static int aw2013_chip_init(struct aw2013 *chip)
+{
+	int i, ret;
+
+	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
+	if (ret) {
+		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
+			ret);
+		return ret;
+	}
+
+	if (chip->cdef->gcr2_imax) {
+		ret = aw2027_set_imax(chip);
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
+	}
+
+	return ret;
+}
+
 static void aw2013_chip_disable(struct aw2013 *chip)
 {
 	int ret;
@@ -293,9 +403,9 @@ static int aw2013_probe_dt(struct aw2013 *chip)
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
@@ -334,18 +444,18 @@ static void aw2013_chip_disable_action(void *data)
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
@@ -357,9 +467,10 @@ static int aw2013_probe(struct i2c_client *client)
 	mutex_lock(&chip->mutex);
 
 	chip->client = client;
+	chip->cdef = cdef;
 	i2c_set_clientdata(client, chip);
 
-	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
+	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
@@ -393,8 +504,7 @@ static int aw2013_probe(struct i2c_client *client)
 			ret);
 		goto error_reg;
 	}
-
-	if (chipid != AW2013_RSTR_CHIP_ID) {
+	if (chipid != chip->cdef->chip_id) {
 		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
 			chipid);
 		ret = -ENODEV;
@@ -433,7 +543,8 @@ static int aw2013_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id aw2013_match_table[] = {
-	{ .compatible = "awinic,aw2013", },
+	{ .compatible = "awinic,aw2013", .data = &aw2013_chipdef },
+	{ .compatible = "awinic,aw2027", .data = &aw2027_chipdef },
 	{ /* sentinel */ },
 };
 
@@ -450,5 +561,5 @@ static struct i2c_driver aw2013_driver = {
 module_i2c_driver(aw2013_driver);
 
 MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
-MODULE_DESCRIPTION("AW2013 LED driver");
+MODULE_DESCRIPTION("AW2013/AW2027 LED driver");
 MODULE_LICENSE("GPL v2");

-- 
2.56.0


