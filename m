Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101823;
	b=L4ENGCyMQxW+3989aDtdzwhKVKXMz5sZNV0kPbG8bohYLKc+AmA7gcAi9EviWVXD8eOF
	 GOkKNZPo/j1ymhrKOGE4BE9JRb8ilKSvux3zV26rlYbLa5nsQpJeMeLERkPM0ashRb8mL
	 wE3PfZg27Qf9Oq52fJmqVBwR/zUVPr4j1jwjZxJ6ytj5k6IIig/rK/B7JadNVBfzg5/tW
	 re3W+PnX7hz+E0/ImqTrk3gTTDcs9bzgLKmPl2XZaxgzeafsq3tcJoung4CcR28sKs4WK
	 9dqMSy6sMfu21walCCIYDLg8YbKrXHsnNBKRtr6VRqV2Pn9gdNW9QwXkzyNyF4vcxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
	b=O90HY4TnAqIcfHi64grx9R6A70N8QyKUvlQcx6w83w6ZnXJFR4dSClIIYDL0fAzfXcMJ
	 QC9PZKtZaVRsujY/FXZusFCjUtQDCb3IUEnnrKl17iEjwb8ACMXGTSRU4Pu4XFVGy8HqW
	 tNuwrd1Bhw1YreliVBrHH+2XFZrnuBkzSf7bAAr9SP5IhaS48wcjgKhDekUWmajXsJGZf
	 zFPdoQqBg6MJopfL4ikRDFut74vlV8T4d1FlWwZucZRQitGmkUwcLpVrHsN/8ksPDDpyR
	 OcO7Lwphz6hC30wDJD2TfvgoTK/I9BDa4yUhsy8hcmuPe3zsHq6JKkUPLq8wQPLYQ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kXHZsWY+;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ADA60A2604
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1ADA60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kXHZsWY+
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so6616264a12.3
        for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101821; x=1793706621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
        b=kXHZsWY+kj5TIkoh0WfAKdmLDDDygaaLWHTz59vgUxqBU9XqHLGSyEeOBVT0NpCOKY
         6Sl+XY1VOTVXvhH2ASUBjs1oftKHDBzZ/06o91nJDfxTaynx5PfrqLLaSZ7Ckuc71E+H
         4b0VBy+ot0p8pAoqBY8c0D48W9BKo1UaSfVB43SbJD0NNmUH7SGwEkFRJ8oWeDkwaQJ5
         RNfmQ+W1L32TvQ7CaKQG1QgeRM4rnlf3XqT3sTkwQf6mMZ8UWDGYopnQuneWvOxFdYok
         bM0htyZZ3hia2laFJLaWjLNczXgfVpJDN0BX7rVIbnpK++/vDoQYdtlob+FI2NUSv5g3
         sTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101821; x=1793706621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
        b=hXpZQegGX7a1LVLfwC8J8JKcjaKoDQkd9FYipdgJ+vChmN3VRPf/7tUXX0xoslsez4
         PrHVBjvTZKpeAExlwEHh795WbyqkSGXmkxoA1yg3+6xboPcKaDKyKOu0X2toeN4OaduF
         TfypS89k/R3qWQ4eiSsK4KiYz6A1difbrtmnsQDZYe1tmZK9KRP1Jg6+wsctlbeuhh8z
         eU7fXsfwKih60v4LNaxVQZlYrEfvMQlAnuRAJBi8K6ZMHREE32K1m12JQQsi2Y0yxtxH
         jux2uwJIhTn8mI4YLDjqV+6ASDfkn0z1dWukbWvXb+zh1JoD2xeNxOROtCeYQvS0nBBD
         KvPg==
X-Forwarded-Encrypted: i=1; AKwUvBz0TRqjV9rh4Llq8iBbKqxKlmr6VeITU/cRuPqW2dsapg0c2OYP9zft1uJ0GSPlLbTmTGqMCgr2kUmj@vger.kernel.org
X-Gm-Message-State: AFq9FYKrm3Bks4YeUb7bh3tDRHbv7oFsRTWrjS8DD1MFPgyJXiRm5/Dy
	JiwVYHXJCYGy+kkI4RoDdWRrC/a9lx9Hig8aeEqkouIp77ZjTzyTkjtA
X-Gm-Gg: AYBFou1Z/OmpxEmhwLSKlfjfd1D6eHLijIGLI1/OUz1DGB1IRNqRw6HESZm2CKqYhgU
	WepA7I4axWIEadkGZQgx2+QKnIERewgN+vpLy/MdqwGZM3bPmqqON6c5Okxer/rqQAvmB9hPLGy
	2q29aeVT1wAhcVmBO4ECpdZjiz4BkFMCTHtwEpgnjijry41bfjf+5bpR+8LwCFXh3m/mS/YnhoW
	ME97EWBUt7vICXtliN6zHnPjSaROi3I5oCMJosUsgV3ZEU5h7dRk5GABKyVSh1W6Ml59QOFtt7k
	YRVgnYr9sA6fauumYAWd+ybiyM+v4Tq2HFK5WxySAAq4MWS4jwFhpaXkgbCAoveIeNi0iH9pHGA
	mg2Kc7L2pb55WI1h23gOYHSIeuGFa4qml+dLxYG4Gc7Q5Ct7cgoD1SNX8SzOcH9mWBRV+0YuRGf
	B5uFKw1QcvnWxYV/VsOpL0a2GOROJTndAkBEDj7wL7eXnuuA+S7tdtEzWMwA+qf8U9e1FImANFP
	3jlZ1zUNrDvBm3tWc9aj1eQrdWVF9Z6RER34pI/VhUz/HfkKVTHoKtw9lm5R/4c1z0jM1rZThdQ
X-Received: by 2002:a05:6402:1945:b0:6b3:f7f6:649e with SMTP id 4fb4d7f45d1cf-6b44311a75emr9097597a12.7.1793101821159;
        Tue, 27 Oct 2026 04:50:21 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4958652a12.19.2026.10.27.04.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4] leds: Add driver for MAX8907 LED cell
Date: Tue, 27 Oct 2026 13:50:06 +0200
Message-ID: <20261027115006.86032-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
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

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS
---
 drivers/leds/Kconfig        |  7 +++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 100 insertions(+), 1 deletion(-)
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
index 0000000000000..a5c445f75d1b1
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,90 @@
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
+	init_data.fwnode = dev_fwnode(dev->parent);
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
+MODULE_ALIAS("platform:max8907-leds");
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index e282dd82ece69..826d7768fd8d0 100644
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

