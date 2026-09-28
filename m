Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662648E0E5
	for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588631; cv=none; b=Ryu19QfrgXAT7+bc1aVrJPxmQyCvxACrI5zi2MblI5+rxQzcZswYNkBJVNV+C9N1fnqV12thQDeqb6QKqxVz8QJ9tiRmqZh9k3+FqJtEdsnCjkpE6Zz6Y6Ln76PM41nVxIn2hi+VW7PRXPhNjNmjyWEgXe4lQEIEOKa3K+nj5nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588631; c=relaxed/simple;
	bh=SQD6xmWfjoQfrwPua2sgQvU/+tjX7BxU9cgylUplRBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsgy7FTklmgy6XahDEcZvVMtDzYZELUcKnDmFSg3kT9jJwg3X1uYNYIJVNlljME8KH4GZe7MuTk36BfkgNW82mJHz4/2pZxcCRJE/TJkrNKtLMGbgtefPM57Z9km45bFDD7p+JNA2V5zzBNuJkENDtkwopMkm9T4vHiSdZsWqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/ijOrte; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/ijOrte"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso30509905e9.1
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 02:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588627; x=1791193427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4svpAaUWs4UGHwMoZsbrUm3m975clCMvxcQHME56vto=;
        b=l/ijOrte1BFL4VjCZmuiTQB2T0X5Zbs96kJxArnvlLJPJHq8A07C+halv79ohae9S9
         ZfQpte3+jTQpnuOhFg3Zn6vE8zbB/hwRZMjCoPFUrVRYRy7UMYZNwlpp+4YA+BOsmYcZ
         vI44XEE0lk8d6Fz/pDBsZNzmfvtjhK4hblMBR3TlMCQN61j3yigMVjBpx99Lsj3xlXrV
         eKlc0F6wUQajXK6PMewNNTAPw6JdDVf+f543PjllKev3HhKasSI665fl55X+jeAPf6tf
         WGIlatUY7n63QjSh/0IjOJfW7cDHonuv1XbqhKxuHOqVS/KAc5l48lgMybjkq1Cj7hDd
         +jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588627; x=1791193427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4svpAaUWs4UGHwMoZsbrUm3m975clCMvxcQHME56vto=;
        b=iqpdJuKP9Ef6nRmkiGf5lLRqJhs9HKT/0G6acy2JfGBEB8egsgOo83EQwokcjt83PR
         ZGcfM3XiyRosd8P7rCJh2eG9zgebl/gGaGEL1ng1TIrXCt1RSGVx+mreHHg8J8wL3UOr
         Mka32AAPK990kiUwQGwE8zpbkO6bRh3tDzCBudi8Ad2h/6fwGMTMLD4XC9RoIBd4sQZR
         nLcXN2VQUtkyu/PsinF7ceGghFtGDNSL9b3pWKuAJsh80z08nFTV+T3QdC6ViN7w35Oc
         8Qd7qITtaTr4VouBsuhrtDJd3TSDg61bRspFAyet9UCYbyRQ78pf5pznDw603u1JzKHo
         Jg+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxow4AaupBo7H9fE1sgnHyEwAv77L4DyXjVoRkcT5Yy6TvE0i+qM/Xcnrh81dv0cewpd1Z843wF9HjF@vger.kernel.org
X-Gm-Message-State: AFuF++nPKNF1vQEmcyJgsiTLlQRlsUGHiBZBHLtLs6HAyRlQbN1vMhhL
	7Figp5j87H1/xOt1R49W1TE3Skl3IvnOrv7hhVQP0shEcQ+Adp75VLI8
X-Gm-Gg: AYBFou34lAGd1fKzRC//Tv5NnOtvPeCIMmNO9q8EP7gyfZNH53FCRyc5X2T9Q8jvfmN
	dFUS9u+ssk/i1hr7vYcVijSExzvU6vWuwxRyKiLEiy6+H7TUFS8o4k2Utvwq15ZY+LrappjOcrk
	2Maq6WXljv5XN9hYTRL+3gkyhYmT1GyV38292ohdge5QkKHriZUf8NOzHX7iMkZHNOX6YWQnMXj
	YZ3ufM4UPAca/vpcXSKdkmfDLwuECrPMVbZWFASRWWfCpvBxeSbshOB9+qv1CaEH8mZxZgRKmQl
	miMVE7hw0ehLfNJar/ml/6eYDiQojrze2/6Eb+P948lQ/Z3ZDd6cSxnI1mhqBZXSGchU5MYOvt0
	9CU2Ph07TeH4bJ/J2ZYt6fVmR5X3BCfbeVTyddEs5CjBmJHglqzvkI7QcQSNKNhUQkUyjztTkU7
	RXfow3NUs79WNiacFgtmR0jIOxY/99amMSWAJejoTViBj2VVY4wZNEXpkHdmNKK1taphYAYmFi/
	hS5y94fmXPadukLo7D3ZFqoXOUWMUR6n20Z/wExeZ0A
X-Received: by 2002:a05:600c:a08:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49fe7b62d26mr220682515e9.10.1790588626409;
        Mon, 28 Sep 2026 02:43:46 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm169401315e9.11.2026.09.28.02.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:43:45 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v2 2/4] leds: flash: Add support for the TI LM3643 dual LED flash driver
Date: Mon, 28 Sep 2026 10:42:35 +0100
Message-ID: <20260928094302.86966-3-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928094302.86966-1-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LM3643 is an I2C dual LED flash driver. Its two high-side current
sources share a synchronous boost converter and each supports torch and
flash modes with programmable current and flash timeout alongside fault
reporting.

It also supports connecting both sources together to supply one LED with
current up to the boost converter's 1.5A maximum. In that case the current
will be split between each source symmetrically and the sources will be
enabled and disabled at the same time.

As strobing is toggled chip-wide the driver returns -EBUSY when a sibling
LED is active.

Flash timeouts do not have a constant step. The driver advertises the most
granular step and rounds down to the nearest supported value.

Register behavior was taken from the datasheet (SNVS967A).

Co-developed-by: Ruslan Koreev <koreev.r@gmail.com>
Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 MAINTAINERS                      |   7 +
 drivers/leds/flash/Kconfig       |  12 +
 drivers/leds/flash/Makefile      |   1 +
 drivers/leds/flash/leds-lm3643.c | 786 +++++++++++++++++++++++++++++++
 4 files changed, 806 insertions(+)
 create mode 100644 drivers/leds/flash/leds-lm3643.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a1eb0937238d..0c186a7f2648 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27036,6 +27036,13 @@ F:	include/linux/dma/k3-udma-glue.h
 F:	include/linux/dma/ti-cppi5.h
 X:	drivers/dma/ti/cppi41.c
 
+TEXAS INSTRUMENTS LM3643 LED FLASH DRIVER
+M:	Rillian Grant <rillian.grant@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ti,lm3643.yaml
+F:	drivers/leds/flash/leds-lm3643.c
+
 TEXAS INSTRUMENTS TPS25990 HARDWARE MONITOR DRIVER
 M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 9b6dd3f1ffe8..0f0a60a902fc 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -39,6 +39,18 @@ config LEDS_LM3601X
 	  This option enables support for the TI LM3601x family
 	  of flash, torch and indicator classes.
 
+config LEDS_LM3643
+	tristate "LED support for LM3643 dual LED flash driver"
+	depends on I2C
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	select REGMAP_I2C
+	help
+	  This option enables support for the Texas Instruments LM3643 dual
+	  LED flash driver.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "leds-lm3643".
+
 config LEDS_MAX77693
 	tristate "LED support for MAX77693 Flash"
 	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 44e6c1b4beb3..e2e885e02123 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_LEDS_AAT1290)	+= leds-aat1290.o
 obj-$(CONFIG_LEDS_AS3645A)	+= leds-as3645a.o
 obj-$(CONFIG_LEDS_KTD2692)	+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_LM3601X)	+= leds-lm3601x.o
+obj-$(CONFIG_LEDS_LM3643)	+= leds-lm3643.o
 obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_QCOM_FLASH)	+= leds-qcom-flash.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
new file mode 100644
index 000000000000..bbe9358c9caa
--- /dev/null
+++ b/drivers/leds/flash/leds-lm3643.c
@@ -0,0 +1,786 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Texas Instruments LM3643(A) Synchronous Boost Dual LED Flash Driver
+ *
+ * Copyright 2026 Rillian Grant <rillian.grant@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/i2c.h>
+#include <linux/led-class-flash.h>
+#include <linux/leds.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <media/v4l2-flash-led-class.h>
+
+#define LM3643_NUM_CHANNELS 2
+#define LM3643_CHAN_JOINT LM3643_NUM_CHANNELS
+
+#define LM3643_REG_ENABLE 0x01
+#define LM3643_REG_FLASH_BR_LED1 0x03
+#define LM3643_REG_FLASH_BR_LED2 0x04
+#define LM3643_REG_TORCH_BR_LED1 0x05
+#define LM3643_REG_TORCH_BR_LED2 0x06
+#define LM3643_REG_CONFIG 0x08
+#define LM3643_REG_FLAGS1 0x0A
+#define LM3643_REG_FLAGS2 0x0B
+#define LM3643_REG_DEV_ID 0x0C
+
+#define LM3643_ENABLE_LED_MASK GENMASK(1, 0)
+#define LM3643_ENABLE_LED1 BIT(0)
+#define LM3643_ENABLE_LED2 BIT(1)
+
+#define LM3643_MODE_MASK GENMASK(3, 2)
+#define LM3643_MODE_STANDBY 0x00
+#define LM3643_MODE_TORCH FIELD_PREP(LM3643_MODE_MASK, 0x2)
+#define LM3643_MODE_FLASH FIELD_PREP(LM3643_MODE_MASK, 0x3)
+
+#define LM3643_TORCH_BR_MASK GENMASK(6, 0)
+#define LM3643_TORCH_BR_LED2_OVERRIDE BIT(7)
+#define LM3643_TORCH_BR_CODE_RESET 0x3F
+#define LM3643_TORCH_BR_CODE_MAX 0x7F
+
+/* Torch: microamps = (code x 1.4) + 0.977 */
+#define LM3643_TORCH_BR_UA_OFFSET 977
+#define LM3643_TORCH_BR_UA_STEP 1400
+#define LM3643_TORCH_BR_UA_TO_CODE(ua) \
+	(((ua) - LM3643_TORCH_BR_UA_OFFSET) / LM3643_TORCH_BR_UA_STEP)
+#define LM3643_TORCH_BR_CODE_TO_UA(code) \
+	(((code) * LM3643_TORCH_BR_UA_STEP) + LM3643_TORCH_BR_UA_OFFSET)
+#define LM3643_TORCH_BR_UA_MIN LM3643_TORCH_BR_CODE_TO_UA(0)
+
+#define LM3643_FLASH_BR_MASK GENMASK(6, 0)
+#define LM3643_FLASH_BR_LED2_OVERRIDE BIT(7)
+#define LM3643_FLASH_BR_CODE_RESET 0x3F
+#define LM3643_FLASH_BR_CODE_MAX 0x7F
+
+/* Flash: microamps = (code x 11.725) + 10.9 */
+#define LM3643_FLASH_BR_UA_OFFSET 10900
+#define LM3643_FLASH_BR_UA_STEP 11725
+#define LM3643_FLASH_BR_UA_TO_CODE(ua) \
+	(((ua) - LM3643_FLASH_BR_UA_OFFSET) / LM3643_FLASH_BR_UA_STEP)
+#define LM3643_FLASH_BR_CODE_TO_UA(code) \
+	(((code) * LM3643_FLASH_BR_UA_STEP) + LM3643_FLASH_BR_UA_OFFSET)
+#define LM3643_FLASH_BR_UA_MIN LM3643_FLASH_BR_CODE_TO_UA(0)
+/* Maximum current the chip can produce across both sources */
+#define LM3643_FLASH_BR_UA_TOTAL_MAX 1500000
+
+/* CDEV brightness values are 1-indexed for use by led_classdev */
+#define LM3643_TORCH_BR_CODE_TO_CDEV(code) ((code) + 1)
+#define LM3643_TORCH_BR_CDEV_TO_CODE(brightness) ((brightness) - 1)
+#define LM3643_TORCH_BR_CDEV_MAX LM3643_TORCH_BR_CODE_TO_CDEV(LM3643_TORCH_BR_CODE_MAX)
+#define LM3643_TORCH_BR_UA_TO_CDEV(ua) \
+	  LM3643_TORCH_BR_CODE_TO_CDEV(LM3643_TORCH_BR_UA_TO_CODE(ua))
+#define LM3643_TORCH_BR_CDEV_TO_UA(brightness) \
+	  LM3643_TORCH_BR_CODE_TO_UA(LM3643_TORCH_BR_CDEV_TO_CODE(brightness))
+
+#define LM3643_CONFIG_FLASH_TIMEOUT_MASK GENMASK(3, 0)
+#define LM3643_CONFIG_FLASH_TIMEOUT_RESET 0xA
+
+#define LM3643_TIMEOUT_US_MIN 10000
+#define LM3643_TIMEOUT_US_STEP 10000
+#define LM3643_TIMEOUT_US_MAX 400000
+
+#define LM3643_FLAGS1_MASK GENMASK(6, 0)
+#define LM3643_FLAGS1_FAULT_TIMEOUT BIT(0)
+#define LM3643_FLAGS1_FAULT_UVLO BIT(1)
+#define LM3643_FLAGS1_FAULT_TSD BIT(2)
+#define LM3643_FLAGS1_FAULT_CURRENT_LIMIT BIT(3)
+#define LM3643_FLAGS1_FAULT_VLED2_SHORT BIT(4)
+#define LM3643_FLAGS1_FAULT_VLED1_SHORT BIT(5)
+#define LM3643_FLAGS1_FAULT_VOUT_SHORT BIT(6)
+#define LM3643_FLAGS1_LED1_FAULTS (LM3643_FLAGS1_MASK & ~LM3643_FLAGS1_FAULT_VLED2_SHORT)
+#define LM3643_FLAGS1_LED2_FAULTS (LM3643_FLAGS1_MASK & ~LM3643_FLAGS1_FAULT_VLED1_SHORT)
+
+#define LM3643_FLAGS2_MASK GENMASK(2, 0)
+#define LM3643_FLAGS2_FAULT_TEMP BIT(0)
+#define LM3643_FLAGS2_FAULT_OVP BIT(1)
+#define LM3643_FLAGS2_FAULT_IVFM_TRIP BIT(2)
+
+#define LM3643_FAULTS_ALL ( \
+	LED_FAULT_TIMEOUT \
+	| LED_FAULT_UNDER_VOLTAGE \
+	| LED_FAULT_OVER_TEMPERATURE \
+	| LED_FAULT_OVER_CURRENT \
+	| LED_FAULT_SHORT_CIRCUIT \
+	| LED_FAULT_LED_OVER_TEMPERATURE \
+	| LED_FAULT_OVER_VOLTAGE \
+	| LED_FAULT_INPUT_VOLTAGE \
+)
+
+#define LM3643_DEV_ID_MASK GENMASK(5, 3)
+#define LM3643_DEV_ID 0x00
+
+struct lm3643_chan {
+	u8 enable_bit;
+	u8 torch_br_reg;
+	u8 flash_br_reg;
+	u8 flags1_faults;
+	u8 num_sources;
+};
+
+static const struct lm3643_chan lm3643_chans[LM3643_NUM_CHANNELS + 1] = {
+	{
+		.enable_bit = LM3643_ENABLE_LED1,
+		.torch_br_reg = LM3643_REG_TORCH_BR_LED1,
+		.flash_br_reg = LM3643_REG_FLASH_BR_LED1,
+		.flags1_faults = LM3643_FLAGS1_LED1_FAULTS,
+		.num_sources = 1,
+	},
+	{
+		.enable_bit = LM3643_ENABLE_LED2,
+		.torch_br_reg = LM3643_REG_TORCH_BR_LED2,
+		.flash_br_reg = LM3643_REG_FLASH_BR_LED2,
+		.flags1_faults = LM3643_FLAGS1_LED2_FAULTS,
+		.num_sources = 1,
+	},
+	[LM3643_CHAN_JOINT] = {
+		.enable_bit = LM3643_ENABLE_LED_MASK,
+		.torch_br_reg = LM3643_REG_TORCH_BR_LED1,
+		.flash_br_reg = LM3643_REG_FLASH_BR_LED1,
+		.flags1_faults = LM3643_FLAGS1_MASK,
+		.num_sources = LM3643_NUM_CHANNELS,
+	},
+};
+
+static const struct led_flash_setting lm3643_flash_br_setting = {
+	.max = LM3643_FLASH_BR_CODE_TO_UA(LM3643_FLASH_BR_CODE_MAX),
+	.min = LM3643_FLASH_BR_UA_MIN,
+	.step = LM3643_FLASH_BR_UA_STEP,
+	.val = LM3643_FLASH_BR_CODE_TO_UA(LM3643_FLASH_BR_CODE_RESET),
+};
+
+static const u32 lm3643_timeout_us[] = {
+	LM3643_TIMEOUT_US_MIN,
+	20000,
+	30000,
+	40000,
+	50000,
+	60000,
+	70000,
+	80000,
+	90000,
+	100000,
+	150000,
+	200000,
+	250000,
+	300000,
+	350000,
+	LM3643_TIMEOUT_US_MAX,
+};
+
+static_assert(ARRAY_SIZE(lm3643_timeout_us) == LM3643_CONFIG_FLASH_TIMEOUT_MASK + 1);
+
+static unsigned int lm3643_timeout_to_code(u32 timeout)
+{
+	unsigned int i;
+
+	for (i = ARRAY_SIZE(lm3643_timeout_us) - 1; i > 0; i--)
+		if (timeout >= lm3643_timeout_us[i])
+			break;
+
+	return i;
+}
+
+/* The chip's timeouts step by 10 ms up to 100 ms and then by 50 ms. */
+static const struct led_flash_setting lm3643_flash_time_setting = {
+	.max = LM3643_TIMEOUT_US_MAX,
+	.min = LM3643_TIMEOUT_US_MIN,
+	.step = LM3643_TIMEOUT_US_STEP,
+	.val = lm3643_timeout_us[LM3643_CONFIG_FLASH_TIMEOUT_RESET],
+};
+
+struct lm3643_led {
+	struct lm3643 *chip;
+	struct regmap *regmap;
+	struct led_classdev_flash flash_cdev;
+	struct v4l2_flash *v4l2_flash;
+
+	const struct lm3643_chan *chan;
+
+	u8 flags1, flags2;
+};
+
+struct lm3643 {
+	struct regmap *regmap;
+	/* Synchronizes access to enable and flag registers */
+	struct mutex lock;
+	struct lm3643_led leds[LM3643_NUM_CHANNELS];
+	unsigned int leds_active;
+};
+
+static enum led_brightness lm3643_torch_get_brightness(struct led_classdev *led_cdev)
+{
+	struct lm3643_led *led = container_of(lcdev_to_flcdev(led_cdev),
+										  struct lm3643_led,
+										  flash_cdev);
+	const struct lm3643_chan *chan = led->chan;
+	unsigned int brightness;
+	unsigned int enable;
+	int ret;
+
+	guard(mutex)(&led->chip->lock);
+
+	ret = regmap_read(led->regmap, LM3643_REG_ENABLE, &enable);
+	if (ret) {
+		dev_err(led_cdev->dev, "failed to get enable register\n");
+		return LED_OFF;
+	}
+	enable &= LM3643_MODE_MASK | chan->enable_bit;
+	if (enable != (LM3643_MODE_TORCH | chan->enable_bit))
+		return LED_OFF;
+
+	ret = regmap_read(led->regmap, chan->torch_br_reg, &brightness);
+	if (ret) {
+		dev_err(led_cdev->dev,
+			"failed to get LED brightness register 0x%02x\n",
+			chan->torch_br_reg);
+		return LED_OFF;
+	}
+	brightness &= LM3643_TORCH_BR_MASK;
+
+	return LM3643_TORCH_BR_CODE_TO_CDEV(brightness);
+}
+
+static int lm3643_torch_set_brightness(struct led_classdev *led_cdev,
+				       enum led_brightness brightness)
+{
+	struct lm3643_led *led = container_of(lcdev_to_flcdev(led_cdev),
+					      struct lm3643_led, flash_cdev);
+	const struct lm3643_chan *chan = led->chan;
+	struct lm3643 *chip = led->chip;
+	unsigned int sibling_bit, keep, enable, mode;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	ret = regmap_read(led->regmap, LM3643_REG_ENABLE, &enable);
+	if (ret)
+		return ret;
+	sibling_bit = LM3643_ENABLE_LED_MASK & ~chan->enable_bit;
+
+	mode = enable & LM3643_MODE_MASK;
+	if ((enable & sibling_bit) &&
+	    mode != LM3643_MODE_STANDBY &&
+	    mode != LM3643_MODE_TORCH)
+		return -EBUSY;
+
+	if (brightness == 0) {
+		unsigned int mask = chan->enable_bit;
+
+		/* Last active output: leave torch mode, back to standby */
+		if (!(enable & sibling_bit))
+			mask |= LM3643_MODE_MASK;
+
+		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE, mask, 0);
+	}
+
+	ret = regmap_update_bits(led->regmap, chan->torch_br_reg, LM3643_TORCH_BR_MASK,
+				 LM3643_TORCH_BR_CDEV_TO_CODE(brightness));
+	if (ret)
+		return ret;
+
+	keep = (enable & LM3643_MODE_MASK) == LM3643_MODE_TORCH
+		? enable & sibling_bit
+		: 0;
+
+	return regmap_update_bits(led->regmap,
+				  LM3643_REG_ENABLE,
+				  LM3643_MODE_MASK | LM3643_ENABLE_LED_MASK,
+				  LM3643_MODE_TORCH | chan->enable_bit | keep);
+}
+
+static int lm3643_flash_brightness_get(struct led_classdev_flash *fled_cdev, u32 *brightness)
+{
+	struct lm3643_led *led = container_of(fled_cdev,
+					      struct lm3643_led,
+					      flash_cdev);
+	const struct lm3643_chan *chan = led->chan;
+	int ret;
+
+	ret = regmap_read(led->regmap, chan->flash_br_reg, brightness);
+	if (ret)
+		return ret;
+
+	*brightness &= LM3643_FLASH_BR_MASK;
+	*brightness = LM3643_FLASH_BR_CODE_TO_UA(*brightness);
+	*brightness *= chan->num_sources;
+
+	return 0;
+}
+
+static int lm3643_flash_brightness_set(struct led_classdev_flash *fled_cdev, u32 brightness)
+{
+	struct lm3643_led *led = container_of(fled_cdev, struct lm3643_led, flash_cdev);
+	const struct lm3643_chan *chan = led->chan;
+
+	brightness /= chan->num_sources;
+	brightness = LM3643_FLASH_BR_UA_TO_CODE(brightness);
+
+	return regmap_update_bits(led->regmap,
+				  chan->flash_br_reg,
+				  LM3643_FLASH_BR_MASK,
+				  brightness);
+}
+
+static int lm3643_flash_timeout_set(struct led_classdev_flash *fled_cdev, u32 timeout)
+{
+	unsigned int code = lm3643_timeout_to_code(timeout);
+
+	fled_cdev->timeout.val = lm3643_timeout_us[code];
+
+	return 0;
+}
+
+static int lm3643_flash_strobe_get(struct led_classdev_flash *fled_cdev, bool *state)
+{
+	struct lm3643_led *led = container_of(fled_cdev, struct lm3643_led, flash_cdev);
+	const struct lm3643_chan *chan = led->chan;
+	unsigned int mode;
+	int ret;
+
+	ret = regmap_read(led->regmap, LM3643_REG_ENABLE, &mode);
+	if (ret)
+		return ret;
+
+	*state = (mode & (LM3643_MODE_MASK | chan->enable_bit)) ==
+		 (LM3643_MODE_FLASH | chan->enable_bit);
+
+	return 0;
+}
+
+static int lm3643_flash_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
+{
+	struct lm3643_led *led = container_of(fled_cdev, struct lm3643_led, flash_cdev);
+	const struct lm3643_chan *chan = led->chan;
+	unsigned int enable_reg, sibling_bit, mode;
+	int ret;
+
+	guard(mutex)(&led->chip->lock);
+
+	ret = regmap_read(led->regmap, LM3643_REG_ENABLE, &enable_reg);
+	if (ret)
+		return ret;
+	sibling_bit = LM3643_ENABLE_LED_MASK & ~led->chan->enable_bit;
+	mode = enable_reg & LM3643_MODE_MASK;
+
+	if (!state) {
+		unsigned int mask = chan->enable_bit;
+
+		if (mode != LM3643_MODE_FLASH)
+			return 0;
+
+		/* Leave flash mode once no other output is strobing */
+		if (!(enable_reg & sibling_bit))
+			mask |= LM3643_MODE_MASK;
+
+		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE, mask, 0);
+	}
+	if ((enable_reg & sibling_bit) && mode != LM3643_MODE_STANDBY)
+		return -EBUSY;
+
+	ret = regmap_update_bits(led->regmap,
+				 LM3643_REG_CONFIG,
+				 LM3643_CONFIG_FLASH_TIMEOUT_MASK,
+				 lm3643_timeout_to_code(fled_cdev->timeout.val));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(led->regmap,
+				  LM3643_REG_ENABLE,
+				  LM3643_MODE_MASK | LM3643_ENABLE_LED_MASK,
+				  LM3643_MODE_FLASH | chan->enable_bit);
+}
+
+static unsigned int lm3643_decode_faults(u8 flags1, u8 flags2)
+{
+	unsigned int faults = 0;
+
+	if (flags1 & LM3643_FLAGS1_FAULT_TIMEOUT)
+		faults |= LED_FAULT_TIMEOUT;
+	if (flags1 & LM3643_FLAGS1_FAULT_UVLO)
+		faults |= LED_FAULT_UNDER_VOLTAGE;
+	if (flags1 & LM3643_FLAGS1_FAULT_TSD)
+		faults |= LED_FAULT_OVER_TEMPERATURE;
+	if (flags1 & LM3643_FLAGS1_FAULT_CURRENT_LIMIT)
+		faults |= LED_FAULT_OVER_CURRENT;
+
+	/*
+	 * The caller has already masked off the sibling channel's short flag,
+	 * so all three short conditions collapse to the one generic fault.
+	 */
+	if (flags1 & (LM3643_FLAGS1_FAULT_VLED1_SHORT |
+			  LM3643_FLAGS1_FAULT_VLED2_SHORT |
+			  LM3643_FLAGS1_FAULT_VOUT_SHORT))
+		faults |= LED_FAULT_SHORT_CIRCUIT;
+
+	/* TSD is the die tripping at 150C; TEMP is the external NTC at the LED. */
+	if (flags2 & LM3643_FLAGS2_FAULT_TEMP)
+		faults |= LED_FAULT_LED_OVER_TEMPERATURE;
+	if (flags2 & LM3643_FLAGS2_FAULT_OVP)
+		faults |= LED_FAULT_OVER_VOLTAGE;
+	if (flags2 & LM3643_FLAGS2_FAULT_IVFM_TRIP)
+		faults |= LED_FAULT_INPUT_VOLTAGE;
+
+	return faults;
+}
+
+static int lm3643_fault_get(struct led_classdev_flash *fled_cdev, u32 *fault)
+{
+	struct lm3643_led *led = container_of(fled_cdev, struct lm3643_led, flash_cdev);
+	struct lm3643 *chip = led->chip;
+	u32 flags1, flags2;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	ret = regmap_read(chip->regmap, LM3643_REG_FLAGS1, &flags1);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(chip->regmap, LM3643_REG_FLAGS2, &flags2);
+	if (ret)
+		return ret;
+
+	flags1 &= LM3643_FLAGS1_MASK;
+	flags2 &= LM3643_FLAGS2_MASK;
+
+	for (int i = 0; i < LM3643_NUM_CHANNELS; i++) {
+		struct lm3643_led *sibling = &chip->leds[i];
+
+		if (!sibling->chan)
+			continue;
+
+		sibling->flags1 |= flags1 & sibling->chan->flags1_faults;
+		sibling->flags2 |= flags2;
+	}
+
+	*fault = lm3643_decode_faults(led->flags1, led->flags2);
+	led->flags1 = 0;
+	led->flags2 = 0;
+
+	return 0;
+}
+
+static const struct led_flash_ops lm3643_flash_ops = {
+	.strobe_get = lm3643_flash_strobe_get,
+	.strobe_set = lm3643_flash_strobe_set,
+	.flash_brightness_get = lm3643_flash_brightness_get,
+	.flash_brightness_set = lm3643_flash_brightness_set,
+	.timeout_set = lm3643_flash_timeout_set,
+	.fault_get = lm3643_fault_get,
+};
+
+static const struct regmap_config lm3643_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x0D,
+	.cache_type = REGCACHE_NONE,
+};
+
+static void lm3643_v4l2_release(void *v4l2_flash)
+{
+	v4l2_flash_release(v4l2_flash);
+}
+
+static void lm3643_standby(void *regmap)
+{
+	regmap_write(regmap, LM3643_REG_ENABLE, LM3643_MODE_STANDBY);
+}
+
+static void lm3643_scale_flash_setting_microamps(struct led_flash_setting *setting, u8 num_sources)
+{
+	setting->max *= num_sources;
+	setting->min *= num_sources;
+	setting->step *= num_sources;
+	setting->val *= num_sources;
+}
+
+static struct lm3643_led *lm3643_claim_channels(struct device *dev, struct lm3643 *chip,
+						struct fwnode_handle *fwnode)
+{
+	u32 sources[LM3643_NUM_CHANNELS];
+	struct lm3643_led *led;
+	int num_sources;
+	int ret;
+
+	num_sources = fwnode_property_count_u32(fwnode, "led-sources");
+	if (num_sources < 0)
+		return ERR_PTR(dev_err_probe(dev, num_sources,
+			"failed to read led-sources property\n"));
+	if (num_sources < 1 || num_sources > LM3643_NUM_CHANNELS)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+			"led-sources has %d entries, expected 1 to %d\n",
+			num_sources, LM3643_NUM_CHANNELS));
+
+	ret = fwnode_property_read_u32_array(fwnode, "led-sources", sources, num_sources);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret,
+			"failed to read led-sources property\n"));
+
+	for (int i = 0; i < num_sources; i++) {
+		if (sources[i] >= LM3643_NUM_CHANNELS)
+			return ERR_PTR(dev_err_probe(dev, -EINVAL,
+				"led-sources entry %u exceeds the %d current outputs\n",
+				sources[i], LM3643_NUM_CHANNELS));
+		if (chip->leds_active & BIT(sources[i]))
+			return ERR_PTR(dev_err_probe(dev, -EINVAL,
+				"current output %u claimed more than once\n", sources[i]));
+
+		chip->leds_active |= BIT(sources[i]);
+	}
+
+	if (num_sources == LM3643_NUM_CHANNELS) {
+		led = &chip->leds[0];
+		led->chan = &lm3643_chans[LM3643_CHAN_JOINT];
+	} else {
+		led = &chip->leds[sources[0]];
+		led->chan = &lm3643_chans[sources[0]];
+	}
+
+	led->chip = chip;
+	led->regmap = chip->regmap;
+
+	return led;
+}
+
+static int lm3643_apply_fw_limits(struct device *dev, struct lm3643_led *led,
+				  struct fwnode_handle *fwnode)
+{
+	struct led_classdev_flash *flash_cdev = &led->flash_cdev;
+	struct led_classdev *led_cdev = &flash_cdev->led_cdev;
+	u8 num_sources = led->chan->num_sources;
+	u32 max_us, max_torch_ua, max_flash_ua;
+
+	if (!fwnode_property_read_u32(fwnode, "flash-max-microamp", &max_flash_ua)) {
+		if (max_flash_ua < LM3643_FLASH_BR_UA_MIN * num_sources)
+			return dev_err_probe(dev, -EINVAL,
+				"flash-max-microamp %u is below the %u uA minimum\n",
+				max_flash_ua, LM3643_FLASH_BR_UA_MIN * num_sources);
+
+		/* Rounded down to a supported value. */
+		flash_cdev->brightness.max = min(flash_cdev->brightness.max, max_flash_ua);
+	}
+
+	if (!fwnode_property_read_u32(fwnode, "led-max-microamp", &max_torch_ua)) {
+		if (max_torch_ua < LM3643_TORCH_BR_UA_MIN * num_sources)
+			return dev_err_probe(dev, -EINVAL,
+				"led-max-microamp %u is below the %u uA minimum\n",
+				max_torch_ua, LM3643_TORCH_BR_UA_MIN * num_sources);
+
+		led_cdev->max_brightness = min(led_cdev->max_brightness,
+					       LM3643_TORCH_BR_UA_TO_CDEV(max_torch_ua /
+									  num_sources));
+	}
+
+	if (!fwnode_property_read_u32(fwnode, "flash-max-timeout-us", &max_us)) {
+		if (max_us < LM3643_TIMEOUT_US_MIN)
+			return dev_err_probe(dev, -EINVAL,
+				"flash-max-timeout-us %u below the %u us minimum\n",
+				max_us, LM3643_TIMEOUT_US_MIN);
+
+		flash_cdev->timeout.max = lm3643_timeout_us[lm3643_timeout_to_code(max_us)];
+	}
+
+	return 0;
+}
+
+static int lm3643_register_v4l2(struct device *dev, struct lm3643_led *led,
+				struct fwnode_handle *fwnode)
+{
+	struct led_classdev *led_cdev = &led->flash_cdev.led_cdev;
+	struct v4l2_flash_config v4l2_flash_config = {};
+
+	strscpy(v4l2_flash_config.dev_name, dev_name(led_cdev->dev),
+		sizeof(v4l2_flash_config.dev_name));
+	v4l2_flash_config.flash_faults = LM3643_FAULTS_ALL;
+	v4l2_flash_config.has_external_strobe = false;
+	v4l2_flash_config.intensity.min = LM3643_TORCH_BR_UA_MIN;
+	v4l2_flash_config.intensity.step = LM3643_TORCH_BR_UA_STEP;
+	v4l2_flash_config.intensity.max = LM3643_TORCH_BR_CDEV_TO_UA(led_cdev->max_brightness);
+	v4l2_flash_config.intensity.val =
+		min_t(u32, LM3643_TORCH_BR_CODE_TO_UA(LM3643_TORCH_BR_CODE_RESET),
+		      v4l2_flash_config.intensity.max);
+
+	lm3643_scale_flash_setting_microamps(&v4l2_flash_config.intensity, led->chan->num_sources);
+
+	led->v4l2_flash = v4l2_flash_init(dev, fwnode, &led->flash_cdev, NULL,
+					  &v4l2_flash_config);
+	if (IS_ERR(led->v4l2_flash))
+		return dev_err_probe(dev,
+				     PTR_ERR(led->v4l2_flash),
+				     "failed to register v4l2 flash\n");
+
+	return devm_add_action_or_reset(dev, lm3643_v4l2_release, led->v4l2_flash);
+}
+
+static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
+			       struct fwnode_handle *fwnode)
+{
+	struct led_init_data init_data = { .fwnode = fwnode };
+	struct led_classdev_flash *flash_cdev;
+	struct led_classdev *led_cdev;
+	struct lm3643_led *led;
+	u32 torch_max_brightness;
+	int ret;
+
+	led = lm3643_claim_channels(dev, chip, fwnode);
+	if (IS_ERR(led))
+		return PTR_ERR(led);
+
+	flash_cdev = &led->flash_cdev;
+	led_cdev = &flash_cdev->led_cdev;
+
+	if (led->chan->num_sources == LM3643_NUM_CHANNELS) {
+		/* Bit 7 of the LED1 brightness registers override LED2 with the same values. */
+		ret = regmap_update_bits(chip->regmap, LM3643_REG_TORCH_BR_LED1,
+					 LM3643_TORCH_BR_LED2_OVERRIDE,
+					 LM3643_TORCH_BR_LED2_OVERRIDE);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(chip->regmap, LM3643_REG_FLASH_BR_LED1,
+					 LM3643_FLASH_BR_LED2_OVERRIDE,
+					 LM3643_FLASH_BR_LED2_OVERRIDE);
+		if (ret)
+			return ret;
+	}
+
+	flash_cdev->brightness = lm3643_flash_br_setting;
+	lm3643_scale_flash_setting_microamps(&flash_cdev->brightness, led->chan->num_sources);
+	flash_cdev->timeout = lm3643_flash_time_setting;
+	flash_cdev->ops = &lm3643_flash_ops;
+
+	led_cdev->flags |= LED_DEV_CAP_FLASH;
+	led_cdev->max_brightness = LM3643_TORCH_BR_CDEV_MAX;
+	led_cdev->brightness_set_blocking = lm3643_torch_set_brightness;
+	led_cdev->brightness_get = lm3643_torch_get_brightness;
+
+	ret = lm3643_apply_fw_limits(dev, led, fwnode);
+	if (ret)
+		return ret;
+
+	torch_max_brightness = led_cdev->max_brightness;
+
+	flash_cdev->brightness.max = min(flash_cdev->brightness.max, LM3643_FLASH_BR_UA_TOTAL_MAX);
+	flash_cdev->brightness.val = min(flash_cdev->brightness.val, flash_cdev->brightness.max);
+	flash_cdev->timeout.val = min(flash_cdev->timeout.val, flash_cdev->timeout.max);
+
+	ret = lm3643_flash_brightness_set(flash_cdev, flash_cdev->brightness.val);
+	if (ret)
+		return ret;
+
+	ret = devm_led_classdev_flash_register_ext(dev, flash_cdev, &init_data);
+	if (ret)
+		return ret;
+
+	if (led_cdev->max_brightness > torch_max_brightness) {
+		dev_warn(dev, "max-brightness %u not supported (using %u)\n",
+			 led_cdev->max_brightness,
+			 torch_max_brightness);
+		led_cdev->max_brightness = torch_max_brightness;
+	}
+
+	return lm3643_register_v4l2(dev, led, fwnode);
+}
+
+static int lm3643_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct lm3643 *chip;
+	unsigned int dev_id;
+	unsigned int count;
+	int ret;
+
+	count = device_get_child_node_count(dev);
+	if (!count || count > LM3643_NUM_CHANNELS)
+		return dev_err_probe(dev, -EINVAL, "%u LED nodes found, expected 1 to %d\n",
+					 count, LM3643_NUM_CHANNELS);
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+	i2c_set_clientdata(client, chip);
+
+	chip->regmap = devm_regmap_init_i2c(client, &lm3643_regmap_config);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(dev,
+				     PTR_ERR(chip->regmap),
+				     "failed to allocate register map\n");
+
+	ret = regmap_read(chip->regmap, LM3643_REG_DEV_ID, &dev_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read device ID\n");
+
+	dev_id &= LM3643_DEV_ID_MASK;
+	if (dev_id != LM3643_DEV_ID)
+		return dev_err_probe(dev, -ENODEV, "wrong chip id 0x%02x (expected 0x%02x)\n",
+					 dev_id, LM3643_DEV_ID);
+
+	ret = devm_mutex_init(dev, &chip->lock);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to create mutex\n");
+
+	ret = regmap_write(chip->regmap, LM3643_REG_ENABLE, LM3643_MODE_STANDBY);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to put device in standby mode\n");
+	ret = devm_add_action_or_reset(dev, lm3643_standby, chip->regmap);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(chip->regmap, LM3643_REG_TORCH_BR_LED1,
+				 LM3643_TORCH_BR_LED2_OVERRIDE,
+				 0);
+	if (ret)
+		return dev_err_probe(dev,
+				     ret,
+				     "failed to clear LED2 torch current override register\n");
+
+	ret = regmap_update_bits(chip->regmap, LM3643_REG_FLASH_BR_LED1,
+				 LM3643_FLASH_BR_LED2_OVERRIDE,
+				 0);
+	if (ret)
+		return dev_err_probe(dev,
+				     ret,
+				     "failed to clear LED2 flash current override register\n");
+
+	device_for_each_child_node_scoped(dev, child) {
+		ret = lm3643_register_led(dev, chip, child);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct acpi_device_id lm3643_acpi_leds_match[] = {
+	{ "TXNW3643" },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, lm3643_acpi_leds_match);
+
+static const struct of_device_id lm3643_of_leds_match[] = {
+	{ .compatible = "ti,lm3643" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm3643_of_leds_match);
+
+static struct i2c_driver lm3643_i2c_driver = {
+	.driver = {
+		.name = "lm3643",
+		.acpi_match_table = lm3643_acpi_leds_match,
+		.of_match_table = lm3643_of_leds_match,
+	},
+	.probe = lm3643_probe,
+};
+module_i2c_driver(lm3643_i2c_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LM3643 LED Flash Driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Rillian Grant <rillian.grant@gmail.com>");
-- 
2.55.0

