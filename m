From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 7/9] backlight: add TI LMU backlight driver
Date: Mon, 11 Jan 2016 09:57:02 +0000
Message-ID: <20160111095702.GS14104@x1>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-8-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448521025-2796-8-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: robh+dt@kernel.org, j.anaszewski@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jingoo (not CC'ed) needs to review this.

> This is consolidated driver which supports backlight devices below.
>   LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
>=20
> Structure
> ---------
>   It consists of two parts - core and data.
>=20
>   Core part supports features below.
>     - Backlight subsystem control
>     - Channel configuration from DT properties
>     - Light dimming effect control: ramp up and down.
>     - LMU fault monitor notifier handling
>     - PWM brightness control
>=20
>   Data part describes device specific data.
>     - Register value configuration for each LMU device
>       : initialization, channel configuration, control mode, enable a=
nd
>         brightness.
>     - PWM action configuration
>     - Light dimming effect table
>     - Option for LMU fault monitor support
>=20
> Macros for register data
> ------------------------
>   All LMU devices have 8-bit based registers. LMU_BL_REG() creates 24=
-bit
>   register value in data part. It consists of address, mask and value=
=2E
>   On the other hand, register value should be parsed when the driver
>   reads/writes data from/to I2C registers. Driver uses LMU_BL_GET_ADD=
R(),
>   LMU_BL_GET_MASK() and LMU_BL_GET_VAL() for this purpose.
>=20
> Data structure
> --------------
>   ti_lmu_bl:         Backlight output channel data
>   ti_lmu_bl_chip:    Backlight device data. One device can have multi=
ple
>                      backlight channel data.
>   ti_lmu_bl_reg:     Backlight device register data
>   ti_lmu_bl_cfg:     Backlight configuration data for each LMU device
>=20
> Cc: Lee Jones <lee.jones@linaro.org>=20
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org=20
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>  drivers/video/backlight/Kconfig                 |   7 +
>  drivers/video/backlight/Makefile                |   3 +
>  drivers/video/backlight/ti-lmu-backlight-core.c | 649 ++++++++++++++=
++++++++++
>  drivers/video/backlight/ti-lmu-backlight-data.c | 287 +++++++++++
>  include/linux/mfd/ti-lmu-backlight.h            | 290 +++++++++++
>  5 files changed, 1236 insertions(+)
>  create mode 100644 drivers/video/backlight/ti-lmu-backlight-core.c
>  create mode 100644 drivers/video/backlight/ti-lmu-backlight-data.c
>  create mode 100644 include/linux/mfd/ti-lmu-backlight.h
>=20
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backligh=
t/Kconfig
> index 5ffa4b4..451d043 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -427,6 +427,13 @@ config BACKLIGHT_SKY81452
>  	  To compile this driver as a module, choose M here: the module wil=
l
>  	  be called sky81452-backlight
> =20
> +config BACKLIGHT_TI_LMU
> +	tristate "Backlight driver for TI LMU"
> +	depends on BACKLIGHT_CLASS_DEVICE && MFD_TI_LMU
> +	help
> +	  Say Y to enable the backlight driver for TI LMU devices.
> +	  This supports LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
> +
>  config BACKLIGHT_TPS65217
>  	tristate "TPS65217 Backlight"
>  	depends on BACKLIGHT_CLASS_DEVICE && MFD_TPS65217
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlig=
ht/Makefile
> index 16ec534..0f74ce7 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -52,6 +52,9 @@ obj-$(CONFIG_BACKLIGHT_PM8941_WLED)	+=3D pm8941-wle=
d.o
>  obj-$(CONFIG_BACKLIGHT_PWM)		+=3D pwm_bl.o
>  obj-$(CONFIG_BACKLIGHT_SAHARA)		+=3D kb3886_bl.o
>  obj-$(CONFIG_BACKLIGHT_SKY81452)	+=3D sky81452-backlight.o
> +ti-lmu-backlight-objs			:=3D ti-lmu-backlight-core.o \
> +					   ti-lmu-backlight-data.o
> +obj-$(CONFIG_BACKLIGHT_TI_LMU)		+=3D ti-lmu-backlight.o
>  obj-$(CONFIG_BACKLIGHT_TOSA)		+=3D tosa_bl.o
>  obj-$(CONFIG_BACKLIGHT_TPS65217)	+=3D tps65217_bl.o
>  obj-$(CONFIG_BACKLIGHT_WM831X)		+=3D wm831x_bl.o
> diff --git a/drivers/video/backlight/ti-lmu-backlight-core.c b/driver=
s/video/backlight/ti-lmu-backlight-core.c
> new file mode 100644
> index 0000000..838e2c2
> --- /dev/null
> +++ b/drivers/video/backlight/ti-lmu-backlight-core.c
> @@ -0,0 +1,649 @@
> +/*
> + * TI LMU (Lighting Management Unit) Backlight Driver
> + *
> + * Copyright 2015 Texas Instruments
> + *
> + * Author: Milo Kim <milo.kim@ti.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/ti-lmu.h>
> +#include <linux/mfd/ti-lmu-backlight.h>
> +#include <linux/mfd/ti-lmu-register.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/slab.h>
> +
> +#define NUM_DUAL_CHANNEL			2
> +#define LMU_BACKLIGHT_DUAL_CHANNEL_USED		(BIT(0) | BIT(1))
> +#define LMU_BACKLIGHT_11BIT_LSB_MASK		(BIT(0) | BIT(1) | BIT(2))
> +#define LMU_BACKLIGHT_11BIT_MSB_SHIFT		3
> +#define DEFAULT_PWM_NAME			"lmu-backlight"
> +
> +static int ti_lmu_backlight_enable(struct ti_lmu_bl *lmu_bl, int ena=
ble)
> +{
> +	struct ti_lmu_bl_chip *chip =3D lmu_bl->chip;
> +	struct regmap *regmap =3D chip->lmu->regmap;
> +	unsigned long enable_time =3D chip->cfg->reginfo->enable_usec;
> +	u8 *reg =3D chip->cfg->reginfo->enable;
> +	u8 mask =3D BIT(lmu_bl->bank_id);
> +
> +	if (!reg)
> +		return -EINVAL;
> +
> +	if (enable)
> +		return regmap_update_bits(regmap, *reg, mask, mask);
> +	else
> +		return regmap_update_bits(regmap, *reg, mask, 0);
> +
> +	if (enable_time > 0)
> +		usleep_range(enable_time, enable_time + 100);
> +}
> +
> +static void ti_lmu_backlight_pwm_ctrl(struct ti_lmu_bl *lmu_bl, int =
brightness,
> +				      int max_brightness)
> +{
> +	struct pwm_device *pwm;
> +	unsigned int duty, period;
> +
> +	if (!lmu_bl->pwm) {
> +		pwm =3D devm_pwm_get(lmu_bl->chip->dev, DEFAULT_PWM_NAME);
> +		if (IS_ERR(pwm)) {
> +			dev_err(lmu_bl->chip->dev,
> +				"Can not get PWM device, err: %ld\n",
> +				PTR_ERR(pwm));
> +			return;
> +		}
> +
> +		lmu_bl->pwm =3D pwm;
> +	}
> +
> +	period =3D lmu_bl->pwm_period;
> +	duty =3D brightness * period / max_brightness;
> +
> +	pwm_config(lmu_bl->pwm, duty, period);
> +	if (duty)
> +		pwm_enable(lmu_bl->pwm);
> +	else
> +		pwm_disable(lmu_bl->pwm);
> +}
> +
> +static int ti_lmu_backlight_update_brightness_register(struct ti_lmu=
_bl *lmu_bl,
> +						       int brightness)
> +{
> +	const struct ti_lmu_bl_cfg *cfg =3D lmu_bl->chip->cfg;
> +	const struct ti_lmu_bl_reg *reginfo =3D cfg->reginfo;
> +	struct regmap *regmap =3D lmu_bl->chip->lmu->regmap;
> +	u8 reg, val;
> +	int ret;
> +
> +	if (lmu_bl->mode =3D=3D BL_PWM_BASED) {
> +		switch (cfg->pwm_action) {
> +		case UPDATE_PWM_ONLY:
> +			/* No register update is required */
> +			return 0;
> +		case UPDATE_MAX_BRT:
> +			/*
> +			 * PWM can start from any non-zero code and dim down
> +			 * to zero. So, brightness register should be updated
> +			 * even in PWM mode.
> +			 */
> +			if (brightness > 0)
> +				brightness =3D MAX_BRIGHTNESS_11BIT;
> +			else
> +				brightness =3D 0;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	/*
> +	 * Brightness register update
> +	 *
> +	 * 11 bit dimming: update LSB bits and write MSB byte.
> +	 *		   MSB brightness should be shifted.
> +	 *  8 bit dimming: write MSB byte.
> +	 */
> +
> +	if (!reginfo->brightness_msb)
> +		return -EINVAL;
> +
> +	if (cfg->max_brightness =3D=3D MAX_BRIGHTNESS_11BIT) {
> +		if (!reginfo->brightness_lsb)
> +			return -EINVAL;
> +
> +		reg =3D reginfo->brightness_lsb[lmu_bl->bank_id];
> +		ret =3D regmap_update_bits(regmap, reg,
> +					 LMU_BACKLIGHT_11BIT_LSB_MASK,
> +					 brightness);
> +		if (ret)
> +			return ret;
> +
> +		val =3D (brightness >> LMU_BACKLIGHT_11BIT_MSB_SHIFT) & 0xFF;
> +	} else {
> +		val =3D brightness & 0xFF;
> +	}
> +
> +	reg =3D reginfo->brightness_msb[lmu_bl->bank_id];
> +	return regmap_write(regmap, reg, val);
> +}
> +
> +static int ti_lmu_backlight_update_status(struct backlight_device *b=
l_dev)
> +{
> +	struct ti_lmu_bl *lmu_bl =3D bl_get_data(bl_dev);
> +	int brightness =3D bl_dev->props.brightness;
> +	int ret;
> +
> +	if (bl_dev->props.state & BL_CORE_SUSPENDED)
> +		brightness =3D 0;
> +
> +	if (brightness > 0)
> +		ret =3D ti_lmu_backlight_enable(lmu_bl, 1);
> +	else
> +		ret =3D ti_lmu_backlight_enable(lmu_bl, 0);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (lmu_bl->mode =3D=3D BL_PWM_BASED)
> +		ti_lmu_backlight_pwm_ctrl(lmu_bl, brightness,
> +					  bl_dev->props.max_brightness);
> +
> +	return ti_lmu_backlight_update_brightness_register(lmu_bl, brightne=
ss);
> +}
> +
> +static const struct backlight_ops lmu_backlight_ops =3D {
> +	.options =3D BL_CORE_SUSPENDRESUME,
> +	.update_status =3D ti_lmu_backlight_update_status,
> +};
> +
> +static int ti_lmu_backlight_of_get_ctrl_bank(struct device_node *np,
> +					     struct ti_lmu_bl *lmu_bl)
> +{
> +	const char *name;
> +	u32 *sources;
> +	int num_channels =3D lmu_bl->chip->cfg->num_channels;
> +	int ret, num_sources;
> +
> +	sources =3D devm_kzalloc(lmu_bl->chip->dev, num_channels, GFP_KERNE=
L);
> +	if (!sources)
> +		return -ENOMEM;
> +
> +	if (!of_property_read_string(np, "label", &name))
> +		lmu_bl->name =3D name;
> +	else
> +		lmu_bl->name =3D np->name;
> +
> +	ret =3D of_property_count_u32_elems(np, "led-sources");
> +	if (ret < 0 || ret > num_channels)
> +		return -EINVAL;
> +
> +	num_sources =3D ret;
> +	ret =3D of_property_read_u32_array(np, "led-sources", sources,
> +					 num_sources);
> +	if (ret)
> +		return ret;
> +
> +	lmu_bl->led_sources =3D 0;
> +	while (num_sources--)
> +		set_bit(sources[num_sources], &lmu_bl->led_sources);
> +
> +	return 0;
> +}
> +
> +static void ti_lmu_backlight_of_get_light_properties(struct device_n=
ode *np,
> +						     struct ti_lmu_bl *lmu_bl)
> +{
> +	of_property_read_u32(np, "default-brightness-level",
> +			     &lmu_bl->default_brightness);
> +
> +	of_property_read_u32(np, "ramp-up-msec",  &lmu_bl->ramp_up_msec);
> +	of_property_read_u32(np, "ramp-down-msec", &lmu_bl->ramp_down_msec)=
;
> +}
> +
> +static void ti_lmu_backlight_of_get_brightness_mode(struct device_no=
de *np,
> +						    struct ti_lmu_bl *lmu_bl)
> +{
> +	of_property_read_u32(np, "pwm-period", &lmu_bl->pwm_period);
> +
> +	if (lmu_bl->pwm_period > 0)
> +		lmu_bl->mode =3D BL_PWM_BASED;
> +	else
> +		lmu_bl->mode =3D BL_REGISTER_BASED;
> +}
> +
> +static int ti_lmu_backlight_of_create(struct ti_lmu_bl_chip *chip,
> +				      struct device_node *np)
> +{
> +	struct device_node *child;
> +	struct ti_lmu_bl *lmu_bl, *each;
> +	int ret, num_backlights;
> +	int i =3D 0;
> +
> +	num_backlights =3D of_get_child_count(np);
> +	if (num_backlights =3D=3D 0) {
> +		dev_err(chip->dev, "No backlight strings\n");
> +		return -ENODEV;
> +	}
> +
> +	/* One chip can have mulitple backlight strings */
> +	lmu_bl =3D devm_kzalloc(chip->dev, sizeof(*lmu_bl) * num_backlights=
,
> +			      GFP_KERNEL);
> +	if (!lmu_bl)
> +		return -ENOMEM;
> +
> +	/* Child is mapped to LMU backlight control bank */
> +	for_each_child_of_node(np, child) {
> +		each =3D lmu_bl + i;
> +		each->bank_id =3D i;
> +		each->chip =3D chip;
> +
> +		ret =3D ti_lmu_backlight_of_get_ctrl_bank(child, each);
> +		if (ret) {
> +			of_node_put(np);
> +			return ret;
> +		}
> +
> +		ti_lmu_backlight_of_get_light_properties(child, each);
> +		ti_lmu_backlight_of_get_brightness_mode(child, each);
> +
> +		i++;
> +	}
> +
> +	chip->lmu_bl =3D lmu_bl;
> +	chip->num_backlights =3D num_backlights;
> +
> +	return 0;
> +}
> +
> +static int ti_lmu_backlight_create_channel(struct ti_lmu_bl *lmu_bl)
> +{
> +	struct regmap *regmap =3D lmu_bl->chip->lmu->regmap;
> +	u32 *reg =3D lmu_bl->chip->cfg->reginfo->channel;
> +	int num_channels =3D lmu_bl->chip->cfg->num_channels;
> +	int i, ret;
> +	u8 shift;
> +
> +	/*
> +	 * How to create backlight output channels:
> +	 *   Check 'led_sources' bit and update registers.
> +	 *
> +	 *   1) Dual channel configuration
> +	 *     The 1st register data is used for single channel.
> +	 *     The 2nd register data is used for dual channel.
> +	 *
> +	 *   2) Multiple channel configuration
> +	 *     Each register data is mapped to bank ID.
> +	 *     Bit shift operation is defined in channel registers.
> +	 *
> +	 * Channel register data consists of address, mask, value.
> +	 * Driver can get each data by using LMU_BL_GET_ADDR(),
> +	 * LMU_BL_GET_MASK(), LMU_BL_GET_VAL().
> +	 */
> +
> +	if (num_channels =3D=3D NUM_DUAL_CHANNEL) {
> +		if (lmu_bl->led_sources =3D=3D LMU_BACKLIGHT_DUAL_CHANNEL_USED)
> +			++reg;
> +
> +		return regmap_update_bits(regmap, LMU_BL_GET_ADDR(*reg),
> +					  LMU_BL_GET_MASK(*reg),
> +					  LMU_BL_GET_VAL(*reg));
> +	}
> +
> +	for (i =3D 0; i < num_channels; i++) {
> +		if (!reg)
> +			break;
> +
> +		/*
> +		 * Note that the result of LMU_BL_GET_VAL() is shift bit.
> +		 * The bank_id should be shifted for the channel configuration.
> +		 */
> +		if (test_bit(i, &lmu_bl->led_sources)) {
> +			shift =3D LMU_BL_GET_VAL(*reg);
> +			ret =3D regmap_update_bits(regmap, LMU_BL_GET_ADDR(*reg),
> +						 LMU_BL_GET_MASK(*reg),
> +						 lmu_bl->bank_id << shift);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		reg++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ti_lmu_backlight_update_ctrl_mode(struct ti_lmu_bl *lmu_b=
l)
> +{
> +	struct regmap *regmap =3D lmu_bl->chip->lmu->regmap;
> +	u32 *reg =3D lmu_bl->chip->cfg->reginfo->mode + lmu_bl->bank_id;
> +	u8 val;
> +
> +	if (!reg)
> +		return 0;
> +
> +	/*
> +	 * Update PWM configuration register.
> +	 * If the mode is register based, then clear the bit.
> +	 */
> +	if (lmu_bl->mode =3D=3D BL_PWM_BASED)
> +		val =3D LMU_BL_GET_VAL(*reg);
> +	else
> +		val =3D 0;
> +
> +	return regmap_update_bits(regmap, LMU_BL_GET_ADDR(*reg),
> +				  LMU_BL_GET_MASK(*reg), val);
> +}
> +
> +static int ti_lmu_backlight_convert_ramp_to_index(struct ti_lmu_bl *=
lmu_bl,
> +						  enum ti_lmu_bl_ramp_mode mode)
> +{
> +	const int *ramp_table =3D lmu_bl->chip->cfg->ramp_table;
> +	const int size =3D lmu_bl->chip->cfg->size_ramp;
> +	unsigned int msec;
> +	int i;
> +
> +	if (!ramp_table)
> +		return -EINVAL;
> +
> +	switch (mode) {
> +	case BL_RAMP_UP:
> +		msec =3D lmu_bl->ramp_up_msec;
> +		break;
> +	case BL_RAMP_DOWN:
> +		msec =3D lmu_bl->ramp_down_msec;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (msec <=3D ramp_table[0])
> +		return 0;
> +
> +	if (msec > ramp_table[size - 1])
> +		return size - 1;
> +
> +	for (i =3D 1; i < size; i++) {
> +		if (msec =3D=3D ramp_table[i])
> +			return i;
> +
> +		/* Find an approximate index by looking up the table */
> +		if (msec > ramp_table[i - 1] && msec < ramp_table[i]) {
> +			if (msec - ramp_table[i - 1] < ramp_table[i] - msec)
> +				return i - 1;
> +			else
> +				return i;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int ti_lmu_backlight_set_ramp(struct ti_lmu_bl *lmu_bl)
> +{
> +	struct regmap *regmap =3D lmu_bl->chip->lmu->regmap;
> +	const struct ti_lmu_bl_reg *reginfo =3D lmu_bl->chip->cfg->reginfo;
> +	int offset =3D reginfo->ramp_reg_offset;
> +	int i, ret, index;
> +	u32 reg;
> +
> +	for (i =3D BL_RAMP_UP; i <=3D BL_RAMP_DOWN; i++) {
> +		index =3D ti_lmu_backlight_convert_ramp_to_index(lmu_bl, i);
> +		if (index > 0) {
> +			if (!reginfo->ramp)
> +				break;
> +
> +			if (lmu_bl->bank_id =3D=3D 0)
> +				reg =3D reginfo->ramp[i];
> +			else
> +				reg =3D reginfo->ramp[i] + offset;
> +
> +			/*
> +			 * Note that the result of LMU_BL_GET_VAL() is
> +			 * shift bit. So updated bit is shifted index value.
> +			 */
> +			ret =3D regmap_update_bits(regmap, LMU_BL_GET_ADDR(reg),
> +						 LMU_BL_GET_MASK(reg),
> +						 index << LMU_BL_GET_VAL(reg));
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ti_lmu_backlight_configure(struct ti_lmu_bl *lmu_bl)
> +{
> +	int ret;
> +
> +	ret =3D ti_lmu_backlight_create_channel(lmu_bl);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ti_lmu_backlight_update_ctrl_mode(lmu_bl);
> +	if (ret)
> +		return ret;
> +
> +	return ti_lmu_backlight_set_ramp(lmu_bl);
> +}
> +
> +static int ti_lmu_backlight_init(struct ti_lmu_bl_chip *chip)
> +{
> +	struct regmap *regmap =3D chip->lmu->regmap;
> +	u32 *reg =3D chip->cfg->reginfo->init;
> +	int num_init =3D chip->cfg->reginfo->num_init;
> +	int i, ret;
> +
> +	/*
> +	 * 'init' register data consists of address, mask, value.
> +	 * Driver can get each data by using LMU_BL_GET_ADDR(),
> +	 * LMU_BL_GET_MASK(), LMU_BL_GET_VAL().
> +	 */
> +
> +	for (i =3D 0; i < num_init; i++) {
> +		if (!reg)
> +			break;
> +
> +		ret =3D regmap_update_bits(regmap, LMU_BL_GET_ADDR(*reg),
> +					 LMU_BL_GET_MASK(*reg),
> +					 LMU_BL_GET_VAL(*reg));
> +		if (ret)
> +			return ret;
> +
> +		reg++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ti_lmu_backlight_reload(struct ti_lmu_bl_chip *chip)
> +{
> +	struct ti_lmu_bl *each;
> +	int i, ret;
> +
> +	ret =3D ti_lmu_backlight_init(chip);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < chip->num_backlights; i++) {
> +		each =3D chip->lmu_bl + i;
> +		ret =3D ti_lmu_backlight_configure(each);
> +		if (ret)
> +			return ret;
> +
> +		backlight_update_status(each->bl_dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ti_lmu_backlight_add_device(struct device *dev,
> +				       struct ti_lmu_bl *lmu_bl)
> +{
> +	struct backlight_device *bl_dev;
> +	struct backlight_properties props;
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type =3D BACKLIGHT_PLATFORM;
> +	props.brightness =3D lmu_bl->default_brightness;
> +	props.max_brightness =3D lmu_bl->chip->cfg->max_brightness;
> +
> +	bl_dev =3D devm_backlight_device_register(dev, lmu_bl->name,
> +						lmu_bl->chip->dev, lmu_bl,
> +						&lmu_backlight_ops, &props);
> +	if (IS_ERR(bl_dev))
> +		return PTR_ERR(bl_dev);
> +
> +	lmu_bl->bl_dev =3D bl_dev;
> +
> +	return 0;
> +}
> +
> +static struct ti_lmu_bl_chip *
> +ti_lmu_backlight_register(struct device *dev, struct ti_lmu *lmu,
> +			  const struct ti_lmu_bl_cfg *cfg)
> +{
> +	struct ti_lmu_bl_chip *chip;
> +	struct ti_lmu_bl *each;
> +	int i, ret;
> +
> +	if (!cfg) {
> +		dev_err(dev, "Operation is not configured\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return ERR_PTR(-ENOMEM);
> +
> +	chip->dev =3D dev;
> +	chip->lmu =3D lmu;
> +	chip->cfg =3D cfg;
> +
> +	ret =3D ti_lmu_backlight_of_create(chip, dev->of_node);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret =3D ti_lmu_backlight_init(chip);
> +	if (ret) {
> +		dev_err(dev, "Backlight init err: %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	for (i =3D 0; i < chip->num_backlights; i++) {
> +		each =3D chip->lmu_bl + i;
> +
> +		ret =3D ti_lmu_backlight_configure(each);
> +		if (ret) {
> +			dev_err(dev, "Backlight config err: %d\n", ret);
> +			return ERR_PTR(ret);
> +		}
> +
> +		ret =3D ti_lmu_backlight_add_device(dev, each);
> +		if (ret) {
> +			dev_err(dev, "Backlight device err: %d\n", ret);
> +			return ERR_PTR(ret);
> +		}
> +
> +		backlight_update_status(each->bl_dev);
> +	}
> +
> +	return chip;
> +}
> +
> +static void ti_lmu_backlight_unregister(struct ti_lmu_bl_chip *chip)
> +{
> +	struct ti_lmu_bl *each;
> +	int i;
> +
> +	/* Turn off the brightness */
> +	for (i =3D 0; i < chip->num_backlights; i++) {
> +		each =3D chip->lmu_bl + i;
> +		each->bl_dev->props.brightness =3D 0;
> +		backlight_update_status(each->bl_dev);
> +	}
> +}
> +
> +static int ti_lmu_backlight_monitor_notifier(struct notifier_block *=
nb,
> +					     unsigned long action, void *unused)
> +{
> +	struct ti_lmu_bl_chip *chip =3D container_of(nb, struct ti_lmu_bl_c=
hip,
> +						   nb);
> +
> +	if (action =3D=3D LMU_EVENT_MONITOR_DONE) {
> +		if (ti_lmu_backlight_reload(chip))
> +			return NOTIFY_STOP;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int ti_lmu_backlight_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ti_lmu *lmu =3D dev_get_drvdata(dev->parent);
> +	struct ti_lmu_bl_chip *chip;
> +	int ret;
> +
> +	chip =3D ti_lmu_backlight_register(dev, lmu, &lmu_bl_cfg[pdev->id])=
;
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +
> +	/*
> +	 * Notifier callback is required because backlight device needs
> +	 * reconfiguration after fault detection procedure is done by
> +	 * ti-lmu-fault-monitor driver.
> +	 */
> +	if (chip->cfg->fault_monitor_used) {
> +		chip->nb.notifier_call =3D ti_lmu_backlight_monitor_notifier;
> +		ret =3D blocking_notifier_chain_register(&chip->lmu->notifier,
> +						       &chip->nb);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	return 0;
> +}
> +
> +static int ti_lmu_backlight_remove(struct platform_device *pdev)
> +{
> +	struct ti_lmu_bl_chip *chip =3D platform_get_drvdata(pdev);
> +
> +	if (chip->cfg->fault_monitor_used)
> +		blocking_notifier_chain_unregister(&chip->lmu->notifier,
> +						   &chip->nb);
> +
> +	ti_lmu_backlight_unregister(chip);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver ti_lmu_backlight_driver =3D {
> +	.probe  =3D ti_lmu_backlight_probe,
> +	.remove =3D ti_lmu_backlight_remove,
> +	.driver =3D {
> +		.name =3D "ti-lmu-backlight",
> +	},
> +};
> +
> +module_platform_driver(ti_lmu_backlight_driver)
> +
> +MODULE_DESCRIPTION("TI LMU Backlight Driver");
> +MODULE_AUTHOR("Milo Kim");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:ti-lmu-backlight");
> diff --git a/drivers/video/backlight/ti-lmu-backlight-data.c b/driver=
s/video/backlight/ti-lmu-backlight-data.c
> new file mode 100644
> index 0000000..0a486b2
> --- /dev/null
> +++ b/drivers/video/backlight/ti-lmu-backlight-data.c
> @@ -0,0 +1,287 @@
> +/*
> + * TI LMU (Lighting Management Unit) Backlight Device Data
> + *
> + * Copyright 2015 Texas Instruments
> + *
> + * Author: Milo Kim <milo.kim@ti.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/mfd/ti-lmu.h>
> +#include <linux/mfd/ti-lmu-backlight.h>
> +#include <linux/mfd/ti-lmu-register.h>
> +#include <linux/module.h>
> +
> +/* LM3532 */
> +static u32 lm3532_init_regs[] =3D {
> +	LM3532_INIT_ZONE_0,
> +	LM3532_INIT_ZONE_1,
> +	LM3532_INIT_ZONE_2,
> +};
> +
> +static u32 lm3532_channel_regs[] =3D {
> +	LM3532_CHANNEL_1,
> +	LM3532_CHANNEL_2,
> +	LM3532_CHANNEL_3,
> +};
> +
> +static u32 lm3532_mode_regs[] =3D {
> +	LM3532_MODE_PWM_A,
> +	LM3532_MODE_PWM_B,
> +	LM3532_MODE_PWM_C,
> +};
> +
> +static u32 lm3532_ramp_regs[] =3D {
> +	LM3532_RAMPUP,
> +	LM3532_RAMPDN,
> +};
> +
> +static u8 lm3532_enable_reg =3D LM3532_REG_ENABLE;
> +
> +static u8 lm3532_brightness_regs[] =3D {
> +	LM3532_REG_BRT_A,
> +	LM3532_REG_BRT_B,
> +	LM3532_REG_BRT_C,
> +};
> +
> +static const struct ti_lmu_bl_reg lm3532_reg_info =3D {
> +	.init		=3D lm3532_init_regs,
> +	.num_init	=3D ARRAY_SIZE(lm3532_init_regs),
> +	.channel	=3D lm3532_channel_regs,
> +	.mode		=3D lm3532_mode_regs,
> +	.ramp		=3D lm3532_ramp_regs,
> +	.enable		=3D &lm3532_enable_reg,
> +	.brightness_msb	=3D lm3532_brightness_regs,
> +};
> +
> +/* LM3631 */
> +static u32 lm3631_init_regs[] =3D {
> +	LM3631_INIT_BRT_MODE,
> +	LM3631_INIT_DIMMING_MODE,
> +};
> +
> +static u32 lm3631_channel_regs[]  =3D {
> +	LM3631_SINGLE_CHANNEL,
> +	LM3631_DUAL_CHANNEL,
> +};
> +
> +static u32 lm3631_ramp_reg =3D LM3631_RAMP;
> +static u8 lm3631_enable_reg =3D LM3631_REG_DEVCTRL;
> +static u8 lm3631_brightness_msb_reg =3D LM3631_REG_BRT_MSB;
> +static u8 lm3631_brightness_lsb_reg =3D LM3631_REG_BRT_LSB;
> +
> +static const struct ti_lmu_bl_reg lm3631_reg_info =3D {
> +	.init		=3D lm3631_init_regs,
> +	.num_init	=3D ARRAY_SIZE(lm3631_init_regs),
> +	.channel	=3D lm3631_channel_regs,
> +	.ramp		=3D &lm3631_ramp_reg,
> +	.enable		=3D &lm3631_enable_reg,
> +	.brightness_msb	=3D &lm3631_brightness_msb_reg,
> +	.brightness_lsb	=3D &lm3631_brightness_lsb_reg,
> +};
> +
> +/* LM3632 */
> +static u32 lm3632_init_regs[] =3D {
> +	LM3632_INIT_OVP_25V,
> +	LM3632_INIT_SWFREQ_1MHZ,
> +};
> +
> +static u32 lm3632_channel_regs[]  =3D {
> +	LM3632_SINGLE_CHANNEL,
> +	LM3632_DUAL_CHANNEL,
> +};
> +
> +static u32 lm3632_mode_reg =3D LM3632_MODE_PWM;
> +static u8 lm3632_enable_reg =3D LM3632_REG_ENABLE;
> +static u8 lm3632_brightness_msb_reg =3D LM3632_REG_BRT_MSB;
> +static u8 lm3632_brightness_lsb_reg =3D LM3632_REG_BRT_LSB;
> +
> +static const struct ti_lmu_bl_reg lm3632_reg_info =3D {
> +	.init		=3D lm3632_init_regs,
> +	.num_init	=3D ARRAY_SIZE(lm3632_init_regs),
> +	.channel	=3D lm3632_channel_regs,
> +	.mode		=3D &lm3632_mode_reg,
> +	.enable		=3D &lm3632_enable_reg,
> +	.brightness_msb	=3D &lm3632_brightness_msb_reg,
> +	.brightness_lsb	=3D &lm3632_brightness_lsb_reg,
> +};
> +
> +/* LM3633 */
> +static u32 lm3633_init_regs[] =3D {
> +	LM3633_INIT_OVP_40V,
> +	LM3633_INIT_RAMP_SELECT,
> +};
> +
> +static u32 lm3633_channel_regs[]  =3D {
> +	LM3633_CHANNEL_HVLED1,
> +	LM3633_CHANNEL_HVLED2,
> +	LM3633_CHANNEL_HVLED3,
> +};
> +
> +static u32 lm3633_mode_regs[] =3D {
> +	LM3633_MODE_PWM_A,
> +	LM3633_MODE_PWM_B,
> +};
> +
> +static u32 lm3633_ramp_regs[] =3D {
> +	LM3633_RAMPUP,
> +	LM3633_RAMPDN,
> +};
> +
> +static u8 lm3633_enable_reg =3D LM3633_REG_ENABLE;
> +
> +static u8 lm3633_brightness_msb_regs[] =3D {
> +	LM3633_REG_BRT_HVLED_A_MSB,
> +	LM3633_REG_BRT_HVLED_B_MSB,
> +};
> +
> +static u8 lm3633_brightness_lsb_regs[] =3D {
> +	LM3633_REG_BRT_HVLED_A_LSB,
> +	LM3633_REG_BRT_HVLED_B_LSB,
> +};
> +
> +static const struct ti_lmu_bl_reg lm3633_reg_info =3D {
> +	.init		 =3D lm3633_init_regs,
> +	.num_init	 =3D ARRAY_SIZE(lm3633_init_regs),
> +	.channel	 =3D lm3633_channel_regs,
> +	.mode		 =3D lm3633_mode_regs,
> +	.ramp		 =3D lm3633_ramp_regs,
> +	.ramp_reg_offset =3D 1, /* For LM3633_REG_BL1_RAMPUP/DN */
> +	.enable		 =3D &lm3633_enable_reg,
> +	.brightness_msb	 =3D lm3633_brightness_msb_regs,
> +	.brightness_lsb	 =3D lm3633_brightness_lsb_regs,
> +};
> +
> +/* LM3695 */
> +static u32 lm3695_init_regs[] =3D {
> +	LM3695_INIT_BRT_MODE,
> +};
> +
> +static u32 lm3695_channel_regs[]  =3D {
> +	LM3695_SINGLE_CHANNEL,
> +	LM3695_DUAL_CHANNEL,
> +};
> +
> +static u8 lm3695_enable_reg =3D LM3695_REG_GP;
> +static u8 lm3695_brightness_msb_reg =3D LM3695_REG_BRT_MSB;
> +static u8 lm3695_brightness_lsb_reg =3D LM3695_REG_BRT_LSB;
> +
> +static const struct ti_lmu_bl_reg lm3695_reg_info =3D {
> +	.init		=3D lm3695_init_regs,
> +	.num_init	=3D ARRAY_SIZE(lm3695_init_regs),
> +	.channel	=3D lm3695_channel_regs,
> +	.enable		=3D &lm3695_enable_reg,
> +	.enable_usec	=3D 600,
> +	.brightness_msb	=3D &lm3695_brightness_msb_reg,
> +	.brightness_lsb	=3D &lm3695_brightness_lsb_reg,
> +};
> +
> +/* LM3697 */
> +static u32 lm3697_init_regs[] =3D {
> +	LM3697_INIT_RAMP_SELECT,
> +};
> +
> +static u32 lm3697_channel_regs[]  =3D {
> +	LM3697_CHANNEL_1,
> +	LM3697_CHANNEL_2,
> +	LM3697_CHANNEL_3,
> +};
> +
> +static u32 lm3697_mode_regs[] =3D {
> +	LM3697_MODE_PWM_A,
> +	LM3697_MODE_PWM_B,
> +};
> +
> +static u32 lm3697_ramp_regs[] =3D {
> +	LM3697_RAMPUP,
> +	LM3697_RAMPDN,
> +};
> +
> +static u8 lm3697_enable_reg =3D LM3697_REG_ENABLE;
> +
> +static u8 lm3697_brightness_msb_regs[] =3D {
> +	LM3697_REG_BRT_A_MSB,
> +	LM3697_REG_BRT_B_MSB,
> +};
> +
> +static u8 lm3697_brightness_lsb_regs[] =3D {
> +	LM3697_REG_BRT_A_LSB,
> +	LM3697_REG_BRT_B_LSB,
> +};
> +
> +static const struct ti_lmu_bl_reg lm3697_reg_info =3D {
> +	.init		 =3D lm3697_init_regs,
> +	.num_init	 =3D ARRAY_SIZE(lm3697_init_regs),
> +	.channel	 =3D lm3697_channel_regs,
> +	.mode		 =3D lm3697_mode_regs,
> +	.ramp		 =3D lm3697_ramp_regs,
> +	.ramp_reg_offset =3D 1, /* For LM3697_REG_BL1_RAMPUP/DN */
> +	.enable		 =3D &lm3697_enable_reg,
> +	.brightness_msb	 =3D lm3697_brightness_msb_regs,
> +	.brightness_lsb	 =3D lm3697_brightness_lsb_regs,
> +};
> +
> +static int lm3532_ramp_table[] =3D { 0, 1, 2, 4, 8, 16, 32, 65 };
> +
> +static int lm3631_ramp_table[] =3D {
> +	   0,   1,   2,    5,   10,   20,   50,  100,
> +	 250, 500, 750, 1000, 1500, 2000, 3000, 4000,
> +};
> +
> +static int common_ramp_table[] =3D {
> +	   2, 250, 500, 1000, 2000, 4000, 8000, 16000,
> +};
> +
> +struct ti_lmu_bl_cfg lmu_bl_cfg[LMU_MAX_ID] =3D {
> +	{
> +		.reginfo		=3D &lm3532_reg_info,
> +		.num_channels		=3D LM3532_MAX_CHANNELS,
> +		.max_brightness		=3D MAX_BRIGHTNESS_8BIT,
> +		.pwm_action		=3D UPDATE_PWM_AND_BRT_REGISTER,
> +		.ramp_table		=3D lm3532_ramp_table,
> +		.size_ramp		=3D ARRAY_SIZE(lm3532_ramp_table),
> +	},
> +	{
> +		.reginfo		=3D &lm3631_reg_info,
> +		.num_channels		=3D LM3631_MAX_CHANNELS,
> +		.max_brightness		=3D MAX_BRIGHTNESS_11BIT,
> +		.pwm_action		=3D UPDATE_PWM_ONLY,
> +		.ramp_table		=3D lm3631_ramp_table,
> +		.size_ramp		=3D ARRAY_SIZE(lm3631_ramp_table),
> +	},
> +	{
> +		.reginfo		=3D &lm3632_reg_info,
> +		.num_channels		=3D LM3632_MAX_CHANNELS,
> +		.max_brightness		=3D MAX_BRIGHTNESS_11BIT,
> +		.pwm_action		=3D UPDATE_PWM_ONLY,
> +	},
> +	{
> +		.reginfo		=3D &lm3633_reg_info,
> +		.num_channels		=3D LM3633_MAX_CHANNELS,
> +		.max_brightness		=3D MAX_BRIGHTNESS_11BIT,
> +		.pwm_action		=3D UPDATE_MAX_BRT,
> +		.ramp_table		=3D common_ramp_table,
> +		.size_ramp		=3D ARRAY_SIZE(common_ramp_table),
> +		.fault_monitor_used	=3D true,
> +	},
> +	{
> +		.reginfo		=3D &lm3695_reg_info,
> +		.num_channels		=3D LM3695_MAX_CHANNELS,
> +		.max_brightness		=3D MAX_BRIGHTNESS_11BIT,
> +		.pwm_action		=3D UPDATE_PWM_AND_BRT_REGISTER,
> +	},
> +	{
> +		.reginfo		=3D &lm3697_reg_info,
> +		.num_channels		=3D LM3697_MAX_CHANNELS,
> +		.max_brightness		=3D MAX_BRIGHTNESS_11BIT,
> +		.pwm_action		=3D UPDATE_PWM_AND_BRT_REGISTER,
> +		.ramp_table		=3D common_ramp_table,
> +		.size_ramp		=3D ARRAY_SIZE(common_ramp_table),
> +		.fault_monitor_used	=3D true,
> +	},
> +};
> +EXPORT_SYMBOL_GPL(lmu_bl_cfg);
> diff --git a/include/linux/mfd/ti-lmu-backlight.h b/include/linux/mfd=
/ti-lmu-backlight.h
> new file mode 100644
> index 0000000..43e5300
> --- /dev/null
> +++ b/include/linux/mfd/ti-lmu-backlight.h
> @@ -0,0 +1,290 @@
> +/*
> + * TI LMU (Lighting Management Unit) Backlight Common Driver
> + *
> + * Copyright 2015 Texas Instruments
> + *
> + * Author: Milo Kim <milo.kim@ti.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __TI_LMU_BACKLIGHT_H__
> +#define __TI_LMU_BACKLIGHT_H__
> +
> +#include <linux/backlight.h>
> +#include <linux/device.h>
> +#include <linux/mfd/ti-lmu.h>
> +#include <linux/mfd/ti-lmu-register.h>
> +#include <linux/notifier.h>
> +
> +/**
> + * LMU backlight register data
> + *	value[23:16] | mask[15:8] | address[7:0]
> + */
> +#define LMU_BL_REG(addr, mask, value)				\
> +	((value << 16) | (mask << 8) | addr)
> +
> +#define LMU_BL_GET_ADDR(x)	(x & 0xFF)
> +#define LMU_BL_GET_MASK(x)	((x >> 8) & 0xFF)
> +#define LMU_BL_GET_VAL(x)	((x >> 16) & 0xFF)
> +
> +#define LM3532_INIT_ZONE_0						\
> +	LMU_BL_REG(LM3532_REG_ZONE_CFG_A, LM3532_ZONE_MASK, LM3532_ZONE_0)
> +#define LM3532_INIT_ZONE_1						\
> +	LMU_BL_REG(LM3532_REG_ZONE_CFG_B, LM3532_ZONE_MASK, LM3532_ZONE_1)
> +#define LM3532_INIT_ZONE_2						\
> +	LMU_BL_REG(LM3532_REG_ZONE_CFG_C, LM3532_ZONE_MASK, LM3532_ZONE_2)
> +#define LM3532_CHANNEL_1						\
> +	LMU_BL_REG(LM3532_REG_OUTPUT_CFG, LM3532_ILED1_CFG_MASK,	\
> +	LM3532_ILED1_CFG_SHIFT)
> +#define LM3532_CHANNEL_2						\
> +	LMU_BL_REG(LM3532_REG_OUTPUT_CFG, LM3532_ILED2_CFG_MASK,	\
> +	LM3532_ILED2_CFG_SHIFT)
> +#define LM3532_CHANNEL_3						\
> +	LMU_BL_REG(LM3532_REG_OUTPUT_CFG, LM3532_ILED3_CFG_MASK,	\
> +	LM3532_ILED3_CFG_SHIFT)
> +#define LM3532_MODE_PWM_A						\
> +	LMU_BL_REG(LM3532_REG_PWM_A_CFG, LM3532_PWM_A_MASK, LM3532_PWM_ZONE=
_0)
> +#define LM3532_MODE_PWM_B						\
> +	LMU_BL_REG(LM3532_REG_PWM_B_CFG, LM3532_PWM_B_MASK, LM3532_PWM_ZONE=
_1)
> +#define LM3532_MODE_PWM_C						\
> +	LMU_BL_REG(LM3532_REG_PWM_C_CFG, LM3532_PWM_C_MASK, LM3532_PWM_ZONE=
_2)
> +#define LM3532_RAMPUP							\
> +	LMU_BL_REG(LM3532_REG_RAMPUP, LM3532_RAMPUP_MASK, LM3532_RAMPUP_SHI=
=46T)
> +#define LM3532_RAMPDN							\
> +	LMU_BL_REG(LM3532_REG_RAMPDN, LM3532_RAMPDN_MASK, LM3532_RAMPDN_SHI=
=46T)
> +
> +#define LM3631_INIT_BRT_MODE						\
> +	LMU_BL_REG(LM3631_REG_BRT_MODE, LM3631_MODE_MASK, LM3631_DEFAULT_MO=
DE)
> +#define LM3631_INIT_DIMMING_MODE					\
> +	LMU_BL_REG(LM3631_REG_BL_CFG, LM3631_MAP_MASK, LM3631_EXPONENTIAL_M=
AP)
> +#define LM3631_SINGLE_CHANNEL						\
> +	LMU_BL_REG(LM3631_REG_BL_CFG, LM3631_BL_CHANNEL_MASK,		\
> +	LM3631_BL_SINGLE_CHANNEL)
> +#define LM3631_DUAL_CHANNEL						\
> +	LMU_BL_REG(LM3631_REG_BL_CFG, LM3631_BL_CHANNEL_MASK,		\
> +	LM3631_BL_DUAL_CHANNEL)
> +#define LM3631_RAMP							\
> +	LMU_BL_REG(LM3631_REG_SLOPE, LM3631_SLOPE_MASK, LM3631_SLOPE_SHIFT)
> +
> +#define LM3632_INIT_OVP_25V						\
> +	LMU_BL_REG(LM3632_REG_CONFIG1, LM3632_OVP_MASK, LM3632_OVP_25V)
> +#define LM3632_INIT_SWFREQ_1MHZ						\
> +	LMU_BL_REG(LM3632_REG_CONFIG2, LM3632_SWFREQ_MASK, LM3632_SWFREQ_1M=
HZ)
> +#define LM3632_SINGLE_CHANNEL						\
> +	LMU_BL_REG(LM3632_REG_ENABLE, LM3632_BL_CHANNEL_MASK,		\
> +	LM3632_BL_SINGLE_CHANNEL)
> +#define LM3632_DUAL_CHANNEL						\
> +	LMU_BL_REG(LM3632_REG_ENABLE, LM3632_BL_CHANNEL_MASK,		\
> +	LM3632_BL_DUAL_CHANNEL)
> +#define LM3632_MODE_PWM							\
> +	LMU_BL_REG(LM3632_REG_IO_CTRL, LM3632_PWM_MASK, LM3632_PWM_MODE)
> +
> +#define LM3633_INIT_OVP_40V						\
> +	LMU_BL_REG(LM3633_REG_BOOST_CFG, LM3633_OVP_MASK, LM3633_OVP_40V)
> +#define LM3633_INIT_RAMP_SELECT						\
> +	LMU_BL_REG(LM3633_REG_BL_RAMP_CONF, LM3633_BL_RAMP_MASK,	\
> +	LM3633_BL_RAMP_EACH)
> +#define LM3633_CHANNEL_HVLED1						\
> +	LMU_BL_REG(LM3633_REG_HVLED_OUTPUT_CFG, LM3633_HVLED1_CFG_MASK,	\
> +	LM3633_HVLED1_CFG_SHIFT)
> +#define LM3633_CHANNEL_HVLED2						\
> +	LMU_BL_REG(LM3633_REG_HVLED_OUTPUT_CFG, LM3633_HVLED2_CFG_MASK,	\
> +	LM3633_HVLED2_CFG_SHIFT)
> +#define LM3633_CHANNEL_HVLED3						\
> +	LMU_BL_REG(LM3633_REG_HVLED_OUTPUT_CFG, LM3633_HVLED3_CFG_MASK,	\
> +	LM3633_HVLED3_CFG_SHIFT)
> +#define LM3633_MODE_PWM_A						\
> +	LMU_BL_REG(LM3633_REG_PWM_CFG, LM3633_PWM_A_MASK, LM3633_PWM_A_MASK=
)
> +#define LM3633_MODE_PWM_B						\
> +	LMU_BL_REG(LM3633_REG_PWM_CFG, LM3633_PWM_B_MASK, LM3633_PWM_B_MASK=
)
> +#define LM3633_RAMPUP							\
> +	LMU_BL_REG(LM3633_REG_BL0_RAMP, LM3633_BL_RAMPUP_MASK,		\
> +	LM3633_BL_RAMPUP_SHIFT)
> +#define LM3633_RAMPDN							\
> +	LMU_BL_REG(LM3633_REG_BL0_RAMP, LM3633_BL_RAMPDN_MASK,		\
> +	LM3633_BL_RAMPDN_SHIFT)
> +
> +#define LM3695_INIT_BRT_MODE						\
> +	LMU_BL_REG(LM3695_REG_GP, LM3695_BRT_RW_MASK, LM3695_BRT_RW_MASK)
> +#define LM3695_SINGLE_CHANNEL						\
> +	LMU_BL_REG(LM3695_REG_GP, LM3695_BL_CHANNEL_MASK,		\
> +	LM3695_BL_SINGLE_CHANNEL)
> +#define LM3695_DUAL_CHANNEL						\
> +	LMU_BL_REG(LM3695_REG_GP, LM3695_BL_CHANNEL_MASK,		\
> +	LM3695_BL_DUAL_CHANNEL)
> +
> +#define LM3697_INIT_RAMP_SELECT						\
> +	LMU_BL_REG(LM3697_REG_RAMP_CONF, LM3697_RAMP_MASK, LM3697_RAMP_EACH=
)
> +#define LM3697_CHANNEL_1						\
> +	LMU_BL_REG(LM3697_REG_HVLED_OUTPUT_CFG, LM3697_HVLED1_CFG_MASK,	\
> +	LM3697_HVLED1_CFG_SHIFT)
> +#define LM3697_CHANNEL_2						\
> +	LMU_BL_REG(LM3697_REG_HVLED_OUTPUT_CFG, LM3697_HVLED2_CFG_MASK,	\
> +	LM3697_HVLED2_CFG_SHIFT)
> +#define LM3697_CHANNEL_3						\
> +	LMU_BL_REG(LM3697_REG_HVLED_OUTPUT_CFG, LM3697_HVLED3_CFG_MASK,	\
> +	LM3697_HVLED3_CFG_SHIFT)
> +#define LM3697_MODE_PWM_A						\
> +	LMU_BL_REG(LM3697_REG_PWM_CFG, LM3697_PWM_A_MASK, LM3697_PWM_A_MASK=
)
> +#define LM3697_MODE_PWM_B						\
> +	LMU_BL_REG(LM3697_REG_PWM_CFG, LM3697_PWM_B_MASK, LM3697_PWM_B_MASK=
)
> +#define LM3697_RAMPUP							\
> +	LMU_BL_REG(LM3697_REG_BL0_RAMP, LM3697_RAMPUP_MASK, LM3697_RAMPUP_S=
HIFT)
> +#define LM3697_RAMPDN							\
> +	LMU_BL_REG(LM3697_REG_BL0_RAMP, LM3697_RAMPDN_MASK, LM3697_RAMPDN_S=
HIFT)
> +
> +#define LM3532_MAX_CHANNELS		3
> +#define LM3631_MAX_CHANNELS		2
> +#define LM3632_MAX_CHANNELS		2
> +#define LM3633_MAX_CHANNELS		3
> +#define LM3695_MAX_CHANNELS		2
> +#define LM3697_MAX_CHANNELS		3
> +
> +#define MAX_BRIGHTNESS_8BIT		255
> +#define MAX_BRIGHTNESS_11BIT		2047
> +
> +enum ti_lmu_bl_ctrl_mode {
> +	BL_REGISTER_BASED,
> +	BL_PWM_BASED,
> +};
> +
> +enum ti_lmu_bl_pwm_action {
> +	/* Update PWM duty, no brightness register update is required */
> +	UPDATE_PWM_ONLY,
> +	/* Update not only duty but also brightness register */
> +	UPDATE_PWM_AND_BRT_REGISTER,
> +	/* Update max value in brightness registers */
> +	UPDATE_MAX_BRT,
> +};
> +
> +enum ti_lmu_bl_ramp_mode {
> +	BL_RAMP_UP,
> +	BL_RAMP_DOWN,
> +};
> +
> +struct ti_lmu_bl;
> +struct ti_lmu_bl_chip;
> +
> +/**
> + * struct ti_lmu_bl_reg
> + *
> + * @init:		Device initialization registers
> + * @num_init:		Numbers of initialization registers
> + * @channel:		Backlight channel configuration registers
> + * @mode:		Brightness control mode registers
> + * @ramp:		Ramp registers for lighting effect
> + * @ramp_reg_offset:	Ramp register offset.
> + *			Only used for multiple ramp registers.
> + * @enable:		Enable control register address
> + * @enable_usec:	Delay time for updating enable register.
> + *			Unit is microsecond.
> + * @brightness_msb:	Brightness MSB(Upper 8 bits) registers.
> + *			Concatenated with LSB in 11 bit dimming mode.
> + *			In 8 bit dimming, only MSB is used.
> + * @brightness_lsb:	Brightness LSB(Lower 3 bits) registers.
> + *			Only valid in 11 bit dimming mode.
> + */
> +struct ti_lmu_bl_reg {
> +	u32 *init;
> +	int num_init;
> +	u32 *channel;
> +	u32 *mode;
> +	u32 *ramp;
> +	int ramp_reg_offset;
> +	u8 *enable;
> +	unsigned long enable_usec;
> +	u8 *brightness_msb;
> +	u8 *brightness_lsb;
> +};
> +
> +/**
> + * struct ti_lmu_bl_cfg
> + *
> + * @reginfo:		Device register configuration
> + * @num_channels:	Number of backlight channels
> + * @max_brightness:	Max brightness value of backlight device
> + * @pwm_action:		How to control brightness registers in PWM mode
> + * @ramp_table:		[Optional] Ramp time table for lighting effect.
> + *			It's used for searching approximate register index.
> + * @size_ramp:		[Optional] Size of ramp table
> + * @fault_monitor_used:	[Optional] Set true if the device needs to h=
andle
> + *			LMU fault monitor event.
> + *
> + * This structure is used for device specific data configuration.
> + */
> +struct ti_lmu_bl_cfg {
> +	const struct ti_lmu_bl_reg *reginfo;
> +	int num_channels;
> +	int max_brightness;
> +	enum ti_lmu_bl_pwm_action pwm_action;
> +	int *ramp_table;
> +	int size_ramp;
> +	bool fault_monitor_used;
> +};
> +
> +/**
> + * struct ti_lmu_bl_chip
> + *
> + * @dev:		Parent device pointer
> + * @lmu:		LMU structure.
> + *			Used for register R/W access and notification.
> + * @cfg:		Device configuration data
> + * @lmu_bl:		Multiple backlight channels
> + * @num_backlights:	Number of backlight channels
> + * @nb:			Notifier block for handling LMU fault monitor event
> + *
> + * One backlight chip can have multiple backlight channels, 'ti_lmu_=
bl'.
> + */
> +struct ti_lmu_bl_chip {
> +	struct device *dev;
> +	struct ti_lmu *lmu;
> +	const struct ti_lmu_bl_cfg *cfg;
> +	struct ti_lmu_bl *lmu_bl;
> +	int num_backlights;
> +	struct notifier_block nb;
> +};
> +
> +/**
> + * struct ti_lmu_bl
> + *
> + * @chip:		Pointer to parent backlight device
> + * @bl_dev:		Backlight subsystem device structure
> + * @bank_id:		Backlight bank ID
> + * @name:		Backlight channel name
> + * @mode:		Backlight control mode
> + * @led_sources:	Backlight output channel configuration.
> + *			Bit mask is set on parsing DT.
> + * @default_brightness:	[Optional] Initial brightness value
> + * @ramp_up_msec:	[Optional] Ramp up time
> + * @ramp_down_msec:	[Optional] Ramp down time
> + * @pwm_period:		[Optional] PWM period
> + * @pwm:		[Optional] PWM subsystem structure
> + *
> + * Each backlight device has its own channel configuration.
> + * For chip control, parent chip data structure is used.
> + */
> +struct ti_lmu_bl {
> +	struct ti_lmu_bl_chip *chip;
> +	struct backlight_device *bl_dev;
> +
> +	int bank_id;
> +	const char *name;
> +	enum ti_lmu_bl_ctrl_mode mode;
> +	unsigned long led_sources;
> +
> +	unsigned int default_brightness;
> +
> +	/* Used for lighting effect */
> +	unsigned int ramp_up_msec;
> +	unsigned int ramp_down_msec;
> +
> +	/* Only valid in PWM mode */
> +	unsigned int pwm_period;
> +	struct pwm_device *pwm;
> +};
> +
> +extern struct ti_lmu_bl_cfg lmu_bl_cfg[LMU_MAX_ID];
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
