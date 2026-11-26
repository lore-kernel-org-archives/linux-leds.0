Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718887;
	b=VqMpJvFRNAkm6lUg5CmcpUWEbwQKi0oO3I9ES2erGSMqmkG8Hm0T6SQQq+htNkn/A5TL
	 6Pjxfp40z4OJ/sshyYrzQYz9R2HQE92cLnNBy3NyBPFqtpgbo4c2UrrGPUw21TBj6nMy6
	 omHyTnRR2v2dcgoIWNHlA/yBdocdVweQaoU+KsDNXsYwy1Y5szzpeqfpIf0N7dQkz6+BN
	 4LhvhANNtSqpUq0NKPuam1fLnjzMn7pSOZPAgGI/Tp7gelASx2ByyW7VudKJWf3FuEsBf
	 7YPC4FRrdQevjIRH35vvQ+YAQesF8pyFjKxlVYpjBQlIlIckOh8dJ9k+phbhH3l3iUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718887;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=nol5pKXi7YDkbDxUDvy8lNNyVqglwSUlxVt4W9w4vPU=;
	b=1bzKw/fM/dozGJk96qBr7RDdjka7nTPL82y2ljL7Lz8m6BBSaPNEBGG2aU/mxORe+3WB
	 /RAZgrQV+zNhk3OQ+8JN/pzkYr6tsTQS9Jr0FGzkyxpL3AN7cSuJS1axqoGnaFr/s0U8G
	 aoWd7QzzhXf0OoO/H84PwPerrqboN7x5Ia8O6xosYBOlJxlo4rMgRhWptdr/Vc+YFJYn5
	 MKxnkUfkrbB+K+wJqzUVPt3x4mjv0px7M7szd4yqq4qmZdEZZfnZBBRGxBuPXpKQwlKqA
	 ZXkBOuT+GUBI5if80JkORgA7kLSKIthXSvYIXtJFZYxdzVNlI2ySftF07qr+KoncLOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4JfDjOC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088E606A31C;
	Thu, 26 Nov 2026 18:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4JfDjOC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE1D1F000D8;
	Thu, 26 Nov 2026 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718886;
	bh=nol5pKXi7YDkbDxUDvy8lNNyVqglwSUlxVt4W9w4vPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d4JfDjOCIIvRpEv2KR/lAXuXk4pFo4ENdYj5wYajXHwtptSK0cL18DZqnwFXct3sW
	 SLwNPC9275/tAGohXS9kSdE+SegE8bEWRL+bsMHXk8WhU62otJ5s0nUCyPdskavVjS
	 SulhtlmEK+7PGuby1sHRK8PSeF5wn5S6O8dniphfjZCWLeSDe6IbMKlGJXMU4/jB+j
	 y6ud++MkHSFd7npSPnlbMzSvO5WkJLApJyAokLTiYytso+DKElNUrAsJ+nqNByqMpl
	 7C4aQrFMcZwQ5Ycrd0VPnyPCy3CGwUaKh1L8zaiVnuk+BiFOTEFu4HV2MMa/oFlqYF
	 EZz3OSopMRr8A==
Date: Thu, 26 Nov 2026 18:48:03 +0000
From: Lee Jones <lee@kernel.org>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: pavel@kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: rt712: add mute/mic-mute LED driver for RT712
 SoundWire codecs
Message-ID: <179510255621.63755.6529158187960204851@kernel.org>
References: <20261119055755.1714527-1-chris.chiu@canonical.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119055755.1714527-1-chris.chiu@canonical.com>
X-AI-Review-Draft: <20261119055755.1714527-1-chris.chiu@canonical.com>

On Thu, 19 Nov 2026, Chris Chiu wrote:

> Some laptops wire the mute and mic mute LEDs to GPIO3 and GPIO4 of an
> RT712 SoundWire codec, which the rt712-sdca driver exports as a
> gpiochip. Nothing drives these LEDs on Linux today.
>
> Add a small LED driver that registers a "mute" and a "micmute" LED
> class device on top of those GPIOs, using the audio-mute and
> audio-micmute default triggers so that the ALSA control LED layer
> updates them.
>
> The GPIO numbers are board specific and are read from the following
> integer properties in the SDCA function expansion node of the codec
> (mipi-sdca-function-expansion-subproperties):
>
>   realtek,mic-mute-led-pin        RT712 GPIO number (3 or 4)
>   realtek,speaker-mute-led-pin    RT712 GPIO number (3 or 4)
>   realtek,mute-led-active-low     optional, LEDs are lit by driving the
>                                   GPIO low
>
> The driver does not load when the properties are missing or invalid, so
> it has no effect on machines that do not describe these LEDs.
>
> The module carries the SoundWire alias of the RT712 family and is
> autoloaded when such a codec is enumerated. The GPIOs are described
> with a gpiod lookup table for the "rt712-sdca" chip and requested with
> devm_gpiod_get(), which defers the probe until the codec has registered
> its gpiochip, so the load order does not matter.
>
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> ---
>  MAINTAINERS               |   6 +
>  drivers/leds/Kconfig      |  15 +++
>  drivers/leds/Makefile     |   1 +
>  drivers/leds/leds-rt712.c | 264 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 286 insertions(+)
>  create mode 100644 drivers/leds/leds-rt712.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 503b4c4586a4..7d7f8ebadb77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14868,6 +14868,12 @@ F:	drivers/leds/
>  F:	include/dt-bindings/leds/
>  F:	include/linux/leds.h
>
> +LEDS RT712 DRIVER
> +M:	Chris Chiu <chris.chiu@canonical.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +F:	drivers/leds/leds-rt712.c
> +
>  LEGO MINDSTORMS EV3
>  R:	David Lechner <david@lechnology.com>
>  S:	Maintained
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d0d3182236be..49e1b6fc4a5b 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1042,6 +1042,21 @@ config LEDS_ACER_A500
>  	  This option enables support for the Power Button LED of
>  	  Acer Iconia Tab A500.
>
> +config LEDS_RT712
> +	tristate "RT712 mute/mic-mute LED driver"
> +	depends on LEDS_CLASS && GPIOLIB && SOUNDWIRE
> +	help
> +	  This option enables support for the mute and mic-mute LEDs
> +	  wired to the GPIOs of an RT712 SoundWire codec.
> +
> +	  It registers the platform::mute and platform::micmute LEDs, which
> +	  follow the audio-mute and audio-micmute triggers. The GPIO numbers
> +	  are read from the codec's firmware properties, so the driver only
> +	  loads on machines that describe these LEDs.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-rt712.
> +
>  source "drivers/leds/blink/Kconfig"
>
>  comment "Flash and Torch LED drivers"
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index a68244bd50fb..f5f10211df94 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -124,6 +124,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
>
>  # LED Blink
>  obj-y					+= blink/
> +obj-$(CONFIG_LEDS_RT712) 		+= leds-rt712.o
>
>  # Simatic LED drivers
>  obj-y					+= simatic/
> diff --git a/drivers/leds/leds-rt712.c b/drivers/leds/leds-rt712.c
> new file mode 100644
> index 000000000000..98c9c0de224d
> --- /dev/null
> +++ b/drivers/leds/leds-rt712.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RT712 mute/mic-mute LED class driver
> + *
> + * The LEDs are wired to the GPIOs exported by the rt712-sdca codec. The module
> + * is autoloaded through the SoundWire alias when an RT712 family codec is
> + * enumerated. The GPIO numbers come from the firmware properties
> + * "realtek,mic-mute-led-pin" and "realtek,speaker-mute-led-pin" (and the
> + * optional "realtek,mute-led-active-low") in the SDCA function expansion node;
> + * without them the driver does not load. They are described with a gpiod
> + * lookup table and probe relies on -EPROBE_DEFER until the "rt712-sdca"
> + * gpiochip shows up, so the load order does not matter.
> + */
> +
> +#include <dt-bindings/leds/common.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +
> +#define RT712_LED_DEV_NAME	"leds-rt712"
> +#define RT712_GPIOCHIP_LABEL	"rt712-sdca"

Nope.  Use the raw strings.

> +/* The codec driver exposes GPIO3 and GPIO4 as gpiochip lines 0 and 1 */
> +#define RT712_GPIO_FIRST_PIN	3
> +#define RT712_GPIO_NUM		2
> +
> +#define RT712_EXT_NODE		"mipi-sdca-function-expansion-subproperties"
> +#define RT712_MICMUTE_PROP	"realtek,mic-mute-led-pin"
> +#define RT712_MUTE_PROP		"realtek,speaker-mute-led-pin"
> +#define RT712_ACTIVE_LOW_PROP	"realtek,mute-led-active-low"

As above.

> +struct rt712_led {
> +	struct led_classdev cdev;
> +	struct gpio_desc *gpiod;
> +};
> +
> +static int rt712_led_set(struct led_classdev *led_cdev,
> +			 enum led_brightness value)

Use 100-chars to prevent these wraps.

> +{
> +	struct rt712_led *led = container_of(led_cdev, struct rt712_led, cdev);
> +
> +	return gpiod_set_value_cansleep(led->gpiod, value ? 1 : 0);
> +}
> +
> +static int rt712_led_create(struct device *dev, struct rt712_led *led,
> +			    const char *con_id, const char *label,
> +			    const char *trigger)
> +{
> +	struct led_init_data init_data = {
> +		.devicename = "platform",
> +		.default_label = label,
> +	};
> +	int ret;
> +
> +	led->gpiod = devm_gpiod_get(dev, con_id, GPIOD_OUT_LOW);
> +	if (IS_ERR(led->gpiod)) {
> +		int err = PTR_ERR(led->gpiod);
> +
> +		if (err == -EPROBE_DEFER)
> +			dev_dbg(dev, "gpio '%s': gpiochip not ready, deferring\n",
> +				con_id);
> +		else
> +			dev_err(dev, "gpio '%s': lookup failed: %d\n", con_id, err);
> +		return err;

dev_err_probe() replaces all of this.

> +	}
> +
> +	dev_dbg(dev, "gpio '%s' found\n", con_id);

Please drop the development dev_dbg() calls throughout the driver.

> +
> +	led->cdev.max_brightness = 1;
> +	led->cdev.brightness_set_blocking = rt712_led_set;
> +	led->cdev.default_trigger = trigger;
> +
> +	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
> +	if (ret)
> +		dev_err(dev, "failed to register LED %s: %d\n", label, ret);
> +	else
> +		dev_dbg(dev, "registered LED %s\n", led->cdev.name);
> +
> +	return ret;
> +}
> +
> +static int rt712_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rt712_led *leds;
> +	int ret;
> +
> +	leds = devm_kcalloc(dev, 2, sizeof(*leds), GFP_KERNEL);

What's 2?  Please define all magic numbers.

> +	if (!leds)
> +		return -ENOMEM;
> +
> +	/* devm_gpiod_get() returns -EPROBE_DEFER until the gpiochip exists */

Where else do you see this kind of comment?

Is it helpful?

> +	ret = rt712_led_create(dev, &leds[0], "mute", ":" LED_FUNCTION_MUTE,

No magic numbers.  And using indexes like this is a red flag to me.

> +			       "audio-mute");

Unwrap, throughout.

> +	if (ret)
> +		return ret;
> +
> +	ret = rt712_led_create(dev, &leds[1], "micmute", ":" LED_FUNCTION_MICMUTE,
> +			       "audio-micmute");
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Stacked returns is also a red flag.  Why not just return ret?

> +}
> +
> +static struct platform_driver rt712_led_driver = {
> +	.probe = rt712_led_probe,
> +	.driver = {
> +		.name = RT712_LED_DEV_NAME,
> +	},
> +};
> +

I wouldn't expect to find much blow this.

Please reorder.

> +/* Line numbers and polarity are filled in from the firmware properties */
> +static struct gpiod_lookup_table rt712_led_gpio_table = {
> +	.dev_id = RT712_LED_DEV_NAME,
> +	.table = {
> +		GPIO_LOOKUP_IDX(RT712_GPIOCHIP_LABEL, 0, "micmute", 0, 0),
> +		GPIO_LOOKUP_IDX(RT712_GPIOCHIP_LABEL, 0, "mute", 0, 0),
> +		{ }
> +	},
> +};
> +
> +/*
> + * Never bound to; only used so that the module is autoloaded when one of these
> + * SoundWire codecs is enumerated.
> + */
> +static const struct sdw_device_id rt712_led_sdw_id[] = {
> +	SDW_SLAVE_ENTRY_EXT(0x025d, 0x712, 0x3, 0x1, 0),
> +	SDW_SLAVE_ENTRY_EXT(0x025d, 0x713, 0x3, 0x1, 0),
> +	SDW_SLAVE_ENTRY_EXT(0x025d, 0x716, 0x3, 0x1, 0),
> +	SDW_SLAVE_ENTRY_EXT(0x025d, 0x717, 0x3, 0x1, 0),
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(sdw, rt712_led_sdw_id);
> +
> +static int rt712_led_match_slave(struct device *dev, const void *data)
> +{
> +	const struct sdw_device_id *id;
> +	struct sdw_slave *slave;
> +
> +	if (!is_sdw_slave(dev))
> +		return 0;
> +
> +	slave = dev_to_sdw_dev(dev);
> +	for (id = rt712_led_sdw_id; id->mfg_id; id++)
> +		if (slave->id.mfg_id == id->mfg_id &&
> +		    slave->id.part_id == id->part_id)
> +			return 1;
> +
> +	return 0;
> +}
> +
> +static int rt712_led_read_pin(struct device *dev, struct fwnode_handle *ext,
> +			     const char *prop, u16 *line)
> +{
> +	u32 pin;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(ext, prop, &pin);
> +	if (ret) {
> +		dev_dbg(dev, "missing property %s: %d\n", prop, ret);
> +		return ret;
> +	}
> +
> +	if (pin < RT712_GPIO_FIRST_PIN ||
> +	    pin >= RT712_GPIO_FIRST_PIN + RT712_GPIO_NUM) {
> +		dev_err(dev, "%s: unsupported GPIO %u\n", prop, pin);
> +		return -EINVAL;
> +	}
> +
> +	*line = pin - RT712_GPIO_FIRST_PIN;
> +	return 0;
> +}
> +
> +/* Get the LED GPIO numbers from the SDCA function expansion node */
> +static int rt712_led_read_firmware(struct device *dev)
> +{
> +	struct fwnode_handle *ext;
> +	unsigned long flags;
> +	int ret = -ENOENT;
> +
> +	device_for_each_child_node_scoped(dev, fn) {
> +		ext = fwnode_get_named_child_node(fn, RT712_EXT_NODE);
> +		if (!ext)
> +			continue;
> +
> +		ret = rt712_led_read_pin(dev, ext, RT712_MICMUTE_PROP,
> +					 &rt712_led_gpio_table.table[0].chip_hwnum);
> +		if (!ret)
> +			ret = rt712_led_read_pin(dev, ext, RT712_MUTE_PROP,
> +						 &rt712_led_gpio_table.table[1].chip_hwnum);
> +
> +		flags = fwnode_property_read_bool(ext, RT712_ACTIVE_LOW_PROP) ?
> +			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> +		rt712_led_gpio_table.table[0].flags = flags;
> +		rt712_led_gpio_table.table[1].flags = flags;
> +		fwnode_handle_put(ext);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct platform_device *rt712_led_pdev;
> +
> +static int __init rt712_led_init(void)
> +{
> +	struct device *slave;
> +	int ret;
> +
> +	slave = bus_find_device(&sdw_bus_type, NULL, NULL, rt712_led_match_slave);
> +	if (!slave)
> +		return -ENODEV;
> +	ret = rt712_led_read_firmware(slave);
> +	put_device(slave);
> +	if (ret) {
> +		pr_info("leds-rt712: no LED GPIO properties in firmware\n");
> +		return -ENODEV;
> +	}
> +
> +	gpiod_add_lookup_table(&rt712_led_gpio_table);
> +
> +	ret = platform_driver_register(&rt712_led_driver);
> +	if (ret)
> +		goto err_table;
> +
> +	/* Probe is deferred until the rt712-sdca gpiochip is registered */
> +	rt712_led_pdev = platform_device_register_simple(RT712_LED_DEV_NAME,
> +							 PLATFORM_DEVID_NONE,
> +							 NULL, 0);
> +	if (IS_ERR(rt712_led_pdev)) {
> +		ret = PTR_ERR(rt712_led_pdev);
> +		goto err_driver;
> +	}
> +
> +	return 0;
> +
> +err_driver:
> +	platform_driver_unregister(&rt712_led_driver);
> +err_table:
> +	gpiod_remove_lookup_table(&rt712_led_gpio_table);
> +	return ret;
> +}
> +
> +static void __exit rt712_led_exit(void)
> +{
> +	platform_device_unregister(rt712_led_pdev);
> +	platform_driver_unregister(&rt712_led_driver);
> +	gpiod_remove_lookup_table(&rt712_led_gpio_table);
> +}
> +
> +module_init(rt712_led_init);

Things just went south real quick!

Is there a reason this needs to be a separate module and platform driver at all?
If this driver is built-in (CONFIG_LEDS_RT712=y), rt712_led_init() runs at
device_initcall() time, before SoundWire finishes enumerating the bus, so
bus_find_device() will return NULL and the LEDs will never be registered.  Even
as a module, spoofing someone else's MODULE_DEVICE_TABLE() to trigger
autoloading and then scanning sdw_bus_type from module_init() is not how the
driver model works.

Why doesn't the rt712-sdca codec driver (which already binds to the SoundWire
device, registers the gpiochip, and has direct access to its fwnode) either
register the 'leds-gpio' platform device / auxiliary device, or register the LED
class devices directly?

> +module_exit(rt712_led_exit);
> +
> +MODULE_AUTHOR("Chris Chiu <chris.chiu@canonical.com>");
> +MODULE_DESCRIPTION("RT712 mute/mic-mute LED class driver");
> +MODULE_ALIAS("platform:" RT712_LED_DEV_NAME);
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
>

-- 
Lee Jones
