Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3C13B4EA1;
	Thu,  6 Aug 2026 02:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785982012; cv=none; b=otmhDEMPCb7/bKylFlVyiCyyJI1AJRWsghyeO76VlPMWpdWqQfgnmhSiKtH0GEOXh7SRyBEvxaVHp3wlWsF4vKS7IuzE78uqXe8wR8Z/9ERXg5mbdFM6n5s9WrYu4DKcEyAlPS4zL0IBMuoEdWeblkIg+ibkdvRUG/i7yosgKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785982012; c=relaxed/simple;
	bh=0ljzEuTDRkykZzlST+bF0UEx5DfgjRjo9dSn2tUa5No=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tvh8791kIm/WVsfBgUAj05vuEAXq9XyF+g0AKOSE8NEsdsnb0+LWTC0w7tunR2T9jZVSywE2VxNGc8HMjqCucmzLbg1uej+euR4X/LwOR3eEbrAVNkOsXdA+jmKlSKz4jFAilO63qCfKtMDTEnLJT3AWF6QfM/Rc0oruVOS60wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xwnuNQJp; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xwnuNQJp"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nb7Cv1792976;
	Wed, 5 Aug 2026 22:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=cCcVv
	SuodWz5x+2JgmQjIIR4eIl/Gx+ANL0ctnkYuUM=; b=xwnuNQJppAIjXX+CY8FCL
	xkqoMhKrlp35i/+xYzPcJvhn2xmOJf22zlqXbt52dPqtAsq+vBiRuVXt4TlT1frd
	VolBX0ZvgRVt1jM2jiLRLODng2fPjwewo5MNruvyILuZqVAJNmAbJjwkuTX7ho3v
	AAlkbr9+VkKTjcH92OWj9H54aGE7brGfyibHk7xYlYr9KBwn62NV9X56X97YIuEp
	+hLWIp2LePmbiJ6CuVuasgZHeTTPZtFt+MqAWSikrCyAM5LqVEWSpGNKf5DBE/sw
	nEkgFHboONR+YaeWakD8ed56mmaEaCe+JfXS2ieDLhpvbW1XDZN1HCzU/zgZUxfO
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fv3a33s3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 22:06:47 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 67626kEw038132
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Aug 2026 22:06:46 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 5 Aug
 2026 22:06:46 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 5 Aug 2026 22:06:46 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.41])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 67626Rbn017246;
	Wed, 5 Aug 2026 22:06:41 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Thu, 6 Aug 2026 10:05:17 +0800
Subject: [PATCH v9 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260806-upstream-ltc3208-v9-2-c746e872c193@analog.com>
References: <20260806-upstream-ltc3208-v9-0-c746e872c193@analog.com>
In-Reply-To: <20260806-upstream-ltc3208-v9-0-c746e872c193@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jan Carlo Roleda <jancarlo.roleda@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785981987; l=11092;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=0ljzEuTDRkykZzlST+bF0UEx5DfgjRjo9dSn2tUa5No=;
 b=86XIWl7AFbQj0JWqxc05V8ObFEBXOFDQG5j3KUAFmw2QLzR7lnlilHOck53p61MzSJsW1F0Ng
 TV8lDUpUqowB6cI2o7uTCZszU21Vc0Wgw1U2gfKEZLl442MrVZz9yDg
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=CuePtH4D c=1 sm=1 tr=0 ts=6a73ec37 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=FfwCkgHInPnU5R23u4kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: lMY_G4nkt0wh4kpTwnfevIMh6axUjowA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAxMyBTYWx0ZWRfX7lFJBxv+yO4H
 RZulELVwAAQjAxgoWkl/h0ZdvBLOba7zCuRTddgvZsNBDtsUW8ItdIyVoEnPdzUre9jndHyD6sd
 Gp9p37CEZ3R8hwftZOGkdRZwWOFPzm9eTS/a/96Kb5HSGxhGnKtsDM7gVOYXAkkuwjxAUTwwmS9
 hgpVccBj+3AuJrZDgGN4PO9kz//lVxsH+9kinypREyX7/9PTJTUliuIAK/ymC+lPM8ysV4lM/f8
 cg7rkd1+BMzYxpEUEflJyNdIBrcr5dtTjK99EDwzlRdvHZebfDs9FlDzoWqpYy5TYCV3Vl2EimR
 I+vFspITXKAk1lRdqn5mNZ27kM2Oe7kwxrRdcExSVURVm8bPPKI6jYiuiHY8Co8FoDNRBPp9ZgE
 OlMl8JEo/fhE1msPjIqRgf8Q6pVx7sUG650YBJB4m23/YF+xKsmeyGMG5BjElW/r1KCXeByaZY0
 qGU8TlTyli8m+/vx68g==
X-Proofpoint-ORIG-GUID: lMY_G4nkt0wh4kpTwnfevIMh6axUjowA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAxMyBTYWx0ZWRfXxxEhcQXzD8KU
 theIyj+rdPnissm6fCehD0r0jRjnsdGbTiR8AjOnHGjN+DNXK/l8QllOPTNK8XNYqHclH3gSpLI
 qH4UZOntc6vvHIAn0FBiFzAqBQc75mB1zeeqWL75fHj5iaHjwrIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060013

Kernel driver implementation for LTC3208 Multidisplay LED Driver.

The LTC3208 is a Multi-display LED driver, designed to control up to
7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN, BLUE),
each configurable with its own current level that is equally set to its
respective output current source pins for external LEDs.

It is programmed via the I2C serial interface.
MAIN and SUB support 8-bit current level resolution,
while AUX, CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.

The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
channel current levels, or as its own independent AUX channel.

The CAM LED channel is configured as 2 separate CAMHI and CAMLO register
sub-channels, which current is selected via the CAMHL pin, or set to
CAMHI register only via setting the S_CAMHILO bit high in register G (0x7).

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/leds/Kconfig        |  12 +++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ltc3208.c | 231 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 245 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fd6ffdaaf04..e3b59485ecb3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
+F:	drivers/leds/leds-ltc3208.c
 
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c870..d917ce3b72f4 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1028,6 +1028,18 @@ config LEDS_ACER_A500
 	  This option enables support for the Power Button LED of
 	  Acer Iconia Tab A500.
 
+config LEDS_LTC3208
+	tristate "LED Driver for Analog Devices LTC3208"
+	depends on LEDS_CLASS && I2C
+	select REGMAP_I2C
+	help
+	  Say Y to enable the LTC3208 LED driver.
+	  This enables the LED device LTC3208, a 7-channel, 17-current source
+	  multidisplay high-current LED driver, configured via I2C.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called ltc3208.
+
 source "drivers/leds/blink/Kconfig"
 
 comment "Flash and Torch LED drivers"
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 7db3768912ca..0148b87e16ba 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
 obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
+obj-$(CONFIG_LEDS_LTC3208)		+= leds-ltc3208.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
new file mode 100644
index 000000000000..25b49e24ca08
--- /dev/null
+++ b/drivers/leds/leds-ltc3208.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LED driver for Analog Devices LTC3208 Multi-Display Driver
+ *
+ * Copyright 2026 Analog Devices Inc.
+ *
+ * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/* Registers */
+#define LTC3208_REG_A_GRNRED		0x1 /* Green and Red current DAC */
+#define LTC3208_REG_B_AUXBLU		0x2 /* AUX and Blue current DAC */
+#define LTC3208_REG_C_MAIN		0x3 /* Main current DAC */
+#define LTC3208_REG_D_SUB		0x4 /* Sub current DAC */
+#define LTC3208_REG_E_AUX_SELECT	0x5 /* AUX DAC Select */
+#define  LTC3208_AUX1_MASK		GENMASK(1, 0)
+#define  LTC3208_AUX2_MASK		GENMASK(3, 2)
+#define  LTC3208_AUX3_MASK		GENMASK(5, 4)
+#define  LTC3208_AUX4_MASK		GENMASK(7, 6)
+#define LTC3208_REG_F_CAM		0x6 /* CAM (High and Low) current DAC */
+#define LTC3208_REG_G_OPT		0x7 /* Device Options */
+#define  LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
+#define  LTC3208_OPT_DIS_RGBDROP	BIT(3)
+#define  LTC3208_OPT_DIS_CAMHILO	BIT(2)
+#define  LTC3208_OPT_EN_RGBS		BIT(1)
+
+#define LTC3208_MAX_BRIGHTNESS_4BIT	0xF
+#define LTC3208_MAX_BRIGHTNESS_8BIT	0xFF
+
+#define LTC3208_NUM_AUX_LEDS		4 /* Number of configurable aux channels */
+
+enum ltc3208_aux_channel {
+	LTC3208_AUX_CHAN_AUX = 0,
+	LTC3208_AUX_CHAN_MAIN,
+	LTC3208_AUX_CHAN_SUB,
+	LTC3208_AUX_CHAN_CAM
+};
+
+enum ltc3208_channel {
+	LTC3208_CHAN_MAIN = 0,
+	LTC3208_CHAN_SUB,
+	LTC3208_CHAN_AUX,
+	LTC3208_CHAN_CAML,
+	LTC3208_CHAN_CAMH,
+	LTC3208_CHAN_RED,
+	LTC3208_CHAN_BLUE,
+	LTC3208_CHAN_GREEN,
+	LTC3208_CHAN_N_COUNT,
+};
+
+static const char *const ltc3208_dt_aux_channels[] = {
+	"adi,aux1-channel",
+	"adi,aux2-channel",
+	"adi,aux3-channel",
+	"adi,aux4-channel"
+};
+
+static const char *const ltc3208_aux_opt[] = { "aux", "main", "sub", "cam" };
+
+struct ltc3208_led {
+	struct led_classdev cdev;
+	struct regmap_field *rfield;
+};
+
+static const struct reg_default ltc3208_reg_defaults[LTC3208_REG_G_OPT] = {
+	{ LTC3208_REG_A_GRNRED, 0 },
+	{ LTC3208_REG_B_AUXBLU, 0 },
+	{ LTC3208_REG_C_MAIN, 0 },
+	{ LTC3208_REG_D_SUB, 0 },
+	{ LTC3208_REG_E_AUX_SELECT, 0 },
+	{ LTC3208_REG_F_CAM, 0 },
+	{ LTC3208_REG_G_OPT, 0 }
+};
+
+static const struct regmap_config ltc3208_regmap_cfg = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LTC3208_REG_G_OPT,
+	.cache_type = REGCACHE_FLAT_S,
+	.reg_defaults = ltc3208_reg_defaults,
+	.num_reg_defaults = LTC3208_REG_G_OPT,
+};
+
+static const struct reg_field ltc3208_led_reg_field[LTC3208_CHAN_N_COUNT] = {
+	[LTC3208_CHAN_MAIN]  = REG_FIELD(LTC3208_REG_C_MAIN, 0, 7),
+	[LTC3208_CHAN_SUB]   = REG_FIELD(LTC3208_REG_D_SUB, 0, 7),
+	[LTC3208_CHAN_BLUE]  = REG_FIELD(LTC3208_REG_B_AUXBLU, 0, 3),
+	[LTC3208_CHAN_AUX]   = REG_FIELD(LTC3208_REG_B_AUXBLU, 4, 7),
+	[LTC3208_CHAN_CAML]  = REG_FIELD(LTC3208_REG_F_CAM, 0, 3),
+	[LTC3208_CHAN_CAMH]  = REG_FIELD(LTC3208_REG_F_CAM, 4, 7),
+	[LTC3208_CHAN_RED]   = REG_FIELD(LTC3208_REG_A_GRNRED, 0, 3),
+	[LTC3208_CHAN_GREEN] = REG_FIELD(LTC3208_REG_A_GRNRED, 4, 7),
+};
+
+static int ltc3208_led_set_brightness(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct ltc3208_led *led = container_of(led_cdev, struct ltc3208_led, cdev);
+	u8 current_level = brightness;
+
+	return regmap_field_write(led->rfield, current_level);
+}
+
+static int ltc3208_probe(struct i2c_client *client)
+{
+	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
+	DECLARE_BITMAP(registered_chans, LTC3208_CHAN_N_COUNT) = { };
+	struct regmap *regmap;
+	bool disable_rgb_aux4_dropout_signal;
+	bool disable_camhl_pin;
+	bool set_sub_control_pin;
+	int ret;
+	u8 dev_options;
+
+	regmap = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap), "Failed to initialize regmap.");
+
+	regcache_mark_dirty(regmap);
+	ret = regcache_sync(regmap);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to sync register cache.");
+
+	disable_camhl_pin = device_property_read_bool(&client->dev, "adi,disable-camhl-pin");
+	set_sub_control_pin = device_property_read_bool(&client->dev, "adi,cfg-enrgbs-pin");
+	disable_rgb_aux4_dropout_signal =
+		device_property_read_bool(&client->dev, "adi,disable-rgb-aux4-dropout");
+
+	dev_options = FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
+		      FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, disable_camhl_pin) |
+		      FIELD_PREP(LTC3208_OPT_CPO_MASK, 0) |
+		      FIELD_PREP(LTC3208_OPT_DIS_RGBDROP, disable_rgb_aux4_dropout_signal);
+
+	ret = regmap_write(regmap, LTC3208_REG_G_OPT, dev_options);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "failed to set device options register.");
+
+	/* Initialize aux channel configurations */
+	for (int i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {
+		/* default value (AUX) if property is not present in dt */
+		if (!device_property_present(&client->dev, ltc3208_dt_aux_channels[i])) {
+			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
+			continue;
+		}
+
+		ret = device_property_match_property_string(&client->dev,
+							    ltc3208_dt_aux_channels[i],
+							    ltc3208_aux_opt, LTC3208_NUM_AUX_LEDS);
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret, "Error reading AUX Channel %d", i);
+
+		aux_channels[i] = ret;
+	}
+
+	dev_options = FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
+		      FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
+		      FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
+		      FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);
+
+	ret = regmap_write(regmap, LTC3208_REG_E_AUX_SELECT, dev_options);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "error writing to aux channel register.");
+
+	device_for_each_child_node_scoped(&client->dev, child) {
+		struct ltc3208_led *led;
+		struct led_init_data init_data = { };
+		u32 chan;
+
+		ret = fwnode_property_read_u32(child, "reg", &chan);
+		if (ret)
+			return dev_err_probe(&client->dev, ret, "Failed to get reg value of LED.");
+		if (chan >= LTC3208_CHAN_N_COUNT)
+			return dev_err_probe(&client->dev, -EINVAL, "%u is an invalid LED ID.",
+					     chan);
+		if (test_and_set_bit(chan, registered_chans))
+			return dev_err_probe(&client->dev, -EINVAL, "%u is already registered.",
+					     chan);
+
+		led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
+		if (!led)
+			return -ENOMEM;
+
+		led->rfield = devm_regmap_field_alloc(&client->dev, regmap,
+						      ltc3208_led_reg_field[chan]);
+		if (IS_ERR(led->rfield))
+			return dev_err_probe(&client->dev, PTR_ERR(led->rfield),
+					     "cannot allocate regmap field.");
+		led->cdev.brightness_set_blocking = ltc3208_led_set_brightness;
+		led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_4BIT;
+
+		if (chan == LTC3208_CHAN_MAIN || chan == LTC3208_CHAN_SUB)
+			led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_8BIT;
+
+		init_data.fwnode = child;
+
+		ret = devm_led_classdev_register_ext(&client->dev, &led->cdev, &init_data);
+		if (ret)
+			return dev_err_probe(&client->dev, ret, "LED %u Register failed.", chan);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id ltc3208_match_table[] = {
+	{ .compatible = "adi,ltc3208" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ltc3208_match_table);
+
+static struct i2c_driver ltc3208_driver = {
+	.driver = {
+		.name = "ltc3208",
+		.of_match_table = ltc3208_match_table,
+	},
+	.probe = ltc3208_probe,
+};
+module_i2c_driver(ltc3208_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jan Carlo Roleda <jancarlo.roleda@analog.com>");
+MODULE_DESCRIPTION("LTC3208 LED Driver");

-- 
2.43.0

