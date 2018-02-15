From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 2/2] leds: add driver for support Mellanox regmap LEDs
 for BMC and x86 platform
Date: Thu, 15 Feb 2018 22:01:16 +0100
Message-ID: <d05f8da2-ed61-e533-78c5-a7b0f5aea701@gmail.com>
References: <1518718298-105286-1-git-send-email-vadimp@mellanox.com>
 <1518718298-105286-3-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:39710 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163392AbeBOVCb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Feb 2018 16:02:31 -0500
Received: by mail-wr0-f193.google.com with SMTP id w77so1024659wrc.6
        for <linux-leds@vger.kernel.org>; Thu, 15 Feb 2018 13:02:30 -0800 (PST)
In-Reply-To: <1518718298-105286-3-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, jiri@resnulli.us

Hi Vadim,

There are still three issues - one recently discussed,
and two I've just noticed. See below.

On 02/15/2018 07:11 PM, Vadim Pasternak wrote:
> Driver obtains LED devices according to system configuration and creates
> devices in form: "devicename:color:function", like
> The full path is to be:
> /sys/class/leds/mlxreg\:status\:amber/brightness
> After timer trigger activation:
> echo timer > /sys/class/leds/mlxreg\:status\:amber/trigger
> Attributes for LED blinking will appaer in sysfs infrastructure:
> /sys/class/leds/mlxreg\:status\:amber/delay_off
> /sys/class/leds/mlxreg\:status\:amber/delay_on
> 
> LED setting is controlled through the on-board programmable devices,
> which exports its register map. This device could be attached to any
> bus type, for which register mapping is supported.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
> v8->v8
> v6->v7
>  Comments pointed out by Jacek:
>   - Fix text in Kconfig;
> v5->v6
>  Changes added by Vadim:
>   - Change year to 2018 in Copyright;
>   - Change structure mlxreg_core_led_platform_data name to common name
>     mlxreg_core_platform_data, as it has been pushed to
>     git://git.infradead.org/linux-platform-drivers-x86.git to branch,
>     commit 1f976f6978bf6156ce822eb279ac86c519b10329 (1f976f6), file
>     include/linux/platform_data/mlxreg.h
>   - Add orange color, as alternative to red (some systems use orange,
>     instead of red);
>   - Drop mlxreg_led_dt_match, since the driver is to be activated by another
>     common Mellanox platform driver, mlx-platform or mlx-platform-of;
> v4->v5
>  Comments pointed out by Jacek:
>  - Make consistent naming in mlxreg_led_brightness_set,
>    mlxreg_led_brightness_get, mlxreg_led_config;
>  - Remove unnecessary data assignment in mlxreg_led_config;
>  Changes added by Vadim:
>  - Add internal structure mlxreg_led_data to leds-mlxreg.c;
> v3->v4
>  Comments pointed out by Jacek:
>  - add led in declaration mlxreg_led_store_hw and mlxreg_led_get_hw;
>  - rearrange local variables names in mlxreg_led_config;
>  Comments pointed out by Pavel:
>  - replace _HALF/_FULL with BLINK_3HZ/BLINK_6HZ;
>  - in mlxreg_led_get_hw just return after access error;
>  - explicit check for green led is not added, since control device can be
>    programmed for blue LED and this case it reuses masks of green LED.
> v2->v3:
>  Comments pointed out by Jacek:
>  - fix order in includes;
>  - add declaration pdata in mlxreg_led_store_hw and mlxreg_led_get_hw;
>  - add declaration of led_data in mlxreg_led_config;
>  - use LED_ON in assignment instead of 1;
>  - fix mutex call in mlxreg_led_remove;
> v1->v2:
>  Comments pointed out by Jacek:
>  - remove macros MLXREG_MAP and MLXREG_CDEV;
>  - brightness_set_blocking insteaf of brightness_set, this fix allows
>    removing of context validation and workqueue and also three fields from
>    struct mlxreg_core_led_data in mlxreg.h;
>  - remove MLXREG_LED_NAME;
>  - extend Kconfig description;
>  Changes added by Vadim:
>  - remove unnecessary includes after dropping workqueue;
> ---
>  MAINTAINERS                |   1 +
>  drivers/leds/Kconfig       |  10 ++
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-mlxreg.c | 311 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 323 insertions(+)
>  create mode 100644 drivers/leds/leds-mlxreg.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3bdc260..e458da6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9003,6 +9003,7 @@ M:	Vadim Pasternak <vadimp@mellanox.com>
>  L:	linux-leds@vger.kernel.org
>  S:	Supported
>  F:	drivers/leds/leds-mlxcpld.c
> +F:	drivers/leds/leds-mlxreg.c
>  F:	Documentation/leds/leds-mlxcpld.txt
>  
>  MELLANOX PLATFORM DRIVER
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4b95aed..80e6fa3 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -694,6 +694,16 @@ config LEDS_MLXCPLD
>  	  This option enables support for the LEDs on the Mellanox
>  	  boards. Say Y to enable these.
>  
> +config LEDS_MLXREG
> +	tristate "LED support for the Mellanox switches management control"
> +	depends on LEDS_CLASS
> +	help
> +	  This option enables support for the LEDs on the Mellanox Ethernet and
> +	  InfiniBand switches. The driver can be activated from the device tree

We agreed on dropping device tree from this description, didn't we? :-)

> +	  or by the direct platform device add call. Say Y to enable these. To
> +	  compile this driver as a module, choose 'M' here: the module will be
> +	  called leds-mlxreg.
> +
>  config LEDS_USER
>  	tristate "Userspace LED support"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 987884a..91eca81 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -72,6 +72,7 @@ obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>  obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
> +obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
>  obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
>  obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
>  obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
> diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
> new file mode 100644
> index 0000000..4dd2bd8
> --- /dev/null
> +++ b/drivers/leds/leds-mlxreg.c
> @@ -0,0 +1,311 @@
> +/*
> + * Copyright (c) 2018 Mellanox Technologies. All rights reserved.
> + * Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions are met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 3. Neither the names of the copyright holders nor the names of its
> + *    contributors may be used to endorse or promote products derived from
> + *    this software without specific prior written permission.
> + *
> + * Alternatively, this software may be distributed under the terms of the
> + * GNU General Public License ("GPL") version 2 as published by the Free
> + * Software Foundation.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> + * POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_data/mlxreg.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +/* Codes for LEDs. */
> +#define MLXREG_LED_OFFSET_BLINK_3HZ	0x01 /* Offset from solid: 3Hz blink */
> +#define MLXREG_LED_OFFSET_BLINK_6HZ	0x02 /* Offset from solid: 6Hz blink */
> +#define MLXREG_LED_IS_OFF		0x00 /* Off */
> +#define MLXREG_LED_RED_SOLID		0x05 /* Solid red */
> +#define MLXREG_LED_GREEN_SOLID		0x0D /* Solid green */
> +#define MLXREG_LED_AMBER_SOLID		0x09 /* Solid amber */
> +#define MLXREG_LED_BLINK_3HZ		167 /* ~167 msec off/on - HW support */
> +#define MLXREG_LED_BLINK_6HZ		83 /* ~83 msec off/on - HW support */
> +
> +/**
> + * struct mlxreg_led_data - led control data:
> + *
> + * @data: led configuration data;
> + * @led_classdev: led class data;
> + * @base_color: base led color (other colors have constant offset from base);
> + * @led_data: led data;
> + * @data_parent: pointer to private device control data of parent;
> + */
> +struct mlxreg_led_data {
> +	struct mlxreg_core_data *data;
> +	struct led_classdev led_cdev;
> +	u8 base_color;
> +	void *data_parent;
> +	char led_cdev_name[MLXREG_CORE_LABEL_MAX_SIZE];
> +};
> +
> +#define cdev_to_priv(c) container_of(c, struct mlxreg_led_data, led_cdev)
> +
> +/**
> + * struct mlxreg_led_priv_data - platform private data:
> + *
> + * @pdev: platform device;
> + * @pdata: platform data;
> + * @access_lock: mutex for attribute IO access;
> + */
> +struct mlxreg_led_priv_data {
> +	struct platform_device *pdev;
> +	struct mlxreg_core_platform_data *pdata;
> +	struct mutex access_lock; /* protect IO operations */
> +};
> +
> +static int
> +mlxreg_led_store_hw(struct mlxreg_led_data *led_data, u8 vset)
> +{
> +	struct mlxreg_led_priv_data *priv = led_data->data_parent;
> +	struct mlxreg_core_platform_data *led_pdata = priv->pdata;
> +	struct mlxreg_core_data *data = led_data->data;
> +	u32 regval;
> +	u32 nib;
> +	int ret;
> +
> +	/*
> +	 * Each LED is controlled through low or high nibble of the relevant
> +	 * register byte. Register offset is specified by off parameter.
> +	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red,
> +	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
> +	 * green.
> +	 * Parameter mask specifies which nibble is used for specific LED: mask
> +	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
> +	 * higher nibble (bits from 4 to 7).
> +	 */
> +	mutex_lock(&priv->access_lock);
> +
> +	ret = regmap_read(led_pdata->regmap, data->reg, &regval);
> +	if (ret)
> +		goto access_error;
> +
> +	nib = (ror32(data->mask, data->bit) == 0xf0) ? rol32(vset, data->bit) :
> +	      rol32(vset, data->bit + 4);
> +	regval = (regval & data->mask) | nib;
> +
> +	ret = regmap_write(led_pdata->regmap, data->reg, regval);
> +
> +access_error:
> +	mutex_unlock(&priv->access_lock);
> +
> +	return ret;
> +}
> +
> +static enum led_brightness
> +mlxreg_led_get_hw(struct mlxreg_led_data *led_data)
> +{
> +	struct mlxreg_led_priv_data *priv = led_data->data_parent;
> +	struct mlxreg_core_platform_data *led_pdata = priv->pdata;
> +	struct mlxreg_core_data *data = led_data->data;
> +	u32 regval;
> +	int ret;
> +
> +	/*
> +	 * Each LED is controlled through low or high nibble of the relevant
> +	 * register byte. Register offset is specified by off parameter.
> +	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red,
> +	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
> +	 * green.
> +	 * Parameter mask specifies which nibble is used for specific LED: mask
> +	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
> +	 * higher nibble (bits from 4 to 7).
> +	 */
> +	ret = regmap_read(led_pdata->regmap, data->reg, &regval);
> +	if (ret < 0) {
> +		dev_warn(led_data->led_cdev.dev, "Failed to get current brightness, error: %d\n",
> +			 ret);
> +		/* Assume the LED is OFF */
> +		return LED_OFF;
> +	}
> +
> +	regval = regval & ~data->mask;
> +	regval = (ror32(data->mask, data->bit) == 0xf0) ? ror32(regval,
> +		 data->bit) : ror32(regval, data->bit + 4);
> +	if (regval >= led_data->base_color &&
> +	    regval <= (led_data->base_color + MLXREG_LED_OFFSET_BLINK_6HZ))
> +		ret = LED_FULL;

Let's have enum led_brightness brightness here instead of ret.
It will be consistent with the brightness_get op return type.

> +	else
> +		ret = LED_OFF;
> +
> +	return ret;
> +}
> +
> +static int
> +mlxreg_led_brightness_set(struct led_classdev *cled, enum led_brightness value)
> +{
> +	struct mlxreg_led_data *led_data = cdev_to_priv(cled);
> +
> +	if (value)
> +		return mlxreg_led_store_hw(led_data, led_data->base_color);
> +	else
> +		return mlxreg_led_store_hw(led_data, MLXREG_LED_IS_OFF);
> +}
> +
> +static enum led_brightness
> +mlxreg_led_brightness_get(struct led_classdev *cled)
> +{
> +	struct mlxreg_led_data *led_data = cdev_to_priv(cled);
> +
> +	return mlxreg_led_get_hw(led_data);
> +}
> +
> +static int
> +mlxreg_led_blink_set(struct led_classdev *cled, unsigned long *delay_on,
> +		     unsigned long *delay_off)
> +{
> +	struct mlxreg_led_data *led_data = cdev_to_priv(cled);
> +	int err;
> +
> +	/*
> +	 * HW supports two types of blinking: full (6Hz) and half (3Hz).
> +	 * For delay on/off zero LED is setting to solid color. For others
> +	 * combination blinking is to be controlled by the software timer.
> +	 */
> +	if (!(*delay_on == 0 && *delay_off == 0) &&
> +	    !(*delay_on == MLXREG_LED_BLINK_3HZ &&
> +	      *delay_off == MLXREG_LED_BLINK_3HZ) &&
> +	    !(*delay_on == MLXREG_LED_BLINK_6HZ &&
> +	      *delay_off == MLXREG_LED_BLINK_6HZ))
> +		return -EINVAL;
> +
> +	if (*delay_on == MLXREG_LED_BLINK_6HZ)
> +		err = mlxreg_led_store_hw(led_data, led_data->base_color +
> +					  MLXREG_LED_OFFSET_BLINK_6HZ);
> +	else if (*delay_on == MLXREG_LED_BLINK_3HZ)
> +		err = mlxreg_led_store_hw(led_data, led_data->base_color +
> +					  MLXREG_LED_OFFSET_BLINK_3HZ);
> +	else
> +		err = mlxreg_led_store_hw(led_data, led_data->base_color);
> +
> +	return err;
> +}
> +
> +static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
> +{
> +	struct mlxreg_core_platform_data *led_pdata = priv->pdata;
> +	struct mlxreg_core_data *data = led_pdata->data;
> +	struct mlxreg_led_data *led_data;
> +	struct led_classdev *led_cdev;
> +	int brightness;

s/int/enum led_brightness/

> +	int i;
> +	int err;
> +
> +	for (i = 0; i < led_pdata->counter; i++, data++) {
> +		led_data = devm_kzalloc(&priv->pdev->dev, sizeof(*led_data),
> +					GFP_KERNEL);
> +		if (!led_data)
> +			return -ENOMEM;
> +
> +		led_cdev = &led_data->led_cdev;
> +		led_data->data_parent = priv;
> +		if (strstr(data->label, "red") ||
> +		    strstr(data->label, "orange")) {
> +			brightness = LED_OFF;
> +			led_data->base_color = MLXREG_LED_RED_SOLID;
> +		} else if (strstr(data->label, "amber")) {
> +			brightness = LED_OFF;
> +			led_data->base_color = MLXREG_LED_AMBER_SOLID;
> +		} else {
> +			brightness = LED_OFF;
> +			led_data->base_color = MLXREG_LED_GREEN_SOLID;
> +		}
> +		sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
> +			data->label);
> +		led_cdev->name = led_data->led_cdev_name;
> +		led_cdev->brightness = brightness;
> +		led_cdev->max_brightness = LED_ON;
> +		led_cdev->brightness_set_blocking =
> +						mlxreg_led_brightness_set;
> +		led_cdev->brightness_get = mlxreg_led_brightness_get;
> +		led_cdev->blink_set = mlxreg_led_blink_set;
> +		led_cdev->flags = LED_CORE_SUSPENDRESUME;
> +		led_data->data = data;
> +		err = devm_led_classdev_register(&priv->pdev->dev, led_cdev);
> +		if (err)
> +			return err;
> +
> +		if (led_cdev->brightness)
> +			mlxreg_led_brightness_set(led_cdev,
> +						  led_cdev->brightness);
> +		dev_info(led_cdev->dev, "label: %s, mask: 0x%02x, offset:0x%02x\n",
> +			 data->label, data->mask, data->reg);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mlxreg_led_probe(struct platform_device *pdev)
> +{
> +	struct mlxreg_core_platform_data *led_pdata;
> +	struct mlxreg_led_priv_data *priv;
> +
> +	led_pdata = dev_get_platdata(&pdev->dev);
> +	if (!led_pdata) {
> +		dev_err(&pdev->dev, "Failed to get platform data.\n");
> +		return -EINVAL;
> +	}
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	mutex_init(&priv->access_lock);
> +	priv->pdev = pdev;
> +	priv->pdata = led_pdata;
> +
> +	return mlxreg_led_config(priv);
> +}
> +
> +static int mlxreg_led_remove(struct platform_device *pdev)
> +{
> +	struct mlxreg_led_priv_data *priv = dev_get_drvdata(&pdev->dev);
> +
> +	mutex_destroy(&priv->access_lock);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mlxreg_led_driver = {
> +	.driver = {
> +	    .name = "leds-mlxreg",
> +	},
> +	.probe = mlxreg_led_probe,
> +	.remove = mlxreg_led_remove,
> +};
> +
> +module_platform_driver(mlxreg_led_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> +MODULE_DESCRIPTION("Mellanox LED regmap driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:leds-mlxreg");
> 

-- 
Best regards,
Jacek Anaszewski
