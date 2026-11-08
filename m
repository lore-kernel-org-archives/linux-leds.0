Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174583;
	b=gTmbGXFlMUoxgqLiKx+ilwiGsv0U7j0BmL8WhXCURcmynZBkCyEuLr1IypmtjY1D8wqc
	 1B2RybiLQ9dJJiUL9pu1o8B/4f7p6aA+lGy1WrVxNTDV2FO2gV6RjBgIjMEFtZT4frkxy
	 CAujT80ff53BhPN7uh5pj8T9wSgkgZXWYUd0jpkqu9leYboaFhCRYwhO+AWf3/RjL2lbN
	 ac4lswUnczFfR3LW1GijaE2o0tR82ZBX8XU6hI6vrJTSha++z6XjdTlNUdD9BJBHPD6aC
	 onxAkpkJMbzhd6u9tBPIwSlv5JNB51UMJu//G03X2USc+9e7lskWlTnUknrktYYWp9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174583;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pcvsOvY+1nARVNwveblF9kWsR1jprq/mjoxrNvXiCgU=;
	b=PXQSqRiTjPcCcIJu5CwUn9wbKngmn79bKUex9yfTFnhqLXA1VPX3+uJn3oGT2kNBk9Ry
	 5yrLb24tjhSFFRVTO+b1Kp0qMBKLkTZLoG7RAB24WneRmv3EDL/8op+aVpMLsVFlSYpF2
	 2RCNXDyfIO/iaq6uz9DlcECpGEcfS+UTbVOLtGcDyssa+AnrvcnQexo+N6kKu36aY6009
	 Fo4r2JfM9qrt8CT2BBkLOdk82VDybxk2VEGqKgWrJE0bOzUMWQrpLYeyZBhMY7QYEbPty
	 b+PoxeJpqrhSOln6hysL8akB3tMvPUWpJiVAkhfbG65YciUdK8OFoE6mwbk7F6GmmBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b="Ux/RbJPh";
	arc=none smtp.remote-ip=95.215.58.158
Received: from mta1.migadu.com (out-158.mta1.migadu.com [95.215.58.158])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E32C606A33C
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 21:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E32C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=Ux/RbJPh
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eW/HzrtU3D2RlCcjuS/znvMmExSBkJPsARgvIb59RCs=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174580; v=1; x=1794779380;
 b=Ux/RbJPhH6Cw9/+Y791sDJNpDb6+Cpd2+emKg0es5NSfHUVOmQByQ07S9+lLMoMba3nwLLdS
 RFGFih2o/6WltHEuEs9ML4jXiivPWn/1mAdo+m8ocRkllMh/6IAQLgBGhNzue78n4pmEwGodl4c
 ZJpB96PHIZ67SjhsNwpAhmNZaK2DNW97sEKCTE5Zcn8Fuk56o3mUKpKKWGbz7kUL8f7xNnaVhec
 iimD8npWgDjIZ2ReVFlQAx9dsn5J34/Q/ff3pNs6ipTHtpIc7WcI+OArnIfg6nZ869Uw9JC/Z96
 FUREML078SdXOYUrQ3Y9a5qGbtQhohrPi5ZkE1jOhiHTQ==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b24ab47eae340d24;
	Sun, 08 Nov 2026 21:49:40 +0000
X-Mizu-Trace-ID: b24ab47eae340d24
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:49:13 -0700
Subject: [PATCH v4 2/4] leds: aw2013: Add AW2027 support
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
Message-Id: <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=8947;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=eW/HzrtU3D2RlCcjuS/znvMmExSBkJPsARgvIb59RCs=;
 b=PMJSeaNmX6EvgZKHXYVLXvZDuJietwj+Vxe6eHT+UycRXlq59Jos/vG8WcpJyfUcln03PTHnl
 ZHrxXEQZOBqDZCMDgQNeX0hpL54clZEDAXixpvueNzU9kzOA6dfbyF3
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
 drivers/leds/leds-aw2013.c | 145 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 127 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 216755d6010f..a51b72de21ac 100644
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
@@ -60,23 +72,87 @@ struct aw2013_led {
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
+	.current_max = 15000,
+};
+
+static const struct aw2013_chipdef aw2027_chipdef = {
+	.chip_id = AW2016_23_27_33_CHIPID,
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
@@ -84,7 +160,7 @@ static int aw2013_chip_init(struct aw2013 *chip)
 	for (i = 0; i < chip->num_leds; i++) {
 		ret = regmap_update_bits(chip->regmap,
 					 AW2013_LCFG(chip->leds[i].num),
-					 AW2013_LCFG_IMAX_MASK,
+					 AW2027_LOCAL_IMAX_MASK,
 					 chip->leds[i].imax);
 		if (ret) {
 			dev_err(&chip->client->dev,
@@ -97,6 +173,38 @@ static int aw2013_chip_init(struct aw2013 *chip)
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
@@ -292,9 +400,9 @@ static int aw2013_probe_dt(struct aw2013 *chip)
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
@@ -323,18 +431,18 @@ static void aw2013_chip_disable_action(void *data)
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
@@ -346,9 +454,10 @@ static int aw2013_probe(struct i2c_client *client)
 	mutex_lock(&chip->mutex);
 
 	chip->client = client;
+	chip->cdef = cdef;
 	i2c_set_clientdata(client, chip);
 
-	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
+	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
@@ -382,8 +491,7 @@ static int aw2013_probe(struct i2c_client *client)
 			ret);
 		goto error_reg;
 	}
-
-	if (chipid != AW2013_RSTR_CHIP_ID) {
+	if (chipid != chip->cdef->chip_id) {
 		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
 			chipid);
 		ret = -ENODEV;
@@ -420,7 +528,8 @@ static int aw2013_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id aw2013_match_table[] = {
-	{ .compatible = "awinic,aw2013", },
+	{ .compatible = "awinic,aw2013", .data = &aw2013_chipdef },
+	{ .compatible = "awinic,aw2027", .data = &aw2027_chipdef },
 	{ /* sentinel */ },
 };
 
@@ -437,5 +546,5 @@ static struct i2c_driver aw2013_driver = {
 module_i2c_driver(aw2013_driver);
 
 MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
-MODULE_DESCRIPTION("AW2013 LED driver");
+MODULE_DESCRIPTION("AW2013/AW2027 LED driver");
 MODULE_LICENSE("GPL v2");

-- 
2.56.0

