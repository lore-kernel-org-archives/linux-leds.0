Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDE153F690
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082837; cv=none; b=GQLDfWRCrU5JseljrLu3eAiIP48RDaED0LjGiBwer1yfH57klXsNwciV+J9HCnRagk1xvgQjjpqenpzOm1IN7FMqvX9qU2PuHzTnTOhdQPbPNY/KeZr9NzQ1v1QRw0261rSCtJnODwdqkuOuJDTIWvOEQTJ4KYPtBHs7rpbL9qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082837; c=relaxed/simple;
	bh=UVkLFT/iCNBYM+zZuBoiPE7e9ayV+mTZppqPDWCEcbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRg4zkO5G1xNYfTVjDvy649hE64uBPihYiHAqIkJXZ9TNQAk+eKGzxGZ30my6c8aO2Uzg8Mk8rLYkHGLrqMCxVf8S5OxON+EHeZliHGsp/45El83fGNt9dwgMxJL5yaOGCh8Wyg+wXAKxWmVi81oaECiZxLRAEbYvcXndSRT+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYQuOaLl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYQuOaLl"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-487049569b6so3857019f8f.1
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792082822; x=1792687622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehnaBlhbeGX+36y2twAo3wrCg2vlEmltEl+fRRTFHPs=;
        b=SYQuOaLlfUmFTCD4uugosnodqNXtl+YIVPvZKu/nXXDfkKXwZ1R7cKtALyhtBqbRzQ
         GPfShfuUdc57OxnSL7Z8RiNP/3y8Nf/G2qJs4ZSrwqFXzBkreTGqo0Ze+nOTa8sDfu6K
         e8mn9PuKpIPqEooUjnMlwftkdn3+efAOfBpHdExFZj0pI9N1NbkLikvnBXJoAZ3+Rjzr
         EXYgpDbQ4/2X44/8QEaqfLRhguMeHpXjf19iH9m6/1mf+NKxk8pxtT+b4nemtldoXDEA
         acQUzF7JFwwLVWqV7LasPzBZYu2B7bSChnydVhlXwJO1k19RGfF1/sez+0p3Q4qZurpz
         bs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082822; x=1792687622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehnaBlhbeGX+36y2twAo3wrCg2vlEmltEl+fRRTFHPs=;
        b=J+wGl5KgFE82E0pkE2rDuN+23SHW6486UYbHHGha1gQs8PGBS/hnJSVleExP8z1GDN
         iZQRWPbW3YQWT3HOfnyqlTsfdrEGG80TsJWsuhmG29Al8gO44+n+pBYO45e2TMLZjCSN
         Emeo2qLJm2KcQ54q0095niGOxUjcol1hqosjgvd+C4UwURihNb5bpGOtzyMtfhhSdWcB
         1e+hOfNlYwMvRFpUEMvav6mVzgZIHKy3zB8NhqPSlpJVoGwQN2aNPG6CEffcGlSD4snf
         O/g3K488DmSXJ04AjwBqU6JVnL+fiY6IakWcFPYykI+ZlP1CKPHW11HKCyrB6ulGUEJG
         M0Eg==
X-Forwarded-Encrypted: i=1; AKwUvByn4gcY0dEQvZpSWokDtYWq50+ZtGKib8sZSE8WZgbAL7pwniS2656rfrjVGRGSmnsP5g43bBf8WuKm@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1iGT0RPDObVIhRL30QAdELaHSav5KgUnkkM2qpmXiRBHdxmv+
	5zrejZ4lD3p79rEYwzrn8/1T8IeOOklctn56bhCg5zmKX+T0BGg9eEcb
X-Gm-Gg: AYBFou0AIboaJX2PsKRuf/+F1wKp4bNH8wNAwGzB7G1pV8BTqa9kDPX3GV9YwDwE02B
	X7RPrC0JqxbPhg7/15I7ehiDcFz63TZ7to2UDTNaVdXEFuAyH3GZSGk0MQSH9Km4tE/KBgdrNVy
	Kw9vdPGczWe40mSyoG8tTIuCac2PwbDjoU9NS1V5h/ZA/DPT9u2NAzrYZ3fYfxyPgdJo2Jpr4+I
	jDyGTwNupAsfCG8at3apwkLgUobMUxEPGamaXEK5CJ+g1ocO8Nru4/q1TlSR0rxG8ySWXEdr0hz
	/S+OIfTloX073ABF947F7rIRtJfCs3mAb9rI9fv4ixkQwPCw45RuVx4yLEshwa0Mg3Fw6/ftFHy
	v/+VviAARaKr64VfJdDk5L1d8fA+oqM71WXTV6Ec9reAma7HxwF4DtTFwybg8ACx4X3m2H6O8CI
	zZmmAJzisF+EVcy9gmDPtGo6onwjCjjuOy2WT6JtEVyaHyQwtiVu9jUGmjUc1joKpBXOy/CAo9F
	N5rw3QsZ0vw6+KzEWDi7NyXTYPYiA==
X-Received: by 2002:a05:6000:46d9:b0:48c:557d:ab24 with SMTP id ffacd0b85a97d-48dba784b8dmr26077336f8f.4.1792082822068;
        Thu, 15 Oct 2026 09:47:02 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de72d2b13sm14672251f8f.55.2026.10.15.09.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:47:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2] leds: Add driver for MAX8907 LED cell
Date: Thu, 15 Oct 2026 19:46:41 +0300
Message-ID: <20261015164641.363500-1-clamor95@gmail.com>
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
---
 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
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

