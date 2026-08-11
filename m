Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A0031714B
	for <linux-leds@vger.kernel.org>; Tue, 11 Aug 2026 05:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424574; cv=none; b=GH19xSx8u8D22kWWpzGgyO8nNkz+qkAMoaXr/bWwzeUZRKUKOeDpXg+Noyb7lBXFjbUzY/BfSa0M+1egUysOaia688IuRwOE5jqZQIdjm8ksYF6Wkr89ERMtbWma/eo/tdTm00ArkSVs28OZaYdJjAZuxvv07PBUojJHfYcXmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424574; c=relaxed/simple;
	bh=q7ufGzThYvQ+QPvF3VWLyr4ute/KEp4pqfm33v9nOyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WN6mD4TmShG/+AxHWIvg09BhxqpNIB1tP31R0uxju45YpD1y5HVc0rfQc88xN0Moq9qrRA/Xx9BdiTbXIfW+MNCP2YP7kgplQPlzrKw4ywdYtCNFOoeNWmpJGcnbh4Ldkr1P9BaJHzHaH95CcTN1+aa7QlokcokcCPB19j2tYUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moIMNzDK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moIMNzDK"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1991009a12.2
        for <linux-leds@vger.kernel.org>; Mon, 10 Aug 2026 22:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424570; x=1787029370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgZlVi6KLblhgttMabvW+gQZSSCrezqH9MroCV+FRE4=;
        b=moIMNzDKx7XeULXFyEb7/62ECuBcFyKiresfn5pUWhU+kzbD18R5+2fLPQp7U1tu8d
         tXMnGq5WbqhPgyh7qHsFHgYmhxfpLdNLZIKp6TmYrSL18nSPcmcP9RO6BHPUWU0icZ6l
         2fi8Q6yJxcM5aD9u5jZIy97DOuH61ZwFqLAMm5u82iIIdtvZyNEPg3LNqgk/n86Sdu79
         mU1Cbtw+Al1gM7k4pFJtB7RQA2u59xj4dN96KgrASE2G/rmmessp895FKPpKcoT+Mf1J
         Ri6ByZyCvViER+kGJZ3zTE5FNDqS7ZbBEmebLT3K72BSZDx/M9pdCkXFvTwyoSgJLCPN
         JZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424570; x=1787029370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgZlVi6KLblhgttMabvW+gQZSSCrezqH9MroCV+FRE4=;
        b=gb0ohmFiox1nGDfBOh42y/NViqFcoOMxXY0Nn3/dNLesMyfRAhFgWL3WB2Gm/Zgcm2
         0t/7v2wJpDTk4GbWE1nEkxgGOBH37KGb5i1+I2NPbznNoGiYlZmkaeXQ8mWkRhLNsYD3
         bdnuVsigUnNkM4Xc2Ymufbtp7E9+VgKmGN8odqplvxx6nX5vUCSQVdLtsdYuBS6UAXk3
         fIckecBs7bOPtHS9xxO+oJWlrfx6CmyIVND1O6LJo2Hz4eKDoSrXhCv3UUHMkwOcFYE4
         WN7R97P/tGOsSHgEE8v2uKXixy1raWfGE9YT5qfT2oVxO4tTQOZZY7R0rKU+SIyqwksO
         DVdg==
X-Forwarded-Encrypted: i=1; AHgh+RpgioZv+qaKTCZ0mTCwjDm9axhqACnc0ff3SLfN9/+QGzz0wNazL4dDKOfD46U6odJV47KGTTUVV03W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14sKWlgkAy4G42zKVHb/xSAvIdim+qYNcODwj/sIEN5S+zUMd
	EBLdtijBViWPrii1PwDTNlRqUZWBaNIyicrh/0PnD/7K93GSS6KFW9RW
X-Gm-Gg: AR+sD10u9plI07OPcTVv1EdtmdW9R7HvBwWpnOiIb0nflfeNKzpD+HJHpyz4DXNapkE
	zysNdySYkvWrmh/o/UGVEqNjgLM7zYGYPv6fCzHSbWezlS+YwEvmBxVvEjDGTZGzaNlzjvQ45Vx
	2xMJWHX1wd1uOm3BdT20hA84K3iJyXmA0RwIk1Dz2nLfRZ4iTuL2CDz97YTWiWcDg2gbC9tKj7m
	DASnTbbtAKhnvTMkVCfz3NYdDZIpwlaCkl8HQMDg1zi4HDJiuSyZzD/gWbhC4Dg2A7Wo8oJ8/VH
	ad1Y1GffU1e7Cq74FFHzmFI96ztJ/hLeOBwhhhql1+MGHqn1Px0vx8/91llal1faHg00WvuJhlR
	5Zd5PyI3lAqc0ICdz6HwQtjw9/8iUqK006hhLil6gUamrIoOLiLcX1Z0l2M5V92w8DssTkXDoof
	GmTcTqiQm/Q6vRmfZrviAGpC5BoG4LtVojlhwst+Ot3zkPbhNjMIuzGMa+xal+Ig99v1TizsjL1
	OQJrYtmlXurp5KAoLDJ3Cp6hhWDTxWKm1h6/rWUTiZeMMoMyg==
X-Received: by 2002:a05:6a20:4325:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3cc2b77a753mr1092126637.2.1786424570055;
        Mon, 10 Aug 2026 22:02:50 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619cf07dsm660421eec.4.2026.08.10.22.02.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 22:02:49 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v3 2/5] leds: is32fl3207: Add controller driver
Date: Mon, 10 Aug 2026 22:02:41 -0700
Message-ID: <0d99d91ced249e4eae7d06fc132a96f544f46598.1786423898.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786423898.git.ahmadexp@gmail.com>
References: <cover.1786423898.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an I2C driver for the Lumissil IS32FL3207 18-channel LED
controller.

Expose individual and multicolor LEDs through the LED class. Use the
default 8-bit, 62 kHz PWM mode, derive output current from RISET, and
enforce each output current limit with the scaling registers. Serialize
scaling, PWM, and controller-wide update operations.

Keep the controller shut down while clearing retained current settings,
resetting the device, and registering every LED. Enable outputs only
after all channel limits and initial brightness values are programmed.
Handle an optional supply and enable GPIO, and honor retained shutdown
state.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 MAINTAINERS                        |   1 +
 drivers/leds/rgb/Kconfig           |  11 +
 drivers/leds/rgb/Makefile          |   1 +
 drivers/leds/rgb/leds-is32fl3207.c | 687 +++++++++++++++++++++++++++++
 4 files changed, 700 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 85e19b1c46cf..ce4132a754d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13827,6 +13827,7 @@ M:	Ahmad Byagowi <ahmadexp@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
+F:	drivers/leds/rgb/leds-is32fl3207.c
 
 IT87 HARDWARE MONITORING DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 6e9ab5f60714..c896be1318dc 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -14,6 +14,17 @@ config LEDS_GROUP_MULTICOLOR
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-group-multicolor.
 
+config LEDS_IS32FL3207
+	tristate "LED support for ISSI IS32FL3207"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say Y here to include support for the Lumissil IS32FL3207
+	  18-channel I2C LED controller.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called leds-is32fl3207.
+
 config LEDS_KTD202X
 	tristate "LED support for KTD202x Chips"
 	depends on I2C
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index cc0f2df66286..228923e8bb11 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_LEDS_GROUP_MULTICOLOR)	+= leds-group-multicolor.o
+obj-$(CONFIG_LEDS_IS32FL3207)		+= leds-is32fl3207.o
 obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
 obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
 obj-$(CONFIG_LEDS_LP5860_CORE)		+= leds-lp5860-core.o
diff --git a/drivers/leds/rgb/leds-is32fl3207.c b/drivers/leds/rgb/leds-is32fl3207.c
new file mode 100644
index 000000000000..c4e4a114a16e
--- /dev/null
+++ b/drivers/leds/rgb/leds-is32fl3207.c
@@ -0,0 +1,687 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ISSI IS32FL3207 LED controller driver
+ *
+ * Copyright 2026 Ahmad Byagowi
+ */
+
+#include <linux/bitmap.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/string.h>
+
+#include <dt-bindings/leds/common.h>
+
+#define IS32FL3207_NUM_CHANNELS		18
+#define IS32FL3207_MAX_BRIGHTNESS	255
+
+#define IS32FL3207_REG_CONTROL		0x00
+#define IS32FL3207_REG_PWM_LOW(channel)	(0x01 + 2 * (channel))
+#define IS32FL3207_REG_PWM_UPDATE	0x49
+#define IS32FL3207_REG_SCALING(channel)	(0x4a + (channel))
+#define IS32FL3207_REG_GLOBAL_CURRENT	0x6e
+#define IS32FL3207_REG_RESET		0x7f
+
+#define IS32FL3207_CONTROL_ENABLE	BIT(0)
+#define IS32FL3207_GLOBAL_CURRENT_MAX	0xff
+
+/* IOUT(MAX) in microamperes = 76,500,000 / RISET in ohms. */
+#define IS32FL3207_CURRENT_NUMERATOR	76500000ULL
+
+struct is32fl3207;
+
+struct is32fl3207_led {
+	struct is32fl3207 *chip;
+	struct led_classdev *led_cdev;
+	union {
+		struct led_classdev cdev;
+		struct led_classdev_mc mcdev;
+	};
+	unsigned int channel;
+};
+
+struct is32fl3207 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct gpio_desc *enable_gpio;
+	struct mutex lock; /* Serializes controller register updates. */
+	unsigned long channels[BITS_TO_LONGS(IS32FL3207_NUM_CHANNELS)];
+	u32 output_max_microamp;
+	unsigned int num_leds;
+	struct is32fl3207_led leds[] __counted_by(num_leds);
+};
+
+static int is32fl3207_parse_led_properties(struct is32fl3207 *chip,
+					   struct fwnode_handle *fwnode,
+					   unsigned int *max_brightness,
+					   unsigned int *brightness)
+{
+	enum led_default_state default_state;
+	u32 value;
+	int ret;
+
+	*max_brightness = IS32FL3207_MAX_BRIGHTNESS;
+	if (fwnode_property_present(fwnode, "max-brightness")) {
+		ret = fwnode_property_read_u32(fwnode, "max-brightness",
+					       &value);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "failed to read maximum brightness for %pfw\n",
+					     fwnode);
+		if (!value || value > IS32FL3207_MAX_BRIGHTNESS)
+			return dev_err_probe(chip->dev, -EINVAL,
+					     "invalid maximum brightness %u for %pfw\n",
+					     value, fwnode);
+
+		*max_brightness = value;
+	}
+
+	value = *max_brightness;
+	if (fwnode_property_present(fwnode, "default-brightness")) {
+		ret = fwnode_property_read_u32(fwnode, "default-brightness",
+					       &value);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "failed to read default brightness for %pfw\n",
+					     fwnode);
+		if (value > *max_brightness)
+			return dev_err_probe(chip->dev, -EINVAL,
+					     "invalid default brightness %u for %pfw\n",
+					     value, fwnode);
+	}
+
+	default_state = led_init_default_state_get(fwnode);
+	if (default_state == LEDS_DEFSTATE_KEEP)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "default state keep is not supported for %pfw\n",
+				     fwnode);
+
+	*brightness = default_state == LEDS_DEFSTATE_ON ? value : LED_OFF;
+	return 0;
+}
+
+static int is32fl3207_validate_component(struct is32fl3207 *chip,
+					 struct fwnode_handle *fwnode)
+{
+	static const char * const unsupported[] = {
+		"default-brightness",
+		"default-state",
+		"max-brightness",
+		"retain-state-shutdown",
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(unsupported); i++)
+		if (fwnode_property_present(fwnode, unsupported[i]))
+			return dev_err_probe(chip->dev, -EINVAL,
+					     "%s is not supported for component %pfw\n",
+					     unsupported[i], fwnode);
+
+	return 0;
+}
+
+static int is32fl3207_write_channels(struct is32fl3207 *chip,
+				     const struct mc_subled *subleds,
+				     unsigned int num_channels)
+{
+	unsigned int i;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	for (i = 0; i < num_channels; i++) {
+		ret = regmap_write(chip->regmap,
+				   IS32FL3207_REG_PWM_LOW(subleds[i].channel),
+				   subleds[i].brightness);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_write(chip->regmap, IS32FL3207_REG_PWM_UPDATE, 0);
+}
+
+static int is32fl3207_brightness_set(struct led_classdev *cdev,
+				     enum led_brightness brightness)
+{
+	struct is32fl3207_led *led = container_of(cdev, struct is32fl3207_led,
+						     cdev);
+	struct mc_subled subled = {
+		.brightness = brightness,
+		.channel = led->channel,
+	};
+
+	return is32fl3207_write_channels(led->chip, &subled, 1);
+}
+
+static int is32fl3207_mc_brightness_set(struct led_classdev *cdev,
+					enum led_brightness brightness)
+{
+	struct led_classdev_mc *mcdev = lcdev_to_mccdev(cdev);
+	struct is32fl3207_led *led = container_of(mcdev, struct is32fl3207_led,
+						     mcdev);
+
+	led_mc_calc_color_components(mcdev, brightness);
+
+	return is32fl3207_write_channels(led->chip, mcdev->subled_info,
+					    mcdev->num_colors);
+}
+
+static int is32fl3207_configure_channel(struct is32fl3207 *chip,
+					struct fwnode_handle *fwnode,
+					unsigned int *channel)
+{
+	u64 scaling;
+	u32 max_microamp;
+	u32 reg;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "reg", &reg);
+	if (ret)
+		return dev_err_probe(chip->dev, ret,
+				     "failed to read channel for %pfw\n",
+				     fwnode);
+
+	if (reg >= IS32FL3207_NUM_CHANNELS)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "channel %u is out of range\n", reg);
+
+	if (test_bit(reg, chip->channels))
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "channel %u is used more than once\n",
+				     reg);
+
+	ret = fwnode_property_read_u32(fwnode, "led-max-microamp",
+				       &max_microamp);
+	if (ret)
+		return dev_err_probe(chip->dev, ret,
+				     "failed to read current limit for channel %u\n",
+				     reg);
+
+	if (!max_microamp || max_microamp > chip->output_max_microamp)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "invalid current limit %u uA for channel %u\n",
+				     max_microamp, reg);
+
+	/* GCC is fixed at 0xff, so use each output's scaling register. */
+	scaling = div_u64((u64)max_microamp * 256 * 256,
+			  (u64)chip->output_max_microamp *
+			  IS32FL3207_GLOBAL_CURRENT_MAX);
+	if (!scaling)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "current limit %u uA is below channel %u resolution\n",
+				     max_microamp, reg);
+
+	scaling = min_t(u64, scaling, 0xff);
+
+	guard(mutex)(&chip->lock);
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_SCALING(reg),
+			   (unsigned int)scaling);
+	if (ret)
+		return ret;
+
+	set_bit(reg, chip->channels);
+	*channel = reg;
+
+	return 0;
+}
+
+static int is32fl3207_register_single(struct is32fl3207 *chip,
+				      struct fwnode_handle *fwnode,
+				      struct is32fl3207_led *led)
+{
+	struct led_init_data init_data = {
+		.devicename = dev_name(chip->dev),
+		.devname_mandatory = true,
+		.fwnode = fwnode,
+	};
+	unsigned int max_brightness;
+	unsigned int brightness;
+	u32 color;
+	int ret;
+
+	if (!fwnode_property_present(fwnode, "function") &&
+	    !fwnode_property_present(fwnode, "color"))
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "single LED %pfw requires function or color\n",
+				     fwnode);
+
+	ret = is32fl3207_parse_led_properties(chip, fwnode,
+					      &max_brightness, &brightness);
+	if (ret)
+		return ret;
+
+	if (fwnode_property_present(fwnode, "color")) {
+		ret = fwnode_property_read_u32(fwnode, "color", &color);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "failed to read color for %pfw\n",
+					     fwnode);
+		if (color >= LED_COLOR_ID_MAX || color == LED_COLOR_ID_MULTI ||
+		    color == LED_COLOR_ID_RGB)
+			return dev_err_probe(chip->dev, -EINVAL,
+					     "invalid single LED color %u\n",
+					     color);
+	}
+
+	ret = is32fl3207_configure_channel(chip, fwnode, &led->channel);
+	if (ret)
+		return ret;
+	led->chip = chip;
+	led->led_cdev = &led->cdev;
+	led->cdev.brightness = brightness;
+	led->cdev.max_brightness = max_brightness;
+	led->cdev.brightness_set_blocking = is32fl3207_brightness_set;
+
+	ret = is32fl3207_brightness_set(&led->cdev, brightness);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register_ext(chip->dev, &led->cdev,
+					      &init_data);
+}
+
+static int is32fl3207_register_multicolor(struct is32fl3207 *chip,
+					  struct fwnode_handle *fwnode,
+					  struct is32fl3207_led *led)
+{
+	struct led_init_data init_data = {
+		.devicename = dev_name(chip->dev),
+		.devname_mandatory = true,
+		.fwnode = fwnode,
+	};
+	struct mc_subled *subleds;
+	DECLARE_BITMAP(color_map, LED_COLOR_ID_MAX);
+	unsigned int max_brightness;
+	unsigned int brightness;
+	unsigned int count;
+	unsigned int i = 0;
+	u32 group_color;
+	u32 group_reg;
+	unsigned int first_channel = IS32FL3207_NUM_CHANNELS;
+	int ret;
+
+	ret = is32fl3207_parse_led_properties(chip, fwnode,
+					      &max_brightness, &brightness);
+	if (ret)
+		return ret;
+
+	ret = fwnode_property_read_u32(fwnode, "color", &group_color);
+	if (ret)
+		return dev_err_probe(chip->dev, ret,
+				     "failed to read color for %pfw\n", fwnode);
+
+	if (group_color != LED_COLOR_ID_RGB &&
+	    group_color != LED_COLOR_ID_MULTI)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "invalid multicolor LED color %u\n",
+				     group_color);
+
+	ret = fwnode_property_read_u32(fwnode, "reg", &group_reg);
+	if (ret)
+		return dev_err_probe(chip->dev, ret,
+				     "failed to read group index for %pfw\n",
+				     fwnode);
+
+	count = fwnode_get_child_node_count(fwnode);
+	if (!count || count > LED_COLOR_ID_MAX)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "invalid component count %u for %pfw\n",
+				     count, fwnode);
+
+	subleds = devm_kcalloc(chip->dev, count, sizeof(*subleds), GFP_KERNEL);
+	if (!subleds)
+		return -ENOMEM;
+	bitmap_zero(color_map, LED_COLOR_ID_MAX);
+
+	fwnode_for_each_child_node_scoped(fwnode, child) {
+		u32 color;
+
+		ret = is32fl3207_validate_component(chip, child);
+		if (ret)
+			return ret;
+
+		ret = fwnode_property_read_u32(child, "color", &color);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "failed to read color for %pfw\n",
+					     child);
+
+		if (color >= LED_COLOR_ID_MAX || color == LED_COLOR_ID_MULTI ||
+		    color == LED_COLOR_ID_RGB)
+			return dev_err_probe(chip->dev, -EINVAL,
+					     "invalid component color %u\n",
+					     color);
+		if (test_and_set_bit(color, color_map))
+			return dev_err_probe(chip->dev, -EINVAL,
+					     "component color %u is used more than once\n",
+					     color);
+
+		ret = is32fl3207_configure_channel(chip, child,
+						   &subleds[i].channel);
+		if (ret)
+			return ret;
+
+		subleds[i].color_index = color;
+		subleds[i].intensity = max_brightness;
+		subleds[i].max_intensity = 0;
+		first_channel = min(first_channel, subleds[i].channel);
+		i++;
+	}
+
+	if (group_reg != first_channel)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "group index %u does not match first channel %u\n",
+				     group_reg, first_channel);
+
+	led->chip = chip;
+	led->led_cdev = &led->mcdev.led_cdev;
+	led->mcdev.num_colors = count;
+	led->mcdev.subled_info = subleds;
+	led->mcdev.led_cdev.brightness = brightness;
+	led->mcdev.led_cdev.max_brightness = max_brightness;
+	led->mcdev.led_cdev.brightness_set_blocking =
+		is32fl3207_mc_brightness_set;
+
+	led_mc_calc_color_components(&led->mcdev, brightness);
+
+	ret = is32fl3207_write_channels(chip, subleds, count);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_multicolor_register_ext(chip->dev, &led->mcdev,
+						     &init_data);
+}
+
+static int is32fl3207_register_led(struct is32fl3207 *chip,
+				   struct fwnode_handle *fwnode,
+				   struct is32fl3207_led *led)
+{
+	unsigned int count = fwnode_get_child_node_count(fwnode);
+	bool has_color = fwnode_property_present(fwnode, "color");
+	u32 color = LED_COLOR_ID_MAX;
+	int ret;
+
+	if (has_color) {
+		ret = fwnode_property_read_u32(fwnode, "color", &color);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "failed to read color for %pfw\n",
+					     fwnode);
+	}
+
+	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI) {
+		if (!count)
+			return dev_err_probe(chip->dev, -EINVAL,
+					     "multicolor LED %pfw has no components\n",
+					     fwnode);
+
+		return is32fl3207_register_multicolor(chip, fwnode, led);
+	}
+
+	if (count)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "single LED %pfw must not have components\n",
+				     fwnode);
+
+	return is32fl3207_register_single(chip, fwnode, led);
+}
+
+static int is32fl3207_prepare_reset(struct is32fl3207 *chip)
+{
+	u8 scaling[IS32FL3207_NUM_CHANNELS] = { };
+	int ret;
+
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_CONTROL, 0);
+	if (ret)
+		return ret;
+
+	return regmap_bulk_write(chip->regmap,
+				 IS32FL3207_REG_SCALING(0), scaling,
+				 sizeof(scaling));
+}
+
+static int is32fl3207_hw_init(struct is32fl3207 *chip)
+{
+	u8 scaling[IS32FL3207_NUM_CHANNELS] = { };
+	u8 pwm[2 * IS32FL3207_NUM_CHANNELS] = { };
+	int disable_ret;
+	int ret;
+
+	/* Reset requires normal operation (SSD = 1). */
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_CONTROL,
+			   IS32FL3207_CONTROL_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_RESET, 0);
+	if (ret)
+		return ret;
+	usleep_range(200, 300);
+
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_CONTROL, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_GLOBAL_CURRENT,
+			   IS32FL3207_GLOBAL_CURRENT_MAX);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(chip->regmap, IS32FL3207_REG_SCALING(0),
+				scaling, sizeof(scaling));
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(chip->regmap, IS32FL3207_REG_PWM_LOW(0), pwm,
+				sizeof(pwm));
+	if (ret)
+		return ret;
+
+	/* PWM data can be latched only in normal operation. */
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_CONTROL,
+			   IS32FL3207_CONTROL_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_PWM_UPDATE, 0);
+	disable_ret = regmap_write(chip->regmap, IS32FL3207_REG_CONTROL, 0);
+
+	return ret ?: disable_ret;
+}
+
+static int is32fl3207_enable(struct is32fl3207 *chip)
+{
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_CONTROL,
+			   IS32FL3207_CONTROL_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_PWM_UPDATE, 0);
+	if (ret)
+		regmap_write(chip->regmap, IS32FL3207_REG_CONTROL, 0);
+
+	return ret;
+}
+
+static void is32fl3207_disable(void *data)
+{
+	struct is32fl3207 *chip = data;
+
+	guard(mutex)(&chip->lock);
+	regmap_write(chip->regmap, IS32FL3207_REG_CONTROL, 0);
+	if (chip->enable_gpio)
+		gpiod_set_value_cansleep(chip->enable_gpio, 0);
+}
+
+static const struct regmap_config is32fl3207_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = IS32FL3207_REG_RESET,
+};
+
+static int is32fl3207_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct is32fl3207 *ddata;
+	unsigned int count;
+	unsigned int i = 0;
+	u32 riset_ohms;
+	int ret;
+
+	count = device_get_child_node_count(dev);
+	if (!count || count > IS32FL3207_NUM_CHANNELS)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid LED count %u\n", count);
+
+	ddata = devm_kzalloc(dev, struct_size(ddata, leds, count), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->dev = dev;
+	ddata->num_leds = count;
+	i2c_set_clientdata(client, ddata);
+
+	ret = device_property_read_u32(dev, "issi,riset-ohms", &riset_ohms);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read RISET value\n");
+
+	if (riset_ohms < 2000)
+		return dev_err_probe(dev, -EINVAL,
+				     "RISET value %u is below 2000 ohms\n",
+				     riset_ohms);
+
+	ddata->output_max_microamp = div_u64(IS32FL3207_CURRENT_NUMERATOR,
+					     riset_ohms);
+	if (!ddata->output_max_microamp)
+		return dev_err_probe(dev, -EINVAL,
+				     "RISET value %u is too large\n",
+				     riset_ohms);
+
+	ddata->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(ddata->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(ddata->enable_gpio),
+				     "failed to get enable GPIO\n");
+
+	ddata->regmap = devm_regmap_init_i2c(client,
+					     &is32fl3207_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(dev, PTR_ERR(ddata->regmap),
+				     "failed to allocate register map\n");
+
+	ret = devm_mutex_init(dev, &ddata->lock);
+	if (ret)
+		return ret;
+
+	ret = devm_regulator_get_enable_optional(dev, "vcc");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret,
+				     "failed to enable VCC regulator\n");
+
+	ret = devm_add_action_or_reset(dev, is32fl3207_disable, ddata);
+	if (ret)
+		return ret;
+
+	/* Let VCC settle while SDB keeps the outputs disabled. */
+	usleep_range(1000, 2000);
+
+	ret = is32fl3207_prepare_reset(ddata);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to prepare controller reset\n");
+
+	if (ddata->enable_gpio)
+		gpiod_set_value_cansleep(ddata->enable_gpio, 1);
+
+	/* Allow the SDB release and I2C interface reset to settle. */
+	usleep_range(1000, 2000);
+
+	ret = is32fl3207_hw_init(ddata);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to initialize controller\n");
+
+	device_for_each_child_node_scoped(dev, child) {
+		struct is32fl3207_led *led = &ddata->leds[i];
+
+		ret = is32fl3207_register_led(ddata, child, led);
+		if (ret)
+			return ret;
+
+		i++;
+	}
+
+	ret = is32fl3207_enable(ddata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable controller\n");
+
+	return 0;
+}
+
+static void is32fl3207_shutdown(struct i2c_client *client)
+{
+	struct is32fl3207 *chip = i2c_get_clientdata(client);
+	bool retain_state = false;
+	unsigned int i;
+
+	for (i = 0; i < chip->num_leds; i++)
+		if (chip->leds[i].led_cdev->flags & LED_RETAIN_AT_SHUTDOWN) {
+			retain_state = true;
+			break;
+		}
+
+	if (!retain_state) {
+		is32fl3207_disable(chip);
+		return;
+	}
+
+	for (i = 0; i < chip->num_leds; i++) {
+		struct led_classdev *cdev = chip->leds[i].led_cdev;
+
+		if (cdev->flags & LED_RETAIN_AT_SHUTDOWN)
+			continue;
+		if (cdev->flags & LED_MULTI_COLOR)
+			is32fl3207_mc_brightness_set(cdev, LED_OFF);
+		else
+			is32fl3207_brightness_set(cdev, LED_OFF);
+	}
+}
+
+static const struct of_device_id is32fl3207_of_match[] = {
+	{ .compatible = "issi,is32fl3207" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, is32fl3207_of_match);
+
+static const struct i2c_device_id is32fl3207_id[] = {
+	{ .name = "is32fl3207" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, is32fl3207_id);
+
+static struct i2c_driver is32fl3207_driver = {
+	.driver = {
+		.name = "is32fl3207",
+		.of_match_table = is32fl3207_of_match,
+	},
+	.probe = is32fl3207_probe,
+	.shutdown = is32fl3207_shutdown,
+	.id_table = is32fl3207_id,
+};
+module_i2c_driver(is32fl3207_driver);
+
+MODULE_AUTHOR("Ahmad Byagowi <ahmadexp@gmail.com>");
+MODULE_DESCRIPTION("Lumissil IS32FL3207 LED controller driver");
+MODULE_LICENSE("GPL");
-- 
2.50.1 (Apple Git-155)

