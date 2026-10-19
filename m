Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2E548FF72
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405219; cv=none; b=b/XWbvwboODIurdvVnCXSjnxuyty3rBn9qdCFA8QNJ3Sy4TsTv1KQryfHVksUxRfKeT/XzH2tuSk+Vm5tYE2IPJGXXXItvSYwvbrxSw3QV3I6QmdBA9EzZ0PZGYsYyIuqekMnL3eHpWRjS6Pxxd+eZ6nx1hyWEaJaMZIG7fYEvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405219; c=relaxed/simple;
	bh=iFTelZR/fM6F4ON/hFI0VUi+K/9N9/4nqgaalnqwzdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T1/0X1ctoqcIld4t5bdv05/tqbIJ8REJ7S7iW2QS/MKacBskxbygFZOryuTvG62vGTqwJYzOX2ZCRMef4258RWeBMLDIfO/jeNJ924qS5Pb8CqRbr3/uK8OQ5C3hSjmvs+z9c+uhdKEvWQr499dtDUgdWqluKCFFsAHTAZ6Y77M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIUYhx1B; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIUYhx1B"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df54150dfso1427689f8f.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405216; x=1793010016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+VtaEFlyrBkdNO0nsT9Fm1xsP8BTwSkFBjYFN2kHRI=;
        b=TIUYhx1B8daRM30fGwQIxO51j4GfwD2pnTbJ2J853pQMvwXe/bkKxA4U27vpVm/ucg
         dCl7SlVUnRiAAQ3TbEadrsg6cBGIejjZSzWBkTWkjOlezeqANrfrypnQtGjSE2SvUj7u
         iVXKPbIu4Su7izmoXLXCV6EyzF9wdAXT6vHk96IlsOtyvTj+PMjsDdlYr6nwvgUdHtru
         SYxpkDihZrNAfo6hF2puz2XJnbEU1BQT/X+lOCKBJSnNSo1wAcCusQBiz7qQ7S76TMm4
         rvhMUE7W0w/E3KY5PhVME3wXyosff0La54Iv4Bu08uhr8BzfnrAbyXrLONB9qNr0KMD6
         2NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405216; x=1793010016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+VtaEFlyrBkdNO0nsT9Fm1xsP8BTwSkFBjYFN2kHRI=;
        b=bHnZeuQ79cr8AE7sQXx5UHw+vxG6FyWkNbFLwMhjllTbhnewulE2Liywfx4IFOunV/
         B4Y3IZNmvpyUgm51W27VibI6pZM2VcgtOHaG3NmRE1p0P45kJ6zy7AFGr40tjlkI3SfR
         4OLk6UZYo3k8frdmm8HBPhECJ7I6dt1cid3eTZ/KstrzPYHlULRAg/3nr0r1QKkTtds7
         4fRuaGtM0CITbz5KdC2aKgi4vklxB8g22Cn8ksenWihbIqwlwhtoL45PsSz8FAjQQiFM
         43u+qtDyqUV81YOChxfWe5oK7Oq/3hDx6TSTDe1oBDUQ8fTJ4lww9zkUngISAeT2dAn7
         mK4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzw58SVDwxWunhgaoQLrLQyOP0UQsgBEi1zLhSxjafLbVaxLDVcyQYkPCrTXGDphbeuApQp4QJP5Tyq@vger.kernel.org
X-Gm-Message-State: AFq9FYI9uMIH56xl5HjO3B4PyQd4XGt5iMpllVCdtB7T8Wlaw3nxCliv
	cApaayGJqKWzz20KCmdInEfTZR5OArqeX3t5tfiprY8ybxGlhVxZMlZp
X-Gm-Gg: AYBFou03ZLtGqM9AH9LlGFEyFYQWmwMta5k/2LCUXRf/Aim6Nis5Th03U0XyEiwCVEQ
	IMpl7W7N0ysF/FGjN2QnIg/vwFGbTerYmRoMK7Vbh0wKGM1coLqcssSjFnxEiTOuqMEOzDaQhLG
	O9Me07+7Ur/O7H8HExMrS8TEfNQYf5UlAbnhoWfiQwoXndyByAKjd7SSfy//xGCa9+kEiTfy0eS
	+Q7KtwRMd+xaCY2wm7w4ixXh3+ArqCjRCfTn1XNZIb4FEMjur5fRPwue7TNTJbdcVciIcKsnZl2
	Db33aEonAnDGA505kV55e5FaDCJfY1vOFnmTvveYZyLQdUcjpCJYqbDLYigWRtoMJcJTbRw00FD
	I5DRIK8kSCGvMb4lgzAzHYw2hfRtJfnow5Oa2hAGWz98RVrz2CH38Or4SKExlLEl5KAKwZ3Wt7R
	19QYvUtVgq7tiuD1fFM7B5DxEPYUZ79AvUHo5fK2GgfKTzqcE6rWSTNCw0ZrTSVLofqAUQslNLZ
	e4k2zVxXdxpfNMd7/c=
X-Received: by 2002:a05:6000:4552:b0:48a:fd58:a7dc with SMTP id ffacd0b85a97d-48e07baf68amr9685152f8f.12.1792405215817;
        Mon, 19 Oct 2026 03:20:15 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4feb6bsm23931792f8f.41.2026.10.19.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3] leds: Add driver for MAX8907 LED cell
Date: Mon, 19 Oct 2026 13:20:07 +0300
Message-ID: <20261019102007.131375-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext
---
 drivers/leds/Kconfig        |  7 +++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 92 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 788e689fe875c..3796c562919fe 100644
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
index 3da746279bb81..24efda3fbaa44 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
+obj-$(CONFIG_LEDS_MAX8907)		+= leds-max8907.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
new file mode 100644
index 0000000000000..c3bd131800a8c
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_REG_WLED_MODE_ON	BIT(0)
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
+	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &brightness_lvl);
+	if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
+		return LED_OFF;
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
+				  MAX8907_REG_WLED_MODE_ON,
+				  brightness_lvl ? MAX8907_REG_WLED_MODE_ON : 0);
+}
+
+static int max8907_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct led_init_data init_data = { };
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
+	init_data.fwnode = dev_fwnode(dev->parent);
+	init_data.devicename = dev_name(dev);
+
+	ddata->cdev.brightness = LED_OFF;
+	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
+	ddata->cdev.max_brightness = LED_FULL;
+
+	ddata->cdev.brightness_get = max8907_led_get_brightness;
+	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
+
+	return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_data);
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
index 6d5e6a1556fd5..9f737ad7eb398 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..35b2ede54f856 100644
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

