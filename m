From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v13 03/13] leds: Add support for max77693 mfd flash
 cell
Date: Mon, 23 Mar 2015 12:07:19 +0000
Message-ID: <20150323120719.GF24422@x1>
References: <1426175114-14876-1-git-send-email-j.anaszewski@samsung.com>
 <1426175114-14876-4-git-send-email-j.anaszewski@samsung.com>
 <20150323115618.GE24422@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:37965 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752135AbbCWMHY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 23 Mar 2015 08:07:24 -0400
Received: by wibgn9 with SMTP id gn9so60273483wib.1
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2015 05:07:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150323115618.GE24422@x1>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

> This patch requires a DT Ack.

Whoops, not this one.  Patch 4.

> > This patch adds led-flash support to Maxim max77693 chipset.
> > A device can be exposed to user space through LED subsystem
> > sysfs interface. Device supports up to two leds which can
> > work in flash and torch mode. The leds can be triggered
> > externally or by software.
> >=20
> > Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> > Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> > Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Bryan Wu <cooloney@gmail.com>
> > Cc: Richard Purdie <rpurdie@rpsys.net>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > ---
> >  drivers/leds/Kconfig         |   10 +
> >  drivers/leds/Makefile        |    1 +
> >  drivers/leds/leds-max77693.c |  993 ++++++++++++++++++++++++++++++=
++++++++++++
> >  3 files changed, 1004 insertions(+)
> >  create mode 100644 drivers/leds/leds-max77693.c
> >=20
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 25b320d..ccef436 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -467,6 +467,16 @@ config LEDS_TCA6507
> >  	  LED driver chips accessed via the I2C bus.
> >  	  Driver support brightness control and hardware-assisted blinkin=
g.
> > =20
> > +config LEDS_MAX77693
> > +	tristate "LED support for MAX77693 Flash"
> > +	depends on LEDS_CLASS_FLASH
> > +	depends on MFD_MAX77693
> > +	depends on OF
> > +	help
> > +	  This option enables support for the flash part of the MAX77693
> > +	  multifunction device. It has build in control for two leds in f=
lash
> > +	  and torch mode.
> > +
> >  config LEDS_MAX8997
> >  	tristate "LED support for MAX8997 PMIC"
> >  	depends on LEDS_CLASS && MFD_MAX8997
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index cbba921..57ca62b 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -52,6 +52,7 @@ obj-$(CONFIG_LEDS_MC13783)		+=3D leds-mc13783.o
> >  obj-$(CONFIG_LEDS_NS2)			+=3D leds-ns2.o
> >  obj-$(CONFIG_LEDS_NETXBIG)		+=3D leds-netxbig.o
> >  obj-$(CONFIG_LEDS_ASIC3)		+=3D leds-asic3.o
> > +obj-$(CONFIG_LEDS_MAX77693)		+=3D leds-max77693.o
> >  obj-$(CONFIG_LEDS_MAX8997)		+=3D leds-max8997.o
> >  obj-$(CONFIG_LEDS_LM355x)		+=3D leds-lm355x.o
> >  obj-$(CONFIG_LEDS_BLINKM)		+=3D leds-blinkm.o
> > diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77=
693.c
> > new file mode 100644
> > index 0000000..6873611
> > --- /dev/null
> > +++ b/drivers/leds/leds-max77693.c
> > @@ -0,0 +1,993 @@
> > +/*
> > + * LED Flash class driver for the flash cell of max77693 mfd.
> > + *
> > + *	Copyright (C) 2015, Samsung Electronics Co., Ltd.
> > + *
> > + *	Authors: Jacek Anaszewski <j.anaszewski@samsung.com>
> > + *		 Andrzej Hajda <a.hajda@samsung.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * version 2 as published by the Free Software Foundation.
> > + */
> > +
> > +#include <asm/div64.h>
> > +#include <linux/led-class-flash.h>
> > +#include <linux/mfd/max77693.h>
> > +#include <linux/mfd/max77693-private.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/workqueue.h>
> > +
> > +#define MODE_OFF		0
> > +#define MODE_FLASH(a)		(1 << (a))
> > +#define MODE_TORCH(a)		(1 << (2 + (a)))
> > +#define MODE_FLASH_EXTERNAL(a)	(1 << (4 + (a)))
> > +
> > +#define MODE_FLASH_MASK		(MODE_FLASH(FLED1) | MODE_FLASH(FLED2) | =
\
> > +				 MODE_FLASH_EXTERNAL(FLED1) | \
> > +				 MODE_FLASH_EXTERNAL(FLED2))
> > +#define MODE_TORCH_MASK		(MODE_TORCH(FLED1) | MODE_TORCH(FLED2))
> > +
> > +#define FLED1_IOUT		(1 << 0)
> > +#define FLED2_IOUT		(1 << 1)
> > +
> > +#define MAX77693_LED1_NAME	"max77693-led.1"
> > +#define MAX77693_LED2_NAME	"max77693-led.2"
> > +
> > +enum max77693_fled {
> > +	FLED1,
> > +	FLED2,
> > +};
> > +
> > +enum max77693_led_mode {
> > +	FLASH,
> > +	TORCH,
> > +};
> > +
> > +struct max77693_led_config_data {
> > +	const char *label[2];
> > +	u32 iout_torch_max[2];
> > +	u32 iout_flash_max[2];
> > +	u32 flash_timeout[2];
> > +	u32 num_leds;
> > +	u32 boost_mode;
> > +	u32 boost_vout;
> > +	u32 low_vsys;
> > +	u32 trigger_type;
> > +};
> > +
> > +struct max77693_sub_led {
> > +	/* related FLED output identifier */
> > +	int fled_id;
> > +	/* related LED Flash class device */
> > +	struct led_classdev_flash fled_cdev;
> > +	/* assures led-triggers compatibility */
> > +	struct work_struct work_brightness_set;
> > +
> > +	/* brightness cache */
> > +	unsigned int torch_brightness;
> > +	/* flash timeout cache */
> > +	unsigned int flash_timeout;
> > +	/* flash faults that may have occurred */
> > +	u32 flash_faults;
> > +};
> > +
> > +struct max77693_led_device {
> > +	/* parent mfd regmap */
> > +	struct regmap *regmap;
> > +	/* platform device data */
> > +	struct platform_device *pdev;
> > +	/* secures access to the device */
> > +	struct mutex lock;
> > +
> > +	/* sub led data */
> > +	struct max77693_sub_led sub_leds[2];
> > +
> > +	/* maximum torch current values for FLED outputs */
> > +	u32 iout_torch_max[2];
> > +	/* maximum flash current values for FLED outputs */
> > +	u32 iout_flash_max[2];
> > +	/* flash trigger type */
> > +	u32 trigger_type;
> > +
> > +	/* current flash timeout cache */
> > +	unsigned int current_flash_timeout;
> > +	/* ITORCH register cache */
> > +	u8 torch_iout_reg;
> > +	/* mode of fled outputs */
> > +	unsigned int mode_flags;
> > +	/* recently strobed fled */
> > +	int strobing_sub_led_id;
> > +	/* bitmask of fled outputs use state (bit 0. - FLED1, bit 1. - FL=
ED2) */
> > +	u8 fled_mask;
> > +	/* FLED modes that can be set */
> > +	u8 allowed_modes;
> > +
> > +	/* arrangement of current outputs */
> > +	bool iout_joint;
> > +};
> > +
> > +struct max77693_led_settings {
> > +	struct led_flash_setting torch_brightness;
> > +	struct led_flash_setting flash_brightness;
> > +	struct led_flash_setting flash_timeout;
> > +};
> > +
> > +static u8 max77693_led_iout_to_reg(u32 ua)
> > +{
> > +	if (ua < FLASH_IOUT_MIN)
> > +		ua =3D FLASH_IOUT_MIN;
> > +	return (ua - FLASH_IOUT_MIN) / FLASH_IOUT_STEP;
> > +}
> > +
> > +static u8 max77693_flash_timeout_to_reg(u32 us)
> > +{
> > +	return (us - FLASH_TIMEOUT_MIN) / FLASH_TIMEOUT_STEP;
> > +}
> > +
> > +static inline struct max77693_sub_led *flcdev_to_sub_led(
> > +					struct led_classdev_flash *fled_cdev)
> > +{
> > +	return container_of(fled_cdev, struct max77693_sub_led, fled_cdev=
);
> > +}
> > +
> > +static inline struct max77693_led_device *sub_led_to_led(
> > +					struct max77693_sub_led *sub_led)
> > +{
> > +	return container_of(sub_led, struct max77693_led_device,
> > +				sub_leds[sub_led->fled_id]);
> > +}
> > +
> > +static inline u8 max77693_led_vsys_to_reg(u32 mv)
> > +{
> > +	return ((mv - MAX_FLASH1_VSYS_MIN) / MAX_FLASH1_VSYS_STEP) << 2;
> > +}
> > +
> > +static inline u8 max77693_led_vout_to_reg(u32 mv)
> > +{
> > +	return (mv - FLASH_VOUT_MIN) / FLASH_VOUT_STEP + FLASH_VOUT_RMIN;
> > +}
> > +
> > +static inline bool max77693_fled_used(struct max77693_led_device *=
led,
> > +					 int fled_id)
> > +{
> > +	u8 fled_bit =3D (fled_id =3D=3D FLED1) ? FLED1_IOUT : FLED2_IOUT;
> > +
> > +	return led->fled_mask & fled_bit;
> > +}
> > +
> > +static int max77693_set_mode_reg(struct max77693_led_device *led, =
u8 mode)
> > +{
> > +	struct regmap *rmap =3D led->regmap;
> > +	int ret, v =3D 0, i;
> > +
> > +	for (i =3D FLED1; i <=3D FLED2; ++i) {
> > +		if (mode & MODE_TORCH(i))
> > +			v |=3D FLASH_EN_ON << TORCH_EN_SHIFT(i);
> > +
> > +		if (mode & MODE_FLASH(i)) {
> > +			v |=3D FLASH_EN_ON << FLASH_EN_SHIFT(i);
> > +		} else if (mode & MODE_FLASH_EXTERNAL(i)) {
> > +			v |=3D FLASH_EN_FLASH << FLASH_EN_SHIFT(i);
> > +			/*
> > +			 * Enable hw triggering also for torch mode, as some
> > +			 * camera sensors use torch led to fathom ambient light
> > +			 * conditions before strobing the flash.
> > +			 */
> > +			v |=3D FLASH_EN_TORCH << TORCH_EN_SHIFT(i);
> > +		}
> > +	}
> > +
> > +	/* Reset the register only prior setting flash modes */
> > +	if (mode & ~(MODE_TORCH(FLED1) | MODE_TORCH(FLED2))) {
> > +		ret =3D regmap_write(rmap, MAX77693_LED_REG_FLASH_EN, 0);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	return regmap_write(rmap, MAX77693_LED_REG_FLASH_EN, v);
> > +}
> > +
> > +static int max77693_add_mode(struct max77693_led_device *led, u8 m=
ode)
> > +{
> > +	int i, ret;
> > +
> > +	mode &=3D led->allowed_modes;
> > +
> > +	/*
> > +	 * Torch mode once enabled remains active until turned off. If th=
e FLED2
> > +	 * output isn't to be disabled check if the torch mode to be set =
isn't
> > +	 * already activated and avoid re-setting it.
> > +	 */
> > +	if ((!(mode ^ led->mode_flags)) & MODE_TORCH(FLED2)) {
> > +		for (i =3D FLED1; i <=3D FLED2; ++i)
> > +			if ((mode & led->mode_flags & MODE_TORCH(i)))
> > +				return 0;
> > +	}
> > +
> > +	if (led->iout_joint)
> > +		/* Span the mode on FLED2 for joint iouts case */
> > +		mode |=3D (mode << 1);
> > +
> > +	/*
> > +	 * FLASH_EXTERNAL mode activates FLASHEN and TORCHEN pins in the =
device.
> > +	 * The related register bits fields interfere with SW triggerred =
modes,
> > +	 * thus clear them to ensure proper device configuration.
> > +	 */
> > +	for (i =3D FLED1; i <=3D FLED2; ++i)
> > +		if (mode & MODE_FLASH_EXTERNAL(i))
> > +			led->mode_flags &=3D (~MODE_TORCH(i) & ~MODE_FLASH(i));
> > +
> > +	led->mode_flags |=3D mode;
> > +	led->mode_flags &=3D led->allowed_modes;
> > +
> > +	ret =3D max77693_set_mode_reg(led, led->mode_flags);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * Clear flash mode flag after setting the mode to avoid spurious=
 flash
> > +	 * strobing on each subsequent torch mode setting.
> > +	 */
> > +	if (mode & MODE_FLASH_MASK)
> > +		led->mode_flags &=3D ~mode;
> > +
> > +	return ret;
> > +}
> > +
> > +static int max77693_clear_mode(struct max77693_led_device *led,
> > +				u8 mode)
> > +{
> > +	if (led->iout_joint)
> > +		/* Clear mode also on FLED2 for joint iouts case */
> > +		mode |=3D (mode << 1);
> > +
> > +	led->mode_flags &=3D ~mode;
> > +
> > +	return max77693_set_mode_reg(led, led->mode_flags);
> > +}
> > +
> > +static void max77693_add_allowed_modes(struct max77693_led_device =
*led,
> > +				int fled_id, enum max77693_led_mode mode)
> > +{
> > +	if (mode =3D=3D FLASH)
> > +		led->allowed_modes |=3D (MODE_FLASH(fled_id) |
> > +				       MODE_FLASH_EXTERNAL(fled_id));
> > +	else
> > +		led->allowed_modes |=3D MODE_TORCH(fled_id);
> > +}
> > +
> > +static void max77693_distribute_currents(struct max77693_led_devic=
e *led,
> > +				int fled_id, enum max77693_led_mode mode,
> > +				u32 micro_amp, u32 iout_max[2], u32 iout[2])
> > +{
> > +	if (!led->iout_joint) {
> > +		iout[fled_id] =3D micro_amp;
> > +		max77693_add_allowed_modes(led, fled_id, mode);
> > +		return;
> > +	}
> > +
> > +	iout[FLED1] =3D min(micro_amp, iout_max[FLED1]);
> > +	iout[FLED2] =3D micro_amp - iout[FLED1];
> > +
> > +	if (mode =3D=3D FLASH)
> > +		led->allowed_modes &=3D ~MODE_FLASH_MASK;
> > +	else
> > +		led->allowed_modes &=3D ~MODE_TORCH_MASK;
> > +
> > +	max77693_add_allowed_modes(led, FLED1, mode);
> > +
> > +	if (iout[FLED2])
> > +		max77693_add_allowed_modes(led, FLED2, mode);
> > +}
> > +
> > +static int max77693_set_torch_current(struct max77693_led_device *=
led,
> > +				int fled_id, u32 micro_amp)
> > +{
> > +	struct regmap *rmap =3D led->regmap;
> > +	u8 iout1_reg =3D 0, iout2_reg =3D 0;
> > +	u32 iout[2];
> > +
> > +	max77693_distribute_currents(led, fled_id, TORCH, micro_amp,
> > +					led->iout_torch_max, iout);
> > +
> > +	if (fled_id =3D=3D FLED1 || led->iout_joint) {
> > +		iout1_reg =3D max77693_led_iout_to_reg(iout[FLED1]);
> > +		led->torch_iout_reg &=3D TORCH_IOUT_MASK(TORCH_IOUT2_SHIFT);
> > +	}
> > +	if (fled_id =3D=3D FLED2 || led->iout_joint) {
> > +		iout2_reg =3D max77693_led_iout_to_reg(iout[FLED2]);
> > +		led->torch_iout_reg &=3D TORCH_IOUT_MASK(TORCH_IOUT1_SHIFT);
> > +	}
> > +
> > +	led->torch_iout_reg |=3D ((iout1_reg << TORCH_IOUT1_SHIFT) |
> > +				(iout2_reg << TORCH_IOUT2_SHIFT));
> > +
> > +	return regmap_write(rmap, MAX77693_LED_REG_ITORCH,
> > +						led->torch_iout_reg);
> > +}
> > +
> > +static int max77693_set_flash_current(struct max77693_led_device *=
led,
> > +					int fled_id,
> > +					u32 micro_amp)
> > +{
> > +	struct regmap *rmap =3D led->regmap;
> > +	u8 iout1_reg, iout2_reg;
> > +	u32 iout[2];
> > +	int ret =3D -EINVAL;
> > +
> > +	max77693_distribute_currents(led, fled_id, FLASH, micro_amp,
> > +					led->iout_flash_max, iout);
> > +
> > +	if (fled_id =3D=3D FLED1 || led->iout_joint) {
> > +		iout1_reg =3D max77693_led_iout_to_reg(iout[FLED1]);
> > +		ret =3D regmap_write(rmap, MAX77693_LED_REG_IFLASH1,
> > +							iout1_reg);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +	if (fled_id =3D=3D FLED2 || led->iout_joint) {
> > +		iout2_reg =3D max77693_led_iout_to_reg(iout[FLED2]);
> > +		ret =3D regmap_write(rmap, MAX77693_LED_REG_IFLASH2,
> > +							iout2_reg);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int max77693_set_timeout(struct max77693_led_device *led, u=
32 microsec)
> > +{
> > +	struct regmap *rmap =3D led->regmap;
> > +	u8 v;
> > +	int ret;
> > +
> > +	v =3D max77693_flash_timeout_to_reg(microsec);
> > +
> > +	if (led->trigger_type =3D=3D MAX77693_LED_TRIG_TYPE_LEVEL)
> > +		v |=3D FLASH_TMR_LEVEL;
> > +
> > +	ret =3D regmap_write(rmap, MAX77693_LED_REG_FLASH_TIMER, v);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	led->current_flash_timeout =3D microsec;
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77693_get_strobe_status(struct max77693_led_device *=
led,
> > +					bool *state)
> > +{
> > +	struct regmap *rmap =3D led->regmap;
> > +	unsigned int v;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(rmap, MAX77693_LED_REG_FLASH_STATUS, &v);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*state =3D v & FLASH_STATUS_FLASH_ON;
> > +
> > +	return ret;
> > +}
> > +
> > +static int max77693_get_flash_faults(struct max77693_sub_led *sub_=
led)
> > +{
> > +	struct max77693_led_device *led =3D sub_led_to_led(sub_led);
> > +	struct regmap *rmap =3D led->regmap;
> > +	unsigned int v;
> > +	u8 fault_open_mask, fault_short_mask;
> > +	int ret;
> > +
> > +	sub_led->flash_faults =3D 0;
> > +
> > +	if (led->iout_joint) {
> > +		fault_open_mask =3D FLASH_INT_FLED1_OPEN | FLASH_INT_FLED2_OPEN;
> > +		fault_short_mask =3D FLASH_INT_FLED1_SHORT |
> > +							FLASH_INT_FLED2_SHORT;
> > +	} else {
> > +		fault_open_mask =3D (sub_led->fled_id =3D=3D FLED1) ?
> > +						FLASH_INT_FLED1_OPEN :
> > +						FLASH_INT_FLED2_OPEN;
> > +		fault_short_mask =3D (sub_led->fled_id =3D=3D FLED1) ?
> > +						FLASH_INT_FLED1_SHORT :
> > +						FLASH_INT_FLED2_SHORT;
> > +	}
> > +
> > +	ret =3D regmap_read(rmap, MAX77693_LED_REG_FLASH_INT, &v);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (v & fault_open_mask)
> > +		sub_led->flash_faults |=3D LED_FAULT_OVER_VOLTAGE;
> > +	if (v & fault_short_mask)
> > +		sub_led->flash_faults |=3D LED_FAULT_SHORT_CIRCUIT;
> > +	if (v & FLASH_INT_OVER_CURRENT)
> > +		sub_led->flash_faults |=3D LED_FAULT_OVER_CURRENT;
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77693_setup(struct max77693_led_device *led,
> > +			 struct max77693_led_config_data *cfg)
> > +{
> > +	struct regmap *rmap =3D led->regmap;
> > +	int i, first_led, last_led, ret;
> > +	u32 max_flash_curr[2];
> > +	u8 v;
> > +
> > +	/*
> > +	 * Initialize only flash current. Torch current doesn't
> > +	 * require initialization as ITORCH register is written with
> > +	 * new value each time brightness_set op is called.
> > +	 */
> > +	if (led->iout_joint) {
> > +		first_led =3D FLED1;
> > +		last_led =3D FLED1;
> > +		max_flash_curr[FLED1] =3D cfg->iout_flash_max[FLED1] +
> > +					cfg->iout_flash_max[FLED2];
> > +	} else {
> > +		first_led =3D max77693_fled_used(led, FLED1) ? FLED1 : FLED2;
> > +		last_led =3D max77693_fled_used(led, FLED2) ? FLED2 : FLED1;
> > +		max_flash_curr[FLED1] =3D cfg->iout_flash_max[FLED1];
> > +		max_flash_curr[FLED2] =3D cfg->iout_flash_max[FLED2];
> > +	}
> > +
> > +	for (i =3D first_led; i <=3D last_led; ++i) {
> > +		ret =3D max77693_set_flash_current(led, i,
> > +					max_flash_curr[i]);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	v =3D TORCH_TMR_NO_TIMER | MAX77693_LED_TRIG_TYPE_LEVEL;
> > +	ret =3D regmap_write(rmap, MAX77693_LED_REG_ITORCHTIMER, v);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (cfg->low_vsys > 0)
> > +		v =3D max77693_led_vsys_to_reg(cfg->low_vsys) |
> > +						MAX_FLASH1_MAX_FL_EN;
> > +	else
> > +		v =3D 0;
> > +
> > +	ret =3D regmap_write(rmap, MAX77693_LED_REG_MAX_FLASH1, v);
> > +	if (ret < 0)
> > +		return ret;
> > +	ret =3D regmap_write(rmap, MAX77693_LED_REG_MAX_FLASH2, 0);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (cfg->boost_mode =3D=3D MAX77693_LED_BOOST_FIXED)
> > +		v =3D FLASH_BOOST_FIXED;
> > +	else
> > +		v =3D cfg->boost_mode | cfg->boost_mode << 1;
> > +
> > +	if (max77693_fled_used(led, FLED1) && max77693_fled_used(led, FLE=
D2))
> > +		v |=3D FLASH_BOOST_LEDNUM_2;
> > +
> > +	ret =3D regmap_write(rmap, MAX77693_LED_REG_VOUT_CNTL, v);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	v =3D max77693_led_vout_to_reg(cfg->boost_vout);
> > +	ret =3D regmap_write(rmap, MAX77693_LED_REG_VOUT_FLASH1, v);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return max77693_set_mode_reg(led, MODE_OFF);
> > +}
> > +
> > +static int __max77693_led_brightness_set(struct max77693_led_devic=
e *led,
> > +					int fled_id, enum led_brightness value)
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&led->lock);
> > +
> > +	if (value =3D=3D 0) {
> > +		ret =3D max77693_clear_mode(led, MODE_TORCH(fled_id));
> > +		if (ret < 0)
> > +			dev_dbg(&led->pdev->dev,
> > +				"Failed to clear torch mode (%d)\n",
> > +				ret);
> > +		goto unlock;
> > +	}
> > +
> > +	ret =3D max77693_set_torch_current(led, fled_id, value * TORCH_IO=
UT_STEP);
> > +	if (ret < 0) {
> > +		dev_dbg(&led->pdev->dev,
> > +			"Failed to set torch current (%d)\n",
> > +			ret);
> > +		goto unlock;
> > +	}
> > +
> > +	ret =3D max77693_add_mode(led, MODE_TORCH(fled_id));
> > +	if (ret < 0)
> > +		dev_dbg(&led->pdev->dev,
> > +			"Failed to set torch mode (%d)\n",
> > +			ret);
> > +unlock:
> > +	mutex_unlock(&led->lock);
> > +	return ret;
> > +}
> > +
> > +static void max77693_led_brightness_set_work(
> > +					struct work_struct *work)
> > +{
> > +	struct max77693_sub_led *sub_led =3D
> > +			container_of(work, struct max77693_sub_led,
> > +					work_brightness_set);
> > +	struct max77693_led_device *led =3D sub_led_to_led(sub_led);
> > +
> > +	__max77693_led_brightness_set(led, sub_led->fled_id,
> > +				sub_led->torch_brightness);
> > +}
> > +
> > +/* LED subsystem callbacks */
> > +
> > +static int max77693_led_brightness_set_sync(
> > +				struct led_classdev *led_cdev,
> > +				enum led_brightness value)
> > +{
> > +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev=
);
> > +	struct max77693_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
> > +	struct max77693_led_device *led =3D sub_led_to_led(sub_led);
> > +
> > +	return __max77693_led_brightness_set(led, sub_led->fled_id, value=
);
> > +}
> > +
> > +static void max77693_led_brightness_set(
> > +				struct led_classdev *led_cdev,
> > +				enum led_brightness value)
> > +{
> > +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev=
);
> > +	struct max77693_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
> > +
> > +	sub_led->torch_brightness =3D value;
> > +	schedule_work(&sub_led->work_brightness_set);
> > +}
> > +
> > +static int max77693_led_flash_brightness_set(
> > +				struct led_classdev_flash *fled_cdev,
> > +				u32 brightness)
> > +{
> > +	struct max77693_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
> > +	struct max77693_led_device *led =3D sub_led_to_led(sub_led);
> > +	int ret;
> > +
> > +	mutex_lock(&led->lock);
> > +	ret =3D max77693_set_flash_current(led, sub_led->fled_id, brightn=
ess);
> > +	mutex_unlock(&led->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int max77693_led_flash_strobe_set(
> > +				struct led_classdev_flash *fled_cdev,
> > +				bool state)
> > +{
> > +	struct max77693_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
> > +	struct max77693_led_device *led =3D sub_led_to_led(sub_led);
> > +	int fled_id =3D sub_led->fled_id;
> > +	int ret;
> > +
> > +	mutex_lock(&led->lock);
> > +
> > +	if (!state) {
> > +		ret =3D max77693_clear_mode(led, MODE_FLASH(fled_id));
> > +		goto unlock;
> > +	}
> > +
> > +	if (sub_led->flash_timeout !=3D led->current_flash_timeout) {
> > +		ret =3D max77693_set_timeout(led, sub_led->flash_timeout);
> > +		if (ret < 0)
> > +			goto unlock;
> > +	}
> > +
> > +	led->strobing_sub_led_id =3D fled_id;
> > +
> > +	ret =3D max77693_add_mode(led, MODE_FLASH(fled_id));
> > +	if (ret < 0)
> > +		goto unlock;
> > +
> > +	ret =3D max77693_get_flash_faults(sub_led);
> > +
> > +unlock:
> > +	mutex_unlock(&led->lock);
> > +	return ret;
> > +}
> > +
> > +static int max77693_led_flash_fault_get(
> > +				struct led_classdev_flash *fled_cdev,
> > +				u32 *fault)
> > +{
> > +	struct max77693_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
> > +
> > +	*fault =3D sub_led->flash_faults;
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77693_led_flash_strobe_get(
> > +				struct led_classdev_flash *fled_cdev,
> > +				bool *state)
> > +{
> > +	struct max77693_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
> > +	struct max77693_led_device *led =3D sub_led_to_led(sub_led);
> > +	int ret;
> > +
> > +	if (!state)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&led->lock);
> > +
> > +	ret =3D max77693_get_strobe_status(led, state);
> > +
> > +	*state =3D !!(*state && (led->strobing_sub_led_id =3D=3D sub_led-=
>fled_id));
> > +
> > +	mutex_unlock(&led->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int max77693_led_flash_timeout_set(
> > +				struct led_classdev_flash *fled_cdev,
> > +				u32 timeout)
> > +{
> > +	struct max77693_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
> > +	struct max77693_led_device *led =3D sub_led_to_led(sub_led);
> > +
> > +	mutex_lock(&led->lock);
> > +	sub_led->flash_timeout =3D timeout;
> > +	mutex_unlock(&led->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77693_led_parse_dt(struct max77693_led_device *led,
> > +				struct max77693_led_config_data *cfg)
> > +{
> > +	struct device *dev =3D &led->pdev->dev;
> > +	struct max77693_sub_led *sub_leds =3D led->sub_leds;
> > +	struct device_node *node =3D dev->of_node, *child_node;
> > +	struct property *prop;
> > +	u32 led_sources[2];
> > +	int i, fled_id;
> > +
> > +	of_property_read_u32(node, "maxim,trigger-type", &cfg->trigger_ty=
pe);
> > +	of_property_read_u32(node, "maxim,boost-mode", &cfg->boost_mode);
> > +	of_property_read_u32(node, "maxim,boost-mvout", &cfg->boost_vout)=
;
> > +	of_property_read_u32(node, "maxim,mvsys-min", &cfg->low_vsys);
> > +
> > +	for_each_available_child_of_node(node, child_node) {
> > +		prop =3D of_find_property(child_node, "led-sources", NULL);
> > +		if (prop) {
> > +			const __be32 *srcs =3D NULL;
> > +
> > +			for (i =3D 0; i < ARRAY_SIZE(led_sources); ++i) {
> > +				srcs =3D of_prop_next_u32(prop, srcs,
> > +							&led_sources[i]);
> > +				if (!srcs)
> > +					break;
> > +			}
> > +		} else {
> > +			dev_err(dev,
> > +				"\"led-sources\" DT property not found.\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (i =3D=3D 2) {
> > +			fled_id =3D FLED1;
> > +			led->fled_mask =3D FLED1_IOUT | FLED2_IOUT;
> > +		} else if (led_sources[0] =3D=3D FLED1) {
> > +			fled_id =3D FLED1;
> > +			led->fled_mask |=3D FLED1_IOUT;
> > +		} else if (led_sources[0] =3D=3D FLED2) {
> > +			fled_id =3D FLED2;
> > +			led->fled_mask |=3D FLED2_IOUT;
> > +		} else {
> > +			dev_err(dev,
> > +				"Wrong \"led-sources\" DT property value.\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		sub_leds[fled_id].fled_id =3D fled_id;
> > +
> > +		of_property_read_string(child_node, "label",
> > +					(const char **) &cfg->label[fled_id]);
> > +
> > +		of_property_read_u32(child_node, "max-microamp",
> > +						&cfg->iout_torch_max[fled_id]);
> > +		of_property_read_u32(child_node, "flash-max-microamp",
> > +						&cfg->iout_flash_max[fled_id]);
> > +		of_property_read_u32(child_node, "flash-timeout-us",
> > +						&cfg->flash_timeout[fled_id]);
> > +
> > +		if (++cfg->num_leds =3D=3D 2 ||
> > +		    (max77693_fled_used(led, FLED1) &&
> > +		     max77693_fled_used(led, FLED2)))
> > +			break;
> > +	}
> > +
> > +	if (cfg->num_leds =3D=3D 0) {
> > +		dev_err(dev, "No DT child node found for connected LED(s).\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void clamp_align(u32 *v, u32 min, u32 max, u32 step)
> > +{
> > +	*v =3D clamp_val(*v, min, max);
> > +	if (step > 1)
> > +		*v =3D (*v - min) / step * step + min;
> > +}
> > +
> > +static void max77693_led_validate_configuration(struct max77693_le=
d_device *led,
> > +					struct max77693_led_config_data *cfg)
> > +{
> > +	int i;
> > +
> > +	if (cfg->num_leds =3D=3D 1 &&
> > +	    max77693_fled_used(led, FLED1) && max77693_fled_used(led, FLE=
D2))
> > +		led->iout_joint =3D true;
> > +
> > +	cfg->boost_mode =3D clamp_val(cfg->boost_mode, MAX77693_LED_BOOST=
_NONE,
> > +			    MAX77693_LED_BOOST_FIXED);
> > +
> > +	/* Boost must be enabled if both current outputs are used */
> > +	if ((cfg->boost_mode =3D=3D MAX77693_LED_BOOST_NONE) && led->iout=
_joint)
> > +		cfg->boost_mode =3D MAX77693_LED_BOOST_FIXED;
> > +
> > +	/* Split max current settings to both outputs in case of joint le=
ds */
> > +	if (led->iout_joint) {
> > +		cfg->iout_torch_max[FLED1] /=3D 2;
> > +		cfg->iout_torch_max[FLED2] =3D cfg->iout_torch_max[FLED1];
> > +		cfg->iout_flash_max[FLED1] /=3D 2;
> > +		cfg->iout_flash_max[FLED2] =3D cfg->iout_flash_max[FLED1];
> > +	}
> > +
> > +	for (i =3D FLED1; i <=3D FLED2; ++i) {
> > +		if (max77693_fled_used(led, i)) {
> > +			clamp_align(&cfg->iout_torch_max[i], TORCH_IOUT_MIN,
> > +					TORCH_IOUT_MAX, TORCH_IOUT_STEP);
> > +			clamp_align(&cfg->iout_flash_max[i], FLASH_IOUT_MIN,
> > +					cfg->boost_mode ? FLASH_IOUT_MAX_2LEDS :
> > +							FLASH_IOUT_MAX_1LED,
> > +					FLASH_IOUT_STEP);
> > +		} else {
> > +			cfg->iout_torch_max[i] =3D cfg->iout_flash_max[i] =3D 0;
> > +		}
> > +	}
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(cfg->flash_timeout); ++i)
> > +		clamp_align(&cfg->flash_timeout[i], FLASH_TIMEOUT_MIN,
> > +				FLASH_TIMEOUT_MAX, FLASH_TIMEOUT_STEP);
> > +
> > +	cfg->trigger_type =3D clamp_val(cfg->trigger_type,
> > +					MAX77693_LED_TRIG_TYPE_EDGE,
> > +					MAX77693_LED_TRIG_TYPE_LEVEL);
> > +
> > +	clamp_align(&cfg->boost_vout, FLASH_VOUT_MIN, FLASH_VOUT_MAX,
> > +							FLASH_VOUT_STEP);
> > +
> > +	if (cfg->low_vsys)
> > +		clamp_align(&cfg->low_vsys, MAX_FLASH1_VSYS_MIN,
> > +				MAX_FLASH1_VSYS_MAX, MAX_FLASH1_VSYS_STEP);
> > +}
> > +
> > +static int max77693_led_get_configuration(struct max77693_led_devi=
ce *led,
> > +				struct max77693_led_config_data *cfg)
> > +{
> > +	int ret;
> > +
> > +	ret =3D max77693_led_parse_dt(led, cfg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	max77693_led_validate_configuration(led, cfg);
> > +
> > +	memcpy(led->iout_torch_max, cfg->iout_torch_max,
> > +				sizeof(led->iout_torch_max));
> > +	memcpy(led->iout_flash_max, cfg->iout_flash_max,
> > +				sizeof(led->iout_flash_max));
> > +	led->trigger_type =3D cfg->trigger_type;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct led_flash_ops flash_ops =3D {
> > +	.flash_brightness_set	=3D max77693_led_flash_brightness_set,
> > +	.strobe_set		=3D max77693_led_flash_strobe_set,
> > +	.strobe_get		=3D max77693_led_flash_strobe_get,
> > +	.timeout_set		=3D max77693_led_flash_timeout_set,
> > +	.fault_get		=3D max77693_led_flash_fault_get,
> > +};
> > +
> > +static void max77693_init_flash_settings(struct max77693_led_devic=
e *led,
> > +					 int fled_id,
> > +					 struct max77693_led_config_data *cfg,
> > +					 struct max77693_led_settings *s)
> > +{
> > +	struct led_flash_setting *setting;
> > +
> > +	/* Init torch intensity setting */
> > +	setting =3D &s->torch_brightness;
> > +	setting->min =3D TORCH_IOUT_MIN;
> > +	setting->max =3D cfg->iout_torch_max[fled_id];
> > +	setting->max =3D led->iout_joint ?
> > +		cfg->iout_torch_max[FLED1] + cfg->iout_torch_max[FLED2] :
> > +		cfg->iout_torch_max[fled_id];
> > +	setting->step =3D TORCH_IOUT_STEP;
> > +	setting->val =3D setting->max;
> > +
> > +	/* Init flash intensity setting */
> > +	setting =3D &s->flash_brightness;
> > +	setting->min =3D FLASH_IOUT_MIN;
> > +	setting->max =3D led->iout_joint ?
> > +		cfg->iout_flash_max[FLED1] + cfg->iout_flash_max[FLED2] :
> > +		cfg->iout_flash_max[fled_id];
> > +	setting->step =3D FLASH_IOUT_STEP;
> > +	setting->val =3D setting->max;
> > +
> > +	/* Init flash timeout setting */
> > +	setting =3D &s->flash_timeout;
> > +	setting->min =3D FLASH_TIMEOUT_MIN;
> > +	setting->max =3D cfg->flash_timeout[fled_id];
> > +	setting->step =3D FLASH_TIMEOUT_STEP;
> > +	setting->val =3D setting->max;
> > +}
> > +
> > +static void max77693_init_fled_cdev(struct max77693_led_device *le=
d,
> > +				int fled_id,
> > +				struct max77693_led_config_data *cfg)
> > +{
> > +	struct led_classdev_flash *fled_cdev;
> > +	struct led_classdev *led_cdev;
> > +	struct max77693_sub_led *sub_led =3D &led->sub_leds[fled_id];
> > +	struct max77693_led_settings settings;
> > +
> > +	/* Initialize flash settings */
> > +	max77693_init_flash_settings(led, fled_id, cfg, &settings);
> > +
> > +	/* Initialize LED Flash class device */
> > +	fled_cdev =3D &sub_led->fled_cdev;
> > +	fled_cdev->ops =3D &flash_ops;
> > +	led_cdev =3D &fled_cdev->led_cdev;
> > +
> > +	if (cfg->label[fled_id])
> > +		led_cdev->name =3D cfg->label[fled_id];
> > +	else
> > +		led_cdev->name =3D (fled_id =3D=3D FLED1) ? MAX77693_LED1_NAME :
> > +						      MAX77693_LED2_NAME;
> > +
> > +	led_cdev->brightness_set =3D max77693_led_brightness_set;
> > +	led_cdev->brightness_set_sync =3D max77693_led_brightness_set_syn=
c;
> > +	INIT_WORK(&sub_led->work_brightness_set,
> > +			max77693_led_brightness_set_work);
> > +
> > +	led_cdev->max_brightness =3D settings.torch_brightness.val /
> > +					TORCH_IOUT_STEP;
> > +	led_cdev->flags |=3D LED_DEV_CAP_FLASH;
> > +
> > +	fled_cdev->brightness =3D settings.flash_brightness;
> > +	fled_cdev->timeout =3D settings.flash_timeout;
> > +	sub_led->flash_timeout =3D fled_cdev->timeout.val;
> > +}
> > +
> > +static int max77693_led_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct max77693_dev *iodev =3D dev_get_drvdata(dev->parent);
> > +	struct max77693_led_device *led;
> > +	struct max77693_sub_led *sub_leds;
> > +	struct max77693_led_config_data cfg =3D {};
> > +	int init_fled_cdev[2], i, ret;
> > +
> > +	led =3D devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> > +	if (!led)
> > +		return -ENOMEM;
> > +
> > +	led->pdev =3D pdev;
> > +	led->regmap =3D iodev->regmap;
> > +	led->allowed_modes =3D MODE_FLASH_MASK;
> > +	sub_leds =3D led->sub_leds;
> > +
> > +	platform_set_drvdata(pdev, led);
> > +	ret =3D max77693_led_get_configuration(led, &cfg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D max77693_setup(led, &cfg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	init_fled_cdev[FLED1] =3D
> > +			led->iout_joint || max77693_fled_used(led, FLED1);
> > +	init_fled_cdev[FLED2] =3D
> > +			!led->iout_joint && max77693_fled_used(led, FLED2);
> > +
> > +	/* Initialize LED Flash class device(s) */
> > +	for (i =3D FLED1; i <=3D FLED2; ++i)
> > +		if (init_fled_cdev[i])
> > +			max77693_init_fled_cdev(led, i, &cfg);
> > +	mutex_init(&led->lock);
> > +
> > +	/* Register LED Flash class device(s) */
> > +	for (i =3D FLED1; i <=3D FLED2; ++i) {
> > +		if (!init_fled_cdev[i])
> > +			continue;
> > +
> > +		ret =3D led_classdev_flash_register(dev, &sub_leds[i].fled_cdev)=
;
> > +		if (ret < 0) {
> > +			/*
> > +			 * At this moment FLED1 might have been already
> > +			 * registered and it needs to be released.
> > +			 */
> > +			if (i =3D=3D FLED2)
> > +				goto err_register_led2;
> > +			else
> > +				goto err_register_led1;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err_register_led2:
> > +	/* It is possible than only FLED2 was to be registered */
> > +	if (!init_fled_cdev[FLED1])
> > +		goto err_register_led1;
> > +	led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
> > +err_register_led1:
> > +	mutex_destroy(&led->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int max77693_led_remove(struct platform_device *pdev)
> > +{
> > +	struct max77693_led_device *led =3D platform_get_drvdata(pdev);
> > +	struct max77693_sub_led *sub_leds =3D led->sub_leds;
> > +
> > +	if (led->iout_joint || max77693_fled_used(led, FLED1)) {
> > +		led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
> > +		cancel_work_sync(&sub_leds[FLED1].work_brightness_set);
> > +	}
> > +
> > +	if (!led->iout_joint && max77693_fled_used(led, FLED2)) {
> > +		led_classdev_flash_unregister(&sub_leds[FLED2].fled_cdev);
> > +		cancel_work_sync(&sub_leds[FLED2].work_brightness_set);
> > +	}
> > +
> > +	mutex_destroy(&led->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id max77693_led_dt_match[] =3D {
> > +	{.compatible =3D "maxim,max77693-led"},
> > +	{},
> > +};
> > +
> > +static struct platform_driver max77693_led_driver =3D {
> > +	.probe		=3D max77693_led_probe,
> > +	.remove		=3D max77693_led_remove,
> > +	.driver		=3D {
> > +		.name	=3D "max77693-led",
> > +		.owner	=3D THIS_MODULE,
> > +		.of_match_table =3D max77693_led_dt_match,
> > +	},
> > +};
> > +
> > +module_platform_driver(max77693_led_driver);
> > +
> > +MODULE_AUTHOR("Jacek Anaszewski <j.anaszewski@samsung.com>");
> > +MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
> > +MODULE_DESCRIPTION("Maxim MAX77693 led flash driver");
> > +MODULE_LICENSE("GPL v2");
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
