Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163024322E7
	for <linux-leds@vger.kernel.org>; Mon,  3 Aug 2026 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790229; cv=none; b=J2MX4bmeYsIsm9jNG7aqeybCYUr7za26v6z8Ua/NqROtrwXjuctNp2NeaNLLeG5uD6LkE/YZ5f0otM4Pf6H1d3xj0NwsKDc4zh2juMgMvXiPdXWrmLjsVRgprcNPzPfzxfU0V52E44OvsYmLiznlEHlild9czuV3JugxRDGJ08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790229; c=relaxed/simple;
	bh=E6AIf4QTV+f9CymIs34y9i6oz54pEi/ksj5d4y9J3rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTtD4UwSYw9JpsyjfKqLQ8OhY7sHI7guxWD1lKrMldGiGKQ49yTcR1HhvwPevzYHVNScWcbijGVAH9znQrC/gcQftiG4N4uRxIhA3FUSwIhatlgRrDilqO7QeTQypNznYGUZFQQSn7W3A/QA1o6Cr70wpLOlRP57DLsSH+AQ6xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfOLdiZ1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfOLdiZ1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3053120a12.2
        for <linux-leds@vger.kernel.org>; Mon, 03 Aug 2026 13:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790226; x=1786395026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJVZwJQnFx3Bw+TQgOysVbru6CqjE8f7xqxUI0NqoII=;
        b=UfOLdiZ1ToG9Xo1TB/ahW291H+wnScr9/XEtEVhk5vAT176HmBhYF17qAVwT0PFHDD
         hH6EjTfqAcO9fQ8ymMdyWsoIL6+gpcKJijeMvWjzSITe0Q1tCI4SNsrxpclDL36zD9sU
         ancCzL4BOQDMPp2Gy0QKOSCfInE+9ztWeL++/4BsA4f1VL9cRNuv3aVKfqdtgxSUy9tw
         5OpmlR/exDVVgD1d4F1o5EiFgCzkNWiocYxGISzDrJHpjuNoCYxniyEJygmncWMQ6G6r
         OPkeXjLMR1WMYRBFEqP2yz8Y741g6Ic6+934ha4mDeMrkKILhnpZTp+fmEiZOnzKtCdP
         vtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790226; x=1786395026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJVZwJQnFx3Bw+TQgOysVbru6CqjE8f7xqxUI0NqoII=;
        b=a+JwFrrO1l/QNC9OmLYaHwRDp6jzQ/y4jtDwEBJ+sUwWDgNQlGzefhPruq1keTlpgV
         jXAjgLOqudfruoaoNxEWqa77Fq9goGBk06WfGGYt227zwE4rNdsZfZoMYrQB7jGmWDvh
         /O7hdjF47N+Br8BM51dFJAxHk5m1wVhI6Jn1MPRgFs4epFSnoY/j80twovSyVxcFlr7S
         LVwfYakL9gr1SybfygmtBnwdXcLXOPpCQVgmgNizYFUlzzlfSEEsYUDDNwH/txY1v8/9
         wFxkXTBCxJ2xWsjmuFiQUjhMeu0ce5lfyt5iMibvFNnIk1GW4d4EmTwSIHBxTeUrXuQb
         AyYg==
X-Gm-Message-State: AOJu0YwFIJgOD8o+9tF/nR2kI3WnDq9yGQz5gCIMpcHo5So8g8YEX62o
	cZd5ufw/CwfN5f2jLsx1eEVd8GM4kV9YUOVuUrIfYUxakuaX0oQ4ZuoKTOlv7X/F
X-Gm-Gg: AR+sD10vngkqhkbX+uULlcp6ewRtK74D0M07GnpPqkRoZqdc9U1JwfHgJQqlxTdLhbW
	EgmbO44c5v4aKfLeI/qzeJzHo0O/8j8oRSD7y+53t3PXMs8QO9HmZ4MtgSuaRJd8McexIBjA4NG
	kis86By2vo+Te7BoNiAVwT84OktZ0U3vq+35ngzyYQehcWLsTCM8Q1h6azrgfZcSBx4lmG+Ued7
	fwMVnuP/89pxTLQnwnBlezeNIRHj/XfO6SOl9JvrKW+L0T+kExVqRYeizZAVTRVDPgTd+iGUYEx
	dVzDfs5hZbCUqwCae0pvct+dUp6zNq/PblTI1TOGHNwB2rrMu/ncM9WQAl1o+8Ngh0VdmoCw8uW
	2KoSqeBM36yIqMY7vf1iWmiNC1PSFh1edOYwWy7NWYF9a2SRTJ1BwNvgNY+x3abbOBfZvqHtB/i
	Eyq/t9gYfUuaYWDF7hrFzRyzbZzhryMPnz12vMVYuC13N4tvLbrhCb9cy2PVP0jOP2njE=
X-Received: by 2002:a05:6a20:734c:b0:3c0:b3f7:e5e5 with SMTP id adf61e73a8af0-3c92a52c2cbmr10819802637.25.1785790226338;
        Mon, 03 Aug 2026 13:50:26 -0700 (PDT)
Received: from Mac.net ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm33112324c88.11.2026.08.03.13.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Aug 2026 13:50:24 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next v2 2/6] leds: rgb: Add IS32FL3207 controller driver
Date: Mon,  3 Aug 2026 13:50:07 -0700
Message-ID: <20260803205011.1249-3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260803205011.1249-1-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a generic I2C driver for the Lumissil IS32FL3207 18-channel
LED controller.

Expose individual and multicolor LEDs through the LED class. Use the
default 8-bit 62 kHz PWM mode, derive output current from RISET, and
enforce each output current limit with the scaling registers. Honor
initial brightness and retained shutdown state. Handle an optional
supply and enable GPIO, and serialize controller-wide update latches.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 MAINTAINERS                        |   1 +
 drivers/leds/rgb/Kconfig           |  11 +
 drivers/leds/rgb/Makefile          |   1 +
 drivers/leds/rgb/leds-is32fl3207.c | 580 +++++++++++++++++++++++++++++
 4 files changed, 593 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 744296f1c..8f2386fd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13833,6 +13833,7 @@ M:	Ahmad Byagowi <ahmadexp@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
+F:	drivers/leds/rgb/leds-is32fl3207.c
 
 IT87 HARDWARE MONITORING DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 6e9ab5f60..c896be131 100644
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
index cc0f2df66..228923e8b 100644
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
index 000000000..08843da96
--- /dev/null
+++ b/drivers/leds/rgb/leds-is32fl3207.c
@@ -0,0 +1,580 @@
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
+		ret = fwnode_property_read_u32(fwnode, "max-brightness", &value);
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
+				     "failed to read channel for %pfw\n", fwnode);
+
+	if (reg >= IS32FL3207_NUM_CHANNELS)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "channel %u is out of range\n", reg);
+
+	if (test_bit(reg, chip->channels))
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "channel %u is used more than once\n", reg);
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
+					     "invalid single LED color %u\n", color);
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
+	return devm_led_classdev_register_ext(chip->dev, &led->cdev, &init_data);
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
+				     "invalid multicolor LED color %u\n", group_color);
+
+	ret = fwnode_property_read_u32(fwnode, "reg", &group_reg);
+	if (ret)
+		return dev_err_probe(chip->dev, ret,
+				     "failed to read group index for %pfw\n", fwnode);
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
+					     "invalid component color %u\n", color);
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
+static int is32fl3207_hw_init(struct is32fl3207 *chip)
+{
+	u8 scaling[IS32FL3207_NUM_CHANNELS];
+	u8 pwm[2 * IS32FL3207_NUM_CHANNELS] = { };
+	int ret;
+
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
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_CONTROL,
+			   IS32FL3207_CONTROL_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(chip->regmap, IS32FL3207_REG_GLOBAL_CURRENT,
+			   IS32FL3207_GLOBAL_CURRENT_MAX);
+	if (ret)
+		return ret;
+
+	memset(scaling, 0xff, sizeof(scaling));
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
+	return regmap_write(chip->regmap, IS32FL3207_REG_PWM_UPDATE, 0);
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
+	struct is32fl3207 *chip;
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
+	chip = devm_kzalloc(dev, struct_size(chip, leds, count), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = dev;
+	chip->num_leds = count;
+	i2c_set_clientdata(client, chip);
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
+	chip->output_max_microamp = div_u64(IS32FL3207_CURRENT_NUMERATOR,
+					    riset_ohms);
+	if (!chip->output_max_microamp)
+		return dev_err_probe(dev, -EINVAL,
+				     "RISET value %u is too large\n", riset_ohms);
+
+	ret = devm_regulator_get_enable_optional(dev, "vcc");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable VCC regulator\n");
+
+	chip->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(chip->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(chip->enable_gpio),
+				     "failed to get enable GPIO\n");
+
+	if (chip->enable_gpio)
+		usleep_range(1000, 2000);
+
+	chip->regmap = devm_regmap_init_i2c(client, &is32fl3207_regmap_config);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(dev, PTR_ERR(chip->regmap),
+				     "failed to allocate register map\n");
+
+	ret = devm_mutex_init(dev, &chip->lock);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, is32fl3207_disable, chip);
+	if (ret)
+		return ret;
+
+	ret = is32fl3207_hw_init(chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize controller\n");
+
+	device_for_each_child_node_scoped(dev, child) {
+		struct is32fl3207_led *led = &chip->leds[i];
+
+		if (fwnode_get_child_node_count(child))
+			ret = is32fl3207_register_multicolor(chip, child, led);
+		else
+			ret = is32fl3207_register_single(chip, child, led);
+		if (ret)
+			return ret;
+
+		i++;
+	}
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

