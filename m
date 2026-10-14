Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A707279DC3
	for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2026 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979997; cv=none; b=fDN8Ks2QaA/68CahymvgoD8Utjx82PT038jogcPXPc2hZSeGSjFsB3hvooknm6NAdI3oi5WeKgj3mkUKKYn8jptFCjc7AdgkooooiFXMZKKTAAJs8K7GGyWfZqP9eP3V0X+JmuswapSnKdQpsmTxyNX709Hga6QtrNh2DzaosFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979997; c=relaxed/simple;
	bh=9OsGp6MbSHvjE+muNEP4p1TUnXdoyedGt8UY6i3iUCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JC1HehszCaFDxkYBmmIWuoAjQFuRITzpCG03YwHPYlnuFR/SFPSmTfsRdHDEQt2rWOJX1x1vn2X7kzzI3jmVmDQIAyDGUFDhZR8Ngm7WByjdEM+3q5Pw2dum2ziiHwCZvkYUY20O94w+Y15Qq3o7nDjF7PS0WPj0hXjCq8vfQ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHKg4eQo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHKg4eQo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso31515045e9.0
        for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2026 05:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979993; x=1792584793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WruczPkazS4ZUlcOrN4t2XFu86i7R3FFqgwfWNzE8vs=;
        b=kHKg4eQomsybwJQNUYUx/ZiNUD8dnllrypAn6egukhq/I5cxwVEtR67mf/LVOnzIu0
         Dhn0L45h9eyOCr0K9cqUtHI19pO8P+xDGcDzBPoDCmjaM9gN5vgBsGtB4JUUOIXml4ea
         s7hkYKlDhFRIyrMm7pOayW/AgK4THaK6dfXQIovADdMGcrFtJ/gA4g3fPHJfSNA0G/K5
         kaj4xrv77h5auCZcVd60e7fYkIZOHJvnopj28fFMYgJWJcgr+quxEzsXlBZkbLhBeDeS
         IWx5zW5kfWQWKWrgRAbEW69aClCBRttAyADrF9sRo0qnuCF+aFF3dLpXFXAL4SHfeTRm
         uJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979993; x=1792584793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WruczPkazS4ZUlcOrN4t2XFu86i7R3FFqgwfWNzE8vs=;
        b=O0q92Wp8+eV3ibC2TjLCd0KoMrym+EltkD8YuzJlsHccdBJpLayXyUtw6Ee1wpQWK5
         C4Gu02bK2rcP/HjV9MK20Bc8HAIYhSYIFdJZlWFRiNnNbSTW4u9hOotYBzGbQfQyfZkD
         wx5NtMrccy7LtdiSc0wYfOWZ6u+mhT4F/poy4jxHGKhNp/kpPiHo2MoFocifQKstG5m4
         fUIF9yOwtwXwc4WeUaNxJ8MwCoT37poKLMq6CG+PkDH52Ze5rVApSW0cSDXduY9y7BL6
         mxUDaSGKrdTo29b6QFHGPqYyN6z0f1hHWTBYHqJdqYoxnYIuTYA2TbsG4/4ZMIjgjRRn
         fKUw==
X-Forwarded-Encrypted: i=1; AKwUvBwwyIXvWUPGfxMW6sjvJcReo0dQUmmFg5RtcrVjF8Pzc0jyy+taJcOlrmrZsQxvEPqb3PBX5zaE1znr@vger.kernel.org
X-Gm-Message-State: AFq9FYIUSD3IVLvg1PaRq2fwBSoG03ssetzmfgIOQhUICPQW/ErnPy/D
	wdYm2H9HzTviGj5hGAj28xv3Rp/rP+lO+EJXM8/5bb3zYY+JxGIyExem
X-Gm-Gg: AYBFou3OIB5GCmJLdctq+QuK1pWeipHo66J2EhDz25W/iE2/lJy0Gkl+bAH70evCCET
	KUDl4E9WfKkqqc3NRP17QD6IanvJeBLQcPphU1b9uktNcqfqhpxhHLuMtcTad4YAH9jMPK+QJpi
	mRjTLpJz1Rd3om2X3+rqYVPOx12BsVEvRcmnAw96Cl9Feh+GOrnOOvwQMDiz7IHwc3vFc82TRaj
	SoiZgQDJJucYzP50/0WUcQZa9aY7wBIltUk1XJJ7rABZrx9VTRmOySX0tAP+l6gbdCE7j5+ticG
	EQUsYIqob2F2w8MaPH4qXRpN5Ti9RldnaJddWtriGDjVN6JkhfANX/rH8xIZLbVqM2E1MN5+VY9
	K0Yv0DVr7UPgb9Q3gze8A66sD5sciYmGfEu4B1rgmIDGr1FcwXXdwQ6ZjTC/qfGVCSlLyhWSdTx
	Hw9zZr76hFNpl7vUiq0wj1WtT4w1TSyr253lj8FUDRXop0KRfWb8jSKK2XYicFsFDjil82H4le8
	Oxh2tIFrLdH3AiC+yw=
X-Received: by 2002:a05:600c:58d3:b0:4a1:9388:7f40 with SMTP id 5b1f17b1804b1-4a193888295mr193224775e9.4.1791979993424;
        Wed, 14 Oct 2026 05:13:13 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm11420985f8f.48.2026.10.14.05.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:13:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/1 RESEND] leds: Add driver for MAX8907 LED cell
Date: Wed, 14 Oct 2026 15:12:53 +0300
Message-ID: <20261014121253.133467-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014121253.133467-1-clamor95@gmail.com>
References: <20261014121253.133467-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 59445bbf2140a..ff00ecf5d858d 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -813,6 +813,13 @@ config LEDS_MAX77705
 	help
 	  LED driver for MAX77705 PMIC from Maxim Integrated.
 
+config LEDS_MAX8907
+	tristate "LED support for MAX8907 PMIC"
+	depends on LEDS_CLASS && MFD_MAX8907
+	help
+	  This option enables support for on-chip LED drivers on
+	  MAXIM MAX8907 PMIC.
+
 config LEDS_MAX8997
 	tristate "LED support for MAX8997 PMIC"
 	depends on LEDS_CLASS && MFD_MAX8997
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index ed3fbf2aa2d2d..b9e815b2416d2 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
+obj-$(CONFIG_LEDS_MAX8907)		+= leds-max8907.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
new file mode 100644
index 0000000000000..358505a1c799f
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct max8907_led_data {
+	struct max8907 *max8907;
+	struct regmap *regmap;
+	struct led_classdev cdev;
+};
+
+static enum led_brightness max8907_led_get_brightness(struct led_classdev *cdev)
+{
+	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
+	unsigned int brightness_lvl;
+	int ret;
+
+	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &brightness_lvl);
+	if (ret)
+		return LED_OFF;
+
+	return brightness_lvl;
+}
+
+static int max8907_led_set_brightness(struct led_classdev *cdev,
+				      enum led_brightness brightness)
+{
+	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
+	int brightness_lvl, ret;
+
+	brightness_lvl = clamp(brightness, LED_OFF, LED_FULL);
+
+	if (brightness_lvl) {
+		ret = regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL, brightness_lvl);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL,
+				  LED_ON, brightness_lvl ? LED_ON : LED_OFF);
+}
+
+static int max8907_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct max8907_led_data *ddata;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->max8907 = max8907;
+	ddata->regmap = max8907->regmap_gen;
+
+	platform_set_drvdata(pdev, ddata);
+
+	ddata->cdev.brightness = LED_OFF;
+	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
+	ddata->cdev.max_brightness = LED_FULL;
+	ddata->cdev.name = dev_name(dev);
+
+	ddata->cdev.brightness_get = max8907_led_get_brightness;
+	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
+
+	return devm_led_classdev_register(dev->parent, &ddata->cdev);
+}
+
+static struct platform_driver max8907_led_driver = {
+	.driver.name = "max8907-leds",
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index a8cb2071aa7f4..b4562ec0ce18f 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -21,6 +21,7 @@
 
 static const struct mfd_cell max8907_cells[] = {
 	{ .name = "max8907-adc", },
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index d960dfdd808ba..15901a1b07424 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -112,7 +112,7 @@
 #define MAX8907_REG_CHG_IRQ2_MASK	0x81
 #define MAX8907_REG_CHG_STAT		0x82
 #define MAX8907_REG_WLED_MODE_CNTL	0x84
-#define MAX8907_REG_ILED_CNTL		0x84
+#define MAX8907_REG_WLED_CNTL		0x85
 #define MAX8907_REG_II1RR		0x8E
 #define MAX8907_REG_II2RR		0x8F
 #define MAX8907_REG_LDOCTL20		0x9C
-- 
2.53.0

