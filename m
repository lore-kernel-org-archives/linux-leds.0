Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80516379993
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544251; cv=none; b=AVTLCrSc+ejZVlB4QNIxn6PzuEuBMYli5ecqTtS5SY+w17DYdNo1CFmVEUUiQARih//ja8N86plMn+1vju6GD72jBATkTWpSa7zAU5T8zxb5OPSBX2MhNF3VA+42u/u5HeWjwwBix6UoYkIVoJeURSk4jeKTQwKC0QBjRTcXvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544251; c=relaxed/simple;
	bh=Qzkt6ubFU7Lm5tN4JSKqFUKRqVdl0YbbtUDuGDG8ZSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PECQtHbiUKiPzkAh8swPGpO0cOybZ3fLtklWIcb6C84tTnTRMcY7pY+F2taVCKdEcbV2NLizaw/DGnT0GPlmcXwOmIdSmc1RVw2/sIh1Bkk1XLgbeEzv6vtIaavp41wbWVmFT/ac4kzJ7WF1PinO0kY79vgK8eOC0BeK5l37YZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMu4Iq7v; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMu4Iq7v"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1195588a91.3
        for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544245; x=1787149045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwleNJS62wayJ8G+qNlO/sozTmsgj8sqpxyjqe0c2qA=;
        b=IMu4Iq7v1xk+3c+Ma5HudBAUNqXLZuzZkchoKwo3v4mZJUemOAUBq5YbHatp7BYbx7
         ABTwAPV7vjGVxBjSQhYF2Z3d+OgOeYQlJw1GloE3m1UkrE/XF4XsQFcR18Y5BJYtml5d
         lPVqZEj9TtmdGq4fzh6FbfGvSiixF1IZr9MmyBJnMR9lMS2GXTRLWjnH4qa+oLl/zY1t
         OBRl85YJZ+JeH125vzo5hFFhBitX8S1Z5hNk05vqBcHYLXNSsPLSQPVisr1a4znz72mI
         FPa9axL7ugwEqnF3+l1HJ6++EB/GTqRRZtf+zxYzu+FjQC8XqaZJXEm1iEF4ScQB7QXj
         0sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544245; x=1787149045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwleNJS62wayJ8G+qNlO/sozTmsgj8sqpxyjqe0c2qA=;
        b=l+Z2aNf37VmBFxn2q3atWceWGwHJqK9AvKPbutoTl0UbokjYPJnJNI3BE5AGPcKPXL
         D2qGiN0HljonqbHgear08sSWqd7hT6PIaXcAsWKeBL+XdF05TB4D4M2PFt3ZJX2R9/CF
         Sdc80CkdkckjZqWJkswzis4lSogj18kXB+FhSyN3vBWTGnLFZMu6Pkj0uWGVUK/r/WAu
         JR5FyfPQ1T8C1UdyujTFtgk03F0x+KkpOJ5f0oiX/dD9KKhl1FmsJxg4JZTUgZtjblH3
         NJ6xWeE6IjYUMJ4tuhJJgJC2f7ecVThZQpm+F92LccFzBtvrznwk8nS/Dz8G1/FG8DO0
         gt+w==
X-Forwarded-Encrypted: i=1; AHgh+RpgvaLu1Qq/pc1Fgov8spZplfDrb0MDpp6NjwxrzZA0SxbxYSxKbcWpgz17esVi+O1YJU9Ua1DpQLbD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+RWjVnaAo7YtzBD1gcwXv6ixWOpkIDlHVk4Hsb+aW3F8J7BgZ
	ZE/PtdH0N0/DLEkpE1/ZnXwGyiFbrABpuvVZtJpI2gQWUSXzwv3eHPFC
X-Gm-Gg: AR+sD12wQjp/c0Ir8BXPeM9R9gGg7mgq8zy+H6nzvwtezF6Slu8cY/8vUzPNWUWcI1H
	FamYEnqrX/ooCmAicq2xlDmW8SplU6Mc4NbJz1VMCVzllvhLctqvE1xi29/orFCimmxSgHRDDaR
	hSJzBkeyLWeQaEJMvK6x8WX9xI3LDZVUi6cnxzRAJeNaFcXufH1GWKkymYcrIr+SkU62Hf0E68G
	I9BTc6HU5MoClA2RU5MmcY+i8UV6Rae1utGIBr+nNXRIUYpGIJJVTBiFt5oYB6OXRqGunGPJx+k
	iFr3w6jR68kbxb2YXkiO0AcfYS2Ku9Xqc8ncDE+mdl0nPjMbqARX079bmn6OrtljjnC+2fcXXjB
	1Tgq48NhRe9VY1h1tm7ilI+STyyMS0u9PUt4rqYNInhldk5gHXrY0aWxSHLjWCvMk3GIGfDOXz/
	dLU8Ny5Iiw/4hpB469VRypj4ktXSbkCWzftH18OtKo0JzPrZhdQCKNdmHDottoo9fP7XkDrGvsq
	lswIh03/tgX9SmHhZBgCtraNGIuW3aRS1ToL1c6FgEyyqdSKQ==
X-Received: by 2002:a17:90b:1dc5:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39301414638mr6246217a91.16.1786544244781;
        Wed, 12 Aug 2026 07:17:24 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf361d57asm11963071eec.6.2026.08.12.07.17.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 07:17:23 -0700 (PDT)
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
Subject: [PATCH net-next v4 2/5] leds: is32fl3207: Add controller driver
Date: Wed, 12 Aug 2026 07:17:12 -0700
Message-ID: <e51da989660502136ddd78779d74b170ad2dcf0e.1786543681.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786543681.git.ahmadexp@gmail.com>
References: <cover.1786543681.git.ahmadexp@gmail.com>
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
 drivers/leds/rgb/leds-is32fl3207.c | 691 +++++++++++++++++++++++++++++
 4 files changed, 704 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c

diff --git a/MAINTAINERS b/MAINTAINERS
index af4b63b9f1ef..0c101c54a5e2 100644
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
index 000000000000..42899b55fc59
--- /dev/null
+++ b/drivers/leds/rgb/leds-is32fl3207.c
@@ -0,0 +1,691 @@
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
+	/*
+	 * Registers remain accessible with SDB low. Clear retained scaling
+	 * before releasing hardware shutdown.
+	 */
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

