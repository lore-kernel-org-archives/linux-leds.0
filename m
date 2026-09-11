Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C671825B092;
	Fri, 11 Sep 2026 00:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084940; cv=none; b=hIAP9fOOrfz3I365CNgk7Kj0Qd/fan+JkO/BZkkEg0Wfed51AYGhmEAqOJU/gcm0lB2TYTWy+9VPpThmiJE0gH3faXS1Z+DxN7CqGOBnK217rXAcXh4w5fdLSpsIBPog+xfwATZCvMgZ2KQerTRa3HUaECQaa3UfyE7y7Z0QojA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084940; c=relaxed/simple;
	bh=oi44BUW+4+y0VksDA+puACoNvDmR4DgSpzX/ESo9ez0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M0f/t7cj/A2rx1jI3FcbFxa4+8dWQZZivWAK9e/v6uS1BeaGo0TN7kkaD/80ihHOJf4nJsDb7M9XPMOGvI78p68MA5wb4qhWgEMVHGWk8m6glXyatImA+doFyVe5YFcqXPGv/Tt6HaoPL7tlYzHcktW5X7L/0ryI0vwHc23yVvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=v1q6JQbN; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="v1q6JQbN"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALXehq382180;
	Thu, 10 Sep 2026 20:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ByFKS
	eeZwf8E+TfLm2BVcjqO83Qi8/ooTjpvQacUhJs=; b=v1q6JQbN1ZbclQ7EntEix
	C11qPxAblpxbJcQ75BAWCISse/0sE8XqmkhhbdBFUErG9PWO5Q/KnNPwh4SDgaEe
	Vn7kzZKyM1I/HNTQK8LC9lXHqkmMpMYBCMAZRpk30GYGY5HFldF76+nx9YYt3ykL
	fZse5bGrWqa0xjXd/9wzwPm/pHjW9hRm0B14487ohHMwJT3NbRQCECU051csQ6E5
	8PEN2c2+N7hN9+qrS4K8DIW4FvOpvydsga4Zf4/MHWwP2OoeyAraAL3vpfaZZkDB
	EaesJJOj8CbiL7GJEjsfFafFIQZf92Udov2sjYvajl4WeHLurq8OSUHlXSgF3om5
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxaeemk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 20:02:14 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68B02DEX024888
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 20:02:13 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 10 Sep 2026 20:02:13 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 10 Sep 2026 20:02:13 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 10 Sep 2026 20:02:13 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.26])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68B01rBu031719;
	Thu, 10 Sep 2026 20:02:07 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Fri, 11 Sep 2026 08:01:52 +0800
Subject: [PATCH v13 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260911-upstream-ltc3208-v13-2-fc9aa3758b55@analog.com>
References: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>
In-Reply-To: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789084913; l=11303;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=oi44BUW+4+y0VksDA+puACoNvDmR4DgSpzX/ESo9ez0=;
 b=8uSB8CtcTmts7cmIs/ShgkntzAyMU5TZPGg1J1q8MbtHaJO27nuQ6diWxYjdhJ2B4PXKCwzQG
 OBoHNthAy+RA7twdSavjILv1k6q50nxdsKJIcVuXMS4e0vjSudB1vAk
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDMwMyBTYWx0ZWRfX7DbmonGnLi9/
 qHudQtgmT5xlmJgEn6JMovg5rTRw00yIp99ebI/cbq1NlE+vgDi0O9GURvaSpxbMvJLKzy3B6j8
 Dij/IgfUza+UqcJkeGVw2rwo+TqqhBuvZo/AC6REU23lyn1Fym8+
X-Authority-Analysis: v=2.4 cv=Ao17T+9P c=1 sm=1 tr=0 ts=6aa34506 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=FfwCkgHInPnU5R23u4kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: M2Rauzf3hidMi33FVUDUep6VanVqiZXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDMwMyBTYWx0ZWRfX9I7LOsgx3vtj
 mLfNFWl0CPhE+jCbHKhhjIxTHMHrswAYJ6RZcPwh+Ki3Sesd7ZkwSechc+1y7PcyfPRsnUROcr/
 GJbQmlInaEoHilyip7o/0jGaN5GeL9/Lmkt7zBaSbn8rHeeqm01vxIjjOvMy7Wqn1IvwxwPBbRo
 N7sMf23j6d6H1/7qLR3wjpAiwq/GTruEtC47s8Jm1sLfxretUoge4g88Ls9kl/IN+LuiUrJpnyl
 wgi+nY2B+Emia/BPjSL9lOTpcfaFzXvg4qUUpHJBewkEb8DKyAOEgc1pe/c+6JVpZg85KxeHr+p
 t54fJQEA+EBsEAfIZEqn/61TqsQwcgFopDnXBJhinarLfJBVoJXK3j9dYE878bt27D2HCE4c2Xj
 BINrvOvHlCcda24wbwHKKq/qV4nlPDkT1opeBNFTzDOykRfwRc8VBzYl10/wKu653WLHLyQXtZ0
 NdzXvlbaJdeuXRwQSpw==
X-Proofpoint-ORIG-GUID: M2Rauzf3hidMi33FVUDUep6VanVqiZXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100303

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
 drivers/leds/leds-ltc3208.c | 234 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 248 insertions(+)

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
index 000000000000..64091f29f18a
--- /dev/null
+++ b/drivers/leds/leds-ltc3208.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LED driver for Analog Devices LTC3208 Multi-Display Driver
+ *
+ * Copyright 2026 Analog Devices Inc.
+ *
+ * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>
+ *
+ */
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
+#define LTC3208_REG_A_GRNRED_CURRENT	0x1	/* Green and Red current DAC */
+#define LTC3208_REG_B_AUXBLU_CURRENT	0x2	/* AUX and Blue current DAC */
+#define LTC3208_REG_C_MAIN_CURRENT	0x3	/* Main current DAC */
+#define LTC3208_REG_D_SUB_CURRENT	0x4	/* Sub current DAC */
+#define LTC3208_REG_E_AUX_SELECT	0x5	/* AUX DAC Select */
+#define  LTC3208_AUX1_MASK		GENMASK(1, 0)
+#define  LTC3208_AUX2_MASK		GENMASK(3, 2)
+#define  LTC3208_AUX3_MASK		GENMASK(5, 4)
+#define  LTC3208_AUX4_MASK		GENMASK(7, 6)
+#define LTC3208_REG_F_CAM_CURRENT	0x6	/* CAM (High and Low) current DAC */
+#define LTC3208_REG_G_OPT		0x7	/* Device Options */
+#define  LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
+#define  LTC3208_OPT_DIS_RGBDROP	BIT(3)
+#define  LTC3208_OPT_DIS_CAMHILO	BIT(2)
+#define  LTC3208_OPT_EN_RGBS		BIT(1)
+
+#define LTC3208_MAX_BRIGHTNESS_4BIT	0xF
+#define LTC3208_MAX_BRIGHTNESS_8BIT	0xFF
+
+#define LTC3208_NUM_AUX_LEDS		4	/* Number of configurable aux channels */
+#define LTC3208_NUM_REGS		7	/* Number of available registers to access */
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
+static const struct reg_default ltc3208_reg_defaults[] = {
+	{ LTC3208_REG_A_GRNRED_CURRENT, 0 },
+	{ LTC3208_REG_B_AUXBLU_CURRENT, 0 },
+	{ LTC3208_REG_C_MAIN_CURRENT, 0 },
+	{ LTC3208_REG_D_SUB_CURRENT, 0 },
+	{ LTC3208_REG_E_AUX_SELECT, 0 },
+	{ LTC3208_REG_F_CAM_CURRENT, 0 },
+	{ LTC3208_REG_G_OPT, 0 }
+};
+
+static const struct regmap_config ltc3208_regmap_cfg = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LTC3208_REG_G_OPT,
+	.cache_type = REGCACHE_FLAT_S,
+	.reg_defaults = ltc3208_reg_defaults,
+	.num_reg_defaults = LTC3208_NUM_REGS,
+};
+
+static const struct reg_field ltc3208_led_reg_field[LTC3208_CHAN_N_COUNT] = {
+	[LTC3208_CHAN_MAIN]  = REG_FIELD(LTC3208_REG_C_MAIN_CURRENT, 0, 7),
+	[LTC3208_CHAN_SUB]   = REG_FIELD(LTC3208_REG_D_SUB_CURRENT, 0, 7),
+	[LTC3208_CHAN_BLUE]  = REG_FIELD(LTC3208_REG_B_AUXBLU_CURRENT, 0, 3),
+	[LTC3208_CHAN_AUX]   = REG_FIELD(LTC3208_REG_B_AUXBLU_CURRENT, 4, 7),
+	[LTC3208_CHAN_CAML]  = REG_FIELD(LTC3208_REG_F_CAM_CURRENT, 0, 3),
+	[LTC3208_CHAN_CAMH]  = REG_FIELD(LTC3208_REG_F_CAM_CURRENT, 4, 7),
+	[LTC3208_CHAN_RED]   = REG_FIELD(LTC3208_REG_A_GRNRED_CURRENT, 0, 3),
+	[LTC3208_CHAN_GREEN] = REG_FIELD(LTC3208_REG_A_GRNRED_CURRENT, 4, 7),
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
+		return dev_err_probe(&client->dev, PTR_ERR(regmap), "Failed to initialize regmap");
+
+	regcache_mark_dirty(regmap);
+	ret = regcache_sync(regmap);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to sync register cache");
+
+	disable_camhl_pin = device_property_read_bool(&client->dev, "adi,disable-camhl-pin");
+
+	set_sub_control_pin = device_property_read_bool(&client->dev, "adi,cfg-enrgbs-pin");
+
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
+		return dev_err_probe(&client->dev, ret, "Failed to set device options register");
+
+	/* Initialize AUX channel configurations */
+	for (int i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {
+		/* Default value (AUX) if property is not present in DT */
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
+		return dev_err_probe(&client->dev, ret, "Error writing to aux channel register");
+
+	device_for_each_child_node_scoped(&client->dev, child) {
+		struct ltc3208_led *led;
+		struct led_init_data init_data = { };
+		u32 chan;
+
+		ret = fwnode_property_read_u32(child, "reg", &chan);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					     "Failed to get register value of LED");
+		if (chan >= LTC3208_CHAN_N_COUNT)
+			return dev_err_probe(&client->dev, -EINVAL, "%u is an invalid LED ID",
+					     chan);
+		if (test_and_set_bit(chan, registered_chans))
+			return dev_err_probe(&client->dev, -EINVAL, "%u is already registered",
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
+					     "Cannot allocate regmap field");
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
+			return dev_err_probe(&client->dev, ret, "Failed to register LED %u", chan);
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

