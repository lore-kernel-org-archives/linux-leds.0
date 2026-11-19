Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067894;
	b=bzZBC26cAIroI/0evUzeJ15FsZ9UMIeSgKwU4B9AL1QQDvnJjOI7icwkeRg/JiAJgRUg
	 m8lUflIiAHNOjX/MG/+QBRJj8lOv57uOTrgxHuMr+mQPm+GO0k1MinaVOH4feTGhUahxr
	 H4x/DO08kbHT5XyWc0ACJPeL3e6MmqZhluiMnFv0OYVxOm8nmLA+AeMdQjij8iPGi4EVZ
	 J34NEW8pp1YIblPBkRNDEtvCbfB5gjGs2Tw46pOsa5BkyYsabtDZZj7TX5OuAaxMoFGVo
	 RR9VV2Ymw9T5p0Q97S0IkvsM5oiXxDMVo/Nn4WSlj5rDTJdWx9EjKMecy9xL++Rut0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NW0o/fKpAP6eqkWdYAeUYPYSbuDzMQd9LKu3FG8wtNA=;
	b=Zc9A4bi6IbkYigiKLGA1XGWRypW0m+sut7f1ugstNLPUAW2x61gzc6SPC3kuayD2egDY
	 bTvb63DkDI2bDLJhsswRXsVBEx743rb7cgcWlIIpaCeVB6IyvquZnkdnSmWq4FLXTe1Pp
	 Nbe+j5Ih9ihyo3unpjUAfWbx5+pCMQwo65khEmPqop1eVICqxYmeKyx6oMEVeDkfyBXg4
	 LTUtdNR17nX5AOEg+vN2fD3fns/et7Hcg7+EgtQlZyeaJXbQgAXG3ZlHXsEq881PunPaM
	 D3Ttuk7mwD8gqpETrrPnMRn6GBYIe2+bdKjZ8Gb/qQoK6/2WBgRXMwe9KZthxxo1w6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=of7GCxBF;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2732A606A320
	for <linux-leds@vger.kernel.org>; Thu, 19 Nov 2026 05:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2732A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=of7GCxBF
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 59DF83F529
	for <linux-leds@vger.kernel.org>; Thu, 19 Nov 2026 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795067890;
	bh=NW0o/fKpAP6eqkWdYAeUYPYSbuDzMQd9LKu3FG8wtNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=of7GCxBFsfqBfmNurwJOuWFOXb8MgdYDAO81qJfL9pJD+Z0GknzBhYvIvuZWl5w1s
	 RgyutkzkuJFcz9CUIWflSY73dgnjS5osh5gxEWsB/KoeV5m7tw0OZtVksODRxRGd3a
	 4ZHrkI8/3PiAiDItBrYHxYSLto117Y5vBS3eZs9GZMIw05PuwXYMMWNwZz/qej2tBM
	 rxzzxKa6eFSf0rPZvIXtbORzjzO1iFgS2GWLZBVfueikhGQ5heSpUgVZHNHgsuHNbh
	 jaIqbXb5cUoZOQrz0HwWj5qEXnsmvFzvNyvpl7Y+xOKEobI8ML+/WvWYcMwriZhqRc
	 kG/Ze2rzxvO2vrTkiCZRLmqKVI8MeAhgx1oV+rGWh3YeqcF+WvCxLHZ8BzJgNBs6C+
	 U96F8/a8i7k3w+eT30PclCXPrQg7rNvqFd59Ah3n9Fx0EbF/94E6jm4S0aCo0de2Hu
	 tSDzRLOdCG97jFanoR3zrJp3WzKcy8AbozoXD3POjYM69NLyGX0HZLD/1mQeIsZmO8
	 mAbu0TH1UEW2bh2w8tfe/jn2AoJFcvVeXpRLQgPMzVxdti6NT4GUWHTtPAYvutHrQ+
	 YjXJdqaY6Rx22uprECi8RGYIa0FFIydnAqvDHpCGzEnOi+V3tkZWWjbpEyywwvKiBJ
	 ZUZc1V2Gy2OuSuipfHSlFv2I=
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so1362378b3a.0
        for <linux-leds@vger.kernel.org>; Wed, 18 Nov 2026 21:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067888; x=1795672688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NW0o/fKpAP6eqkWdYAeUYPYSbuDzMQd9LKu3FG8wtNA=;
        b=uzSI9VtY1lX42SZJecd0LB52w6lG+hCOM3/J0z5eb0D0fdJQlYDk+ZjXqVuyBi7XgD
         /7nR4tQ8xxdDSkSdpjrYMlPSzqDYKNEFRAFNOdrC2pf6I5QxFJ7UmelkTG76Or1vAEUU
         mBVykLY8EGJ+x4iV8SXQRXIxnWhRUroQUA3dkk25iS4CkrYhHxbBiV76LBFdvOw16l1u
         MvIHzlDyl7N3GGCnkd0Qgrn/8qKtPvzSmIUmJmYL8CKAPrRoMM9gGRt/Z1yGCju+vsf0
         Je7zaX/IhrmAtdnpWWoo7lnZI9f5teSueomxHpLUZVtpuRG2AZOrlt1vB6FVB86aafLa
         Jwsw==
X-Forwarded-Encrypted: i=1; AL+hErFDagVn5kPls/TzsBD8o4eNHgemeZ9erIEm2USHDr5typOvYtmAaLYDc2QaFdSCH3QWNTittYzuN87p@vger.kernel.org
X-Gm-Message-State: APuU4Z9J5mri5MdjnzPmoBK7J8/WpLjAvdW/yjh1acK9ftcRT75tQXxV
	DrgHD71j/YAch5ikbIRk8aUUiYBnNi4qMIxFeSmK7JRO7aZ4bbOv5fAzj6Q10oyN625uhQiGKmm
	QIyPOxo49Ffr7eOCnntChpt9UOKlM4rejBGytG4NRNhKuIAq33J/G2k1CKatBut9xgXeNd7CVjk
	3CqI0=
X-Gm-Gg: AYBFou1jqC9geNZMxTq2vfjsXi8j6fMAi4B2KTafKbzUMMc6UZW1P1ngKxocTH/HrIC
	PTmzSK85R4DDs7u3ACp2/+BBd+oDPOCwtwm+Sr8d4ZxR2HfIlok6KqhX0yCvTLhIlqZcl3uXQNN
	850+izU5vAzz6TJObDt/10A3pOdEpj7WpMDehzTpz1CoKu3BjlGLvLOIZYbBJBEzjlUTTuMq0z0
	cifoVWgcBj2NxpRu3wiRY5bi0BgAbyQSb37CvGVJ9noWeORjN3n4bPcWdxMQi4Hh8P9o87u060R
	hH9sc9HnFsZ9HeXtfrr/ngO0up/A+h8/1L3uJZAc9Dh2xuaiLhJscBS8P7eYJy1LNVVwjlDCVap
	Iwwi+LNDKyaUZWlOgZOdD1erT34sOxupVntPfp8GcYYgowouL7Xyx57UikEei687SIZ59pw8TLK
	8N+2brfb2eR1q6pgHFM0JZOQFACiF7drtkZRkErYsWK91xa7cGmhl1EkKpoyORHzYB
X-Received: by 2002:a05:6a00:6ca5:b0:878:34d7:699e with SMTP id d2e1a72fcca58-8c5d4fb2236mr4427897b3a.46.1795067888413;
        Wed, 18 Nov 2026 21:58:08 -0800 (PST)
X-Received: by 2002:a05:6a00:6ca5:b0:878:34d7:699e with SMTP id d2e1a72fcca58-8c5d4fb2236mr4427878b3a.46.1795067887911;
        Wed, 18 Nov 2026 21:58:07 -0800 (PST)
Received: from localhost.localdomain (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aaaccsm2207456b3a.11.2026.11.18.21.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:58:07 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] leds: rt712: add mute/mic-mute LED driver for RT712 SoundWire codecs
Date: Thu, 19 Nov 2026 13:57:55 +0800
Message-ID: <20261119055755.1714527-1-chris.chiu@canonical.com>
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

Some laptops wire the mute and mic mute LEDs to GPIO3 and GPIO4 of an
RT712 SoundWire codec, which the rt712-sdca driver exports as a
gpiochip. Nothing drives these LEDs on Linux today.

Add a small LED driver that registers a "mute" and a "micmute" LED
class device on top of those GPIOs, using the audio-mute and
audio-micmute default triggers so that the ALSA control LED layer
updates them.

The GPIO numbers are board specific and are read from the following
integer properties in the SDCA function expansion node of the codec
(mipi-sdca-function-expansion-subproperties):

  realtek,mic-mute-led-pin        RT712 GPIO number (3 or 4)
  realtek,speaker-mute-led-pin    RT712 GPIO number (3 or 4)
  realtek,mute-led-active-low     optional, LEDs are lit by driving the
                                  GPIO low

The driver does not load when the properties are missing or invalid, so
it has no effect on machines that do not describe these LEDs.

The module carries the SoundWire alias of the RT712 family and is
autoloaded when such a codec is enumerated. The GPIOs are described
with a gpiod lookup table for the "rt712-sdca" chip and requested with
devm_gpiod_get(), which defers the probe until the codec has registered
its gpiochip, so the load order does not matter.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 MAINTAINERS               |   6 +
 drivers/leds/Kconfig      |  15 +++
 drivers/leds/Makefile     |   1 +
 drivers/leds/leds-rt712.c | 264 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 drivers/leds/leds-rt712.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 503b4c4586a4..7d7f8ebadb77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14868,6 +14868,12 @@ F:	drivers/leds/
 F:	include/dt-bindings/leds/
 F:	include/linux/leds.h
 
+LEDS RT712 DRIVER
+M:	Chris Chiu <chris.chiu@canonical.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	drivers/leds/leds-rt712.c
+
 LEGO MINDSTORMS EV3
 R:	David Lechner <david@lechnology.com>
 S:	Maintained
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d3182236be..49e1b6fc4a5b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1042,6 +1042,21 @@ config LEDS_ACER_A500
 	  This option enables support for the Power Button LED of
 	  Acer Iconia Tab A500.
 
+config LEDS_RT712
+	tristate "RT712 mute/mic-mute LED driver"
+	depends on LEDS_CLASS && GPIOLIB && SOUNDWIRE
+	help
+	  This option enables support for the mute and mic-mute LEDs
+	  wired to the GPIOs of an RT712 SoundWire codec.
+
+	  It registers the platform::mute and platform::micmute LEDs, which
+	  follow the audio-mute and audio-micmute triggers. The GPIO numbers
+	  are read from the codec's firmware properties, so the driver only
+	  loads on machines that describe these LEDs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-rt712.
+
 source "drivers/leds/blink/Kconfig"
 
 comment "Flash and Torch LED drivers"
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index a68244bd50fb..f5f10211df94 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
 
 # LED Blink
 obj-y					+= blink/
+obj-$(CONFIG_LEDS_RT712) 		+= leds-rt712.o
 
 # Simatic LED drivers
 obj-y					+= simatic/
diff --git a/drivers/leds/leds-rt712.c b/drivers/leds/leds-rt712.c
new file mode 100644
index 000000000000..98c9c0de224d
--- /dev/null
+++ b/drivers/leds/leds-rt712.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RT712 mute/mic-mute LED class driver
+ *
+ * The LEDs are wired to the GPIOs exported by the rt712-sdca codec. The module
+ * is autoloaded through the SoundWire alias when an RT712 family codec is
+ * enumerated. The GPIO numbers come from the firmware properties
+ * "realtek,mic-mute-led-pin" and "realtek,speaker-mute-led-pin" (and the
+ * optional "realtek,mute-led-active-low") in the SDCA function expansion node;
+ * without them the driver does not load. They are described with a gpiod
+ * lookup table and probe relies on -EPROBE_DEFER until the "rt712-sdca"
+ * gpiochip shows up, so the load order does not matter.
+ */
+
+#include <dt-bindings/leds/common.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+
+#define RT712_LED_DEV_NAME	"leds-rt712"
+#define RT712_GPIOCHIP_LABEL	"rt712-sdca"
+
+/* The codec driver exposes GPIO3 and GPIO4 as gpiochip lines 0 and 1 */
+#define RT712_GPIO_FIRST_PIN	3
+#define RT712_GPIO_NUM		2
+
+#define RT712_EXT_NODE		"mipi-sdca-function-expansion-subproperties"
+#define RT712_MICMUTE_PROP	"realtek,mic-mute-led-pin"
+#define RT712_MUTE_PROP		"realtek,speaker-mute-led-pin"
+#define RT712_ACTIVE_LOW_PROP	"realtek,mute-led-active-low"
+
+struct rt712_led {
+	struct led_classdev cdev;
+	struct gpio_desc *gpiod;
+};
+
+static int rt712_led_set(struct led_classdev *led_cdev,
+			 enum led_brightness value)
+{
+	struct rt712_led *led = container_of(led_cdev, struct rt712_led, cdev);
+
+	return gpiod_set_value_cansleep(led->gpiod, value ? 1 : 0);
+}
+
+static int rt712_led_create(struct device *dev, struct rt712_led *led,
+			    const char *con_id, const char *label,
+			    const char *trigger)
+{
+	struct led_init_data init_data = {
+		.devicename = "platform",
+		.default_label = label,
+	};
+	int ret;
+
+	led->gpiod = devm_gpiod_get(dev, con_id, GPIOD_OUT_LOW);
+	if (IS_ERR(led->gpiod)) {
+		int err = PTR_ERR(led->gpiod);
+
+		if (err == -EPROBE_DEFER)
+			dev_dbg(dev, "gpio '%s': gpiochip not ready, deferring\n",
+				con_id);
+		else
+			dev_err(dev, "gpio '%s': lookup failed: %d\n", con_id, err);
+		return err;
+	}
+
+	dev_dbg(dev, "gpio '%s' found\n", con_id);
+
+	led->cdev.max_brightness = 1;
+	led->cdev.brightness_set_blocking = rt712_led_set;
+	led->cdev.default_trigger = trigger;
+
+	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+	if (ret)
+		dev_err(dev, "failed to register LED %s: %d\n", label, ret);
+	else
+		dev_dbg(dev, "registered LED %s\n", led->cdev.name);
+
+	return ret;
+}
+
+static int rt712_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rt712_led *leds;
+	int ret;
+
+	leds = devm_kcalloc(dev, 2, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	/* devm_gpiod_get() returns -EPROBE_DEFER until the gpiochip exists */
+	ret = rt712_led_create(dev, &leds[0], "mute", ":" LED_FUNCTION_MUTE,
+			       "audio-mute");
+	if (ret)
+		return ret;
+
+	ret = rt712_led_create(dev, &leds[1], "micmute", ":" LED_FUNCTION_MICMUTE,
+			       "audio-micmute");
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct platform_driver rt712_led_driver = {
+	.probe = rt712_led_probe,
+	.driver = {
+		.name = RT712_LED_DEV_NAME,
+	},
+};
+
+/* Line numbers and polarity are filled in from the firmware properties */
+static struct gpiod_lookup_table rt712_led_gpio_table = {
+	.dev_id = RT712_LED_DEV_NAME,
+	.table = {
+		GPIO_LOOKUP_IDX(RT712_GPIOCHIP_LABEL, 0, "micmute", 0, 0),
+		GPIO_LOOKUP_IDX(RT712_GPIOCHIP_LABEL, 0, "mute", 0, 0),
+		{ }
+	},
+};
+
+/*
+ * Never bound to; only used so that the module is autoloaded when one of these
+ * SoundWire codecs is enumerated.
+ */
+static const struct sdw_device_id rt712_led_sdw_id[] = {
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x712, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x713, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x716, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x717, 0x3, 0x1, 0),
+	{ }
+};
+MODULE_DEVICE_TABLE(sdw, rt712_led_sdw_id);
+
+static int rt712_led_match_slave(struct device *dev, const void *data)
+{
+	const struct sdw_device_id *id;
+	struct sdw_slave *slave;
+
+	if (!is_sdw_slave(dev))
+		return 0;
+
+	slave = dev_to_sdw_dev(dev);
+	for (id = rt712_led_sdw_id; id->mfg_id; id++)
+		if (slave->id.mfg_id == id->mfg_id &&
+		    slave->id.part_id == id->part_id)
+			return 1;
+
+	return 0;
+}
+
+static int rt712_led_read_pin(struct device *dev, struct fwnode_handle *ext,
+			     const char *prop, u16 *line)
+{
+	u32 pin;
+	int ret;
+
+	ret = fwnode_property_read_u32(ext, prop, &pin);
+	if (ret) {
+		dev_dbg(dev, "missing property %s: %d\n", prop, ret);
+		return ret;
+	}
+
+	if (pin < RT712_GPIO_FIRST_PIN ||
+	    pin >= RT712_GPIO_FIRST_PIN + RT712_GPIO_NUM) {
+		dev_err(dev, "%s: unsupported GPIO %u\n", prop, pin);
+		return -EINVAL;
+	}
+
+	*line = pin - RT712_GPIO_FIRST_PIN;
+	return 0;
+}
+
+/* Get the LED GPIO numbers from the SDCA function expansion node */
+static int rt712_led_read_firmware(struct device *dev)
+{
+	struct fwnode_handle *ext;
+	unsigned long flags;
+	int ret = -ENOENT;
+
+	device_for_each_child_node_scoped(dev, fn) {
+		ext = fwnode_get_named_child_node(fn, RT712_EXT_NODE);
+		if (!ext)
+			continue;
+
+		ret = rt712_led_read_pin(dev, ext, RT712_MICMUTE_PROP,
+					 &rt712_led_gpio_table.table[0].chip_hwnum);
+		if (!ret)
+			ret = rt712_led_read_pin(dev, ext, RT712_MUTE_PROP,
+						 &rt712_led_gpio_table.table[1].chip_hwnum);
+
+		flags = fwnode_property_read_bool(ext, RT712_ACTIVE_LOW_PROP) ?
+			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
+		rt712_led_gpio_table.table[0].flags = flags;
+		rt712_led_gpio_table.table[1].flags = flags;
+		fwnode_handle_put(ext);
+		break;
+	}
+
+	return ret;
+}
+
+static struct platform_device *rt712_led_pdev;
+
+static int __init rt712_led_init(void)
+{
+	struct device *slave;
+	int ret;
+
+	slave = bus_find_device(&sdw_bus_type, NULL, NULL, rt712_led_match_slave);
+	if (!slave)
+		return -ENODEV;
+	ret = rt712_led_read_firmware(slave);
+	put_device(slave);
+	if (ret) {
+		pr_info("leds-rt712: no LED GPIO properties in firmware\n");
+		return -ENODEV;
+	}
+
+	gpiod_add_lookup_table(&rt712_led_gpio_table);
+
+	ret = platform_driver_register(&rt712_led_driver);
+	if (ret)
+		goto err_table;
+
+	/* Probe is deferred until the rt712-sdca gpiochip is registered */
+	rt712_led_pdev = platform_device_register_simple(RT712_LED_DEV_NAME,
+							 PLATFORM_DEVID_NONE,
+							 NULL, 0);
+	if (IS_ERR(rt712_led_pdev)) {
+		ret = PTR_ERR(rt712_led_pdev);
+		goto err_driver;
+	}
+
+	return 0;
+
+err_driver:
+	platform_driver_unregister(&rt712_led_driver);
+err_table:
+	gpiod_remove_lookup_table(&rt712_led_gpio_table);
+	return ret;
+}
+
+static void __exit rt712_led_exit(void)
+{
+	platform_device_unregister(rt712_led_pdev);
+	platform_driver_unregister(&rt712_led_driver);
+	gpiod_remove_lookup_table(&rt712_led_gpio_table);
+}
+
+module_init(rt712_led_init);
+module_exit(rt712_led_exit);
+
+MODULE_AUTHOR("Chris Chiu <chris.chiu@canonical.com>");
+MODULE_DESCRIPTION("RT712 mute/mic-mute LED class driver");
+MODULE_ALIAS("platform:" RT712_LED_DEV_NAME);
+MODULE_LICENSE("GPL");
-- 
2.43.0

