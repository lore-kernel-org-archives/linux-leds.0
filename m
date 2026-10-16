Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEFC530DED
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168173; cv=none; b=S1BzJl/UWuF3jsVJmyoQ18rnSujvB3semxvQAGKGd8ChTGSEQRwIist6OcHl1Kq/iEg1IAqiq3cDI1BdQhNfaOZLCBW6toyWvjiZb/Y/Kxn40twIZjp/JbwAwt+8dRgUWAm9cuEaRPCWOLaRx69HfryC6zU+acASTVE6oARCF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168173; c=relaxed/simple;
	bh=pqS6KFk2050B10nKGfi4aD7GcPJCQEPYCC94LoumGDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUY6zpc2c3GaGt3qg3zaXg/dR2MIKv7Wn/xohTRRRDPrvrsYJqCrjJ5xscjU9vUNsTOkQE/+nIsPSXsgIzkYkmur48s7tU1iNXwCKS8ekzIucmKyJZnDg3U9Z74Hte5O+3zTVpYcpkbu9LTE9ythvRnI49dKLn+jOLVMd37I9jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDZIErLc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDZIErLc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so8505f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168165; x=1792772965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyyptWs4jeRy65VcZv2YS5BXwKedU7NEWnY/im0Q2Lg=;
        b=MDZIErLccDlYos2drA1F0zZk5AhdcywLZZWIAkgah7DJjcL4tToN3XEnuZxZXFjDIr
         PhA7rLOTV6bkLcAk7I1Ir7h0mqVNIiPQIXcHkH9622t4F5mxORsvQXc9I5/+ANJUsGbV
         ePJtM7nfcIToF+db3SrjbIRxfupSYeO6vxiqxpRuVPEw4fzfM9JlqeCx9NQpIUHk9y+m
         JMcqc8g0HQpu5HlKYVtETuXmwMu/uJdp376fNhZ2WgC7CxweZK2/edPGMBeKPstDgHVq
         IJpdB8ka8c/Walfqbpy73cZct4Q4WcK73T9qjXX3XsFDKdG/neQP8dgF9u0Omsrj2M5g
         TPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168165; x=1792772965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FyyptWs4jeRy65VcZv2YS5BXwKedU7NEWnY/im0Q2Lg=;
        b=ytPKyPG5/4peSpkTd6uLQr2ZY85uZcinYHT13sGU+u+V+eLiGhcBOEt8Pk8jCUAqIG
         JNVzo5lNdMuKzb5lRIsVhjOOdp1HMR/KKcGBhlEnhN4wECax0J/iGxKi/OAB2FeqWXCu
         zVp+779irRy9d6ApNW4rXb2bE3cOztvuMzDjJMVN7Vxxxjl64/nHxGeoPwiEH5pIzKOi
         Um91d6l7LFCQvtvIycKcW3lyWQ4/bpqSBT/CXNEfMdaSzOOVRIqO1zu28VJ6S9XdYX38
         7SAq2nPlZirWDGqnZOPLqIo/0U4f/3c1BFbOy47LkJXpjyD7EdNhYQJeD9Cm/oFGIMgj
         l1PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc+C2z9VpBH4Ed2Sm5Rorl426XpAS0opDKgyHKdAdDAOQTo9lBiiNNXrFqI88RL+hdFVVUAv/oT8Tm@vger.kernel.org
X-Gm-Message-State: AFq9FYLlTr3TlSebBlGl7FQDXV5OjJyMT3VLy9q0xpgxSo0D0udiZii+
	vzoTp9JTDCBdeu/wCg0EQILtt1AQTbt8c8o0oWauRPcNsPSQDnR1hC9A
X-Gm-Gg: AYBFou1amgLZ6m0j07vYWJrIRn2xxwcOLitHZX6pii3/HmvBAmMKX6wC0wPX9/IKlWg
	46zP0AcwQ7+4WG+F4LQC9v1Lv25cV/4f4QM+cd/m/m/qxSu7NyHB3kZimV430h/7HbpRn/5Fnqt
	BlHQCv1vAIF7pk1TDDM1phYyTFe8UvnGjRK+jAIizD4oMTz971k+Pxm13hzwhiFsEBN3xh7JDVx
	ubq5Qr/J5rKK/X212g7KxTUfpV7O2uIkyyDYrmm/Jaw0shIjs+w1L6HWoKWKZmY3LaFJCcDJcsg
	DeN2tyjCPsaEpXnrxC0OMEUpZ5rY7htljKTFkEs6WHQaJNiUO2P3+xc6WaLpnB5/IGZxIE2VgQH
	vAIUnT7XO4bRZ89yyN+4uwm3EKuhdylR11kPgOH/9DHVEyGjBXSPRcwMRQWmDyx02rpdWH//n2l
	kl47+RlIH8HhM6cdAi3OdMBFYBcZinDMYev32BTZiOJibiiEDREcp8fne04jGCVTx60DMfHOO9Z
	XI/YAGQxk8lPsoRUUqs4QYxE1eEYCkhd6GUsxHjxHcKNcDT6lwEibHuV6ujBzZ7A1JnYteAulAT
	sA==
X-Received: by 2002:a05:6000:46da:b0:48d:f3d2:38e0 with SMTP id ffacd0b85a97d-48e07bbe5efmr161804f8f.15.1792168164719;
        Fri, 16 Oct 2026 09:29:24 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::103c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm9404317f8f.16.2026.10.16.09.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:29:24 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 2/2] backlight: Add Awinic AW99703 backlight driver
Date: Fri, 16 Oct 2026 18:29:12 +0200
Message-ID: <20261016162912.64581-3-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016162912.64581-1-lukapanio@gmail.com>
References: <20261016162912.64581-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for the Awinic AW99703 3-string WLED backlight controller.

Register values follow the AW99703 datasheet (V1.6), the structure
follows the aw99706 driver.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 MAINTAINERS                       |   6 +
 drivers/video/backlight/Kconfig   |  11 +
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/aw99703.c | 583 ++++++++++++++++++++++++++++++
 4 files changed, 601 insertions(+)
 create mode 100644 drivers/video/backlight/aw99703.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 461a56850c84..e4168448e95c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4525,6 +4525,12 @@ L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	sound/hda/codecs/side-codecs/aw88399*
 
+AWINIC AW99703 WLED BACKLIGHT DRIVER
+M:	Luka Panio <lukapanio@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml
+F:	drivers/video/backlight/aw99703.c
+
 AWINIC AW99706 WLED BACKLIGHT DRIVER
 M:	Junjie Cao <junjie.cao@linux.dev>
 S:	Maintained
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index dbf4ca23a9b6..c2494f7fa5d2 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -156,6 +156,17 @@ config BACKLIGHT_ATMEL_LCDC
 	  If in doubt, it's safe to enable this option; it doesn't kick
 	  in unless the board's description says it's wired that way.
 
+config BACKLIGHT_AW99703
+	tristate "Backlight Driver for Awinic AW99703"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you have a LCD backlight connected to the WLED outputs of an
+	  Awinic AW99703, say Y here to enable this driver.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called aw99703.
+
 config BACKLIGHT_AW99706
 	tristate "Backlight Driver for Awinic AW99706"
 	depends on I2C
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 34469711c6cd..09ec9bd71c92 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= apple_dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
+obj-$(CONFIG_BACKLIGHT_AW99703)		+= aw99703.o
 obj-$(CONFIG_BACKLIGHT_AW99706)		+= aw99706.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CGBC)		+= cgbc_bl.o
diff --git a/drivers/video/backlight/aw99703.c b/drivers/video/backlight/aw99703.c
new file mode 100644
index 000000000000..b0a46753d176
--- /dev/null
+++ b/drivers/video/backlight/aw99703.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * aw99703 - Backlight driver for the AWINIC AW99703
+ *
+ * Copyright (C) 2026 Luka Panio <lukapanio@gmail.com>
+ *
+ * Register layout and init sequence based on the AW99703 datasheet (V1.6)
+ */
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+
+#define AW99703_MAX_BRT_LVL		2047
+#define AW99703_ID			0x03
+
+#define AW99703_REG_ID			0x00
+#define AW99703_REG_SFTRST		0x01
+#define AW99703_REG_MODE		0x02
+#define AW99703_PDIS_MASK		BIT(4)
+#define AW99703_MAP_LINEAR_MASK		BIT(2)
+#define AW99703_WORKMODE_MASK		GENMASK(1, 0)
+#define AW99703_WORKMODE_STANDBY	0
+#define AW99703_WORKMODE_BACKLIGHT	1
+#define AW99703_REG_LEDCUR		0x03
+#define AW99703_BLFS_MASK		GENMASK(7, 3)
+#define AW99703_CHANNEL_MASK		GENMASK(2, 0)
+#define AW99703_REG_BSTCTR1		0x04
+#define AW99703_SW_FREQ_MASK		BIT(5)
+#define AW99703_OVPSEL_MASK		GENMASK(4, 2)
+#define AW99703_OCPSEL_MASK		GENMASK(1, 0)
+#define AW99703_REG_BSTCTR2		0x05
+#define AW99703_IDCTSEL_MASK		BIT(6)
+#define AW99703_REG_LEDLSB		0x06
+#define AW99703_BRT_LSB_MASK		GENMASK(2, 0)
+#define AW99703_REG_LEDMSB		0x07
+#define AW99703_REG_PWM			0x08
+#define AW99703_REG_TURNCFG		0x09
+#define AW99703_RAMP_ON_MASK		GENMASK(7, 4)
+#define AW99703_RAMP_OFF_MASK		GENMASK(3, 0)
+#define AW99703_REG_TRANCFG		0x0A
+#define AW99703_PWM_TRANS_MASK		GENMASK(6, 4)
+#define AW99703_I2C_TRANS_MASK		GENMASK(3, 0)
+#define AW99703_REG_FLASH		0x0B
+#define AW99703_REG_AFHIGH		0x0C
+#define AW99703_REG_AFLOW		0x0D
+#define AW99703_REG_FLAGS1		0x0E
+#define AW99703_REG_FLAGS2		0x0F
+#define AW99703_FLAGS2_MASK		GENMASK(7, 5)
+#define AW99703_REG_FLAGS3		0x11
+#define AW99703_REG_MAX			0x69
+
+#define AW99703_HWEN_ON_DELAY_US	3500
+#define AW99703_ID_RETRIES		5
+
+#define RESV	U32_MAX
+
+/* Boost switching frequency, in Hz */
+static const u32 aw99703_sw_freq_tbl[] = { 500000, 1000000 };
+
+/* Boost over-voltage protection threshold, in uV (1xx = 41.5 V) */
+static const u32 aw99703_ovp_tbl[] = {
+	17500000, 24000000, 31000000, 38000000, 41500000, RESV, RESV, RESV
+};
+
+/* Boost over-current protection threshold, in uA */
+static const u32 aw99703_ocp_tbl[] = { 900000, 1800000, 2700000, 3400000 };
+
+/* Boost inductor, in nH */
+static const u32 aw99703_inductor_tbl[] = { 4700, 10000 };
+
+/* Current sink turn on/off ramp time, in us */
+static const u32 aw99703_ramp_tbl[] = {
+	512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000, 256000,
+	512000, 1024000, 2048000, 4096000, 8192000, 16384000
+};
+
+/* PWM dimming transition time, in ms */
+static const u32 aw99703_pwm_trans_tbl[] = {
+	2, 4, 8, 16, 32, 64, 128, 256
+};
+
+/* I2C dimming transition time, in ms (code 0: 1 us per brightness step) */
+static const u32 aw99703_i2c_trans_tbl[] = {
+	RESV, 128, 192, 256, 320, 384, 448, 512, 576, 640, 768, 1024, 1280,
+	1536, 2560, 4096
+};
+
+struct aw99703_dt_prop {
+	const char * const name;
+	const u32 * const lookup_tbl;
+	u8 tbl_size;
+	u32 min;
+	u32 step;
+	u8 reg;
+	u8 mask;
+	u8 def_code;
+};
+
+static const struct aw99703_dt_prop aw99703_dt_props[] = {
+	{
+		.name = "awinic,sw-freq-hz",
+		.lookup_tbl = aw99703_sw_freq_tbl,
+		.tbl_size = ARRAY_SIZE(aw99703_sw_freq_tbl),
+		.reg = AW99703_REG_BSTCTR1,
+		.mask = AW99703_SW_FREQ_MASK,
+		.def_code = 1,
+	},
+	{
+		.name = "awinic,ovp-microvolt",
+		.lookup_tbl = aw99703_ovp_tbl,
+		.tbl_size = ARRAY_SIZE(aw99703_ovp_tbl),
+		.reg = AW99703_REG_BSTCTR1,
+		.mask = AW99703_OVPSEL_MASK,
+		.def_code = 3,
+	},
+	{
+		.name = "awinic,ocp-microamp",
+		.lookup_tbl = aw99703_ocp_tbl,
+		.tbl_size = ARRAY_SIZE(aw99703_ocp_tbl),
+		.reg = AW99703_REG_BSTCTR1,
+		.mask = AW99703_OCPSEL_MASK,
+		.def_code = 2,
+	},
+	{
+		.name = "awinic,inductor-nanohenry",
+		.lookup_tbl = aw99703_inductor_tbl,
+		.tbl_size = ARRAY_SIZE(aw99703_inductor_tbl),
+		.reg = AW99703_REG_BSTCTR2,
+		.mask = AW99703_IDCTSEL_MASK,
+		.def_code = 0,
+	},
+	{
+		.name = "awinic,iled-max-microamp",
+		.min = 4800,
+		.step = 800,
+		.reg = AW99703_REG_LEDCUR,
+		.mask = AW99703_BLFS_MASK,
+		.def_code = 19,
+	},
+	{
+		.name = "awinic,ramp-on-time-us",
+		.lookup_tbl = aw99703_ramp_tbl,
+		.tbl_size = ARRAY_SIZE(aw99703_ramp_tbl),
+		.reg = AW99703_REG_TURNCFG,
+		.mask = AW99703_RAMP_ON_MASK,
+		.def_code = 4,
+	},
+	{
+		.name = "awinic,ramp-off-time-us",
+		.lookup_tbl = aw99703_ramp_tbl,
+		.tbl_size = ARRAY_SIZE(aw99703_ramp_tbl),
+		.reg = AW99703_REG_TURNCFG,
+		.mask = AW99703_RAMP_OFF_MASK,
+		.def_code = 4,
+	},
+	{
+		.name = "awinic,pwm-trans-time-ms",
+		.lookup_tbl = aw99703_pwm_trans_tbl,
+		.tbl_size = ARRAY_SIZE(aw99703_pwm_trans_tbl),
+		.reg = AW99703_REG_TRANCFG,
+		.mask = AW99703_PWM_TRANS_MASK,
+		.def_code = 0,
+	},
+	{
+		.name = "awinic,i2c-trans-time-ms",
+		.lookup_tbl = aw99703_i2c_trans_tbl,
+		.tbl_size = ARRAY_SIZE(aw99703_i2c_trans_tbl),
+		.reg = AW99703_REG_TRANCFG,
+		.mask = AW99703_I2C_TRANS_MASK,
+		.def_code = 0,
+	},
+};
+
+struct reg_init_data {
+	u8 reg;
+	u8 mask;
+	u8 val;
+};
+
+#define AW99703_INIT_TBL_SIZE	(ARRAY_SIZE(aw99703_dt_props) + 3)
+
+struct aw99703_device {
+	struct device *dev;
+	struct regmap *regmap;
+	struct backlight_device *bl_dev;
+	struct gpio_desc *hwen_gpio;
+	struct reg_init_data init_tbl[AW99703_INIT_TBL_SIZE];
+	bool bl_enable;
+};
+
+static bool aw99703_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AW99703_REG_ID:
+	case AW99703_REG_MODE ... AW99703_REG_FLAGS2:
+	case AW99703_REG_FLAGS3:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool aw99703_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AW99703_REG_SFTRST ... AW99703_REG_AFLOW:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool aw99703_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AW99703_REG_FLAGS1:
+	case AW99703_REG_FLAGS2:
+	case AW99703_REG_FLAGS3:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config aw99703_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AW99703_REG_MAX,
+	.readable_reg = aw99703_readable_reg,
+	.writeable_reg = aw99703_writeable_reg,
+	.volatile_reg = aw99703_volatile_reg,
+};
+
+static int aw99703_dt_lookup(const struct aw99703_dt_prop *prop, u32 dt_val,
+			     u8 *val)
+{
+	u32 max_code = prop->mask >> __ffs(prop->mask);
+	int i;
+
+	if (!prop->lookup_tbl) {
+		if (dt_val < prop->min || (dt_val - prop->min) % prop->step ||
+		    (dt_val - prop->min) / prop->step > max_code)
+			return -EINVAL;
+		*val = (dt_val - prop->min) / prop->step;
+		return 0;
+	}
+
+	for (i = 0; i < prop->tbl_size; i++)
+		if (prop->lookup_tbl[i] != RESV && prop->lookup_tbl[i] == dt_val)
+			break;
+
+	*val = i;
+	return i == prop->tbl_size ? -EINVAL : 0;
+}
+
+static void aw99703_dt_parse(struct aw99703_device *aw,
+			     struct backlight_properties *props)
+{
+	const struct aw99703_dt_prop *prop;
+	struct reg_init_data *init = aw->init_tbl;
+	bool exp_map;
+	u32 dt_val, strings = 3;
+	int i;
+	u8 val;
+
+	for (i = 0; i < ARRAY_SIZE(aw99703_dt_props); i++, init++) {
+		prop = &aw99703_dt_props[i];
+
+		val = prop->def_code;
+		if (!device_property_read_u32(aw->dev, prop->name, &dt_val) &&
+		    aw99703_dt_lookup(prop, dt_val, &val)) {
+			dev_warn(aw->dev, "invalid value %u for %s, using chip default\n",
+				 dt_val, prop->name);
+			val = prop->def_code;
+		}
+
+		init->reg = prop->reg;
+		init->mask = prop->mask;
+		init->val = val << __ffs(prop->mask);
+	}
+
+	device_property_read_u32(aw->dev, "awinic,led-strings", &strings);
+	if (strings < 1 || strings > 3) {
+		dev_warn(aw->dev, "invalid awinic,led-strings %u, using 3\n",
+			 strings);
+		strings = 3;
+	}
+	init->reg = AW99703_REG_LEDCUR;
+	init->mask = AW99703_CHANNEL_MASK;
+	init->val = GENMASK(strings - 1, 0);
+	init++;
+
+	init->reg = AW99703_REG_MODE;
+	init->mask = AW99703_PDIS_MASK;
+	init->val = device_property_read_bool(aw->dev, "awinic,pwm-input") ?
+		    0 : AW99703_PDIS_MASK;
+	init++;
+
+	exp_map = device_property_read_bool(aw->dev, "awinic,exponential-map");
+	init->reg = AW99703_REG_MODE;
+	init->mask = AW99703_MAP_LINEAR_MASK;
+	init->val = exp_map ? 0 : AW99703_MAP_LINEAR_MASK;
+	props->scale = exp_map ? BACKLIGHT_SCALE_NON_LINEAR :
+				 BACKLIGHT_SCALE_LINEAR;
+
+	props->max_brightness = AW99703_MAX_BRT_LVL;
+	device_property_read_u32(aw->dev, "max-brightness",
+				 &props->max_brightness);
+	if (props->max_brightness > AW99703_MAX_BRT_LVL)
+		props->max_brightness = AW99703_MAX_BRT_LVL;
+
+	props->brightness = props->max_brightness >> 1;
+	device_property_read_u32(aw->dev, "default-brightness",
+				 &props->brightness);
+	if (props->brightness > props->max_brightness)
+		props->brightness = props->max_brightness;
+}
+
+static int aw99703_hw_init(struct aw99703_device *aw)
+{
+	int ret, i;
+
+	if (aw->hwen_gpio) {
+		gpiod_set_value_cansleep(aw->hwen_gpio, 1);
+		fsleep(AW99703_HWEN_ON_DELAY_US);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(aw->init_tbl); i++) {
+		ret = regmap_update_bits(aw->regmap, aw->init_tbl[i].reg,
+					 aw->init_tbl[i].mask,
+					 aw->init_tbl[i].val);
+		if (ret) {
+			dev_err(aw->dev, "failed to write init data: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const char * const aw99703_flags1_names[] = {
+	"over-temperature", "boost over-current", "LED3 short", "LED2 short",
+	"LED1 short", "LED3 open", "LED2 open", "LED1 open",
+};
+
+static const char * const aw99703_flags2_names[] = {
+	[5] = "flash timeout", [6] = "UVLO", [7] = "boost over-voltage",
+};
+
+static void aw99703_check_faults(struct aw99703_device *aw)
+{
+	unsigned int f1, f2;
+	unsigned long flags;
+	int bit;
+
+	if (regmap_read(aw->regmap, AW99703_REG_FLAGS1, &f1) ||
+	    regmap_read(aw->regmap, AW99703_REG_FLAGS2, &f2))
+		return;
+
+	flags = f1;
+	for_each_set_bit(bit, &flags, 8)
+		dev_warn_ratelimited(aw->dev, "fault: %s\n",
+				     aw99703_flags1_names[bit]);
+
+	flags = f2 & AW99703_FLAGS2_MASK;
+	for_each_set_bit(bit, &flags, 8)
+		dev_warn_ratelimited(aw->dev, "fault: %s\n",
+				     aw99703_flags2_names[bit]);
+}
+
+static int aw99703_update_brightness(struct aw99703_device *aw, u32 brt)
+{
+	bool enable = !!brt;
+	int ret;
+
+	ret = regmap_write(aw->regmap, AW99703_REG_LEDLSB,
+			   brt & AW99703_BRT_LSB_MASK);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(aw->regmap, AW99703_REG_LEDMSB, brt >> 3);
+	if (ret)
+		return ret;
+
+	if (aw->bl_enable == enable)
+		return 0;
+
+	ret = regmap_update_bits(aw->regmap, AW99703_REG_MODE,
+				 AW99703_WORKMODE_MASK,
+				 enable ? AW99703_WORKMODE_BACKLIGHT :
+					  AW99703_WORKMODE_STANDBY);
+	if (ret) {
+		dev_err(aw->dev, "failed to %s backlight: %d\n",
+			enable ? "enable" : "disable", ret);
+		return ret;
+	}
+
+	aw->bl_enable = enable;
+	if (enable)
+		aw99703_check_faults(aw);
+
+	return 0;
+}
+
+static int aw99703_bl_update_status(struct backlight_device *bl)
+{
+	struct aw99703_device *aw = bl_get_data(bl);
+
+	return aw99703_update_brightness(aw, backlight_get_brightness(bl));
+}
+
+static const struct backlight_ops aw99703_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = aw99703_bl_update_status,
+};
+
+static int aw99703_chip_id_read(struct aw99703_device *aw)
+{
+	unsigned int val = 0;
+	int ret = 0, i;
+
+	for (i = 0; i < AW99703_ID_RETRIES; i++) {
+		ret = regmap_read(aw->regmap, AW99703_REG_ID, &val);
+		if (!ret && val == AW99703_ID)
+			return 0;
+		fsleep(2000);
+	}
+
+	if (!ret)
+		dev_err(aw->dev, "unexpected chip id 0x%02x\n", val);
+
+	return ret ? ret : -ENODEV;
+}
+
+/*
+ * If the bootloader left the backlight on, start from its level so the
+ * handover doesn't flash the panel.
+ */
+static void aw99703_read_boot_brightness(struct aw99703_device *aw,
+					 struct backlight_properties *props)
+{
+	unsigned int mode, lsb, msb, brt;
+
+	if (regmap_read(aw->regmap, AW99703_REG_MODE, &mode) ||
+	    FIELD_GET(AW99703_WORKMODE_MASK, mode) != AW99703_WORKMODE_BACKLIGHT)
+		return;
+
+	if (regmap_read(aw->regmap, AW99703_REG_LEDLSB, &lsb) ||
+	    regmap_read(aw->regmap, AW99703_REG_LEDMSB, &msb))
+		return;
+
+	brt = (msb << 3) | (lsb & AW99703_BRT_LSB_MASK);
+	if (brt && brt <= props->max_brightness) {
+		props->brightness = brt;
+		aw->bl_enable = true;
+	}
+}
+
+static void aw99703_power_off(void *data)
+{
+	struct aw99703_device *aw = data;
+
+	aw99703_update_brightness(aw, 0);
+	gpiod_set_value_cansleep(aw->hwen_gpio, 0);
+}
+
+static int aw99703_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct backlight_properties props = {};
+	struct aw99703_device *aw;
+	int ret;
+
+	aw = devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
+	if (!aw)
+		return -ENOMEM;
+
+	aw->dev = dev;
+	i2c_set_clientdata(client, aw);
+
+	aw->regmap = devm_regmap_init_i2c(client, &aw99703_regmap_config);
+	if (IS_ERR(aw->regmap))
+		return dev_err_probe(dev, PTR_ERR(aw->regmap),
+				     "failed to init regmap\n");
+
+	aw->hwen_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_ASIS);
+	if (IS_ERR(aw->hwen_gpio))
+		return dev_err_probe(dev, PTR_ERR(aw->hwen_gpio),
+				     "failed to get enable gpio\n");
+	if (aw->hwen_gpio) {
+		ret = gpiod_direction_output(aw->hwen_gpio, 1);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to drive enable gpio\n");
+		fsleep(AW99703_HWEN_ON_DELAY_US);
+	}
+
+	ret = aw99703_chip_id_read(aw);
+	if (ret)
+		return dev_err_probe(dev, ret, "chip id check failed\n");
+
+	props.type = BACKLIGHT_RAW;
+	aw99703_dt_parse(aw, &props);
+	aw99703_read_boot_brightness(aw, &props);
+
+	ret = aw99703_hw_init(aw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize chip\n");
+
+	ret = devm_add_action_or_reset(dev, aw99703_power_off, aw);
+	if (ret)
+		return ret;
+
+	aw->bl_dev = devm_backlight_device_register(dev, "aw99703-backlight",
+						    dev, aw, &aw99703_bl_ops,
+						    &props);
+	if (IS_ERR(aw->bl_dev))
+		return dev_err_probe(dev, PTR_ERR(aw->bl_dev),
+				     "failed to register backlight\n");
+
+	return backlight_update_status(aw->bl_dev);
+}
+
+static void aw99703_shutdown(struct i2c_client *client)
+{
+	aw99703_power_off(i2c_get_clientdata(client));
+}
+
+static int aw99703_suspend(struct device *dev)
+{
+	struct aw99703_device *aw = dev_get_drvdata(dev);
+
+	if (aw->hwen_gpio) {
+		gpiod_set_value_cansleep(aw->hwen_gpio, 0);
+		aw->bl_enable = false;
+	}
+
+	return 0;
+}
+
+static int aw99703_resume(struct device *dev)
+{
+	struct aw99703_device *aw = dev_get_drvdata(dev);
+
+	return aw99703_hw_init(aw);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(aw99703_pm_ops, aw99703_suspend,
+				aw99703_resume);
+
+static const struct i2c_device_id aw99703_ids[] = {
+	{ "aw99703" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, aw99703_ids);
+
+static const struct of_device_id aw99703_match_table[] = {
+	{ .compatible = "awinic,aw99703" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aw99703_match_table);
+
+static struct i2c_driver aw99703_i2c_driver = {
+	.probe = aw99703_probe,
+	.shutdown = aw99703_shutdown,
+	.id_table = aw99703_ids,
+	.driver = {
+		.name = "aw99703",
+		.of_match_table = aw99703_match_table,
+		.pm = pm_sleep_ptr(&aw99703_pm_ops),
+	},
+};
+module_i2c_driver(aw99703_i2c_driver);
+
+MODULE_AUTHOR("Luka Panio <lukapanio@gmail.com>");
+MODULE_DESCRIPTION("AWINIC AW99703 Backlight Driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

