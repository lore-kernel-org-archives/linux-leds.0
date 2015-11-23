From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND 06/16] mfd: add TI LMU driver
Date: Mon, 23 Nov 2015 10:30:25 +0000
Message-ID: <20151123103025.GJ3098@x1>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-7-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446441875-1256-7-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mark Brown <broonie@kernel.org>, lm-sensors@lm-sensors.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 02 Nov 2015, Milo Kim wrote:

> TI LMU(Lighting Management Unit) driver supports lighting devices bel=
ow.

Really small nit, I'd prefer a ' ' between "LMU" and "(".

>   LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
>=20
> LMU devices have common features.
>   - I2C interface for accessing device registers
>   - Hardware enable pin control
>   - Backlight brightness control
>   - Max current conversion helper function
>   - Notifier for hardware fault monitoring
>   - Regulators for LCD display bias
>=20
> It contains backlight, HWMON, LED and regulator driver.
>=20
> Backlight
> ---------
>   It's handled by TI LMU backlight common driver and chip dependent d=
river.
>   Please refer to separate patches for ti-lmu-backlight.
>=20
> HWMON
> -----
>   LM3633 and LM3697 provide hardware monitoring feature.
>   It enables opened or shorted circuit detection.
>   After monitoring is done, each device should be re-initialized.
>   Notifier is used for this case.
>   Please refer to separate patch for ti-lmu-hwmon.
>=20
> LED indicator
> -------------
>   LM3633 has 6 indicator LEDs. Programmable pattern is also supported=
=2E
>   Please refer to separate patch for leds-lm3633.
>=20
> Regulator
> ---------
>   LM3631 has 5 regulators for the display bias.
>   LM3632 supports 3 regulators. One consolidated driver enables it.
>   Please refer to separate patch for lm363x-regulator.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: lm-sensors@lm-sensors.org
> Cc: linux-leds@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>  drivers/mfd/Kconfig                 |  12 ++
>  drivers/mfd/Makefile                |   1 +
>  drivers/mfd/ti-lmu.c                | 324 ++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/ti-lmu-register.h | 277 ++++++++++++++++++++++++++=
++++
>  include/linux/mfd/ti-lmu.h          |  81 +++++++++
>  5 files changed, 695 insertions(+)
>  create mode 100644 drivers/mfd/ti-lmu.c
>  create mode 100644 include/linux/mfd/ti-lmu-register.h
>  create mode 100644 include/linux/mfd/ti-lmu.h
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 99d6367..a53a38e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1037,6 +1037,18 @@ config MFD_LP8788
>  	  TI LP8788 PMU supports regulators, battery charger, RTC,
>  	  ADC, backlight driver and current sinks.
> =20
> +config MFD_TI_LMU
> +	tristate "TI Lighting Management Unit driver"
> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to enable support for TI LMU chips.
> +
> +	  TI LMU MFD supports LM3532, LM3631, LM3632, LM3633, LM3695 and LM=
3697.
> +	  It consists of backlight, hwmon, LED and regulator driver.
> +	  It provides consistent device controls for lighting functions.
> +
>  config MFD_OMAP_USB_HOST
>  	bool "TI OMAP USBHS core and TLL driver"
>  	depends on USB_EHCI_HCD_OMAP || USB_OHCI_HCD_OMAP3
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index a59e3fc..32920f8 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -110,6 +110,7 @@ obj-$(CONFIG_MFD_AXP20X)	+=3D axp20x.o
> =20
>  obj-$(CONFIG_MFD_LP3943)	+=3D lp3943.o
>  obj-$(CONFIG_MFD_LP8788)	+=3D lp8788.o lp8788-irq.o
> +obj-$(CONFIG_MFD_TI_LMU)	+=3D ti-lmu.o
> =20
>  da9055-objs			:=3D da9055-core.o da9055-i2c.o
>  obj-$(CONFIG_MFD_DA9055)	+=3D da9055.o
> diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
> new file mode 100644
> index 0000000..e86a0ea
> --- /dev/null
> +++ b/drivers/mfd/ti-lmu.c
> @@ -0,0 +1,324 @@
> +/*
> + * TI LMU(Lighting Management Unit) Core Driver
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
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/ti-lmu.h>
> +#include <linux/mfd/ti-lmu-register.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/slab.h>
> +
> +#define LMU_IMAX_OFFSET		6
> +
> +enum ti_lmu_id {
> +	LM3532,
> +	LM3631,
> +	LM3632,
> +	LM3633,
> +	LM3695,
> +	LM3697,
> +};
> +
> +struct ti_lmu_data {
> +	struct mfd_cell *cells;
> +	int num_cells;
> +	unsigned int max_register;
> +};
> +
> +int ti_lmu_read_byte(struct ti_lmu *lmu, u8 reg, u8 *read)
> +{
> +	int ret;
> +	unsigned int val;
> +
> +	ret =3D regmap_read(lmu->regmap, reg, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	*read =3D (u8)val;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ti_lmu_read_byte);

It doesn't get much more simple than this.

What's the purpose of abstracting it?

> +int ti_lmu_write_byte(struct ti_lmu *lmu, u8 reg, u8 data)
> +{
> +	return regmap_write(lmu->regmap, reg, data);
> +}
> +EXPORT_SYMBOL_GPL(ti_lmu_write_byte);
> +
> +int ti_lmu_update_bits(struct ti_lmu *lmu, u8 reg, u8 mask, u8 data)
> +{
> +	return regmap_update_bits(lmu->regmap, reg, mask, data);
> +}
> +EXPORT_SYMBOL_GPL(ti_lmu_update_bits);

Okay, I lied, it does get more simple.

Seems like abstraction for the sake of abstraction here.

=46eel free to try and convince me otherwise.

> +/*
> + * LMU backlight and LED devices use shared max current table.
> + * This function finds appropriate register index and return it.
> + */
> +enum ti_lmu_max_current ti_lmu_get_current_code(u32 imax_microamp)
> +{
> +	u8 imax_milliamp =3D imax_microamp / 1000;
> +
> +	const enum ti_lmu_max_current imax_table[] =3D {
> +		LMU_IMAX_6mA,  LMU_IMAX_7mA,  LMU_IMAX_8mA,  LMU_IMAX_9mA,
> +		LMU_IMAX_10mA, LMU_IMAX_11mA, LMU_IMAX_12mA, LMU_IMAX_13mA,
> +		LMU_IMAX_14mA, LMU_IMAX_15mA, LMU_IMAX_16mA, LMU_IMAX_17mA,
> +		LMU_IMAX_18mA, LMU_IMAX_19mA, LMU_IMAX_20mA, LMU_IMAX_21mA,
> +		LMU_IMAX_22mA, LMU_IMAX_23mA, LMU_IMAX_24mA, LMU_IMAX_25mA,
> +		LMU_IMAX_26mA, LMU_IMAX_27mA, LMU_IMAX_28mA, LMU_IMAX_29mA,
> +	};
> +
> +	/* Valid range is from 5mA to 30mA */
> +	if (imax_milliamp <=3D 5)
> +		return LMU_IMAX_5mA;
> +
> +	if (imax_milliamp >=3D 30)
> +		return LMU_IMAX_30mA;
> +
> +	return imax_table[imax_milliamp - LMU_IMAX_OFFSET];
> +}
> +EXPORT_SYMBOL_GPL(ti_lmu_get_current_code);
> +
> +static int ti_lmu_enable_hw(struct ti_lmu *lmu, enum ti_lmu_id id)
> +{
> +	int ret;
> +
> +	if (gpio_is_valid(lmu->en_gpio)) {
> +		ret =3D devm_gpio_request_one(lmu->dev, lmu->en_gpio,
> +					    GPIOF_OUT_INIT_HIGH, "lmu_hwen");
> +		if (ret) {
> +			dev_err(lmu->dev, "Can not request enable GPIO: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* Delay about 1ms after HW enable pin control */
> +	usleep_range(1000, 1500);
> +
> +	/* LM3631 has additional power up sequence - enable LCD_EN bit. */
> +	if (id =3D=3D LM3631) {
> +		return ti_lmu_update_bits(lmu, LM3631_REG_DEVCTRL,
> +					  LM3631_LCD_EN_MASK,
> +					  LM3631_LCD_EN_MASK);
> +	}
> +
> +	return 0;
> +}
> +
> +static void ti_lmu_disable_hw(struct ti_lmu *lmu)
> +{
> +	if (gpio_is_valid(lmu->en_gpio))
> +		gpio_set_value(lmu->en_gpio, 0);
> +}
> +
> +static struct mfd_cell lm3532_devices[] =3D {
> +	{
> +		.name          =3D "lm3532-backlight",
> +		.of_compatible =3D "ti,lm3532-backlight",
> +	},
> +};
> +
> +#define LM363X_REGULATOR(_id)			\
> +{						\
> +	.name          =3D "lm363x-regulator",	\
> +	.id            =3D _id,			\
> +	.of_compatible =3D "ti,lm363x-regulator",	\
> +}						\
> +
> +static struct mfd_cell lm3631_devices[] =3D {
> +	/* 5 regulators */

No need for this, we can read and count.

> +	LM363X_REGULATOR(LM3631_BOOST),
> +	LM363X_REGULATOR(LM3631_LDO_CONT),
> +	LM363X_REGULATOR(LM3631_LDO_OREF),
> +	LM363X_REGULATOR(LM3631_LDO_POS),
> +	LM363X_REGULATOR(LM3631_LDO_NEG),
> +	/* Backlight */

These comments are a bit redundant.

> +	{
> +		.name          =3D "lm3631-backlight",
> +		.of_compatible =3D "ti,lm3631-backlight",
> +	},
> +};
> +
> +static struct mfd_cell lm3632_devices[] =3D {
> +	/* 3 regulators */
> +	LM363X_REGULATOR(LM3632_BOOST),
> +	LM363X_REGULATOR(LM3632_LDO_POS),
> +	LM363X_REGULATOR(LM3632_LDO_NEG),
> +	/* Backlight */
> +	{
> +		.name          =3D "lm3632-backlight",
> +		.of_compatible =3D "ti,lm3632-backlight",
> +	},
> +};
> +
> +static struct mfd_cell lm3633_devices[] =3D {
> +	/* Backlight */
> +	{
> +		.name          =3D "lm3633-backlight",
> +		.of_compatible =3D "ti,lm3633-backlight",
> +	},
> +	/* LED */

The clue is in the words "-led".

> +	{
> +		.name          =3D "lm3633-leds",
> +		.of_compatible =3D "ti,lm3633-leds",
> +	},
> +	/* HWMON for opened/shorted circuit detection */
> +	{
> +		.name          =3D "ti-lmu-hwmon",
> +		.of_compatible =3D "ti,lm3633-hwmon",
> +	},
> +};
> +
> +static struct mfd_cell lm3695_devices[] =3D {
> +	{
> +		.name          =3D "lm3695-backlight",
> +		.of_compatible =3D "ti,lm3695-backlight",
> +	},
> +};
> +
> +static struct mfd_cell lm3697_devices[] =3D {
> +	/* Backlight */
> +	{
> +		.name          =3D "lm3697-backlight",
> +		.of_compatible =3D "ti,lm3697-backlight",
> +	},
> +	/* HWMON for opened/shorted circuit detection */
> +	{
> +		.name          =3D "ti-lmu-hwmon",
> +		.of_compatible =3D "ti,lm3697-hwmon",
> +	},
> +};
> +
> +#define TI_LMU_DATA(chip, max_reg)		\
> +static const struct ti_lmu_data chip##_data =3D	\
> +{						\
> +	.cells =3D chip##_devices,		\
> +	.num_cells =3D ARRAY_SIZE(chip##_devices),\
> +	.max_register =3D max_reg,		\
> +}						\
> +
> +TI_LMU_DATA(lm3532, LM3532_MAX_REG);	/* lm3532_data */
> +TI_LMU_DATA(lm3631, LM3631_MAX_REG);	/* lm3631_data */
> +TI_LMU_DATA(lm3632, LM3632_MAX_REG);	/* lm3632_data */
> +TI_LMU_DATA(lm3633, LM3633_MAX_REG);	/* lm3633_data */
> +TI_LMU_DATA(lm3695, LM3695_MAX_REG);	/* lm3695_data */
> +TI_LMU_DATA(lm3697, LM3697_MAX_REG);	/* lm3697_data */

Again with the pointless comments.

> +static const struct of_device_id ti_lmu_of_match[] =3D {
> +	{ .compatible =3D "ti,lm3532", .data =3D &lm3532_data },
> +	{ .compatible =3D "ti,lm3631", .data =3D &lm3631_data },
> +	{ .compatible =3D "ti,lm3632", .data =3D &lm3632_data },
> +	{ .compatible =3D "ti,lm3633", .data =3D &lm3633_data },
> +	{ .compatible =3D "ti,lm3695", .data =3D &lm3695_data },
> +	{ .compatible =3D "ti,lm3697", .data =3D &lm3697_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ti_lmu_of_match);
> +
> +static int ti_lmu_probe(struct i2c_client *cl, const struct i2c_devi=
ce_id *id)
> +{
> +	struct device *dev =3D &cl->dev;
> +	const struct of_device_id *match;
> +	const struct ti_lmu_data *data;
> +	struct regmap_config regmap_cfg;
> +	struct ti_lmu *lmu;
> +	int ret;
> +
> +	match =3D of_match_device(ti_lmu_of_match, dev);
> +	if (!match)
> +		return -ENODEV;
> +	/*
> +	 * Get device specific data from of_match table.
> +	 * This data is defined by using TI_LMU_DATA() macro.
> +	 */
> +	data =3D (struct ti_lmu_data *)match->data;
> +
> +	lmu =3D devm_kzalloc(dev, sizeof(*lmu), GFP_KERNEL);
> +	if (!lmu)
> +		return -ENOMEM;
> +
> +	lmu->dev =3D &cl->dev;
> +
> +	/* Setup regmap */
> +	memset(&regmap_cfg, 0, sizeof(struct regmap_config));
> +	regmap_cfg.reg_bits =3D 8;
> +	regmap_cfg.val_bits =3D 8;
> +	regmap_cfg.name =3D id->name;
> +	regmap_cfg.max_register =3D data->max_register;
> +
> +	lmu->regmap =3D devm_regmap_init_i2c(cl, &regmap_cfg);
> +	if (IS_ERR(lmu->regmap))
> +		return PTR_ERR(lmu->regmap);
> +
> +	/* HW enable pin control and additional power up sequence if requir=
ed */
> +	lmu->en_gpio =3D of_get_named_gpio(dev->of_node, "enable-gpios", 0)=
;
> +	ret =3D ti_lmu_enable_hw(lmu, id->driver_data);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Fault circuit(opened/shorted) can be detected by ti-lmu-hwmon.
> +	 * After fault detection is done, some devices should re-initialize
> +	 * configuration. The notifier enables such kind of handling.
> +	 */
> +	BLOCKING_INIT_NOTIFIER_HEAD(&lmu->notifier);
> +
> +	i2c_set_clientdata(cl, lmu);
> +
> +	return mfd_add_devices(lmu->dev, 0, data->cells,
> +			       data->num_cells, NULL, 0, NULL);
> +}
> +
> +static int ti_lmu_remove(struct i2c_client *cl)
> +{
> +	struct ti_lmu *lmu =3D i2c_get_clientdata(cl);
> +
> +	ti_lmu_disable_hw(lmu);
> +	mfd_remove_devices(lmu->dev);
> +	return 0;
> +}
> +
> +static const struct i2c_device_id ti_lmu_ids[] =3D {
> +	{ "lm3532", LM3532 },
> +	{ "lm3631", LM3631 },
> +	{ "lm3632", LM3632 },
> +	{ "lm3633", LM3633 },
> +	{ "lm3695", LM3695 },
> +	{ "lm3697", LM3697 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ti_lmu_ids);
> +
> +static struct i2c_driver ti_lmu_driver =3D {
> +	.probe =3D ti_lmu_probe,
> +	.remove =3D ti_lmu_remove,
> +	.driver =3D {
> +		.name =3D "ti-lmu",
> +		.of_match_table =3D ti_lmu_of_match,
> +	},
> +	.id_table =3D ti_lmu_ids,
> +};
> +
> +module_i2c_driver(ti_lmu_driver);
> +
> +MODULE_DESCRIPTION("TI LMU MFD Core Driver");
> +MODULE_AUTHOR("Milo Kim");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mfd/ti-lmu-register.h b/include/linux/mfd/=
ti-lmu-register.h
> new file mode 100644
> index 0000000..39f5771
> --- /dev/null
> +++ b/include/linux/mfd/ti-lmu-register.h
> @@ -0,0 +1,277 @@
> +/*
> + * TI LMU(Lighting Management Unit) Device Register Map
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
> +#ifndef __MFD_TI_LMU_REGISTER_H__
> +#define __MFD_TI_LMU_REGISTER_H__
> +
> +#include <linux/mfd/ti-lmu.h>
> +
> +/* LM3532 */
> +#define LM3532_REG_OUTPUT_CFG			0x10
> +#define LM3532_ILED1_CFG_MASK			0x03
> +#define LM3532_ILED2_CFG_MASK			0x0C
> +#define LM3532_ILED3_CFG_MASK			0x30
> +#define LM3532_ILED1_CFG_SHIFT			0
> +#define LM3532_ILED2_CFG_SHIFT			2
> +#define LM3532_ILED3_CFG_SHIFT			4
> +
> +#define LM3532_REG_RAMPUP			0x12
> +#define LM3532_REG_RAMPDN			LM3532_REG_RAMPUP
> +#define LM3532_RAMPUP_MASK			0x07
> +#define LM3532_RAMPUP_SHIFT			0
> +#define LM3532_RAMPDN_MASK			0x38
> +#define LM3532_RAMPDN_SHIFT			3
> +
> +#define LM3532_REG_ENABLE			0x1D
> +
> +#define LM3532_REG_PWM_CFG_BASE			0x13
> +#define LM3532_PWM_SEL_A_MASK			0x05	/* zone 0 */
> +#define LM3532_PWM_SEL_B_MASK			0x09	/* zone 1 */
> +#define LM3532_PWM_SEL_C_MASK			0x11	/* zone 2 */
> +#define LM3532_PWM_SEL_A_SHIFT			2
> +#define LM3532_PWM_SEL_B_SHIFT			3
> +#define LM3532_PWM_SEL_C_SHIFT			4
> +
> +#define LM3532_REG_ZONE_CFG_A			0x16
> +#define LM3532_REG_ZONE_CFG_B			0x18
> +#define LM3532_REG_ZONE_CFG_C			0x1A
> +#define LM3532_ZONE_CFG_MASK			(BIT(2) | BIT(3) | BIT(4))
> +#define LM3532_ZONE_CFG_SHIFT			2
> +
> +#define LM3532_REG_IMAX_A			0x17
> +#define LM3532_REG_IMAX_B			0x19
> +#define LM3532_REG_IMAX_C			0x1B
> +
> +#define LM3532_REG_BRT_A			0x70	/* zone 0 */
> +#define LM3532_REG_BRT_B			0x76	/* zone 1 */
> +#define LM3532_REG_BRT_C			0x7C	/* zone 2 */
> +
> +#define LM3532_MAX_REG				0x7E
> +
> +/* LM3631 */
> +#define LM3631_REG_DEVCTRL			0x00
> +#define LM3631_LCD_EN_MASK			BIT(1)
> +#define LM3631_BL_EN_MASK			BIT(0)
> +
> +#define LM3631_REG_BRT_LSB			0x01
> +#define LM3631_BRT_LSB_MASK			(BIT(0) | BIT(1) | BIT(2))
> +#define LM3631_REG_BRT_MSB			0x02
> +#define LM3631_BRT_MSB_SHIFT			3
> +
> +#define LM3631_REG_BL_CFG			0x06
> +#define LM3631_BL_STRING_MASK			BIT(3)
> +#define LM3631_BL_TWO_STRINGS			0
> +#define LM3631_BL_ONE_STRING			BIT(3)
> +#define LM3631_MAP_MASK				BIT(5)
> +#define LM3631_EXPONENTIAL_MAP			0
> +
> +#define LM3631_REG_BRT_MODE			0x08
> +#define LM3631_EN_SLOPE_MASK			BIT(1)
> +#define LM3631_MODE_MASK			(BIT(2) | BIT(3))
> +#define LM3631_MODE_I2C				0
> +#define LM3631_MODE_PWM				BIT(2)
> +#define LM3631_MODE_COMB1			BIT(3)
> +#define LM3631_MODE_COMB2			(BIT(2) | BIT(3))
> +
> +#define LM3631_REG_SLOPE			0x09
> +#define LM3631_SLOPE_MASK			0xF0
> +#define LM3631_SLOPE_SHIFT			4
> +
> +#define LM3631_REG_LDO_CTRL1			0x0A
> +#define LM3631_EN_OREF_MASK			BIT(0)
> +#define LM3631_EN_VNEG_MASK			BIT(1)
> +#define LM3631_EN_VPOS_MASK			BIT(2)
> +
> +#define LM3631_REG_LDO_CTRL2			0x0B
> +#define LM3631_EN_CONT_MASK			BIT(0)
> +
> +#define LM3631_REG_VOUT_CONT			0x0C
> +#define LM3631_VOUT_CONT_MASK			(BIT(6) | BIT(7))
> +
> +#define LM3631_REG_VOUT_BOOST			0x0C
> +#define LM3631_REG_VOUT_POS			0x0D
> +#define LM3631_REG_VOUT_NEG			0x0E
> +#define LM3631_REG_VOUT_OREF			0x0F
> +#define LM3631_VOUT_MASK			0x3F
> +
> +#define LM3631_REG_ENTIME_VCONT			0x0B
> +#define LM3631_ENTIME_CONT_MASK			0x70
> +
> +#define LM3631_REG_ENTIME_VOREF			0x0F
> +#define LM3631_REG_ENTIME_VPOS			0x10
> +#define LM3631_REG_ENTIME_VNEG			0x11
> +#define LM3631_ENTIME_MASK			0xF0
> +#define LM3631_ENTIME_SHIFT			4
> +
> +#define LM3631_MAX_REG				0x16
> +
> +/* LM3632 */
> +#define LM3632_REG_CONFIG1			0x02
> +#define LM3632_OVP_MASK				(BIT(5) | BIT(6) | BIT(7))
> +#define LM3632_OVP_25V				BIT(6)
> +
> +#define LM3632_REG_CONFIG2			0x03
> +#define LM3632_SWFREQ_MASK			BIT(7)
> +#define LM3632_SWFREQ_1MHZ			BIT(7)
> +
> +#define LM3632_REG_BRT_LSB			0x04
> +#define LM3632_BRT_LSB_MASK			(BIT(0) | BIT(1) | BIT(2))
> +#define LM3632_REG_BRT_MSB			0x05
> +#define LM3632_BRT_MSB_SHIFT			3
> +
> +#define LM3632_REG_IO_CTRL			0x09
> +#define LM3632_PWM_MASK				BIT(6)
> +#define LM3632_I2C_MODE				0
> +#define LM3632_PWM_MODE				BIT(6)
> +
> +#define LM3632_REG_ENABLE			0x0A
> +#define LM3632_BL_EN_MASK			BIT(0)
> +#define LM3632_BL_STRING_MASK			(BIT(3) | BIT(4))
> +#define LM3632_BL_ONE_STRING			BIT(4)
> +#define LM3632_BL_TWO_STRINGS			BIT(3)
> +
> +#define LM3632_REG_BIAS_CONFIG			0x0C
> +#define LM3632_EXT_EN_MASK			BIT(0)
> +#define LM3632_EN_VNEG_MASK			BIT(1)
> +#define LM3632_EN_VPOS_MASK			BIT(2)
> +
> +#define LM3632_REG_VOUT_BOOST			0x0D
> +#define LM3632_REG_VOUT_POS			0x0E
> +#define LM3632_REG_VOUT_NEG			0x0F
> +#define LM3632_VOUT_MASK			0x3F
> +
> +#define LM3632_MAX_REG				0x10
> +
> +/* LM3633 */
> +#define LM3633_REG_HVLED_OUTPUT_CFG		0x10
> +
> +#define LM3633_REG_BANK_SEL			0x11
> +
> +#define LM3633_REG_BL0_RAMPUP			0x12
> +#define LM3633_REG_BL0_RAMPDN			LM3633_REG_BL0_RAMPUP
> +#define LM3633_REG_BL1_RAMPUP			0x13
> +#define LM3633_REG_BL1_RAMPDN			LM3633_REG_BL1_RAMPUP
> +#define LM3633_BL_RAMPUP_MASK			0xF0
> +#define LM3633_BL_RAMPUP_SHIFT			4
> +#define LM3633_BL_RAMPDN_MASK			0x0F
> +#define LM3633_BL_RAMPDN_SHIFT			0
> +
> +#define LM3633_REG_BL_RAMP_CONF			0x1B
> +#define LM3633_BL_RAMP_MASK			0x0F
> +#define LM3633_BL_RAMP_EACH			0x05
> +
> +#define LM3633_REG_PTN0_RAMP			0x1C
> +#define LM3633_REG_PTN1_RAMP			0x1D
> +#define LM3633_PTN_RAMPUP_MASK			0x70
> +#define LM3633_PTN_RAMPUP_SHIFT			4
> +#define LM3633_PTN_RAMPDN_MASK			0x07
> +#define LM3633_PTN_RAMPDN_SHIFT			0
> +
> +#define LM3633_REG_IMAX_HVLED_A			0x20
> +#define LM3633_REG_IMAX_HVLED_B			0x21
> +#define LM3633_REG_IMAX_LVLED_BASE		0x22
> +
> +#define LM3633_REG_BL_FEEDBACK_ENABLE		0x28
> +
> +#define LM3633_REG_ENABLE			0x2B
> +#define LM3633_LED_BANK_OFFSET			2
> +
> +#define LM3633_REG_PATTERN			0x2C
> +
> +#define LM3633_REG_BOOST_CFG			0x2D
> +#define LM3633_BOOST_OVP_MASK			(BIT(1) | BIT(2))
> +#define LM3633_BOOST_OVP_40V			0x6
> +
> +#define LM3633_REG_PWM_CFG			0x2F
> +
> +#define LM3633_REG_BRT_HVLED_A_LSB		0x40
> +#define LM3633_REG_BRT_HVLED_A_MSB		0x41
> +#define LM3633_REG_BRT_HVLED_B_LSB		0x42
> +#define LM3633_REG_BRT_HVLED_B_MSB		0x43
> +#define LM3633_BRT_HVLED_LSB_MASK		(BIT(0) | BIT(1) | BIT(2))
> +#define LM3633_BRT_HVLED_MSB_SHIFT		3
> +
> +#define LM3633_REG_BRT_LVLED_BASE		0x44
> +
> +#define LM3633_REG_PTN_DELAY			0x50
> +
> +#define LM3633_REG_PTN_LOWTIME			0x51
> +
> +#define LM3633_REG_PTN_HIGHTIME			0x52
> +
> +#define LM3633_REG_PTN_LOWBRT			0x53
> +
> +#define LM3633_REG_PTN_HIGHBRT			LM3633_REG_BRT_LVLED_BASE
> +
> +#define LM3633_REG_BL_OPEN_FAULT_STATUS		0xB0
> +
> +#define LM3633_REG_BL_SHORT_FAULT_STATUS	0xB2
> +
> +#define LM3633_REG_MONITOR_ENABLE		0xB4
> +
> +#define LM3633_MAX_REG				0xB4
> +
> +/* LM3695 */
> +#define LM3695_REG_GP				0x10
> +#define LM3695_BL_STRING_MASK			BIT(3)
> +#define LM3695_BL_TWO_STRINGS			0
> +#define LM3695_BL_ONE_STRING			BIT(3)
> +#define LM3695_BRT_RW_MASK			BIT(2)
> +#define LM3695_BL_EN_MASK			BIT(0)
> +
> +#define LM3695_REG_BRT_LSB			0x13
> +#define LM3695_BRT_LSB_MASK			(BIT(0) | BIT(1) | BIT(2))
> +#define LM3695_REG_BRT_MSB			0x14
> +#define LM3695_BRT_MSB_SHIFT			3
> +
> +#define LM3695_MAX_REG				0x14
> +
> +/* LM3697 */
> +#define LM3697_REG_HVLED_OUTPUT_CFG		0x10
> +
> +#define LM3697_REG_BL0_RAMPUP			0x11
> +#define LM3697_REG_BL0_RAMPDN			LM3697_REG_BL0_RAMPUP
> +#define LM3697_REG_BL1_RAMPUP			0x12
> +#define LM3697_REG_BL1_RAMPDN			LM3697_REG_BL1_RAMPUP
> +#define LM3697_BL_RAMPUP_MASK			0xF0
> +#define LM3697_BL_RAMPUP_SHIFT			4
> +#define LM3697_BL_RAMPDN_MASK			0x0F
> +#define LM3697_BL_RAMPDN_SHIFT			0
> +
> +#define LM3697_REG_RAMP_CONF			0x14
> +#define LM3697_RAMP_MASK			0x0F
> +#define LM3697_RAMP_EACH			0x05
> +
> +#define LM3697_REG_PWM_CFG			0x1C
> +
> +#define LM3697_REG_IMAX_A			0x17
> +#define LM3697_REG_IMAX_B			0x18
> +
> +#define LM3697_REG_FEEDBACK_ENABLE		0x19
> +
> +#define LM3697_REG_BRT_A_LSB			0x20
> +#define LM3697_REG_BRT_A_MSB			0x21
> +#define LM3697_REG_BRT_B_LSB			0x22
> +#define LM3697_REG_BRT_B_MSB			0x23
> +#define LM3697_BRT_LSB_MASK			(BIT(0) | BIT(1) | BIT(2))
> +#define LM3697_BRT_MSB_SHIFT			3
> +
> +#define LM3697_REG_ENABLE			0x24
> +
> +#define LM3697_REG_OPEN_FAULT_STATUS		0xB0
> +
> +#define LM3697_REG_SHORT_FAULT_STATUS		0xB2
> +
> +#define LM3697_REG_MONITOR_ENABLE		0xB4
> +
> +#define LM3697_MAX_REG				0xB4
> +#endif
> diff --git a/include/linux/mfd/ti-lmu.h b/include/linux/mfd/ti-lmu.h
> new file mode 100644
> index 0000000..eeb6b9e
> --- /dev/null
> +++ b/include/linux/mfd/ti-lmu.h
> @@ -0,0 +1,81 @@
> +/*
> + * TI LMU(Lighting Management Unit) Devices
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
> +#ifndef __MFD_TI_LMU_H__
> +#define __MFD_TI_LMU_H__
> +
> +#include <linux/gpio.h>
> +#include <linux/regmap.h>
> +
> +/* Notifier event */
> +#define LMU_EVENT_HWMON_DONE		0x01
> +
> +enum ti_lmu_max_current {
> +	LMU_IMAX_5mA,
> +	LMU_IMAX_6mA,
> +	LMU_IMAX_7mA =3D 0x03,
> +	LMU_IMAX_8mA,
> +	LMU_IMAX_9mA,
> +	LMU_IMAX_10mA =3D 0x07,
> +	LMU_IMAX_11mA,
> +	LMU_IMAX_12mA,
> +	LMU_IMAX_13mA,
> +	LMU_IMAX_14mA,
> +	LMU_IMAX_15mA =3D 0x0D,
> +	LMU_IMAX_16mA,
> +	LMU_IMAX_17mA,
> +	LMU_IMAX_18mA,
> +	LMU_IMAX_19mA,
> +	LMU_IMAX_20mA =3D 0x13,
> +	LMU_IMAX_21mA,
> +	LMU_IMAX_22mA,
> +	LMU_IMAX_23mA =3D 0x17,
> +	LMU_IMAX_24mA,
> +	LMU_IMAX_25mA,
> +	LMU_IMAX_26mA,
> +	LMU_IMAX_27mA =3D 0x1C,
> +	LMU_IMAX_28mA,
> +	LMU_IMAX_29mA,
> +	LMU_IMAX_30mA,
> +};
> +
> +enum lm363x_regulator_id {
> +	LM3631_BOOST,		/* Boost output */
> +	LM3631_LDO_CONT,	/* Display panel controller */
> +	LM3631_LDO_OREF,	/* Gamma reference */
> +	LM3631_LDO_POS,		/* Positive display bias output */
> +	LM3631_LDO_NEG,		/* Negative display bias output */
> +	LM3632_BOOST,		/* Boost output */
> +	LM3632_LDO_POS,		/* Positive display bias output */
> +	LM3632_LDO_NEG,		/* Negative display bias output */
> +};
> +
> +/**
> + * struct ti_lmu
> + *
> + * @dev:	Parent device pointer
> + * @regmap:	Used for i2c communcation on accessing registers
> + * @en_gpio:	GPIO for HWEN pin [Optional]
> + * @notifier:	Notifier for reporting hwmon event
> + */
> +struct ti_lmu {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	int en_gpio;
> +	struct blocking_notifier_head notifier;
> +};
> +
> +int ti_lmu_read_byte(struct ti_lmu *lmu, u8 reg, u8 *read);
> +int ti_lmu_write_byte(struct ti_lmu *lmu, u8 reg, u8 data);
> +int ti_lmu_update_bits(struct ti_lmu *lmu, u8 reg, u8 mask, u8 data)=
;
> +enum ti_lmu_max_current ti_lmu_get_current_code(u32 imax_microamp);
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
