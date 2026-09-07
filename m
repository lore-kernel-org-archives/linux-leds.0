Received: from mta1.migadu.com (out-63.mta1.migadu.com [95.215.58.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680813A875E
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 23:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824916; cv=none; b=Krz1SCASEX4g8BWuZN564Et2Zuag2SefK5Zq8TCpRs7lqGewGb72hSLM2553+kcAwmVxXhCFEm8J9tx/f7iuM8sWKpeWhow/F5IXsUPFKdnYFnrbb3FRbIo5J6N6SCgGhz/lm8cbOk5Vrelz/JYoG2LRWg0VP2OMoSWeGDNulqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824916; c=relaxed/simple;
	bh=p6QkN5XU5iG1SB3+bNQAFJKzmgJWrsnX8EWPgh5HKFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipirPnaDKRNBO/PFcBlXB473Dl7i1Kbun5QBs4io1yYC5vZpOFVQYa9x9aAcMKE93G5RxfPgeLQa/iMC36WSqS+LYYn0zPkowpkdPkFYVrpU0/P1WIPd4CeZRY8jv2n2H0n5y4EzUy4JKnwFFThLD7iIR1tTP4fhyT2s/O1XjxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=GH5I42g2; arc=none smtp.client-ip=95.215.58.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="GH5I42g2"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=p6QkN5XU5iG1SB3+bNQAFJKzmgJWrsnX8EWPgh5HKFU=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788824911; v=1; x=1789429711;
 b=GH5I42g2ITerfdMILSRiQieciljoZOcwN2eOjKcDHQ+bsGjW4O9uEFQenat73PE/qoKsjssu
 Bpr57Rgr9zrTjH1weaX0UHnRavn0vinCFlgbku8jC2gz0JvC+at3Kx0PIs6KfOO1zXje/36iIYZ
 d5Wr6OrQNndESso9GsW7uMv0bUrQ4eVfCLSeFboCzozUxDK+UrUjrVjM/d9Vmc1qROYHErKp5va
 ejnxAi3wHgjYAX7C8pUY9JfZdSnm6/1pwb51lnxb2Dj23A17tn7HRvHpOeWjWpjY17HNvAQGva2
 fchJSOEVLf6D9rqXMaJnCBDAoQK51yMuAD0Tbl5Ebwhyg==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fff151c01ed7c8dd;
	Mon, 07 Sep 2026 23:48:31 +0000
X-Mizu-Trace-ID: fff151c01ed7c8dd
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 07 Sep 2026 16:47:53 -0700
Subject: [PATCH RFC 3/3] leds: aw2013: Add AW2027 support and rename to
 aw20xx
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-aw2013-aw20xx-rename-v1-3-c9a7df12a701@postmarketos.org>
References: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
In-Reply-To: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788824891; l=18741;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=p6QkN5XU5iG1SB3+bNQAFJKzmgJWrsnX8EWPgh5HKFU=;
 b=IR9K3ZcHqUdfdwWPQ2X32vGCJzG3wFVQbKwzcmPrYjGEMDXTZhZae0nKX6Q2j8+01mXNlAsQ5
 4xPauecIhRQBrDlT10jCuRsQVJGT6qFMGLAW501oBM9cUL0ql/Fgnpy
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

Comparison of all AW20xx chips https://www.awinic.com/en/productCompareList?id=47&ids=1022,74,96,75,72,71,928,927,73,76,578
AW2027 datasheet: https://doc.awinic.com/doc/202507/77b87097-27bf-48cd-af9b-9b615064c1e1.pdf
Vendor driver: https://www.awinic.com/en/driver/AW2027DNR/454

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw20xx.c | 306 +++++++++++++++++++++++++++++----------------
 1 file changed, 195 insertions(+), 111 deletions(-)

diff --git a/drivers/leds/leds-aw20xx.c b/drivers/leds/leds-aw20xx.c
index 216755d6010f..635965b712d4 100644
--- a/drivers/leds/leds-aw20xx.c
+++ b/drivers/leds/leds-aw20xx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-// Driver for Awinic AW2013 3-channel LED driver
+// Driver for Awinic AW20XX 3-channel LED drivers
 
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -9,102 +9,188 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 
-#define AW2013_MAX_LEDS 3
+#define AW20XX_MAX_LEDS 3
 
 /* Reset and ID register */
-#define AW2013_RSTR 0x00
-#define AW2013_RSTR_RESET 0x55
+#define AW20XX_RSTR 0x00
+#define AW20XX_RSTR_RESET 0x55
 #define AW2013_RSTR_CHIP_ID 0x33
+#define AW2027_RSTR_CHIP_ID 0x09
 
 /* Global control register */
-#define AW2013_GCR 0x01
-#define AW2013_GCR_ENABLE BIT(0)
+#define AW20XX_GCR 0x01
+#define AW20XX_GCR_ENABLE BIT(0)
+
+#define AW20XX_GCR2 0x04
+#define AW20XX_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
 
 /* LED channel enable register */
-#define AW2013_LCTR 0x30
-#define AW2013_LCTR_LE(x) BIT((x))
+#define AW20XX_LCTR 0x30
+#define AW20XX_LCTR_LE(x) BIT((x))
 
 /* LED channel control registers */
-#define AW2013_LCFG(x) (0x31 + (x))
-#define AW2013_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
-#define AW2013_LCFG_MD BIT(4)
-#define AW2013_LCFG_FI BIT(5)
-#define AW2013_LCFG_FO BIT(6)
+#define AW20XX_LCFG(x) (0x31 + (x))
+#define AW20XX_LCFG_CUR_MASK GENMASK(3, 0)
+#define AW20XX_LCFG_MD BIT(4)
+#define AW20XX_LCFG_FI BIT(5)
+#define AW20XX_LCFG_FO BIT(6)
+
+#define AW2027_IMAX_15MA (0)
+#define AW2027_IMAX_30MA (1)
+#define AW2027_IMAX_5MA  (2)
+#define AW2027_IMAX_10MA (3)
 
 /* LED channel PWM registers */
-#define AW2013_REG_PWM(x) (0x34 + (x))
+#define AW20XX_REG_PWM(x) (0x34 + (x))
 
 /* LED channel timing registers */
-#define AW2013_LEDT0(x) (0x37 + (x) * 3)
-#define AW2013_LEDT0_T1(x) ((x) << 4) // Should be 0-7
-#define AW2013_LEDT0_T2(x) (x) // Should be 0-5
+#define AW20XX_LEDT0(x) (0x37 + (x) * 3)
+#define AW20XX_LEDT0_T1(x) ((x) << 4) // Should be 0-7
+#define AW20XX_LEDT0_T2(x) (x) // Should be 0-5
 
-#define AW2013_LEDT1(x) (0x38 + (x) * 3)
-#define AW2013_LEDT1_T3(x) ((x) << 4) // Should be 0-7
-#define AW2013_LEDT1_T4(x) (x) // Should be 0-7
+#define AW20XX_LEDT1(x) (0x38 + (x) * 3)
+#define AW20XX_LEDT1_T3(x) ((x) << 4) // Should be 0-7
+#define AW20XX_LEDT1_T4(x) (x) // Should be 0-7
 
-#define AW2013_LEDT2(x) (0x39 + (x) * 3)
-#define AW2013_LEDT2_T0(x) ((x) << 4) // Should be 0-8
-#define AW2013_LEDT2_REPEAT(x) (x) // Should be 0-15
+#define AW20XX_LEDT2(x) (0x39 + (x) * 3)
+#define AW20XX_LEDT2_T0(x) ((x) << 4) // Should be 0-8
+#define AW20XX_LEDT2_REPEAT(x) (x) // Should be 0-15
 
 #define AW2013_REG_MAX 0x77
+#define AW2027_REG_MAX 0x7F /* copied from vendor driver, but only up to 0x3F is documented */
 
-#define AW2013_TIME_STEP 130 /* ms */
+#define AW20XX_TIME_STEP 130 /* ms */
 
-struct aw2013;
+struct aw20xx;
 
-struct aw2013_led {
-	struct aw2013 *chip;
+struct aw20xx_led {
+	struct aw20xx *chip;
 	struct led_classdev cdev;
 	u32 num;
 	unsigned int imax;
 };
 
-struct aw2013 {
+struct aw20xx_chipdef {
+	u8 chip_id;
+	const struct regmap_config regmap_cfg;
+	u32 default_imax;
+	bool gcr2_imax;
+	unsigned int current_levels;
+	unsigned int current_max;
+};
+
+struct aw20xx {
 	struct mutex mutex; /* held when writing to registers */
 	struct regulator_bulk_data regulators[2];
-	struct i2c_client *client;
-	struct aw2013_led leds[AW2013_MAX_LEDS];
 	struct regmap *regmap;
+	struct i2c_client *client;
+	struct aw20xx_led leds[AW20XX_MAX_LEDS];
+	const struct aw20xx_chipdef *cdef;
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
+/* finds the closest current step to the given microamp
+ * given the max current and number of levels
+ */
+inline u32 aw20xx_microamp_to_imax(u32 microamp, const struct aw20xx_chipdef *cdef)
+{
+	return min_t(u32, ((microamp * (cdef->current_levels - 1))
+			  + (cdef->current_max / 2)) / cdef->current_max,
+		     cdef->current_levels - 1);
+}
+
+static const struct aw20xx_chipdef aw2013_chipdef = {
+	.chip_id = AW2013_RSTR_CHIP_ID,
+	.regmap_cfg = aw2013_regmap_config,
+	.default_imax = 0b01, // 5mA
+	.gcr2_imax = false,
+	.current_levels = 4,
+	.current_max = 15000,
+};
+
+static const struct aw20xx_chipdef aw2027_chipdef = {
+	.chip_id = AW2027_RSTR_CHIP_ID,
+	.regmap_cfg = aw2027_regmap_config,
+	.default_imax = AW2027_IMAX_15MA,
+	.gcr2_imax = true,
+	.current_levels = 16,
+	.current_max = 30000,
+};
+
+static int aw20xx_chip_init(struct aw20xx *chip)
 {
 	int i, ret;
 
-	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
+	ret = regmap_write(chip->regmap, AW20XX_GCR, AW20XX_GCR_ENABLE);
 	if (ret) {
 		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
 			ret);
 		return ret;
 	}
 
-	for (i = 0; i < chip->num_leds; i++) {
+	if (chip->cdef->gcr2_imax) {
+		/* AW2027 supports 4-step global imax, and also a 16-step control for limiting
+		 * individual current per LED. This doesn't map to the single value the
+		 * devicetree provides super well, so set global imax  to maximum, and
+		 * local imax to whatever gets us closest to the value in the devicetree
+		 */
 		ret = regmap_update_bits(chip->regmap,
-					 AW2013_LCFG(chip->leds[i].num),
-					 AW2013_LCFG_IMAX_MASK,
-					 chip->leds[i].imax);
-		if (ret) {
-			dev_err(&chip->client->dev,
-				"Failed to set maximum current for led %d: %d\n",
-				chip->leds[i].num, ret);
-			return ret;
+				AW20XX_GCR2,
+				AW20XX_IMAX_MASK,
+				AW2027_IMAX_30MA);
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
 		}
 	}
 
 	return ret;
 }
 
-static void aw2013_chip_disable(struct aw2013 *chip)
+static void aw20xx_chip_disable(struct aw20xx *chip)
 {
 	int ret;
 
 	if (!chip->enabled)
 		return;
 
-	regmap_write(chip->regmap, AW2013_GCR, 0);
+	regmap_write(chip->regmap, AW20XX_GCR, 0);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
@@ -117,7 +203,7 @@ static void aw2013_chip_disable(struct aw2013 *chip)
 	chip->enabled = false;
 }
 
-static int aw2013_chip_enable(struct aw2013 *chip)
+static int aw20xx_chip_enable(struct aw20xx *chip)
 {
 	int ret;
 
@@ -133,14 +219,14 @@ static int aw2013_chip_enable(struct aw2013 *chip)
 	}
 	chip->enabled = true;
 
-	ret = aw2013_chip_init(chip);
+	ret = aw20xx_chip_init(chip);
 	if (ret)
-		aw2013_chip_disable(chip);
+		aw20xx_chip_disable(chip);
 
 	return ret;
 }
 
-static bool aw2013_chip_in_use(struct aw2013 *chip)
+static bool aw20xx_chip_in_use(struct aw20xx *chip)
 {
 	int i;
 
@@ -151,42 +237,42 @@ static bool aw2013_chip_in_use(struct aw2013 *chip)
 	return false;
 }
 
-static int aw2013_brightness_set(struct led_classdev *cdev,
+static int aw20xx_brightness_set(struct led_classdev *cdev,
 				 enum led_brightness brightness)
 {
-	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
+	struct aw20xx_led *led = container_of(cdev, struct aw20xx_led, cdev);
 	int ret, num;
 
 	mutex_lock(&led->chip->mutex);
 
-	if (aw2013_chip_in_use(led->chip)) {
-		ret = aw2013_chip_enable(led->chip);
+	if (aw20xx_chip_in_use(led->chip)) {
+		ret = aw20xx_chip_enable(led->chip);
 		if (ret)
 			goto error;
 	}
 
 	num = led->num;
 
-	ret = regmap_write(led->chip->regmap, AW2013_REG_PWM(num), brightness);
+	ret = regmap_write(led->chip->regmap, AW20XX_REG_PWM(num), brightness);
 	if (ret)
 		goto error;
 
 	if (brightness) {
-		ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
-					 AW2013_LCTR_LE(num), 0xFF);
+		ret = regmap_update_bits(led->chip->regmap, AW20XX_LCTR,
+					 AW20XX_LCTR_LE(num), 0xFF);
 	} else {
-		ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
-					 AW2013_LCTR_LE(num), 0);
+		ret = regmap_update_bits(led->chip->regmap, AW20XX_LCTR,
+					 AW20XX_LCTR_LE(num), 0);
 		if (ret)
 			goto error;
-		ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
-					 AW2013_LCFG_MD, 0);
+		ret = regmap_update_bits(led->chip->regmap, AW20XX_LCFG(num),
+					 AW20XX_LCFG_MD, 0);
 	}
 	if (ret)
 		goto error;
 
-	if (!aw2013_chip_in_use(led->chip))
-		aw2013_chip_disable(led->chip);
+	if (!aw20xx_chip_in_use(led->chip))
+		aw20xx_chip_disable(led->chip);
 
 error:
 	mutex_unlock(&led->chip->mutex);
@@ -194,10 +280,10 @@ static int aw2013_brightness_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int aw2013_blink_set(struct led_classdev *cdev,
+static int aw20xx_blink_set(struct led_classdev *cdev,
 			    unsigned long *delay_on, unsigned long *delay_off)
 {
-	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
+	struct aw20xx_led *led = container_of(cdev, struct aw20xx_led, cdev);
 	int ret, num = led->num;
 	unsigned long off = 0, on = 0;
 
@@ -209,7 +295,7 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 
 	if (!led->cdev.brightness) {
 		led->cdev.brightness = LED_FULL;
-		ret = aw2013_brightness_set(&led->cdev, led->cdev.brightness);
+		ret = aw20xx_brightness_set(&led->cdev, led->cdev.brightness);
 		if (ret)
 			return ret;
 	}
@@ -217,43 +303,43 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 	/* Never on - just set to off */
 	if (!*delay_on) {
 		led->cdev.brightness = LED_OFF;
-		return aw2013_brightness_set(&led->cdev, LED_OFF);
+		return aw20xx_brightness_set(&led->cdev, LED_OFF);
 	}
 
 	mutex_lock(&led->chip->mutex);
 
 	/* Never off - brightness is already set, disable blinking */
 	if (!*delay_off) {
-		ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
-					 AW2013_LCFG_MD, 0);
+		ret = regmap_update_bits(led->chip->regmap, AW20XX_LCFG(num),
+					 AW20XX_LCFG_MD, 0);
 		goto out;
 	}
 
 	/* Convert into values the HW will understand. */
-	off = min(5, ilog2((*delay_off - 1) / AW2013_TIME_STEP) + 1);
-	on = min(7, ilog2((*delay_on - 1) / AW2013_TIME_STEP) + 1);
+	off = min(5, ilog2((*delay_off - 1) / AW20XX_TIME_STEP) + 1);
+	on = min(7, ilog2((*delay_on - 1) / AW20XX_TIME_STEP) + 1);
 
-	*delay_off = BIT(off) * AW2013_TIME_STEP;
-	*delay_on = BIT(on) * AW2013_TIME_STEP;
+	*delay_off = BIT(off) * AW20XX_TIME_STEP;
+	*delay_on = BIT(on) * AW20XX_TIME_STEP;
 
 	/* Set timings */
 	ret = regmap_write(led->chip->regmap,
-			   AW2013_LEDT0(num), AW2013_LEDT0_T2(on));
+			   AW20XX_LEDT0(num), AW20XX_LEDT0_T2(on));
 	if (ret)
 		goto out;
 	ret = regmap_write(led->chip->regmap,
-			   AW2013_LEDT1(num), AW2013_LEDT1_T4(off));
+			   AW20XX_LEDT1(num), AW20XX_LEDT1_T4(off));
 	if (ret)
 		goto out;
 
 	/* Finally, enable the LED */
-	ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
-				 AW2013_LCFG_MD, 0xFF);
+	ret = regmap_update_bits(led->chip->regmap, AW20XX_LCFG(num),
+				 AW20XX_LCFG_MD, 0xFF);
 	if (ret)
 		goto out;
 
-	ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
-				 AW2013_LCTR_LE(num), 0xFF);
+	ret = regmap_update_bits(led->chip->regmap, AW20XX_LCTR,
+				 AW20XX_LCTR_LE(num), 0xFF);
 
 out:
 	mutex_unlock(&led->chip->mutex);
@@ -261,17 +347,17 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int aw2013_probe_dt(struct aw2013 *chip)
+static int aw20xx_probe_dt(struct aw20xx *chip)
 {
 	struct device_node *np = dev_of_node(&chip->client->dev);
 	int count, ret = 0, i = 0;
-	struct aw2013_led *led;
+	struct aw20xx_led *led;
 
 	count = of_get_available_child_count(np);
-	if (!count || count > AW2013_MAX_LEDS)
+	if (!count || count > AW20XX_MAX_LEDS)
 		return -EINVAL;
 
-	regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
+	regmap_write(chip->regmap, AW20XX_RSTR, AW20XX_RSTR_RESET);
 
 	for_each_available_child_of_node_scoped(np, child) {
 		struct led_init_data init_data = {};
@@ -279,7 +365,7 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 		u32 imax;
 
 		ret = of_property_read_u32(child, "reg", &source);
-		if (ret != 0 || source >= AW2013_MAX_LEDS) {
+		if (ret != 0 || source >= AW20XX_MAX_LEDS) {
 			dev_err(&chip->client->dev,
 				"Couldn't read LED address: %d\n", ret);
 			count--;
@@ -292,15 +378,15 @@ static int aw2013_probe_dt(struct aw2013 *chip)
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
 
-		led->cdev.brightness_set_blocking = aw2013_brightness_set;
-		led->cdev.blink_set = aw2013_blink_set;
+		led->cdev.brightness_set_blocking = aw20xx_brightness_set;
+		led->cdev.blink_set = aw20xx_blink_set;
 
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
@@ -318,23 +404,20 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 	return 0;
 }
 
-static void aw2013_chip_disable_action(void *data)
+static void aw20xx_chip_disable_action(void *data)
 {
-	aw2013_chip_disable(data);
+	aw20xx_chip_disable(data);
 }
 
-static const struct regmap_config aw2013_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.max_register = AW2013_REG_MAX,
-};
-
-static int aw2013_probe(struct i2c_client *client)
+static int aw20xx_probe(struct i2c_client *client)
 {
-	struct aw2013 *chip;
+	struct aw20xx *chip;
+	const struct aw20xx_chipdef *cdef;
 	int ret;
 	unsigned int chipid;
 
+	cdef = device_get_match_data(&client->dev);
+
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
@@ -346,9 +429,10 @@ static int aw2013_probe(struct i2c_client *client)
 	mutex_lock(&chip->mutex);
 
 	chip->client = client;
+	chip->cdef = cdef;
 	i2c_set_clientdata(client, chip);
 
-	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
+	chip->regmap = devm_regmap_init_i2c(client, &chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
@@ -369,32 +453,31 @@ static int aw2013_probe(struct i2c_client *client)
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
-				    chip->regulators);
+					chip->regulators);
 	if (ret) {
 		dev_err(&client->dev,
 			"Failed to enable regulators: %d\n", ret);
 		goto error;
 	}
 
-	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
+	ret = regmap_read(chip->regmap, AW20XX_RSTR, &chipid);
 	if (ret) {
 		dev_err(&client->dev, "Failed to read chip ID: %d\n",
 			ret);
 		goto error_reg;
 	}
-
-	if (chipid != AW2013_RSTR_CHIP_ID) {
+	if (chipid != chip->cdef->chip_id) {
 		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
 			chipid);
 		ret = -ENODEV;
 		goto error_reg;
 	}
 
-	ret = devm_add_action(&client->dev, aw2013_chip_disable_action, chip);
+	ret = devm_add_action(&client->dev, aw20xx_chip_disable_action, chip);
 	if (ret)
 		goto error_reg;
 
-	ret = aw2013_probe_dt(chip);
+	ret = aw20xx_probe_dt(chip);
 	if (ret < 0)
 		goto error_reg;
 
@@ -419,23 +502,24 @@ static int aw2013_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct of_device_id aw2013_match_table[] = {
-	{ .compatible = "awinic,aw2013", },
+static const struct of_device_id aw20xx_match_table[] = {
+	{ .compatible = "awinic,aw2013", .data = &aw2013_chipdef },
+	{ .compatible = "awinic,aw2027", .data = &aw2027_chipdef },
 	{ /* sentinel */ },
 };
 
-MODULE_DEVICE_TABLE(of, aw2013_match_table);
+MODULE_DEVICE_TABLE(of, aw20xx_match_table);
 
-static struct i2c_driver aw2013_driver = {
+static struct i2c_driver aw20xx_driver = {
 	.driver = {
-		.name = "leds-aw2013",
-		.of_match_table = aw2013_match_table,
+		.name = "leds-aw20xx",
+		.of_match_table = aw20xx_match_table,
 	},
-	.probe = aw2013_probe,
+	.probe = aw20xx_probe,
 };
 
-module_i2c_driver(aw2013_driver);
+module_i2c_driver(aw20xx_driver);
 
 MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
-MODULE_DESCRIPTION("AW2013 LED driver");
+MODULE_DESCRIPTION("AW20XX LED driver");
 MODULE_LICENSE("GPL v2");

-- 
2.55.0

