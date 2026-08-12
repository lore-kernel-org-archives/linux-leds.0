Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C37435514;
	Wed, 12 Aug 2026 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534851; cv=none; b=XCLdj7AlIwYrIx5rEA8lWNts5EP91/26ehizkc9KMXkEps4S7Z4l6NrF/8NXH5E6wQDNOjaoBykjFdQ57m+Qc0O57J065Oqqhdtk6KjZEoxuKdkiE+kYXBClC4VlW9QQ+pH1B4x941VcH8zliK7sib76wpwG/g/SUWmwk3Bjsjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534851; c=relaxed/simple;
	bh=s9ecsXvZspbcIH0MOAKsmnnJboSudDwoSRPNibzr7qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRJ6ReD7FMITuEAoYJxQeJzozfbmsoKijJHrDGtdl5VobALf6axvuTUoiSg0FPhORU40/IBdv+YwQ45yxLB97X00i+vqhc0WiP6c8zn0Wgo+yEL6OAD3YPrfqFk1+a9pUFW4TbS3hVhTsD66MrQjaPeT4Qy1FrP9qmaDS3rvvsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hm9z4iOn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hm9z4iOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDFD1F000E9;
	Wed, 12 Aug 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786534849;
	bh=8VQt5g5EK+0NgQYi2J/IzMhuZY4HLl1nyngFuxLnKMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hm9z4iOnWGoJsmiV5wAAPsT+r75+cOVvJNXhRLflvx0D11m1z/IgK8510YOVjfGZt
	 yGPemO6pJWmOpCenDV83VB4zVaVLBnRoDTJcRqprP4KKigkukbxy+KxUdDidg7yHER
	 3CnvEEm6116LYce7sbDDzJbkAniL1ZpDQU63M2vFCU2BUGkoASURIxe5XUFP93eb/e
	 fmLx3nHXf92evRlV3yw+aYVbZBLwqQ1WtApUockXXxkvz/nL8mfuRGYEBCjSfiitok
	 vGx7myWElSMeryyalMtlRc56OXFSxx2OHCtqSFi0eAwhzB5zx2O6flccDlKzcB2H4p
	 ngwy9lZ0QvnRg==
Date: Wed, 12 Aug 2026 12:40:45 +0100
From: Lee Jones <lee@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v9 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Message-ID: <20260812114045.GK1072730@google.com>
References: <20260806-upstream-ltc3208-v9-0-c746e872c193@analog.com>
 <20260806-upstream-ltc3208-v9-2-c746e872c193@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-upstream-ltc3208-v9-2-c746e872c193@analog.com>

On Thu, 06 Aug 2026, Jan Carlo Roleda wrote:

> Kernel driver implementation for LTC3208 Multidisplay LED Driver.
> 
> The LTC3208 is a Multi-display LED driver, designed to control up to
> 7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN, BLUE),
> each configurable with its own current level that is equally set to its
> respective output current source pins for external LEDs.
> 
> It is programmed via the I2C serial interface.
> MAIN and SUB support 8-bit current level resolution,
> while AUX, CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.
> 
> The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
> channel current levels, or as its own independent AUX channel.
> 
> The CAM LED channel is configured as 2 separate CAMHI and CAMLO register
> sub-channels, which current is selected via the CAMHL pin, or set to
> CAMHI register only via setting the S_CAMHILO bit high in register G (0x7).
> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/leds/Kconfig        |  12 +++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-ltc3208.c | 231 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 245 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fd6ffdaaf04..e3b59485ecb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> +F:	drivers/leds/leds-ltc3208.c
>  
>  LTC4282 HARDWARE MONITOR DRIVER
>  M:	Nuno Sa <nuno.sa@analog.com>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c870..d917ce3b72f4 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1028,6 +1028,18 @@ config LEDS_ACER_A500
>  	  This option enables support for the Power Button LED of
>  	  Acer Iconia Tab A500.
>  
> +config LEDS_LTC3208
> +	tristate "LED Driver for Analog Devices LTC3208"
> +	depends on LEDS_CLASS && I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y to enable the LTC3208 LED driver.
> +	  This enables the LED device LTC3208, a 7-channel, 17-current source
> +	  multidisplay high-current LED driver, configured via I2C.

multi-display ?

> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called ltc3208.
> +
>  source "drivers/leds/blink/Kconfig"
>  
>  comment "Flash and Torch LED drivers"
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 7db3768912ca..0148b87e16ba 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
>  obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
>  obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
>  obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
> +obj-$(CONFIG_LEDS_LTC3208)		+= leds-ltc3208.o
>  obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
>  obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
>  obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
> diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> new file mode 100644
> index 000000000000..25b49e24ca08
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3208.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED driver for Analog Devices LTC3208 Multi-Display Driver
> + *
> + * Copyright 2026 Analog Devices Inc.
> + *
> + * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> + *

Remove this line.

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitmap.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +/* Registers */
> +#define LTC3208_REG_A_GRNRED		0x1 /* Green and Red current DAC */

I'm not agasint the comments, but can we tab them out beyond the values.

> +#define LTC3208_REG_B_AUXBLU		0x2 /* AUX and Blue current DAC */
> +#define LTC3208_REG_C_MAIN		0x3 /* Main current DAC */

Is this the nomenclature used in the datasheet or can me improve them?

> +#define LTC3208_REG_D_SUB		0x4 /* Sub current DAC */
> +#define LTC3208_REG_E_AUX_SELECT	0x5 /* AUX DAC Select */
> +#define  LTC3208_AUX1_MASK		GENMASK(1, 0)
> +#define  LTC3208_AUX2_MASK		GENMASK(3, 2)
> +#define  LTC3208_AUX3_MASK		GENMASK(5, 4)
> +#define  LTC3208_AUX4_MASK		GENMASK(7, 6)
> +#define LTC3208_REG_F_CAM		0x6 /* CAM (High and Low) current DAC */
> +#define LTC3208_REG_G_OPT		0x7 /* Device Options */
> +#define  LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
> +#define  LTC3208_OPT_DIS_RGBDROP	BIT(3)
> +#define  LTC3208_OPT_DIS_CAMHILO	BIT(2)
> +#define  LTC3208_OPT_EN_RGBS		BIT(1)
> +
> +#define LTC3208_MAX_BRIGHTNESS_4BIT	0xF
> +#define LTC3208_MAX_BRIGHTNESS_8BIT	0xFF
> +
> +#define LTC3208_NUM_AUX_LEDS		4 /* Number of configurable aux channels */
> +
> +enum ltc3208_aux_channel {
> +	LTC3208_AUX_CHAN_AUX = 0,
> +	LTC3208_AUX_CHAN_MAIN,
> +	LTC3208_AUX_CHAN_SUB,
> +	LTC3208_AUX_CHAN_CAM
> +};
> +
> +enum ltc3208_channel {
> +	LTC3208_CHAN_MAIN = 0,
> +	LTC3208_CHAN_SUB,
> +	LTC3208_CHAN_AUX,
> +	LTC3208_CHAN_CAML,
> +	LTC3208_CHAN_CAMH,
> +	LTC3208_CHAN_RED,
> +	LTC3208_CHAN_BLUE,
> +	LTC3208_CHAN_GREEN,
> +	LTC3208_CHAN_N_COUNT,
> +};
> +
> +static const char *const ltc3208_dt_aux_channels[] = {
> +	"adi,aux1-channel",
> +	"adi,aux2-channel",
> +	"adi,aux3-channel",
> +	"adi,aux4-channel"
> +};
> +
> +static const char *const ltc3208_aux_opt[] = { "aux", "main", "sub", "cam" };
> +
> +struct ltc3208_led {
> +	struct led_classdev cdev;
> +	struct regmap_field *rfield;
> +};
> +
> +static const struct reg_default ltc3208_reg_defaults[LTC3208_REG_G_OPT] = {

Since these are already populated, what's the point in specifying a size?

> +	{ LTC3208_REG_A_GRNRED, 0 },
> +	{ LTC3208_REG_B_AUXBLU, 0 },
> +	{ LTC3208_REG_C_MAIN, 0 },
> +	{ LTC3208_REG_D_SUB, 0 },
> +	{ LTC3208_REG_E_AUX_SELECT, 0 },
> +	{ LTC3208_REG_F_CAM, 0 },
> +	{ LTC3208_REG_G_OPT, 0 }
> +};
> +
> +static const struct regmap_config ltc3208_regmap_cfg = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = LTC3208_REG_G_OPT,
> +	.cache_type = REGCACHE_FLAT_S,
> +	.reg_defaults = ltc3208_reg_defaults,
> +	.num_reg_defaults = LTC3208_REG_G_OPT,
> +};
> +
> +static const struct reg_field ltc3208_led_reg_field[LTC3208_CHAN_N_COUNT] = {
> +	[LTC3208_CHAN_MAIN]  = REG_FIELD(LTC3208_REG_C_MAIN, 0, 7),
> +	[LTC3208_CHAN_SUB]   = REG_FIELD(LTC3208_REG_D_SUB, 0, 7),
> +	[LTC3208_CHAN_BLUE]  = REG_FIELD(LTC3208_REG_B_AUXBLU, 0, 3),
> +	[LTC3208_CHAN_AUX]   = REG_FIELD(LTC3208_REG_B_AUXBLU, 4, 7),
> +	[LTC3208_CHAN_CAML]  = REG_FIELD(LTC3208_REG_F_CAM, 0, 3),
> +	[LTC3208_CHAN_CAMH]  = REG_FIELD(LTC3208_REG_F_CAM, 4, 7),
> +	[LTC3208_CHAN_RED]   = REG_FIELD(LTC3208_REG_A_GRNRED, 0, 3),
> +	[LTC3208_CHAN_GREEN] = REG_FIELD(LTC3208_REG_A_GRNRED, 4, 7),
> +};
> +
> +static int ltc3208_led_set_brightness(struct led_classdev *led_cdev, enum led_brightness brightness)
> +{
> +	struct ltc3208_led *led = container_of(led_cdev, struct ltc3208_led, cdev);
> +	u8 current_level = brightness;
> +
> +	return regmap_field_write(led->rfield, current_level);
> +}
> +
> +static int ltc3208_probe(struct i2c_client *client)
> +{
> +	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
> +	DECLARE_BITMAP(registered_chans, LTC3208_CHAN_N_COUNT) = { };
> +	struct regmap *regmap;
> +	bool disable_rgb_aux4_dropout_signal;
> +	bool disable_camhl_pin;
> +	bool set_sub_control_pin;
> +	int ret;
> +	u8 dev_options;
> +
> +	regmap = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap), "Failed to initialize regmap.");
> +
> +	regcache_mark_dirty(regmap);
> +	ret = regcache_sync(regmap);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to sync register cache.");
> +
> +	disable_camhl_pin = device_property_read_bool(&client->dev, "adi,disable-camhl-pin");
> +	set_sub_control_pin = device_property_read_bool(&client->dev, "adi,cfg-enrgbs-pin");
> +	disable_rgb_aux4_dropout_signal =
> +		device_property_read_bool(&client->dev, "adi,disable-rgb-aux4-dropout");
> +
> +	dev_options = FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
> +		      FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, disable_camhl_pin) |
> +		      FIELD_PREP(LTC3208_OPT_CPO_MASK, 0) |
> +		      FIELD_PREP(LTC3208_OPT_DIS_RGBDROP, disable_rgb_aux4_dropout_signal);
> +
> +	ret = regmap_write(regmap, LTC3208_REG_G_OPT, dev_options);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "failed to set device options register.");

The style inconsistencies are making me \twitch\.

I suggest an upper-case char to start and drop the full-stop.

> +
> +	/* Initialize aux channel configurations */
> +	for (int i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> +		/* default value (AUX) if property is not present in dt */

Definitely capitalise comments and it's "DT".

> +		if (!device_property_present(&client->dev, ltc3208_dt_aux_channels[i])) {
> +			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
> +			continue;
> +		}
> +
> +		ret = device_property_match_property_string(&client->dev,
> +							    ltc3208_dt_aux_channels[i],
> +							    ltc3208_aux_opt, LTC3208_NUM_AUX_LEDS);
> +		if (ret < 0)
> +			return dev_err_probe(&client->dev, ret, "Error reading AUX Channel %d", i);
> +
> +		aux_channels[i] = ret;
> +	}
> +
> +	dev_options = FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
> +		      FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
> +		      FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
> +		      FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);
> +
> +	ret = regmap_write(regmap, LTC3208_REG_E_AUX_SELECT, dev_options);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "error writing to aux channel register.");
> +
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct ltc3208_led *led;
> +		struct led_init_data init_data = { };
> +		u32 chan;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &chan);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "Failed to get reg value of LED.");

This is user facing, so "register" would be better.

> +		if (chan >= LTC3208_CHAN_N_COUNT)
> +			return dev_err_probe(&client->dev, -EINVAL, "%u is an invalid LED ID.",
> +					     chan);
> +		if (test_and_set_bit(chan, registered_chans))
> +			return dev_err_probe(&client->dev, -EINVAL, "%u is already registered.",
> +					     chan);
> +
> +		led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
> +		if (!led)
> +			return -ENOMEM;
> +
> +		led->rfield = devm_regmap_field_alloc(&client->dev, regmap,
> +						      ltc3208_led_reg_field[chan]);
> +		if (IS_ERR(led->rfield))
> +			return dev_err_probe(&client->dev, PTR_ERR(led->rfield),
> +					     "cannot allocate regmap field.");
> +		led->cdev.brightness_set_blocking = ltc3208_led_set_brightness;
> +		led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_4BIT;
> +
> +		if (chan == LTC3208_CHAN_MAIN || chan == LTC3208_CHAN_SUB)
> +			led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_8BIT;
> +
> +		init_data.fwnode = child;
> +
> +		ret = devm_led_classdev_register_ext(&client->dev, &led->cdev, &init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "LED %u Register failed.", chan);

"Failed to register LED %u"

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc3208_match_table[] = {
> +	{ .compatible = "adi,ltc3208" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ltc3208_match_table);
> +
> +static struct i2c_driver ltc3208_driver = {
> +	.driver = {
> +		.name = "ltc3208",
> +		.of_match_table = ltc3208_match_table,
> +	},
> +	.probe = ltc3208_probe,
> +};
> +module_i2c_driver(ltc3208_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jan Carlo Roleda <jancarlo.roleda@analog.com>");
> +MODULE_DESCRIPTION("LTC3208 LED Driver");
> 
> -- 
> 2.43.0
> 

-- 
Lee Jones
