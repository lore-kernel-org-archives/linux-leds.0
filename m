From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Thu, 26 Nov 2015 09:11:16 +0000
Message-ID: <20151126091116.GP12874@x1>
References: <1448446948-13729-1-git-send-email-ingi2.kim@samsung.com>
 <1448446948-13729-3-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:32901 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753080AbbKZJLV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2015 04:11:21 -0500
Received: by wmec201 with SMTP id c201so21309092wme.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2015 01:11:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1448446948-13729-3-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, andi.shyti@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Wed, 25 Nov 2015, Ingi Kim wrote:

> This patch adds device driver of Richtek RT5033 PMIC.
> The RT5033 Flash LED Circuit is designed for one or two LEDs driving
> for torch and strobe applications, it provides an I2C software comman=
d
> to trigger the torch and strobe operation.
>=20
> Each of LED outputs can contorl a separate LED sharing their setting,
> and can be connected together for a single connected LED.
> One LED is represented by one child node.
>=20
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> ---
>  drivers/leds/Kconfig               |   8 +
>  drivers/leds/Makefile              |   1 +
>  drivers/leds/leds-rt5033.c         | 541 +++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/rt5033-private.h |  51 ++++

Acked-by: Lee Jones <lee.jones@linaro.org>

>  4 files changed, 601 insertions(+)
>  create mode 100644 drivers/leds/leds-rt5033.c
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b1ab8bd..f41ac9b 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -345,6 +345,14 @@ config LEDS_PCA963X
>  	  LED driver chip accessed via the I2C bus. Supported
>  	  devices include PCA9633 and PCA9634
> =20
> +config LEDS_RT5033
> +	tristate "LED support for RT5033 PMIC"
> +	depends on LEDS_CLASS_FLASH && OF
> +	depends on MFD_RT5033
> +	help
> +	  This option enables support for on-chip LED driver on
> +	  RT5033 PMIC.
> +
>  config LEDS_WM831X_STATUS
>  	tristate "LED support for status LEDs on WM831x PMICs"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index e9d53092..77cfad5 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_LEDS_COBALT_QUBE)		+=3D leds-cobalt-qu=
be.o
>  obj-$(CONFIG_LEDS_COBALT_RAQ)		+=3D leds-cobalt-raq.o
>  obj-$(CONFIG_LEDS_SUNFIRE)		+=3D leds-sunfire.o
>  obj-$(CONFIG_LEDS_PCA9532)		+=3D leds-pca9532.o
> +obj-$(CONFIG_LEDS_RT5033)		+=3D leds-rt5033.o
>  obj-$(CONFIG_LEDS_GPIO_REGISTER)	+=3D leds-gpio-register.o
>  obj-$(CONFIG_LEDS_GPIO)			+=3D leds-gpio.o
>  obj-$(CONFIG_LEDS_LP3944)		+=3D leds-lp3944.o
> diff --git a/drivers/leds/leds-rt5033.c b/drivers/leds/leds-rt5033.c
> new file mode 100644
> index 0000000..256df74
> --- /dev/null
> +++ b/drivers/leds/leds-rt5033.c
> @@ -0,0 +1,541 @@
> +/*
> + * led driver for RT5033
> + *
> + * Copyright (C) 2015 Samsung Electronics, Co., Ltd.
> + * Ingi Kim <ingi2.kim@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/led-class-flash.h>
> +#include <linux/mfd/rt5033.h>
> +#include <linux/mfd/rt5033-private.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#define RT5033_LED_FLASH_TIMEOUT_MIN		64000
> +#define RT5033_LED_FLASH_TIMEOUT_STEP		32000
> +#define RT5033_LED_FLASH_BRIGHTNESS_MIN		50000
> +#define RT5033_LED_FLASH_BRIGHTNESS_MAX_1CH	600000
> +#define RT5033_LED_FLASH_BRIGHTNESS_MAX_2CH	800000
> +#define RT5033_LED_FLASH_BRIGHTNESS_STEP	25000
> +#define RT5033_LED_TORCH_BRIGHTNESS_MIN		12500
> +#define RT5033_LED_TORCH_BRIGHTNESS_STEP	12500
> +
> +#define FLED1_IOUT		(BIT(0))
> +#define FLED2_IOUT		(BIT(1))
> +
> +enum rt5033_fled {
> +	FLED1,
> +	FLED2,
> +};
> +
> +struct rt5033_sub_led {
> +	enum rt5033_fled fled_id;
> +	struct led_classdev_flash fled_cdev;
> +
> +	u32 flash_brightness;
> +	u32 flash_timeout;
> +};
> +
> +/* RT5033 Flash led platform data */
> +struct rt5033_led {
> +	struct device *dev;
> +	struct mutex lock;
> +	struct regmap *regmap;
> +	struct rt5033_sub_led sub_leds[2];
> +
> +	u32 current_flash_timeout;
> +	u32 current_flash_brightness;
> +
> +	bool iout_joint;
> +	u8 fled_mask;
> +	u8 current_iout;
> +};
> +
> +struct rt5033_led_config_data {
> +	const char *label[2];
> +	u32 flash_max_microamp[2];
> +	u32 flash_max_timeout[2];
> +	u32 torch_max_microamp[2];
> +	u32 num_leds;
> +};
> +
> +static u8 rt5033_torch_brightness_to_reg(u32 ua)
> +{
> +	return (ua - RT5033_LED_TORCH_BRIGHTNESS_MIN) /
> +		RT5033_LED_TORCH_BRIGHTNESS_STEP;
> +}
> +
> +static u8 rt5033_flash_brightness_to_reg(u32 ua)
> +{
> +	return (ua - RT5033_LED_FLASH_BRIGHTNESS_MIN) /
> +		RT5033_LED_FLASH_BRIGHTNESS_STEP;
> +}
> +
> +static u8 rt5033_flash_timeout_to_reg(u32 us)
> +{
> +	return (us - RT5033_LED_FLASH_TIMEOUT_MIN) /
> +		RT5033_LED_FLASH_TIMEOUT_STEP;
> +}
> +
> +static struct rt5033_sub_led *flcdev_to_sub_led(
> +					struct led_classdev_flash *fled_cdev)
> +{
> +	return container_of(fled_cdev, struct rt5033_sub_led, fled_cdev);
> +}
> +
> +static struct rt5033_led *sub_led_to_led(struct rt5033_sub_led *sub_=
led)
> +{
> +	return container_of(sub_led, struct rt5033_led,
> +			    sub_leds[sub_led->fled_id]);
> +}
> +
> +static bool rt5033_fled_used(struct rt5033_led *led, enum rt5033_fle=
d fled_id)
> +{
> +	u8 fled_bit =3D (fled_id =3D=3D FLED1) ? FLED1_IOUT : FLED2_IOUT;
> +
> +	return led->fled_mask & fled_bit;
> +}
> +
> +static u8 rt5033_get_iout_to_set(struct rt5033_led *led,
> +				 enum rt5033_fled fled_id)
> +{
> +	u8 fled_bit;
> +
> +	if (led->iout_joint)
> +		fled_bit =3D FLED1_IOUT | FLED2_IOUT;
> +	else
> +		fled_bit =3D (fled_id =3D=3D FLED1) ? FLED1_IOUT : FLED2_IOUT;
> +
> +	return fled_bit;
> +}
> +
> +static int rt5033_led_iout_disable(struct rt5033_led *led,
> +				   enum rt5033_fled fled_id)
> +{
> +	int ret;
> +	u8 fled_bit;
> +
> +	fled_bit =3D rt5033_get_iout_to_set(led, fled_id);
> +	led->current_iout &=3D ~fled_bit;
> +
> +	ret =3D regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
> +				 RT5033_FLED_FUNC1_MASK,
> +				 RT5033_FLED_PINCTRL | led->current_iout);
> +
> +	return ret;
> +}
> +
> +static int rt5033_set_flash_current(struct rt5033_led *led, u32 micr=
o_amp)
> +{
> +	u8 v;
> +	int ret;
> +
> +	v =3D rt5033_flash_brightness_to_reg(micro_amp);
> +
> +	ret =3D regmap_write(led->regmap, RT5033_REG_FLED_STROBE_CTRL1, v);
> +	if (ret < 0)
> +		return ret;
> +
> +	led->current_flash_brightness =3D micro_amp;
> +
> +	return 0;
> +}
> +
> +static int rt5033_set_timeout(struct rt5033_led *led, u32 microsec)
> +{
> +	u8 v;
> +	int ret;
> +
> +	v =3D rt5033_flash_timeout_to_reg(microsec);
> +
> +	ret =3D regmap_write(led->regmap, RT5033_REG_FLED_STROBE_CTRL2, v);
> +	if (ret < 0)
> +		return ret;
> +
> +	led->current_flash_timeout =3D microsec;
> +
> +	return 0;
> +}
> +
> +static int rt5033_led_brightness_set(struct led_classdev *led_cdev,
> +				     enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
> +	struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev);
> +	struct rt5033_led *led =3D sub_led_to_led(sub_led);
> +	int fled_id =3D sub_led->fled_id, ret;
> +	u8 fled_bit;
> +
> +	mutex_lock(&led->lock);
> +
> +	if (!brightness) {
> +		ret =3D rt5033_led_iout_disable(led, fled_id);
> +		goto torch_unlock;
> +	}
> +
> +	fled_bit =3D rt5033_get_iout_to_set(led, fled_id);
> +
> +	ret =3D regmap_update_bits(led->regmap, RT5033_REG_FLED_CTRL1,
> +				 RT5033_FLED_CTRL1_MASK, (brightness - 1) << 4);
> +	if (ret < 0)
> +		goto torch_unlock;
> +
> +	if (led->current_iout !=3D fled_bit) {
> +		ret =3D regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
> +					 RT5033_FLED_FUNC1_MASK,
> +					 RT5033_FLED_PINCTRL | fled_bit);
> +		if (ret < 0)
> +			goto torch_unlock;
> +		led->current_iout =3D fled_bit;
> +	}
> +	ret =3D regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
> +				 RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED);
> +
> +torch_unlock:
> +	mutex_unlock(&led->lock);
> +	return ret;
> +}
> +
> +static int rt5033_led_flash_brightness_set(struct led_classdev_flash=
 *fled_cdev,
> +					   u32 brightness)
> +{
> +	struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev);
> +	struct rt5033_led *led =3D sub_led_to_led(sub_led);
> +
> +	mutex_lock(&led->lock);
> +	sub_led->flash_brightness =3D brightness;
> +	mutex_unlock(&led->lock);
> +
> +	return 0;
> +}
> +
> +static int rt5033_led_flash_timeout_set(struct led_classdev_flash *f=
led_cdev,
> +					u32 timeout)
> +{
> +	struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev);
> +	struct rt5033_led *led =3D sub_led_to_led(sub_led);
> +
> +	mutex_lock(&led->lock);
> +	sub_led->flash_timeout =3D timeout;
> +	mutex_unlock(&led->lock);
> +
> +	return 0;
> +}
> +
> +static int rt5033_led_flash_strobe_set(struct led_classdev_flash *fl=
ed_cdev,
> +				       bool state)
> +{
> +	struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev);
> +	struct rt5033_led *led =3D sub_led_to_led(sub_led);
> +	enum rt5033_fled fled_id =3D sub_led->fled_id;
> +	int ret;
> +	u8 fled_bit;
> +
> +	mutex_lock(&led->lock);
> +
> +	fled_bit =3D rt5033_get_iout_to_set(led, fled_id);
> +	led->current_iout =3D fled_bit;
> +
> +	if (state =3D=3D 0) {
> +		ret =3D rt5033_led_iout_disable(led, fled_id);
> +		if (ret < 0)
> +			goto strobe_unlock;
> +		ret =3D regmap_update_bits(led->regmap,
> +					 RT5033_REG_FLED_FUNCTION2,
> +					 RT5033_FLED_FUNC2_MASK, 0);
> +		goto strobe_unlock;
> +	}
> +
> +	if (sub_led->flash_brightness !=3D led->current_flash_brightness) {
> +		ret =3D rt5033_set_flash_current(led, sub_led->flash_brightness);
> +		if (ret < 0)
> +			goto strobe_unlock;
> +	}
> +
> +	if (sub_led->flash_timeout !=3D led->current_flash_timeout) {
> +		ret =3D rt5033_set_timeout(led, sub_led->flash_timeout);
> +		if (ret < 0)
> +			goto strobe_unlock;
> +	}
> +
> +	ret =3D regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
> +				 RT5033_FLED_FUNC1_MASK, RT5033_FLED_PINCTRL |
> +				 RT5033_FLED_STRB_SEL | led->current_iout);
> +	if (ret < 0)
> +		goto strobe_unlock;
> +	ret =3D regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
> +				 RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED |
> +				 RT5033_FLED_SREG_STRB);
> +
> +	led->current_iout =3D 0;
> +strobe_unlock:
> +	mutex_unlock(&led->lock);
> +	return ret;
> +}
> +
> +static const struct led_flash_ops flash_ops =3D {
> +	.flash_brightness_set =3D rt5033_led_flash_brightness_set,
> +	.strobe_set =3D rt5033_led_flash_strobe_set,
> +	.timeout_set =3D rt5033_led_flash_timeout_set,
> +};
> +
> +static void rt5033_init_flash_properties(struct rt5033_sub_led *sub_=
led,
> +					 struct rt5033_led_config_data *led_cfg)
> +{
> +	struct led_classdev_flash *fled_cdev =3D &sub_led->fled_cdev;
> +	struct rt5033_led *led =3D sub_led_to_led(sub_led);
> +	struct led_flash_setting *tm_set, *fl_set;
> +	enum rt5033_fled fled_id =3D sub_led->fled_id;
> +
> +	tm_set =3D &fled_cdev->timeout;
> +	tm_set->min =3D RT5033_LED_FLASH_TIMEOUT_MIN;
> +	tm_set->max =3D led_cfg->flash_max_timeout[fled_id];
> +	tm_set->step =3D RT5033_LED_FLASH_TIMEOUT_STEP;
> +	tm_set->val =3D tm_set->max;
> +
> +	fl_set =3D &fled_cdev->brightness;
> +	fl_set->min =3D RT5033_LED_FLASH_BRIGHTNESS_MIN;
> +	if (led->iout_joint)
> +		fl_set->max =3D min(led_cfg->flash_max_microamp[FLED1] +
> +				  led_cfg->flash_max_microamp[FLED2],
> +				  (u32)RT5033_LED_FLASH_BRIGHTNESS_MAX_2CH);
> +	else
> +		fl_set->max =3D min(led_cfg->flash_max_microamp[fled_id],
> +				  (u32)RT5033_LED_FLASH_BRIGHTNESS_MAX_1CH);
> +	fl_set->step =3D RT5033_LED_FLASH_BRIGHTNESS_STEP;
> +	fl_set->val =3D fl_set->max;
> +}
> +
> +static void rt5033_led_init_fled_cdev(struct rt5033_sub_led *sub_led=
,
> +				      struct rt5033_led_config_data *led_cfg)
> +{
> +	struct led_classdev_flash *fled_cdev;
> +	struct led_classdev *led_cdev;
> +	enum rt5033_fled fled_id =3D sub_led->fled_id;
> +
> +	/* Initialize LED Flash class device */
> +	fled_cdev =3D &sub_led->fled_cdev;
> +	fled_cdev->ops =3D &flash_ops;
> +	led_cdev =3D &fled_cdev->led_cdev;
> +
> +	led_cdev->name =3D led_cfg->label[fled_id];
> +
> +	led_cdev->brightness_set_blocking =3D rt5033_led_brightness_set;
> +	led_cdev->max_brightness =3D rt5033_torch_brightness_to_reg(
> +					led_cfg->torch_max_microamp[fled_id]);
> +	led_cdev->flags |=3D LED_DEV_CAP_FLASH;
> +
> +	rt5033_init_flash_properties(sub_led, led_cfg);
> +
> +	sub_led->flash_timeout =3D fled_cdev->timeout.val;
> +	sub_led->flash_brightness =3D fled_cdev->brightness.val;
> +}
> +
> +static int rt5033_led_parse_dt(struct rt5033_led *led, struct device=
 *dev,
> +			       struct rt5033_led_config_data *cfg,
> +			       struct device_node **sub_nodes)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *child_node;
> +	struct rt5033_sub_led *sub_leds =3D led->sub_leds;
> +	struct property *prop;
> +	u32 led_sources[2];
> +	enum rt5033_fled fled_id;
> +	int i, ret;
> +
> +	for_each_available_child_of_node(np, child_node) {
> +		prop =3D of_find_property(child_node, "led-sources", NULL);
> +		if (prop) {
> +			const __be32 *srcs =3D NULL;
> +
> +			for (i =3D 0; i < ARRAY_SIZE(led_sources); ++i) {
> +				srcs =3D of_prop_next_u32(prop, srcs,
> +							&led_sources[i]);
> +				if (!srcs)
> +					break;
> +			}
> +		} else {
> +			dev_err(dev, "led-sources DT property missing\n");
> +			ret =3D -EINVAL;
> +			goto err_parse_dt;
> +		}
> +
> +		if (i =3D=3D 2) {
> +			fled_id =3D FLED1;
> +			led->fled_mask =3D FLED1_IOUT | FLED2_IOUT;
> +		} else if (led_sources[0] =3D=3D FLED1) {
> +			fled_id =3D FLED1;
> +			led->fled_mask |=3D FLED1_IOUT;
> +		} else if (led_sources[0] =3D=3D FLED2) {
> +			fled_id =3D FLED2;
> +			led->fled_mask |=3D FLED2_IOUT;
> +		} else {
> +			dev_err(dev, "Wrong led-sources DT property value.\n");
> +			ret =3D -EINVAL;
> +			goto err_parse_dt;
> +		}
> +
> +		if (sub_nodes[fled_id]) {
> +			dev_err(dev,
> +				"Conflicting \"led-sources\" DT properties\n");
> +			ret =3D -EINVAL;
> +			goto err_parse_dt;
> +		}
> +
> +		sub_nodes[fled_id] =3D child_node;
> +		sub_leds[fled_id].fled_id =3D fled_id;
> +
> +		cfg->label[fled_id] =3D
> +			of_get_property(child_node, "label", NULL) ? :
> +					child_node->name;
> +
> +		ret =3D of_property_read_u32(child_node, "led-max-microamp",
> +					   &cfg->torch_max_microamp[fled_id]);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to parse led-max-microamp\n");
> +			goto err_parse_dt;
> +		}
> +
> +		ret =3D of_property_read_u32(child_node, "flash-max-microamp",
> +					   &cfg->flash_max_microamp[fled_id]);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to parse flash-max-microamp\n");
> +			goto err_parse_dt;
> +		}
> +
> +		ret =3D of_property_read_u32(child_node, "flash-max-timeout-us",
> +					   &cfg->flash_max_timeout[fled_id]);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to parse flash-max-timeout-us\n");
> +			goto err_parse_dt;
> +		}
> +
> +		if (++cfg->num_leds =3D=3D 2 ||
> +		    (rt5033_fled_used(led, FLED1) &&
> +		     rt5033_fled_used(led, FLED2))) {
> +			of_node_put(child_node);
> +			break;
> +		}
> +	}
> +
> +	if (cfg->num_leds =3D=3D 0) {
> +		dev_err(dev, "No DT child node found for connected LED(s).\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +
> +err_parse_dt:
> +	of_node_put(child_node);
> +	return ret;
> +}
> +
> +static int rt5033_led_probe(struct platform_device *pdev)
> +{
> +	struct rt5033_dev *rt5033 =3D dev_get_drvdata(pdev->dev.parent);
> +	struct rt5033_led *led;
> +	struct rt5033_sub_led *sub_leds;
> +	struct device_node *sub_nodes[2] =3D {};
> +	struct rt5033_led_config_data led_cfg =3D {};
> +	int init_fled_cdev[2], i, ret;
> +
> +	led =3D devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, led);
> +	led->dev =3D &pdev->dev;
> +	led->regmap =3D rt5033->regmap;
> +	sub_leds =3D led->sub_leds;
> +
> +	ret =3D rt5033_led_parse_dt(led, &pdev->dev, &led_cfg, sub_nodes);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (led_cfg.num_leds =3D=3D 1 && rt5033_fled_used(led, FLED1) &&
> +	    rt5033_fled_used(led, FLED2))
> +		led->iout_joint =3D true;
> +
> +	mutex_init(&led->lock);
> +
> +	init_fled_cdev[FLED1] =3D
> +			led->iout_joint || rt5033_fled_used(led, FLED1);
> +	init_fled_cdev[FLED2] =3D
> +			!led->iout_joint && rt5033_fled_used(led, FLED2);
> +
> +	for (i =3D FLED1; i <=3D FLED2; ++i) {
> +		if (!init_fled_cdev[i])
> +			continue;
> +
> +		rt5033_led_init_fled_cdev(&sub_leds[i], &led_cfg);
> +		ret =3D led_classdev_flash_register(led->dev,
> +						  &sub_leds[i].fled_cdev);
> +		if (ret < 0) {
> +			if (i =3D=3D FLED2)
> +				goto err_register_led2;
> +			else
> +				goto err_register_led1;
> +		}
> +	}
> +
> +	led->current_iout =3D 0;
> +	ret =3D regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
> +				 RT5033_FLED_FUNC1_MASK, RT5033_FLED_RESET);
> +	if (ret < 0)
> +		dev_dbg(led->dev, "Failed to reset flash led (%d)\n", ret);
> +
> +	return 0;
> +
> +err_register_led2:
> +	/* It is possible than only FLED2 was to be registered */
> +	if (!init_fled_cdev[FLED1])
> +		goto err_register_led1;
> +	led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
> +err_register_led1:
> +	mutex_destroy(&led->lock);
> +
> +	return ret;
> +}
> +
> +static int rt5033_led_remove(struct platform_device *pdev)
> +{
> +	struct rt5033_led *led =3D platform_get_drvdata(pdev);
> +	struct rt5033_sub_led *sub_leds =3D led->sub_leds;
> +
> +	if (led->iout_joint || rt5033_fled_used(led, FLED1))
> +		led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
> +
> +	if (!led->iout_joint && rt5033_fled_used(led, FLED2))
> +		led_classdev_flash_unregister(&sub_leds[FLED2].fled_cdev);
> +
> +	mutex_destroy(&led->lock);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rt5033_led_match[] =3D {
> +	{ .compatible =3D "richtek,rt5033-led", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, rt5033_led_match);
> +
> +static struct platform_driver rt5033_led_driver =3D {
> +	.driver =3D {
> +		.name =3D "rt5033-led",
> +		.of_match_table =3D rt5033_led_match,
> +	},
> +	.probe		=3D rt5033_led_probe,
> +	.remove		=3D rt5033_led_remove,
> +};
> +module_platform_driver(rt5033_led_driver);
> +
> +MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
> +MODULE_DESCRIPTION("Richtek RT5033 LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:rt5033-led");
> diff --git a/include/linux/mfd/rt5033-private.h b/include/linux/mfd/r=
t5033-private.h
> index 1b63fc2..b20c7e4 100644
> --- a/include/linux/mfd/rt5033-private.h
> +++ b/include/linux/mfd/rt5033-private.h
> @@ -93,6 +93,57 @@ enum rt5033_reg {
>  #define RT5033_RT_CTRL1_UUG_MASK	0x02
>  #define RT5033_RT_HZ_MASK		0x01
> =20
> +/* RT5033 FLED Function1 register */
> +#define RT5033_FLED_FUNC1_MASK		0x97
> +#define RT5033_FLED_EN_LEDCS1		0x01
> +#define RT5033_FLED_EN_LEDCS2		0x02
> +#define RT5033_FLED_STRB_SEL		0x04
> +#define RT5033_FLED_PINCTRL		0x10
> +#define RT5033_FLED_RESET		0x80
> +
> +/* RT5033 FLED Function2 register */
> +#define RT5033_FLED_FUNC2_MASK		0x81
> +#define RT5033_FLED_ENFLED		0x01
> +#define RT5033_FLED_SREG_STRB		0x80
> +
> +/* RT5033 FLED Strobe Control1 */
> +#define RT5033_FLED_STRBCTRL1_MASK		0xFF
> +#define RT5033_FLED_STRBCTRL1_TM_CUR_MAX	0xE0
> +#define RT5033_FLED_STRBCTRL1_FL_CUR_DEF	0x0D
> +#define RT5033_FLED_STRBCTRL1_FL_CUR_MAX	0x1F
> +
> +/* RT5033 FLED Strobe Control2 */
> +#define RT5033_FLED_STRBCTRL2_MASK	0x3F
> +#define RT5033_FLED_STRBCTRL2_TM_DEF	0x0F
> +#define RT5033_FLED_STRBCTRL2_TM_MAX	0x3F
> +
> +/* RT5033 FLED Control1 */
> +#define RT5033_FLED_CTRL1_MASK		0xF7
> +#define RT5033_FLED_CTRL1_TORCH_CUR_DEF	0x20
> +#define RT5033_FLED_CTRL1_TORCH_CUR_MAX	0xF0
> +#define RT5033_FLED_CTRL1_LBP_DEF	0x02
> +#define RT5033_FLED_CTRL1_LBP_MAX	0x07
> +
> +/* RT5033 FLED Control2 */
> +#define RT5033_FLED_CTRL2_MASK		0xFF
> +#define RT5033_FLED_CTRL2_VMID_DEF	0x37
> +#define RT5033_FLED_CTRL2_VMID_MAX	0x3F
> +#define RT5033_FLED_CTRL2_TRACK_ALIVE	0x40
> +#define RT5033_FLED_CTRL2_MID_TRACK	0x80
> +
> +/* RT5033 FLED Control4 */
> +#define RT5033_FLED_CTRL4_MASK		0xE0
> +#define RT5033_FLED_CTRL4_RESV		0x14
> +#define RT5033_FLED_CTRL4_VTRREG_DEF	0x40
> +#define RT5033_FLED_CTRL4_VTRREG_MAX	0x60
> +#define RT5033_FLED_CTRL4_TRACK_CLK	0x80
> +
> +/* RT5033 FLED Control5 */
> +#define RT5033_FLED_CTRL5_MASK		0xC0
> +#define RT5033_FLED_CTRL5_RESV		0x10
> +#define RT5033_FLED_CTRL5_TA_GOOD	0x40
> +#define RT5033_FLED_CTRL5_TA_EXIST	0x80
> +
>  /* RT5033 control register */
>  #define RT5033_CTRL_FCCM_BUCK_MASK		0x00
>  #define RT5033_CTRL_BUCKOMS_MASK		0x01

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
