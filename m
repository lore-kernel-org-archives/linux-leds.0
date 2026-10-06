Received: from mta1.migadu.com (out-224.mta1.migadu.com [95.215.58.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA7332AAD6
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 03:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258386; cv=none; b=OJD5TE0htFbBuOb/DcpqU1ImYVLb19LfkORQxU6NmH46yLeS1rUrliNEOI8McWgaHVQ1T1RZmVu4pJbdbb7VXOSQc7W7niJOz6tHG9UOJykSdMrEZz7s1qfuxI3l/9QWNg1dqG+xX/s/NknTdOQ/lQ7LR76K3u3pHF9ud+NtD9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258386; c=relaxed/simple;
	bh=LwzW+GCcmNO4ZfhnCEKcoOx5CqKoeplfKoI/2KBcAvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4hmad0ckMuHLxR6hTA0TwQ3v2gDErMtqhRoZeabwTA0YnnBhT7Ezy4ZJVoiLn4VMDqRZkLYvzsgm0azoid2yFfJcNOmEOjjV9Iyy7A1PHwZ9s2/46Ny8zZjYrqbGm5sAb79ae72hANyv+q6VaudJYyw2Snd2+Pt2ryBP3CR4Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Y0iKJCOo; arc=none smtp.client-ip=95.215.58.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Y0iKJCOo"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LwzW+GCcmNO4ZfhnCEKcoOx5CqKoeplfKoI/2KBcAvw=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791258382; v=1; x=1791863182;
 b=Y0iKJCOoVVUr3MbYCU+8ELSvChfw1tRdEPoMCS4R1PjxEpjtSGVA9jp43iAGDOJKvYdfwNwJ
 sq7fmQlh5auyrejIhVVf/TJ4VMAdSDUG0LdgfGvAGaY68HJlFRMv2Ip9FRVb545ybs0OMufV7CK
 WCqAs3jOCXuaGgCbt3ykakPpKk1hai2M+P3fAGrh84MNDdOmugyFWXvNoP8yjbZPTWOiLym7ls5
 mFmL5QBdEDJpylVZ7+/FCdiByO6L2TLz29COQmrryf3KK1KlRstdnuIuMN3lf8gNYKHuKK54EoU
 RXoWhJZMUCNFBHzbxKgaC41aHgyMt+p50cxV1UN1DLG1A==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f61b64cfd8f5b7e9;
	Tue, 06 Oct 2026 03:46:22 +0000
X-Mizu-Trace-ID: f61b64cfd8f5b7e9
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 05 Oct 2026 20:46:03 -0700
Subject: [PATCH v2 2/7] leds: aw2013: Rename internal APIs from aw2013 to
 aw20xx
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-aw2013-aw20xx-rename-v2-2-108ecbdf2775@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791258374; l=13888;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=LwzW+GCcmNO4ZfhnCEKcoOx5CqKoeplfKoI/2KBcAvw=;
 b=4QQn/1Q0Fe9Yp1i5PflVv6asi9K2akiM2jlFePOb9CfUUGio+ebljfrNyXwtkbG7oGle8HRMo
 yGTksHLRJvQAWBM6YA1rvr49k916cVdrA6QM6A95C2GLVMJ2YzVmAaT
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

We don't want to break external compatibility, but it's better
if the things shared between aw2013 and aw2027 have generic names.

Split into a separate commit to reduce noise in the upcoming commits

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 182 ++++++++++++++++++++++-----------------------
 1 file changed, 91 insertions(+), 91 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 216755d6010f..ae3c8131efb4 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -9,72 +9,72 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 
-#define AW2013_MAX_LEDS 3
+#define AW20XX_MAX_LEDS 3
 
 /* Reset and ID register */
-#define AW2013_RSTR 0x00
-#define AW2013_RSTR_RESET 0x55
-#define AW2013_RSTR_CHIP_ID 0x33
+#define AW20XX_RSTR 0x00
+#define AW20XX_RSTR_RESET 0x55
 
 /* Global control register */
-#define AW2013_GCR 0x01
-#define AW2013_GCR_ENABLE BIT(0)
+#define AW20XX_GCR 0x01
+#define AW20XX_GCR_ENABLE BIT(0)
 
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
+#define AW20XX_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
+#define AW20XX_LCFG_MD BIT(4)
+#define AW20XX_LCFG_FI BIT(5)
+#define AW20XX_LCFG_FO BIT(6)
 
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
 
-#define AW2013_REG_MAX 0x77
+#define AW20XX_TIME_STEP 130 /* ms */
 
-#define AW2013_TIME_STEP 130 /* ms */
+#define AW2013_RSTR_CHIP_ID 0x33
+#define AW2013_REG_MAX 0x77
 
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
+struct aw20xx {
 	struct mutex mutex; /* held when writing to registers */
 	struct regulator_bulk_data regulators[2];
 	struct i2c_client *client;
-	struct aw2013_led leds[AW2013_MAX_LEDS];
+	struct aw20xx_led leds[AW20XX_MAX_LEDS];
 	struct regmap *regmap;
 	int num_leds;
 	bool enabled;
 };
 
-static int aw2013_chip_init(struct aw2013 *chip)
+static int aw20xx_chip_init(struct aw20xx *chip)
 {
 	int i, ret;
 
-	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
+	ret = regmap_write(chip->regmap, AW20XX_GCR, AW20XX_GCR_ENABLE);
 	if (ret) {
 		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
 			ret);
@@ -83,8 +83,8 @@ static int aw2013_chip_init(struct aw2013 *chip)
 
 	for (i = 0; i < chip->num_leds; i++) {
 		ret = regmap_update_bits(chip->regmap,
-					 AW2013_LCFG(chip->leds[i].num),
-					 AW2013_LCFG_IMAX_MASK,
+					 AW20XX_LCFG(chip->leds[i].num),
+					 AW20XX_LCFG_IMAX_MASK,
 					 chip->leds[i].imax);
 		if (ret) {
 			dev_err(&chip->client->dev,
@@ -97,14 +97,14 @@ static int aw2013_chip_init(struct aw2013 *chip)
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
@@ -117,7 +117,7 @@ static void aw2013_chip_disable(struct aw2013 *chip)
 	chip->enabled = false;
 }
 
-static int aw2013_chip_enable(struct aw2013 *chip)
+static int aw20xx_chip_enable(struct aw20xx *chip)
 {
 	int ret;
 
@@ -133,14 +133,14 @@ static int aw2013_chip_enable(struct aw2013 *chip)
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
 
@@ -151,42 +151,42 @@ static bool aw2013_chip_in_use(struct aw2013 *chip)
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
@@ -194,10 +194,10 @@ static int aw2013_brightness_set(struct led_classdev *cdev,
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
 
@@ -209,7 +209,7 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 
 	if (!led->cdev.brightness) {
 		led->cdev.brightness = LED_FULL;
-		ret = aw2013_brightness_set(&led->cdev, led->cdev.brightness);
+		ret = aw20xx_brightness_set(&led->cdev, led->cdev.brightness);
 		if (ret)
 			return ret;
 	}
@@ -217,43 +217,43 @@ static int aw2013_blink_set(struct led_classdev *cdev,
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
@@ -261,17 +261,17 @@ static int aw2013_blink_set(struct led_classdev *cdev,
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
@@ -279,7 +279,7 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 		u32 imax;
 
 		ret = of_property_read_u32(child, "reg", &source);
-		if (ret != 0 || source >= AW2013_MAX_LEDS) {
+		if (ret != 0 || source >= AW20XX_MAX_LEDS) {
 			dev_err(&chip->client->dev,
 				"Couldn't read LED address: %d\n", ret);
 			count--;
@@ -299,8 +299,8 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 				 "DT property led-max-microamp is missing\n");
 		}
 
-		led->cdev.brightness_set_blocking = aw2013_brightness_set;
-		led->cdev.blink_set = aw2013_blink_set;
+		led->cdev.brightness_set_blocking = aw20xx_brightness_set;
+		led->cdev.blink_set = aw20xx_blink_set;
 
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
@@ -318,20 +318,20 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 	return 0;
 }
 
-static void aw2013_chip_disable_action(void *data)
+static void aw20xx_chip_disable_action(void *data)
 {
-	aw2013_chip_disable(data);
+	aw20xx_chip_disable(data);
 }
 
-static const struct regmap_config aw2013_regmap_config = {
+static const struct regmap_config aw20xx_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = AW2013_REG_MAX,
 };
 
-static int aw2013_probe(struct i2c_client *client)
+static int aw20xx_probe(struct i2c_client *client)
 {
-	struct aw2013 *chip;
+	struct aw20xx *chip;
 	int ret;
 	unsigned int chipid;
 
@@ -348,7 +348,7 @@ static int aw2013_probe(struct i2c_client *client)
 	chip->client = client;
 	i2c_set_clientdata(client, chip);
 
-	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
+	chip->regmap = devm_regmap_init_i2c(client, &aw20xx_regmap_config);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
@@ -376,7 +376,7 @@ static int aw2013_probe(struct i2c_client *client)
 		goto error;
 	}
 
-	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
+	ret = regmap_read(chip->regmap, AW20XX_RSTR, &chipid);
 	if (ret) {
 		dev_err(&client->dev, "Failed to read chip ID: %d\n",
 			ret);
@@ -390,11 +390,11 @@ static int aw2013_probe(struct i2c_client *client)
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
 
@@ -419,22 +419,22 @@ static int aw2013_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct of_device_id aw2013_match_table[] = {
+static const struct of_device_id aw20xx_match_table[] = {
 	{ .compatible = "awinic,aw2013", },
 	{ /* sentinel */ },
 };
 
-MODULE_DEVICE_TABLE(of, aw2013_match_table);
+MODULE_DEVICE_TABLE(of, aw20xx_match_table);
 
-static struct i2c_driver aw2013_driver = {
+static struct i2c_driver aw20xx_driver = {
 	.driver = {
 		.name = "leds-aw2013",
-		.of_match_table = aw2013_match_table,
+		.of_match_table = aw20xx_match_table,
 	},
-	.probe = aw2013_probe,
+	.probe = aw20xx_probe,
 };
 
-module_i2c_driver(aw2013_driver);
+module_i2c_driver(aw20xx_driver);
 
 MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
 MODULE_DESCRIPTION("AW2013 LED driver");

-- 
2.55.0

