Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F974D1795
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404591; cv=none; b=hH0v+4VEtEGda+hpF1TYQW+h1gEXWzBU40vtJBpbgh2yZahidcEDzcF4+gk6mE1vpSXC/BBCzJDYtCLD15DCSBSZJbIn2CN5ySJzdwMfkKpGrFto15h1rbbCfRq3PWge73RPT+fAd4MIBQbz3MDrJb7kxYCxdxcJvyiREsn8J0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404591; c=relaxed/simple;
	bh=BEj4THcTRs0yCPmmquk9Zw2rFAgEJjz4Xfui03izIkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZfDT1NL5eShoEoN3n5TUVmTCUgDZW58vAxJMHHew7QpkDU64j5hSQ9sl4FUGd+3+Ukt+MZ4gFiH3xOnm0gSdkted/5jes4Qf76eDqU7i/CqfsSyhi+0N2PshlHNZUvVioZK7y0xy+wNV7LLnpYSxbr/buND7iEYeDO/MqObr18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoaryMp8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoaryMp8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1883208f8f.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404586; x=1793009386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSQwchBv7UOnkY9f1EtRUBqaDPhd9Ef+hXEtN7Ip/3k=;
        b=hoaryMp8G3a7SlXhFpOKdwX2HUWugV27g1XN9fsdEoXla7pQNHa0DINnVA7S3Ke6s6
         pg2XJKTeQ1cpnzBjqBeAsu8Ti/RWsGJLdD5IO9NkFl3sJ+yJvNpLCZHVcmq1bbV6881f
         iELCmZ1POMFq5wYxxui/N0ymeEvCDYvG62hTfNKvwJf3Yq9oZZVIodHp/MEuSe4inYYO
         ZGlULgIHD82OoB6DQ8leS+C0hnbOfkady/1h+44iqfmBWhFHnkVnnLygR+/cP+Pt3rl4
         T7QweaM1YiD4jSjl5bLzKSrQsWoA63/o0p08mPTSwAAH0EQ+KvUcAcUj4t5UvynKyjFT
         XaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404586; x=1793009386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSQwchBv7UOnkY9f1EtRUBqaDPhd9Ef+hXEtN7Ip/3k=;
        b=nGeyVdEOAG1RutfztWkc0F5KUTxbFjTZC4xz/ZXKfsL3yV6gpIeUXrQPspsYKVAJnz
         HkQMyQpHDk2dvij71pB8C977m71YbxsMtQYBz1eNgXYXQFB7k078wBPC2yMhuk3sU99S
         aBYFiCwaSeuyeiUcZ0+K3DDTBhtCsTYQMPY2kRs1w9NjcfCpbqrLpt9jGqhY6UbmDvFm
         +rn8nV4rkzav06bzr6JHiA+K6ULDWr7+DlpUdP5Z0qmTep0CcpzpvegvDIKM4/UD1bAb
         vxjNvBRiQL3oYziEDhl3v/mv5VhUG7zEzunSjK1hBrXGP31ndzQk2ZAIPYn/3oh00tr5
         SI5A==
X-Gm-Message-State: AFq9FYK5he1C3dwYlqTeFGaQ8t7dsf3Gtx4Srw9pIOQUXfz2qQbxXNxJ
	/w/4rlNLKAOgqB6uX0rD/xTcwpJ/sArNAaIjyhpWIol/B/gXraTS9JnB
X-Gm-Gg: AYBFou2EqCw619jw81J2m7GXIHlKHS7E7uVuM4HI/1ivKb5OImWAFE0IUEiil0sjVx6
	Glx0uANJg9+YD1YKokpk9AZnsvCRU5FVF92vSQ4woFuKMV5q1izDn9LMkwZOFgK5moaYluAA+6J
	L3e+zv2br1HkcAQcPSPYE2hjUjY0+yF1Tkuvp8BgNJuWadeUmLdu5XNM/p7u5A1nHhj4SzaimR9
	NN2/wOEaO3l/z13jxE2RRUcuyw9aXAG8IKpLXilDL1uoal8AzxFSisO5DFkraG+AAceeW3CVZDd
	MNoZyHb7exm1BBquTapuDi5sHQGtQAnA8wnhJXWgnKG//ftSBpXBure/1z2sBNxmV+2mBsCw8DP
	f3OBboZLf/aQD2y3H4tyG1EB2ljKFiecBz5Rpm4ESBPcR+PbyyuL/7Vv49e541ZW9wJY1e3Ce4j
	7R3vZ2NDzPoVrWI6xGc6RaBoEI8bDedO6LtbMmJ6Tw3IqHoltU3TmKP5o7t6qP64gWPw+JqHS3c
	Ln9LEsnKJn4iS7Tou0=
X-Received: by 2002:a05:600c:1d04:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a1d76121a2mr169774155e9.15.1792404585978;
        Mon, 19 Oct 2026 03:09:45 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] mfd: aat2870: Convert to use OF bindings
Date: Mon, 19 Oct 2026 13:09:29 +0300
Message-ID: <20261019100930.110954-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conversion of the AAT2870 driver to use OF bindings requires a few complex
changes that should be done simultaneously.

The AAT2870 essentially provides two functions via child devices:
backlight and regulators. Both functions are fairly self-sufficient and
may not be populated on the final board. Consequently, the MFD
registration API was replaced with of_platform_populate(), and each
sub-device was given its own compatible string.

Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
was converted to use modern gpiod/OF helpers, allowing the redundant
aat2870_enable() and aat2870_disable() helpers to be removed.

The aat2870-regulator driver was updated to register each of the four LDOs
from a dedicated OF node using modern regulator framework.

The aat2870-backlight driver was changed to populate all required
properties from a dedicated Device Tree node. Its channel map was updated
to use u8 instead of int. Furthermore, because the maximum current is now
parsed as an absolute value rather than an enum entry, the calculation and
application of the maximum current were updated accordingly.

All of the changes above allow platform data to be removed entirely.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 115 +++++--------------
 drivers/regulator/aat2870-regulator.c | 159 +++++++++++---------------
 drivers/video/backlight/aat2870_bl.c  |  53 ++++-----
 include/linux/mfd/aat2870.h           |  95 +--------------
 4 files changed, 122 insertions(+), 300 deletions(-)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 0d56cd6fbc6a5..fe43ef675f257 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -16,8 +16,15 @@
 #include <linux/gpio/legacy.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
+#include <linux/of_platform.h>
 #include <linux/regulator/machine.h>
 
+struct aat2870_register {
+	bool readable;
+	bool writeable;
+	u8 value;
+};
+
 static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] = {
 	/* readable, writeable, value */
 	{ 0, 1, 0x00 },	/* 0x00 AAT2870_BL_CH_EN */
@@ -61,34 +68,6 @@ static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] = {
 	{ 0, 1, 0x00 },	/* 0x26 AAT2870_LDO_EN */
 };
 
-static struct mfd_cell aat2870_devs[] = {
-	{
-		.name = "aat2870-backlight",
-		.id = AAT2870_ID_BL,
-		.pdata_size = sizeof(struct aat2870_bl_platform_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOA,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOB,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOC,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOD,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-};
-
 static int __aat2870_read(struct aat2870_data *aat2870, u8 addr, u8 *val)
 {
 	int ret;
@@ -196,22 +175,6 @@ static int aat2870_update(struct aat2870_data *aat2870, u8 addr, u8 mask,
 	return ret;
 }
 
-static inline void aat2870_enable(struct aat2870_data *aat2870)
-{
-	if (aat2870->en_pin >= 0)
-		gpio_set_value(aat2870->en_pin, 1);
-
-	aat2870->is_enable = 1;
-}
-
-static inline void aat2870_disable(struct aat2870_data *aat2870)
-{
-	if (aat2870->en_pin >= 0)
-		gpio_set_value(aat2870->en_pin, 0);
-
-	aat2870->is_enable = 0;
-}
-
 #ifdef CONFIG_DEBUG_FS
 static ssize_t aat2870_dump_reg(struct aat2870_data *aat2870, char *buf)
 {
@@ -332,9 +295,7 @@ static inline void aat2870_init_debugfs(struct aat2870_data *aat2870)
 
 static int aat2870_i2c_probe(struct i2c_client *client)
 {
-	struct aat2870_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct aat2870_data *aat2870;
-	int i, j;
 	int ret = 0;
 
 	aat2870 = devm_kzalloc(&client->dev, sizeof(struct aat2870_data),
@@ -348,60 +309,29 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
-	if (pdata->en_pin < 0)
-		aat2870->en_pin = -1;
-	else
-		aat2870->en_pin = pdata->en_pin;
+	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(aat2870->en_pin))
+		return dev_err_probe(&client->dev, PTR_ERR(aat2870->en_pin),
+				     "Failed to get EN GPIO\n");
 
-	aat2870->init = pdata->init;
-	aat2870->uninit = pdata->uninit;
 	aat2870->read = aat2870_read;
 	aat2870->write = aat2870_write;
 	aat2870->update = aat2870_update;
 
 	mutex_init(&aat2870->io_lock);
 
-	if (aat2870->init)
-		aat2870->init(aat2870);
-
-	if (aat2870->en_pin >= 0) {
-		ret = devm_gpio_request_one(&client->dev, aat2870->en_pin,
-					GPIOF_OUT_INIT_HIGH, "aat2870-en");
-		if (ret < 0) {
-			dev_err(&client->dev,
-				"Failed to request GPIO %d\n", aat2870->en_pin);
-			return ret;
-		}
-	}
-
-	aat2870_enable(aat2870);
-
-	for (i = 0; i < pdata->num_subdevs; i++) {
-		for (j = 0; j < ARRAY_SIZE(aat2870_devs); j++) {
-			if ((pdata->subdevs[i].id == aat2870_devs[j].id) &&
-					!strcmp(pdata->subdevs[i].name,
-						aat2870_devs[j].name)) {
-				aat2870_devs[j].platform_data =
-					pdata->subdevs[i].platform_data;
-				break;
-			}
-		}
-	}
+	gpiod_set_value_cansleep(aat2870->en_pin, 1);
 
-	ret = mfd_add_devices(aat2870->dev, 0, aat2870_devs,
-			      ARRAY_SIZE(aat2870_devs), NULL, 0, NULL);
-	if (ret != 0) {
-		dev_err(aat2870->dev, "Failed to add subdev: %d\n", ret);
-		goto out_disable;
+	ret = devm_of_platform_populate(&client->dev);
+	if (ret) {
+		gpiod_set_value_cansleep(aat2870->en_pin, 0);
+		return dev_err_probe(&client->dev, ret, "Failed to populate cells\n");
 	}
 
 	aat2870_init_debugfs(aat2870);
 
 	return 0;
-
-out_disable:
-	aat2870_disable(aat2870);
-	return ret;
 }
 
 static int aat2870_i2c_suspend(struct device *dev)
@@ -409,7 +339,7 @@ static int aat2870_i2c_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct aat2870_data *aat2870 = i2c_get_clientdata(client);
 
-	aat2870_disable(aat2870);
+	gpiod_set_value_cansleep(aat2870->en_pin, 0);
 
 	return 0;
 }
@@ -421,7 +351,7 @@ static int aat2870_i2c_resume(struct device *dev)
 	struct aat2870_register *reg = NULL;
 	int i;
 
-	aat2870_enable(aat2870);
+	gpiod_set_value_cansleep(aat2870->en_pin, 1);
 
 	/* restore registers */
 	for (i = 0; i < AAT2870_REG_NUM; i++) {
@@ -436,6 +366,12 @@ static int aat2870_i2c_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
 				aat2870_i2c_resume);
 
+static const struct of_device_id aat2870_match_table[] = {
+	{ .compatible = "skyworks,aat2870" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_match_table);
+
 static const struct i2c_device_id aat2870_i2c_id_table[] = {
 	{ "aat2870" },
 	{ }
@@ -444,6 +380,7 @@ static const struct i2c_device_id aat2870_i2c_id_table[] = {
 static struct i2c_driver aat2870_i2c_driver = {
 	.driver = {
 		.name			= "aat2870",
+		.of_match_table		= aat2870_match_table,
 		.pm			= pm_sleep_ptr(&aat2870_pm_ops),
 		.suppress_bind_attrs	= true,
 	},
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 970d86f2bbb81..73b6d06858cff 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -15,73 +15,74 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/mfd/aat2870.h>
-
-struct aat2870_regulator {
-	struct aat2870_data *aat2870;
-	struct regulator_desc desc;
-
-	u8 enable_addr;
-	u8 enable_shift;
-	u8 enable_mask;
-
-	u8 voltage_addr;
-	u8 voltage_shift;
-	u8 voltage_mask;
+#include <linux/regulator/of_regulator.h>
+
+#define AAT2870_LDO_AB_A_MASK    GENMASK(7, 4)
+#define AAT2870_LDO_AB_B_MASK    GENMASK(3, 0)
+#define AAT2870_LDO_CD_C_MASK    GENMASK(7, 4)
+#define AAT2870_LDO_CD_D_MASK    GENMASK(3, 0)
+
+/* Device IDs */
+enum aat2870_regulator_id {
+	AAT2870_ID_LDOA,
+	AAT2870_ID_LDOB,
+	AAT2870_ID_LDOC,
+	AAT2870_ID_LDOD
 };
 
 static int aat2870_ldo_set_voltage_sel(struct regulator_dev *rdev,
 				       unsigned selector)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->voltage_addr, ri->voltage_mask,
-			       selector << ri->voltage_shift);
+	return aat2870->update(aat2870, rdesc->vsel_reg, rdesc->vsel_mask,
+			       (selector << __ffs(rdesc->vsel_mask)) & rdesc->vsel_mask);
 }
 
 static int aat2870_ldo_get_voltage_sel(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 	u8 val;
 	int ret;
 
-	ret = aat2870->read(aat2870, ri->voltage_addr, &val);
+	ret = aat2870->read(aat2870, rdesc->vsel_reg, &val);
 	if (ret)
 		return ret;
 
-	return (val & ri->voltage_mask) >> ri->voltage_shift;
+	return (val & rdesc->vsel_mask) >> __ffs(rdesc->vsel_mask);
 }
 
 static int aat2870_ldo_enable(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->enable_addr, ri->enable_mask,
-			       ri->enable_mask);
+	return aat2870->update(aat2870, rdesc->enable_reg, rdesc->enable_mask,
+			       rdesc->enable_mask);
 }
 
 static int aat2870_ldo_disable(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->enable_addr, ri->enable_mask, 0);
+	return aat2870->update(aat2870, rdesc->enable_reg, rdesc->enable_mask, 0);
 }
 
 static int aat2870_ldo_is_enabled(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 	u8 val;
 	int ret;
 
-	ret = aat2870->read(aat2870, ri->enable_addr, &val);
+	ret = aat2870->read(aat2870, rdesc->enable_reg, &val);
 	if (ret)
 		return ret;
 
-	return val & ri->enable_mask ? 1 : 0;
+	return (val & rdesc->enable_mask) >> __ffs(rdesc->enable_mask);
 }
 
 static const struct regulator_ops aat2870_ldo_ops = {
@@ -101,84 +102,60 @@ static const unsigned int aat2870_ldo_voltages[] = {
 	3000000, 3100000, 3200000, 3300000,
 };
 
-#define AAT2870_LDO(ids)				\
-	{						\
-		.desc = {				\
-			.name = #ids,			\
-			.id = AAT2870_ID_##ids,		\
-			.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
-			.volt_table = aat2870_ldo_voltages, \
-			.ops = &aat2870_ldo_ops,	\
-			.type = REGULATOR_VOLTAGE,	\
-			.owner = THIS_MODULE,		\
-		},					\
-	}
+#define AAT2870_LDO(ids, match, vsel, vmask) {		\
+	.name = #ids,					\
+	.of_match = (match),				\
+	.id = AAT2870_ID_##ids,				\
+	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
+	.volt_table = aat2870_ldo_voltages,		\
+	.ops = &aat2870_ldo_ops,			\
+	.type = REGULATOR_VOLTAGE,			\
+	.owner = THIS_MODULE,				\
+	.vsel_reg = (vsel),				\
+	.vsel_mask = (vmask),				\
+	.enable_reg = AAT2870_LDO_EN,			\
+	.enable_mask = BIT(AAT2870_ID_##ids),		\
+}
 
-static struct aat2870_regulator aat2870_regulators[] = {
-	AAT2870_LDO(LDOA),
-	AAT2870_LDO(LDOB),
-	AAT2870_LDO(LDOC),
-	AAT2870_LDO(LDOD),
+static const struct regulator_desc aat2870_regulators[] = {
+	AAT2870_LDO(LDOA, "ldo-a", AAT2870_LDO_AB, AAT2870_LDO_AB_A_MASK),
+	AAT2870_LDO(LDOB, "ldo-b", AAT2870_LDO_AB, AAT2870_LDO_AB_B_MASK),
+	AAT2870_LDO(LDOC, "ldo-c", AAT2870_LDO_CD, AAT2870_LDO_CD_C_MASK),
+	AAT2870_LDO(LDOD, "ldo-d", AAT2870_LDO_CD, AAT2870_LDO_CD_D_MASK),
 };
 
-static struct aat2870_regulator *aat2870_get_regulator(int id)
-{
-	struct aat2870_regulator *ri = NULL;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(aat2870_regulators); i++) {
-		ri = &aat2870_regulators[i];
-		if (ri->desc.id == id)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(aat2870_regulators))
-		return NULL;
-
-	ri->enable_addr = AAT2870_LDO_EN;
-	ri->enable_shift = id - AAT2870_ID_LDOA;
-	ri->enable_mask = 0x1 << ri->enable_shift;
-
-	ri->voltage_addr = (id - AAT2870_ID_LDOA) / 2 ?
-			   AAT2870_LDO_CD : AAT2870_LDO_AB;
-	ri->voltage_shift = (id - AAT2870_ID_LDOA) % 2 ? 0 : 4;
-	ri->voltage_mask = 0xF << ri->voltage_shift;
-
-	return ri;
-}
-
 static int aat2870_regulator_probe(struct platform_device *pdev)
 {
-	struct aat2870_regulator *ri;
+	struct device *dev = &pdev->dev;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 
-	ri = aat2870_get_regulator(pdev->id);
-	if (!ri) {
-		dev_err(&pdev->dev, "Invalid device ID, %d\n", pdev->id);
-		return -EINVAL;
-	}
-	ri->aat2870 = dev_get_drvdata(pdev->dev.parent);
-
-	config.dev = &pdev->dev;
-	config.driver_data = ri;
-	config.init_data = dev_get_platdata(&pdev->dev);
+	config.dev = dev;
+	config.driver_data = dev_get_drvdata(dev->parent);
 
-	rdev = devm_regulator_register(&pdev->dev, &ri->desc, &config);
-	if (IS_ERR(rdev)) {
-		dev_err(&pdev->dev, "Failed to register regulator %s\n",
-			ri->desc.name);
-		return PTR_ERR(rdev);
+	for (int i = 0; i < ARRAY_SIZE(aat2870_regulators); i++) {
+		rdev = devm_regulator_register(dev, &aat2870_regulators[i], &config);
+		if (IS_ERR(rdev)) {
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to register regulator %s\n",
+					     aat2870_regulators[i].name);
+		}
 	}
-	platform_set_drvdata(pdev, rdev);
 
 	return 0;
 }
 
+static const struct of_device_id aat2870_regulator_match_table[] = {
+	{ .compatible = "skyworks,aat2870-regulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_regulator_match_table);
+
 static struct platform_driver aat2870_regulator_driver = {
 	.driver = {
 		.name	= "aat2870-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = aat2870_regulator_match_table,
 	},
 	.probe	= aat2870_regulator_probe,
 };
diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index c9e764a94a238..4bc62ed8b0165 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -15,12 +15,20 @@
 #include <linux/backlight.h>
 #include <linux/mfd/aat2870.h>
 
+/* Backlight has 8 channels, each bit represents one channel */
+#define AAT2870_BL_CH_ALL	0xff
+
+/* Backlight current magnitude (uA), 450uA current is eq to 0 */
+#define AAT2870_CURRENT_MIN	450
+#define AAT2870_CURRENT_MAX	27900
+#define AAT2870_CURRENT_STEP	900
+
 struct aat2870_bl_driver_data {
 	struct platform_device *pdev;
 	struct backlight_device *bd;
 
-	int channels;
-	int max_current;
+	u8 channels;
+	u32 max_current;
 	int brightness; /* current brightness */
 };
 
@@ -30,7 +38,7 @@ static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat2870_bl)
 			= dev_get_drvdata(aat2870_bl->pdev->dev.parent);
 
 	return aat2870->write(aat2870, AAT2870_BL_CH_EN,
-			      (u8)aat2870_bl->channels);
+			      aat2870_bl->channels);
 }
 
 static inline int aat2870_bl_disable(struct aat2870_bl_driver_data *aat2870_bl)
@@ -85,24 +93,11 @@ static const struct backlight_ops aat2870_bl_ops = {
 
 static int aat2870_bl_probe(struct platform_device *pdev)
 {
-	struct aat2870_bl_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct aat2870_bl_driver_data *aat2870_bl;
 	struct backlight_device *bd;
 	struct backlight_properties props;
 	int ret = 0;
 
-	if (!pdata) {
-		dev_err(&pdev->dev, "No platform data\n");
-		ret = -ENXIO;
-		goto out;
-	}
-
-	if (pdev->id != AAT2870_ID_BL) {
-		dev_err(&pdev->dev, "Invalid device ID, %d\n", pdev->id);
-		ret = -EINVAL;
-		goto out;
-	}
-
 	aat2870_bl = devm_kzalloc(&pdev->dev,
 				  sizeof(struct aat2870_bl_driver_data),
 				  GFP_KERNEL);
@@ -129,21 +124,20 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 
 	aat2870_bl->bd = bd;
 
-	if (pdata->channels > 0)
-		aat2870_bl->channels = pdata->channels;
-	else
-		aat2870_bl->channels = AAT2870_BL_CH_ALL;
+	aat2870_bl->channels = AAT2870_BL_CH_ALL;
+	device_property_read_u8(&pdev->dev, "skyworks,channels", &aat2870_bl->channels);
 
-	if (pdata->max_current > 0)
-		aat2870_bl->max_current = pdata->max_current;
-	else
-		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
+	device_property_read_u32(&pdev->dev, "led-max-microamp", &aat2870_bl->max_current);
+	aat2870_bl->max_current = clamp(aat2870_bl->max_current, AAT2870_CURRENT_MIN,
+					AAT2870_CURRENT_MAX);
+	aat2870_bl->max_current /= AAT2870_CURRENT_STEP;
 
 	/*
 	 * The maximum number of brightness steps is determined by the max current.
-	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 * The aat2870_bl->max_current value maps to the allowed brightness steps
+	 * with +1 offset since max_current 0 is still 450uA.
 	 */
-	bd->props.max_brightness = aat2870_bl->max_current;
+	bd->props.max_brightness = aat2870_bl->max_current + 1;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
@@ -171,9 +165,16 @@ static void aat2870_bl_remove(struct platform_device *pdev)
 	backlight_update_status(bd);
 }
 
+static const struct of_device_id aat2870_bl_match_table[] = {
+	{ .compatible = "skyworks,aat2870-backlight" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_bl_match_table);
+
 static struct platform_driver aat2870_bl_driver = {
 	.driver = {
 		.name	= "aat2870-backlight",
+		.of_match_table = aat2870_bl_match_table,
 	},
 	.probe		= aat2870_bl_probe,
 	.remove		= aat2870_bl_remove,
diff --git a/include/linux/mfd/aat2870.h b/include/linux/mfd/aat2870.h
index c7a3c53eba681..a7b482b790b4e 100644
--- a/include/linux/mfd/aat2870.h
+++ b/include/linux/mfd/aat2870.h
@@ -54,80 +54,13 @@
 #define AAT2870_LDO_EN		0x26
 #define AAT2870_REG_NUM		0x27
 
-/* Device IDs */
-enum aat2870_id {
-	AAT2870_ID_BL,
-	AAT2870_ID_LDOA,
-	AAT2870_ID_LDOB,
-	AAT2870_ID_LDOC,
-	AAT2870_ID_LDOD
-};
-
-/* Backlight channels */
-#define AAT2870_BL_CH1		0x01
-#define AAT2870_BL_CH2		0x02
-#define AAT2870_BL_CH3		0x04
-#define AAT2870_BL_CH4		0x08
-#define AAT2870_BL_CH5		0x10
-#define AAT2870_BL_CH6		0x20
-#define AAT2870_BL_CH7		0x40
-#define AAT2870_BL_CH8		0x80
-#define AAT2870_BL_CH_ALL	0xFF
-
-/* Backlight current magnitude (mA) */
-enum aat2870_current {
-	AAT2870_CURRENT_0_45 = 1,
-	AAT2870_CURRENT_0_90,
-	AAT2870_CURRENT_1_80,
-	AAT2870_CURRENT_2_70,
-	AAT2870_CURRENT_3_60,
-	AAT2870_CURRENT_4_50,
-	AAT2870_CURRENT_5_40,
-	AAT2870_CURRENT_6_30,
-	AAT2870_CURRENT_7_20,
-	AAT2870_CURRENT_8_10,
-	AAT2870_CURRENT_9_00,
-	AAT2870_CURRENT_9_90,
-	AAT2870_CURRENT_10_8,
-	AAT2870_CURRENT_11_7,
-	AAT2870_CURRENT_12_6,
-	AAT2870_CURRENT_13_5,
-	AAT2870_CURRENT_14_4,
-	AAT2870_CURRENT_15_3,
-	AAT2870_CURRENT_16_2,
-	AAT2870_CURRENT_17_1,
-	AAT2870_CURRENT_18_0,
-	AAT2870_CURRENT_18_9,
-	AAT2870_CURRENT_19_8,
-	AAT2870_CURRENT_20_7,
-	AAT2870_CURRENT_21_6,
-	AAT2870_CURRENT_22_5,
-	AAT2870_CURRENT_23_4,
-	AAT2870_CURRENT_24_3,
-	AAT2870_CURRENT_25_2,
-	AAT2870_CURRENT_26_1,
-	AAT2870_CURRENT_27_0,
-	AAT2870_CURRENT_27_9
-};
-
-struct aat2870_register {
-	bool readable;
-	bool writeable;
-	u8 value;
-};
-
 struct aat2870_data {
 	struct device *dev;
 	struct i2c_client *client;
 
 	struct mutex io_lock;
 	struct aat2870_register *reg_cache; /* register cache */
-	int en_pin; /* enable GPIO pin (if < 0, ignore this value) */
-	bool is_enable;
-
-	/* init and uninit for platform specified */
-	int (*init)(struct aat2870_data *aat2870);
-	void (*uninit)(struct aat2870_data *aat2870);
+	struct gpio_desc *en_pin;
 
 	/* i2c io funcntions */
 	int (*read)(struct aat2870_data *aat2870, u8 addr, u8 *val);
@@ -135,30 +68,4 @@ struct aat2870_data {
 	int (*update)(struct aat2870_data *aat2870, u8 addr, u8 mask, u8 val);
 };
 
-struct aat2870_subdev_info {
-	int id;
-	const char *name;
-	void *platform_data;
-};
-
-struct aat2870_platform_data {
-	int en_pin; /* enable GPIO pin (if < 0, ignore this value) */
-
-	struct aat2870_subdev_info *subdevs;
-	int num_subdevs;
-
-	/* init and uninit for platform specified */
-	int (*init)(struct aat2870_data *aat2870);
-	void (*uninit)(struct aat2870_data *aat2870);
-};
-
-struct aat2870_bl_platform_data {
-	/* backlight channels, default is AAT2870_BL_CH_ALL */
-	int channels;
-	/* backlight current magnitude, default is AAT2870_CURRENT_27_9 */
-	int max_current;
-	/* maximum brightness, default is 255 */
-	int max_brightness;
-};
-
 #endif /* __LINUX_MFD_AAT2870_H */
-- 
2.53.0

