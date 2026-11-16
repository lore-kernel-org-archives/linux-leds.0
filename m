Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852502;
	b=tNpb6N15lYLp5aSySOt7oqiORGtj5JYeGTl7phBq83ILSBIzw9iJ1zPS0plhyUcqtEAj
	 5OhFS6ZlgCF47TRBwXU8adNmbJHCMe1WjUtkfr4TNVeJ7jW8EEobqoHp4s1Nbmtt5Z8e1
	 eX1EOkYuYS5mww1fFJIA6jFamR1g6p0nkel6pQRbOxh4bJ6k3VbnPFEqp3BEUzrWm1znl
	 7yrBeIB+X8Q+3x6NPdQdvwPM7cdZoAax3toNkMdwCHlvrK3zuUk2lmmFRBw094B+eQdR0
	 WaW4TggEz1NPWPFZAdmRiJvn3+oaXE5Hr6o4i17gIgiDIqiI/5hOHQ+zFyy0Z1MdZfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t92aTLgSQFgAtbZh31ucXDF90ij9OtvpoozTmZs6UUA=;
	b=DqmFW3QSMx9TXDXbpbkweOABQE05Dy/Za11u9D2pwRbwx9WDUrIBEDaLc5+KwvkRZrf+
	 96MUx4e/5qbgrDm7jaWpZGGsOd7Uf3WmAXb549b7SGRAChLCzJbQnmAxlnSoGu9it2mSd
	 oj+Q06v2lPpaQsJc8mJ3kU1DuyjxKad0vzQAfHOExtYJtpUV6D4q4VKtiaEK0axFRoVOY
	 qmrptJLKZehPqyDTGMGS/USCVjidyEM6OgE9y2tsqITnuSrXVAqQmYbt5hWosQeVQwput
	 UndfoNm6NzHcsFGvDvnMcD/5xJDx7+zrS6KqK9hGL3rd49O5BrCknAwBxXLLqwoX5Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opvy84eW;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64061606A31C
	for <linux-leds@vger.kernel.org>; Mon, 16 Nov 2026 18:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64061606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opvy84eW
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1632726f8f.2
        for <linux-leds@vger.kernel.org>; Mon, 16 Nov 2026 10:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852501; x=1795457301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t92aTLgSQFgAtbZh31ucXDF90ij9OtvpoozTmZs6UUA=;
        b=opvy84eWgM09ln+Ti/gMANDD6ipJROun+dkh7c/5GC/3H4VxqGtFQu4qPioAheU+Te
         CeR3uV4cvQb2EWNeFzaBDvVQ0AfX/vjjE5gOyOfbUVXBUw+3klb6bUuJI4YJA0ngGjPC
         FSBuizks6p4m7kv8DKGpZ2gSQYQeelqRu+6Y9V7oulQ4S0hqm7OKhhAUtDYAVd9eExim
         NUAf6fngUqnC5MvZFOW1uwELcOyxoTJi+HiLbU91GVZRcZpwjOsuyNLQezc6my5cUipe
         JGZp+KapWQzMdEvCPr/A10EgYFdedZvZJX+YEgFRf2QxealoI9ENFuWfzKYrpH6z8iU7
         gosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852501; x=1795457301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t92aTLgSQFgAtbZh31ucXDF90ij9OtvpoozTmZs6UUA=;
        b=INgv6v/yTbWNnYP60GHiWHgQocq4Fk/0G5Wg2pB0aMJNQ6IMQSiEZIcTdyxbjRQObb
         Z/BZM1UdlW4VcaOP4a36sXmYQOz7gkmFrSPFy4vrntfoM8K23MN1VrgD1almQNI3kaB5
         KiGftDUwege1Y3dQex3ySDFaEgP8O4XsWVdg8AFXORn1TckRdy9c8Efxq8O9F6oKBM1E
         ok5dwnq67wSC3FXxKd3k5T+vilgO287gRleb65U+NJhrt0QS/wWYq88xp9WhDdb+93/7
         oo+uIgeuc/rZXmi36u5uNWjk5JZYRLCHltYB+RepCAIqNcCdJEu7x9xhBWSjvoGlMCT8
         bIDw==
X-Forwarded-Encrypted: i=1; AL+hErEgQplKwpHrvphmO8JyQVMhTeZ1moH4A58T+LgEZ6s7YHvwgjQMXOMpxT/onvehWYNnKesuL3qhhN6N@vger.kernel.org
X-Gm-Message-State: APuU4Z9dR+QlRxDxfmTNPQN3tIg+Exl61Wld6EOu2R2ZfVmeXaE0ObtM
	RbbFtdH/w+MVpH7PMFte+qAlcvGJO6L2VAKXxO918QNkkGtXmNtsGAG9
X-Gm-Gg: AZFdTZew4g8q0uCzmpikvlWA7D5ExEyPd9bcc+XMQAxgvGxtM6xMAHbozOnSoWiyLqZ
	5S7srLzWirkKadXCh2unNtSSpJFFhduo32RtjaOpHiEMl5JO6P0++O0BPZO8I8GwLNohED0KCS+
	UVOJDnVTRUDHMsGdu+6hWAMTSN8MPvTEW8DZiSStELKrSJ5ehyItxTxs7N1Sil5DYhszmdDwTm3
	UX624zPGkDDzPDKYerY4CCebs2LefcuCCmtqQuxxeg0Z76lZP4HjVa9e5jACex25+dHLhuIyFHT
	mSAEC7nhFuoJcVEXhbkBG/kECS0pbn+XZxpNbwBgeTBmwn8ThfGriSagaep+/2TO3b/5X1gfMjN
	Tc0hoxQ6OZxHkcwTg0V+XB656oL7yBx6+dRlxEcoZJgTcfHsf5BLC4iCoSgM8ozRECLEDW7h2F5
	/Xf8oLU/ypSlBTo4uoglnBU+P++GHXCJ6+2PmN9JzJancQeD3CU1N0OYbYuW/x7D2skT59wWqvF
	csLr/Lk4DtbXfOjAuoxBuPK/ADU+R6QNrBNjdDBNGuiTfhVtocvGRdw+Jtd/u2DtTdYkjfih9Iq
	U6+IvAwRXMcNcK9l2VSYQF+P3C1KRYQRoaT+BeBAUrIMfw==
X-Received: by 2002:a05:6000:1626:b0:498:be72:6365 with SMTP id ffacd0b85a97d-49c73164876mr17893053f8f.16.1794852500691;
        Mon, 16 Nov 2026 10:08:20 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm39025291f8f.44.2026.11.16.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:08:20 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH] leds: flash: Add driver for the TI LM3554
Date: Mon, 16 Nov 2026 18:08:09 +0000
Message-ID: <20261116180809.26946-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The Texas Instruments LM3554 is a flash LED driver with two current
sources for a flash LED, used together, and an indicator LED output,
controlled over I2C. It is used for the rear camera flash of the Lenovo
ThinkPad 10 (20C1/20C3), where the firmware describes it as ACPI device
INTCF1C, at I2C address 0x53, with the STROBE, TORCH and HWEN GPIOs
listed in that order and without names.

An atomisp specific driver for the LM3554 was removed in commit
f1aa35ab5943 ("media: atomisp: Drop the atomisp custom lm3554 flash
driver"), which suggested re-implementing it with the LED flash class
API if needed. This is such a driver, written from the datasheet and
using the removed driver as a reference for the ACPI GPIO order.

The driver controls the LED over I2C only and keeps the STROBE and TORCH
inputs low. It registers a flash LED class device with 8 torch levels
(34 to 295 mA), a flash current of 71 to 1037 mA and a flash timeout of
32 to 512 ms. The chip allows up to 1191 mA and 1024 ms, but the
firmware does not describe the LED's ratings, so the flash current and
timeout are limited to the chip's power-on defaults. Faults are read
from the flags register. The indicator output is not supported, it is
not connected on the ThinkPad 10.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795), with the driver and
led-class-flash built out of tree against a 7.2.15 kernel: torch at
levels 1 and 8, flash at 71 mA / 256 ms (the flash ends by itself and
the timeout fault is reported) and at 365 mA / 96 ms, s2idle suspend and
resume with the torch on (the LED is off while suspended and on again
after resume) and off, and unloading. This was also build-tested with
W=1 on top of for-leds-next and media.git next.

The driver was written with the help of an AI coding assistant (Claude);
the testing was done on the hardware by the submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 MAINTAINERS                      |   6 +
 drivers/leds/flash/Kconfig       |  12 ++
 drivers/leds/flash/Makefile      |   1 +
 drivers/leds/flash/leds-lm3554.c | 337 +++++++++++++++++++++++++++++++
 4 files changed, 356 insertions(+)
 create mode 100644 drivers/leds/flash/leds-lm3554.c

diff --git a/MAINTAINERS b/MAINTAINERS
index af302622c..6382ea861 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27685,6 +27685,12 @@ F:	include/linux/dma/k3-udma-glue.h
 F:	include/linux/dma/ti-cppi5.h
 X:	drivers/dma/ti/cppi41.c
 
+TEXAS INSTRUMENTS LM3554 FLASH LED DRIVER
+M:	Volodymyr Chapman <volodymyrchapman@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	drivers/leds/flash/leds-lm3554.c
+
 TEXAS INSTRUMENTS TPS25990 HARDWARE MONITOR DRIVER
 M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 9b6dd3f1f..bfc1f8888 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -31,6 +31,18 @@ config LEDS_KTD2692
 
 	  Say Y to enable this driver.
 
+config LEDS_LM3554
+	tristate "LED support for the TI LM3554 flash LED driver"
+	depends on ACPI && I2C && GPIOLIB
+	select REGMAP_I2C
+	help
+	  This option enables support for the Texas Instruments LM3554
+	  flash LED driver, as used for the rear camera flash of the
+	  Lenovo ThinkPad 10 (20C1/20C3).
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-lm3554.
+
 config LEDS_LM3601X
 	tristate "LED support for LM3601x Chips"
 	depends on LEDS_CLASS && I2C
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 44e6c1b4b..90afe6583 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_LEDS_MT6370_FLASH)	+= leds-mt6370-flash.o
 obj-$(CONFIG_LEDS_AAT1290)	+= leds-aat1290.o
 obj-$(CONFIG_LEDS_AS3645A)	+= leds-as3645a.o
 obj-$(CONFIG_LEDS_KTD2692)	+= leds-ktd2692.o
+obj-$(CONFIG_LEDS_LM3554)	+= leds-lm3554.o
 obj-$(CONFIG_LEDS_LM3601X)	+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_QCOM_FLASH)	+= leds-qcom-flash.o
diff --git a/drivers/leds/flash/leds-lm3554.c b/drivers/leds/flash/leds-lm3554.c
new file mode 100644
index 000000000..70c526df3
--- /dev/null
+++ b/drivers/leds/flash/leds-lm3554.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Texas Instruments LM3554 flash LED driver
+ *
+ * The LM3554 drives a flash LED through two current sources (LED1, LED2),
+ * which are used together, and an indicator LED (LEDI). It is used e.g. for
+ * the rear camera flash of the Lenovo ThinkPad 10 (20C1/20C3), where the
+ * firmware describes it as ACPI device INTCF1C.
+ *
+ * Copyright (C) 2026 Volodymyr Chapman <volodymyrchapman@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/led-class-flash.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+#define LM3554_REG_TORCH		0xa0
+#define   LM3554_TORCH_CURRENT		GENMASK(5, 3)
+#define LM3554_REG_FLASH		0xb0
+#define   LM3554_FLASH_CURRENT		GENMASK(6, 3)
+/* Bits [2:0] of the torch and flash registers are shared */
+#define   LM3554_MODE			GENMASK(2, 0)
+#define   LM3554_MODE_SHUTDOWN		0
+#define   LM3554_MODE_TORCH		2
+#define   LM3554_MODE_FLASH		3
+#define LM3554_REG_DURATION		0xc0
+#define   LM3554_TIMEOUT		GENMASK(4, 0)
+#define LM3554_REG_FLAGS		0xd0
+#define   LM3554_FLAG_TIMEOUT		BIT(0)
+#define   LM3554_FLAG_THERMAL_SHUTDOWN	BIT(1)
+#define   LM3554_FLAG_LED_FAULT		BIT(2)
+#define   LM3554_FLAG_LED_THERMAL	BIT(5)
+#define   LM3554_FLAG_VIN_MONITOR	BIT(7)
+#define LM3554_REG_CONFIG1		0xe0
+#define LM3554_REG_CONFIG2		0xf0
+
+#define LM3554_TIMEOUT_STEP_US		32000
+#define LM3554_TIMEOUT_MIN_US		32000
+/* Power-on default, the chip allows up to 1024 ms */
+#define LM3554_TIMEOUT_MAX_US		512000
+
+/*
+ * 8 torch current settings, LED1 + LED2 together: 34, 71, 108, 146, 180, 218,
+ * 256 and 295 mA.
+ */
+#define LM3554_TORCH_LEVELS		8
+
+/* Total of LED1 + LED2, for the 16 flash current settings */
+static const u32 lm3554_flash_ua[] = {
+	71000, 146000, 218000, 295000, 365000, 441000, 518000, 596000,
+	652000, 729000, 805000, 881000, 960000, 1037000, 1113000, 1191000,
+};
+
+/* Power-on default (13), the chip allows up to 1191 mA */
+#define LM3554_FLASH_MAX_UA		1037000
+
+struct lm3554 {
+	struct led_classdev_flash fled_cdev;
+	struct regmap *regmap;
+	struct gpio_desc *enable_gpio;
+	/* Serialises register access between the LED and flash callbacks */
+	struct mutex lock;
+};
+
+static struct lm3554 *fled_cdev_to_lm3554(struct led_classdev_flash *fled_cdev)
+{
+	return container_of(fled_cdev, struct lm3554, fled_cdev);
+}
+
+static bool lm3554_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* The mode bits clear themselves when a flash times out */
+	return reg == LM3554_REG_TORCH || reg == LM3554_REG_FLASH ||
+	       reg == LM3554_REG_FLAGS;
+}
+
+static const struct regmap_config lm3554_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LM3554_REG_CONFIG2,
+	.volatile_reg = lm3554_volatile_reg,
+};
+
+static int lm3554_set_mode(struct lm3554 *lm3554, unsigned int mode)
+{
+	return regmap_update_bits(lm3554->regmap, LM3554_REG_TORCH,
+				  LM3554_MODE, mode);
+}
+
+static int lm3554_brightness_set(struct led_classdev *led_cdev,
+				 enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	int ret;
+
+	guard(mutex)(&lm3554->lock);
+
+	if (brightness == LED_OFF)
+		return lm3554_set_mode(lm3554, LM3554_MODE_SHUTDOWN);
+
+	ret = regmap_update_bits(lm3554->regmap, LM3554_REG_TORCH,
+				 LM3554_TORCH_CURRENT,
+				 FIELD_PREP(LM3554_TORCH_CURRENT, brightness - 1));
+	if (ret)
+		return ret;
+
+	return lm3554_set_mode(lm3554, LM3554_MODE_TORCH);
+}
+
+static int lm3554_flash_brightness_set(struct led_classdev_flash *fled_cdev,
+				       u32 brightness)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	unsigned int i;
+
+	/* Use the highest setting which does not exceed the requested current */
+	for (i = ARRAY_SIZE(lm3554_flash_ua) - 1; i > 0; i--)
+		if (lm3554_flash_ua[i] <= brightness)
+			break;
+
+	guard(mutex)(&lm3554->lock);
+
+	return regmap_update_bits(lm3554->regmap, LM3554_REG_FLASH,
+				  LM3554_FLASH_CURRENT,
+				  FIELD_PREP(LM3554_FLASH_CURRENT, i));
+}
+
+static int lm3554_timeout_set(struct led_classdev_flash *fled_cdev, u32 timeout)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+
+	guard(mutex)(&lm3554->lock);
+
+	return regmap_update_bits(lm3554->regmap, LM3554_REG_DURATION,
+				  LM3554_TIMEOUT,
+				  FIELD_PREP(LM3554_TIMEOUT,
+					     timeout / LM3554_TIMEOUT_STEP_US - 1));
+}
+
+static int lm3554_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	unsigned int flags;
+	int ret;
+
+	guard(mutex)(&lm3554->lock);
+
+	if (!state)
+		return lm3554_set_mode(lm3554, LM3554_MODE_SHUTDOWN);
+
+	/* Clear old flags, the timeout flag would otherwise stay set */
+	ret = regmap_read(lm3554->regmap, LM3554_REG_FLAGS, &flags);
+	if (ret)
+		return ret;
+
+	return lm3554_set_mode(lm3554, LM3554_MODE_FLASH);
+}
+
+static int lm3554_strobe_get(struct led_classdev_flash *fled_cdev, bool *state)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	unsigned int val;
+	int ret;
+
+	guard(mutex)(&lm3554->lock);
+
+	ret = regmap_read(lm3554->regmap, LM3554_REG_TORCH, &val);
+	if (ret)
+		return ret;
+
+	*state = FIELD_GET(LM3554_MODE, val) == LM3554_MODE_FLASH;
+
+	return 0;
+}
+
+static int lm3554_fault_get(struct led_classdev_flash *fled_cdev, u32 *fault)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	unsigned int flags;
+	int ret;
+
+	guard(mutex)(&lm3554->lock);
+
+	/* Reading the flags register clears it */
+	ret = regmap_read(lm3554->regmap, LM3554_REG_FLAGS, &flags);
+	if (ret)
+		return ret;
+
+	*fault = 0;
+	if (flags & LM3554_FLAG_TIMEOUT)
+		*fault |= LED_FAULT_TIMEOUT;
+	if (flags & LM3554_FLAG_THERMAL_SHUTDOWN)
+		*fault |= LED_FAULT_OVER_TEMPERATURE;
+	if (flags & LM3554_FLAG_LED_FAULT)
+		*fault |= LED_FAULT_SHORT_CIRCUIT;
+	if (flags & LM3554_FLAG_LED_THERMAL)
+		*fault |= LED_FAULT_LED_OVER_TEMPERATURE;
+	if (flags & LM3554_FLAG_VIN_MONITOR)
+		*fault |= LED_FAULT_INPUT_VOLTAGE;
+
+	return 0;
+}
+
+static const struct led_flash_ops lm3554_flash_ops = {
+	.flash_brightness_set	= lm3554_flash_brightness_set,
+	.strobe_set		= lm3554_strobe_set,
+	.strobe_get		= lm3554_strobe_get,
+	.timeout_set		= lm3554_timeout_set,
+	.fault_get		= lm3554_fault_get,
+};
+
+/*
+ * The ACPI resources list the STROBE, TORCH and HWEN (enable) GPIOs in this
+ * order, without names.
+ */
+static const struct acpi_gpio_params lm3554_strobe_gpio = { 0, 0, false };
+static const struct acpi_gpio_params lm3554_torch_gpio = { 1, 0, false };
+static const struct acpi_gpio_params lm3554_enable_gpio = { 2, 0, false };
+
+static const struct acpi_gpio_mapping lm3554_acpi_gpios[] = {
+	{ "strobe-gpios", &lm3554_strobe_gpio, 1 },
+	{ "torch-gpios", &lm3554_torch_gpio, 1 },
+	{ "enable-gpios", &lm3554_enable_gpio, 1 },
+	{ }
+};
+
+static void lm3554_power_off(void *data)
+{
+	struct lm3554 *lm3554 = data;
+
+	lm3554_set_mode(lm3554, LM3554_MODE_SHUTDOWN);
+	gpiod_set_value_cansleep(lm3554->enable_gpio, 0);
+}
+
+static int lm3554_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct led_flash_setting *setting;
+	struct led_classdev *led_cdev;
+	struct gpio_desc *gpio;
+	struct lm3554 *lm3554;
+	unsigned int val;
+	int ret;
+
+	lm3554 = devm_kzalloc(dev, sizeof(*lm3554), GFP_KERNEL);
+	if (!lm3554)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &lm3554->lock);
+	if (ret)
+		return ret;
+
+	ret = devm_acpi_dev_add_driver_gpios(dev, lm3554_acpi_gpios);
+	if (ret)
+		return ret;
+
+	/*
+	 * This driver only controls the LED over I2C. Keep the STROBE and
+	 * TORCH inputs low so that they do not turn on the LED.
+	 */
+	gpio = devm_gpiod_get_optional(dev, "strobe", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio), "getting strobe GPIO\n");
+
+	gpio = devm_gpiod_get_optional(dev, "torch", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio), "getting torch GPIO\n");
+
+	lm3554->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(lm3554->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(lm3554->enable_gpio),
+				     "getting enable GPIO\n");
+
+	lm3554->regmap = devm_regmap_init_i2c(client, &lm3554_regmap_config);
+	if (IS_ERR(lm3554->regmap))
+		return PTR_ERR(lm3554->regmap);
+
+	ret = devm_add_action_or_reset(dev, lm3554_power_off, lm3554);
+	if (ret)
+		return ret;
+
+	/* Check that the chip is there, this also clears its flags */
+	ret = regmap_read(lm3554->regmap, LM3554_REG_FLAGS, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "reading flags register\n");
+
+	lm3554->fled_cdev.ops = &lm3554_flash_ops;
+
+	setting = &lm3554->fled_cdev.timeout;
+	setting->min = LM3554_TIMEOUT_MIN_US;
+	setting->max = LM3554_TIMEOUT_MAX_US;
+	setting->step = LM3554_TIMEOUT_STEP_US;
+	setting->val = LM3554_TIMEOUT_MAX_US;
+
+	setting = &lm3554->fled_cdev.brightness;
+	setting->min = lm3554_flash_ua[0];
+	setting->max = LM3554_FLASH_MAX_UA;
+	setting->step = 1;
+	setting->val = LM3554_FLASH_MAX_UA;
+
+	led_cdev = &lm3554->fled_cdev.led_cdev;
+	led_cdev->name = "white:" LED_FUNCTION_FLASH;
+	led_cdev->max_brightness = LM3554_TORCH_LEVELS;
+	led_cdev->brightness_set_blocking = lm3554_brightness_set;
+	led_cdev->flags |= LED_DEV_CAP_FLASH | LED_CORE_SUSPENDRESUME;
+
+	return devm_led_classdev_flash_register(dev, &lm3554->fled_cdev);
+}
+
+static const struct acpi_device_id lm3554_acpi_match[] = {
+	{ "INTCF1C" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, lm3554_acpi_match);
+
+static struct i2c_driver lm3554_driver = {
+	.driver = {
+		.name = "leds-lm3554",
+		.acpi_match_table = lm3554_acpi_match,
+	},
+	.probe = lm3554_probe,
+};
+module_i2c_driver(lm3554_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LM3554 flash LED driver");
+MODULE_AUTHOR("Volodymyr Chapman <volodymyrchapman@gmail.com>");
+MODULE_LICENSE("GPL");

base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

