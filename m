Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150862;
	b=l5E/Y6gAMFkc6lr/IjCLWgVpo8q9gC8lWdxxKgcuyGqUm9G2PMtHK4O3HqSRkUoQdIXA
	 IyTyXsXis4zE8DzFGdGqTbCK/ldyB0Czztz9nVg4NehPpUbiBoiG8H9WgLx2itNevyltW
	 N38knkWY9I51PAFS1Dtj1vQ9MpRyYfsFoccfPnQY1Ix7MMTeHhTVox0RfS8BQFoCEhN/Y
	 H4vK8SzJvAMehYyYjKZLhsmhVO3qDsWuhqkidKNKdhRIMAt3U5xR/s0/hBffdBsgri6hU
	 SlwLM8gxtEssj1v/mLXJeqDC+VWdePEXWxXIrEJAi2QPSdlFCh8v9pjseDt3c4i8Jww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
	b=rBoTR8EX6Edl+qobgk+ur3IaH2jvMHkflWWT1iWdSDdfWt25boG8wY1Ou4i8jPTTbqh4
	 FwWPkVG+wHXJtaOgGlPOC/0705I1diNFbv4yjPNxttXxGQ9VuL7FEAn6XhB6UAV8nWuZe
	 hS7qHpSUZnDKSeb1O/N952mTUlP6ljX9KzSLCLqoB7imN1vYFSPBlbyIGhXaoR0xPaLxx
	 TBh/CDCZVR++vxUCA5n6hAr5h14zIedyzWK1jcRHO1BEubJRbF1nsqyZ2gQwRcED3Z0M6
	 +s6NUuGOLI1FfaZiKEibKmkCxIOpokKU9QLhV3AUpiLju/dDWDK0tMmry7Hdpzvt4RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jCDCRLM;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338B606A323
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 15:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3338B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jCDCRLM
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4ceaee6770so17810066b.0
        for <linux-leds@vger.kernel.org>; Sun, 08 Nov 2026 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150854; x=1794755654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
        b=0jCDCRLMKln027NFtBCDUX9Nk3mKuhWrKQz2oC2tzqubtlZAnb+Ls2YiGiG0EQPSXC
         GK6PsG1Lt72qXpPuNlOdkg2oMXzI1nGxD6LRzLNL1logBe0mRXVNMfDZhwhBFpOj9pUb
         NeMNWRFO1oDUGJOUgx8Rpy7g/s1sctXllDTo0lMKPwqX/g6rHeXf25OTmMejF+8ZAHgQ
         BdvnrKWGSYQaXLWT/ZvPCb2Hc5dUUCl9Qxixf+Ccm/7WhrCAr+nc3zjAv1HXyebbdYmt
         5scVW3h80wS8dsdMdnR1yFx9WT6bcUcMy2vSdBnGLWWcks54m0Vdq5AUl8IJBtU68aFR
         EC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150854; x=1794755654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
        b=HsSdmicGfjN8+KE2HH3FT7X2uNV/2p6UjX2iCMmdVJIoCmpXckdgY3yQxpTne91Jmq
         m3MQEwx+ehfj5eOQtjIRB6z3YceyoKu8cggd4ze9+u78T4g4KU/ehaWS4LTcn7IVqBGc
         h7O0rr2DeW+ArM4aI7YxTxOcK6ZQ2ZD/yH+DT6gC9tl6K+HW/DdKW0M1bw3IzgZfNiCa
         a0BfQ7zGTuzR6JDHRugjoDs8vBcabobOTmOOzLXAAJ67b7LBkaZRUrGnEnzYWgL8Hp22
         77iYj4v/WgCKr0ruMogvDJBYVtdfJgqnzQT8KiO+xhIfagu71dXoB7yq9jqFvBhnc56R
         MTIQ==
X-Forwarded-Encrypted: i=1; AL+hErFp2SalTBTnep0LgT0vtvtR4CgrpDm2bJY86zyPPvH5J+UaUozUdxCFn4tBDXtx4L3yOpZGrMlCypo8@vger.kernel.org
X-Gm-Message-State: APuU4Z8pj6xsBWpeo5yiD0WgI9rV2CUbmhw53lPJohAl6nloHbRT1Djp
	vRZ8XAzd2sYvyEuhKnwn3N2fqf2xVyatMyDiPcoxBybYjtMQ/34bL2P9
X-Gm-Gg: AYBFou1Vfpqqqhuw+kpZmV/MQsgHbuxTQFC9RQyLlotvbk+6vX30LAYnqQg0oRR8bwB
	q0n2V+yTjbBLHbE9HxeZK+FCwZNIdf5rvLh2Cc3ZnQ8WJia+CWzf8sF/ErFFFIif/K2hw3J3+Xk
	Avv6qA/Kg5pil1AZ2k33OHdzo3VYMz2x+QbyvNDAGc1PUk3FEbAGMJAoILcuOnRBnTSz/MGrMc6
	KikeUfYXA8qrJ9X/DVM8FICHAElPFqKO/+ol5wpoJ3GygGVpb6vVjUSCpeCEVwpc5QK4GbJeY7u
	hULXXoEfTMOAWi5GPjPBibIoTRr9jPwRhyVFMzZ4USHI7T7xK/2QLTNA7ekLgHbCvcjvIubVKcd
	HQJaaXBO0pFXTb1vLXaDSKYlybhsfpY4Xi7o0manaAgTo+qcG+2e/1ftHoVKZsLvSjVBmz80oSX
	M1G31AbQjqAtepc6nLTGbIZ1WoQ4ebcsCrSgV93QOAenTPxS6+cRmlSsLhMdgPJI1ujSXIJ0/30
	+EmSYNZu5OK4rznvd8t0nSxa9iq2rOvwydqasbv9fhZsAULMyYk4OY91rXacOuAh2qWwoMuV/US
	ZnZLw6NKHurI8GuE5WpjUxZVuJJx1N7lAAId662CJtf/QNtzT1NuZ4Kk0RbtIKdYqsTeIZxM32d
	6P/dMrJiNYw==
X-Received: by 2002:a17:907:5ce:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c4d6db1f141mr151964566b.19.1794150854401;
        Sun, 08 Nov 2026 07:14:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 2/3] leds: Add driver for MAX8907 LED cell
Date: Sun,  8 Nov 2026 17:13:47 +0200
Message-ID: <20261108151348.204182-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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
The LED node is a child of the PMIC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/Kconfig        | 10 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 99 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max8907.h |  2 +-
 4 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 788e689fe875c..d4e0f514bd667 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -813,6 +813,16 @@ config LEDS_MAX77705
 	help
 	  LED driver for MAX77705 PMIC from Maxim Integrated.
 
+config LEDS_MAX8907
+	tristate "LED support for MAX8907 PMIC"
+	depends on LEDS_CLASS && MFD_MAX8907
+	help
+	  This option enables support for on-chip LED drivers on
+	  MAXIM MAX8907 PMIC.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-max8907.
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
index 0000000000000..795b35390b039
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_REG_WLED_MODE_ON	BIT(0)
+
+struct max8907_led_data {
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
+	struct device_node *led_np __free(device_node) =
+		of_get_available_child_by_name(dev_of_node(dev->parent), "led");
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct led_init_data init_data = { };
+	struct max8907_led_data *ddata;
+
+	if (!led_np)
+		return -ENODEV;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->regmap = max8907->regmap_gen;
+
+	init_data.fwnode = of_fwnode_handle(led_np);
+	init_data.devicename = "max8907";
+	init_data.default_label = ":wled";
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
+	.driver = {
+		.name = "max8907-leds",
+	},
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_ALIAS("platform:max8907-leds");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
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

