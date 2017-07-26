From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1 1/1] leds: add driver for support Mellanox regmap LEDs
 for BMC
Date: Wed, 26 Jul 2017 14:45:49 +0000
Message-ID: <AM4PR05MB3330F31FE30D3AD7985E4CFAA2B90@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1501001663-22209-1-git-send-email-vadimp@mellanox.com>
 <1501001663-22209-2-git-send-email-vadimp@mellanox.com>
 <0f5f9998-94d3-2650-6b2c-f73cb6b11dd4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-eopbgr40078.outbound.protection.outlook.com ([40.107.4.78]:1680
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751738AbdGZOpx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Jul 2017 10:45:53 -0400
In-Reply-To: <0f5f9998-94d3-2650-6b2c-f73cb6b11dd4@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

Hi Jacek,

Thank you very much for your comments.

> -----Original Message-----
> From: Jacek Anaszewski [mailto:jacek.anaszewski@gmail.com]
> Sent: Tuesday, July 25, 2017 10:56 PM
> To: Vadim Pasternak <vadimp@mellanox.com>;
> j.anaszewski@samsung.com; rpurdie@rpsys.net
> Cc: linux-leds@vger.kernel.org; lee.jones@linaro.org; robh+dt@kernel.org;
> jiri@resnulli.us
> Subject: Re: [patch v1 1/1] leds: add driver for support Mellanox regmap =
LEDs
> for BMC
>=20
> Hi Vadim,
>=20
> Thanks for the patch. Please refer to my remarks in the code below.
>=20
> On 07/25/2017 06:54 PM, Vadim Pasternak wrote:
> > Driver obtains LED devices according to system configuration, provided
> > through the platform data,
>=20
> Why platform data? This is confusing since you're providing DT bindings i=
n
> 1/2.

I think, I'll just remove "provided through the platform data".
I put it there, because I am getting data by dev_get_platdata and=20
I'd like this driver to work not only from DT bindings, but also through th=
e
APIs like platform_device_register_resndata for f.e. x86 systems.

>=20
> > like mlxreg:status:green or mlxreg:status:amber and creates devices in
> > form: "devicename:colour:function".
> > The full path is to be:
> > /sys/class/leds/mlxreg\:status\:amber/brightness
> > After timer trigger activation:
> > echo timer > /sys/class/leds/mlxreg\:status\:amber/trigger
> > Attributes for LED blinking will appaer in sysfs infrastructure:
> > /sys/class/leds/mlxreg\:status\:amber/delay_off
> > /sys/class/leds/mlxreg\:status\:amber/delay_on
> >
> > LED setting is controlled through the on-board programmable devices,
> > which exports its register map. This device could be attached to any
> > bus type, for which register mapping is supported.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/leds/Makefile      |   1 +
> >  drivers/leds/leds-mlxreg.c | 345
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 347 insertions(+)
> >  create mode 100644 drivers/leds/leds-mlxreg.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index 205d397..ac6b0d0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8566,6 +8566,7 @@ M:	Vadim Pasternak <vadimp@mellanox.com>
> >  L:	linux-leds@vger.kernel.org
> >  S:	Supported
> >  F:	drivers/leds/leds-mlxcpld.c
> > +F:	drivers/leds/leds-mlxreg.c
> >  F:	Documentation/leds/leds-mlxcpld.txt
> >
> >  MELLANOX PLATFORM DRIVER
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile index
> > 909dae6..3eb76e5 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_LEDS_IS31FL319X)		+=3D
> leds-is31fl319x.o
> >  obj-$(CONFIG_LEDS_IS31FL32XX)		+=3D leds-is31fl32xx.o
> >  obj-$(CONFIG_LEDS_PM8058)		+=3D leds-pm8058.o
> >  obj-$(CONFIG_LEDS_MLXCPLD)		+=3D leds-mlxcpld.o
> > +obj-$(CONFIG_LEDS_MLXREG)		+=3D leds-mlxreg.o
> >  obj-$(CONFIG_LEDS_NIC78BX)		+=3D leds-nic78bx.o
> >  obj-$(CONFIG_LEDS_MT6323)		+=3D leds-mt6323.o
> >
> > diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
> > new file mode 100644 index 0000000..bc1a6c3
> > --- /dev/null
> > +++ b/drivers/leds/leds-mlxreg.c
> > @@ -0,0 +1,345 @@
> > +/*
> > + * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
> > + * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
> > + *
> > + * Redistribution and use in source and binary forms, with or without
> > + * modification, are permitted provided that the following conditions =
are
> met:
> > + *
> > + * 1. Redistributions of source code must retain the above copyright
> > + *    notice, this list of conditions and the following disclaimer.
> > + * 2. Redistributions in binary form must reproduce the above copyrigh=
t
> > + *    notice, this list of conditions and the following disclaimer in =
the
> > + *    documentation and/or other materials provided with the distribut=
ion.
> > + * 3. Neither the names of the copyright holders nor the names of its
> > + *    contributors may be used to endorse or promote products derived
> from
> > + *    this software without specific prior written permission.
> > + *
> > + * Alternatively, this software may be distributed under the terms of
> > +the
> > + * GNU General Public License ("GPL") version 2 as published by the
> > +Free
> > + * Software Foundation.
> > + *
> > + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE
> > + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR
> > +PURPOSE
> > + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> > +CONTRIBUTORS BE
> > + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
> > +OR
> > + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> PROCUREMENT
> > +OF
> > + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> > +BUSINESS
> > + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> > +WHETHER IN
> > + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> > +OTHERWISE)
> > + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> > +ADVISED OF THE
> > + * POSSIBILITY OF SUCH DAMAGE.
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/io.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_data/mlxreg.h> #include
> > +<linux/platform_device.h> #include <linux/regmap.h> #include
> > +<linux/wait.h> #include <linux/workqueue.h>
> > +
> > +#define MLXREG_LED_NAME "mlxreg"
>=20
> Why can't it be taken from DT?
>=20
> > +
> > +/* Codes for LEDs. */
> > +#define MLXREG_LED_OFFSET_HALF	0x01 /* Offset from solid: 3Hz
> blink */
> > +#define MLXREG_LED_OFFSET_FULL	0x02 /* Offset from solid: 6Hz
> blink */
> > +#define MLXREG_LED_IS_OFF	0x00 /* Off */
> > +#define MLXREG_LED_RED_SOLID	0x05 /* Solid red */
> > +#define MLXREG_LED_GREEN_SOLID	0x0D /* Solid green */
> > +#define MLXREG_LED_AMBER_SOLID	0x09 /* Solid amber */
> > +#define MLXREG_LED_BLINK_3HZ	167 /* ~167 msec off/on - HW
> support */
> > +#define MLXREG_LED_BLINK_6HZ	83 /* ~83 msec off/on - HW support
> */
> > +#define MLXREG_LED_MAX_DEFERRED	32 /* Max deferred
> operations for LED set */
> > +
> > +#define cdev_to_priv(c) container_of(c, struct mlxreg_core_led_data,
> > +led_cdev)
> > +
> > +/**
> > + * struct mlxreg_led_priv_data - platform private data:
> > + *
> > + * @pdev: platform device;
> > + * @pdata: platform data;
> > + * @access_lock: mutex for attribute IO access;  */ struct
> > +mlxreg_led_priv_data {
> > +	struct platform_device *pdev;
> > +	struct mlxreg_core_led_platform_data *pdata;
> > +	struct mutex access_lock; /* protect IO operations */ };
> > +
> > +#define MLXREG_MAP	priv->pdata->regmap
> > +
> > +static int
> > +mlxreg_led_store_hw(struct mlxreg_core_led_data *led_pdata, u8 vset)
> > +{
> > +	struct mlxreg_led_priv_data *priv =3D led_pdata->data_parent;
> > +	u32 regval;
> > +	u32 nib;
> > +	int ret;
> > +
> > +	/*
> > +	 * Each LED is controlled through low or high nibble of the relevant
> > +	 * register byte. Register offset is specified by off parameter.
> > +	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red=
,
> > +	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
> > +	 * green.
> > +	 * Parameter mask specifies which nibble is used for specific LED:
> mask
> > +	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
> > +	 * higher nibble (bits from 4 to 7).
> > +	 */
> > +	mutex_lock(&priv->access_lock);
> > +
> > +	ret =3D regmap_read(MLXREG_MAP, led_pdata->led->reg, &regval);
> > +	if (ret)
> > +		goto access_error;
> > +
> > +	nib =3D (ror32(led_pdata->led->mask, led_pdata->led->bit) =3D=3D 0xf0=
) ?
> > +	      rol32(vset, led_pdata->led->bit) :
> > +	      rol32(vset, led_pdata->led->bit + 4);
> > +	regval =3D (regval & led_pdata->led->mask) | nib;
> > +
> > +	ret =3D regmap_write(MLXREG_MAP, led_pdata->led->reg, regval);
> > +
> > +access_error:
> > +	mutex_unlock(&priv->access_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static enum led_brightness
> > +mlxreg_led_get_hw(struct mlxreg_core_led_data *led_pdata) {
> > +	struct mlxreg_led_priv_data *priv =3D led_pdata->data_parent;
> > +	u32 regval;
> > +	int ret;
> > +
> > +	/*
> > +	 * Each LED is controlled through low or high nibble of the relevant
> > +	 * register byte. Register offset is specified by off parameter.
> > +	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red=
,
> > +	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
> > +	 * green.
> > +	 * Parameter mask specifies which nibble is used for specific LED:
> mask
> > +	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
> > +	 * higher nibble (bits from 4 to 7).
> > +	 */
> > +	ret =3D regmap_read(MLXREG_MAP, led_pdata->led->reg, &regval);
> > +	if (ret < 0) {
> > +		dev_warn(led_pdata->led_cdev.dev, "Failed to get current
> brightness, error: %d\n",
> > +			 ret);
> > +		/* Assume the LED is OFF */
> > +		ret =3D LED_OFF;
> > +		goto access_error;
> > +	}
> > +
> > +	regval =3D regval & ~led_pdata->led->mask;
> > +	regval =3D (ror32(led_pdata->led->mask, led_pdata->led->bit) =3D=3D 0=
xf0)
> ?
> > +		  ror32(regval, led_pdata->led->bit) :
> > +		  ror32(regval, led_pdata->led->bit + 4);
> > +	if (regval >=3D led_pdata->base_color &&
> > +	    regval <=3D (led_pdata->base_color + MLXREG_LED_OFFSET_FULL))
> > +		ret =3D LED_FULL;
> > +	else
> > +		ret =3D LED_OFF;
> > +
> > +access_error:
> > +
> > +	return ret;
> > +}
> > +
> > +static void
> > +mlxreg_led_brightness_set(struct led_classdev *cled, enum
> > +led_brightness value) {
> > +	struct mlxreg_core_led_data *led_pdata =3D cdev_to_priv(cled);
> > +
> > +	if (in_interrupt()) {
>=20
> You wouldn't have to bother with the context you are called from if only =
you
> used brightness_set_blocking op.
>=20

Thanks for this pointer. Missed it.
I'll issue v2 for both patches, since with this change I can remove these t=
hree fields from  mlxreg_core_led_data
	u32 bitset;
	u8 set_count;
	struct delayed_work dwork_led;

> > +		/*
> > +		 * Handle hw access to LED in workqueue to avoid I2C locking
> in
> > +		 * interrupt mode. Skip if deferred operations counter is at
> > +		 * maximum value.
> > +		 */
> > +		if (led_pdata->set_count =3D=3D MLXREG_LED_MAX_DEFERRED -
> 1)
> > +			return;
> > +
> > +		if (!!value)
> > +			led_pdata->bitset |=3D BIT(led_pdata->set_count);
> > +		led_pdata->set_count++;
> > +
> > +		schedule_delayed_work(&led_pdata->dwork_led, 0);
>=20
> Similarly you could get rid of the workqueue then. It is implemented
> internally in the LED core now.
>=20
> > +
> > +		return;
> > +	}
> > +
> > +	if (value)
> > +		mlxreg_led_store_hw(led_pdata, led_pdata->base_color);
> > +	else
> > +		mlxreg_led_store_hw(led_pdata, MLXREG_LED_IS_OFF); }
> > +
> > +static enum led_brightness
> > +mlxreg_led_brightness_get(struct led_classdev *cled) {
> > +	struct mlxreg_core_led_data *led_pdata =3D cdev_to_priv(cled);
> > +
> > +	return mlxreg_led_get_hw(led_pdata); }
> > +
> > +static int
> > +mlxreg_led_blink_set(struct led_classdev *cled, unsigned long
> *delay_on,
> > +		     unsigned long *delay_off)
> > +{
> > +	struct mlxreg_core_led_data *led_pdata =3D cdev_to_priv(cled);
> > +	int err;
> > +
> > +	/*
> > +	 * HW supports two types of blinking: full (6Hz) and half (3Hz).
> > +	 * For delay on/off zero LED is setting to solid color. For others
> > +	 * combination blinking is to be controlled by the software timer.
> > +	 */
> > +	if (!(*delay_on =3D=3D 0 && *delay_off =3D=3D 0) &&
> > +	    !(*delay_on =3D=3D MLXREG_LED_BLINK_3HZ &&
> > +	      *delay_off =3D=3D MLXREG_LED_BLINK_3HZ) &&
> > +	    !(*delay_on =3D=3D MLXREG_LED_BLINK_6HZ &&
> > +	      *delay_off =3D=3D MLXREG_LED_BLINK_6HZ))
> > +		return -EINVAL;
> > +
> > +	if (*delay_on =3D=3D MLXREG_LED_BLINK_6HZ)
> > +		err =3D mlxreg_led_store_hw(led_pdata, led_pdata-
> >base_color +
> > +					  MLXREG_LED_OFFSET_FULL);
> > +	else if (*delay_on =3D=3D MLXREG_LED_BLINK_3HZ)
> > +		err =3D mlxreg_led_store_hw(led_pdata, led_pdata-
> >base_color +
> > +					  MLXREG_LED_OFFSET_HALF);
> > +	else
> > +		err =3D mlxreg_led_store_hw(led_pdata, led_pdata-
> >base_color);
> > +
> > +	return err;
> > +}
> > +
> > +static void mlxreg_led_handler(struct work_struct *work) {
> > +	struct mlxreg_core_led_data *led_pdata =3D container_of(work,
> > +			struct mlxreg_core_led_data, dwork_led.work);
> > +
> > +	if (led_pdata->bitset & BIT(0))
> > +		mlxreg_led_store_hw(led_pdata, led_pdata->base_color);
> > +	else
> > +		mlxreg_led_store_hw(led_pdata, MLXREG_LED_IS_OFF);
> > +
> > +	led_pdata->bitset >>=3D 1;
> > +	led_pdata->set_count--;
> > +}
> > +
> > +#define MLXREG_CDEV(i)	pdata->data[i].led_cdev
> > +
> > +static int mlxreg_led_config(struct mlxreg_led_priv_data *priv) {
> > +	struct mlxreg_core_led_platform_data *pdata =3D priv->pdata;
> > +	struct mlxreg_core_data *data =3D pdata->data->led;
> > +	int brightness;
> > +	int i;
> > +	int err;
> > +
> > +	for (i =3D 0; i < pdata->counter; i++, data++) {
> > +		pdata->data[i].data_parent =3D priv;
> > +		if (strstr(data->label, "red")) {
> > +			brightness =3D LED_OFF;
> > +			pdata->data[i].base_color =3D
> MLXREG_LED_RED_SOLID;
> > +		} else if (strstr(data->label, "amber")) {
> > +			brightness =3D LED_OFF;
> > +			pdata->data[i].base_color =3D
> MLXREG_LED_AMBER_SOLID;
> > +		} else {
> > +			brightness =3D LED_OFF;
> > +			pdata->data[i].base_color =3D
> MLXREG_LED_GREEN_SOLID;
> > +		}
> > +		sprintf(pdata->data[i].led_cdev_name, "%s:%s",
> > +			MLXREG_LED_NAME, data->label);
>=20
> You should take LED name directly from the of_node. Either child DT node
> name or label property contained by it.
> See Documentation/devicetree/bindings/leds/common.txt.

LED name is coming from DT:
	status-green {
		reg =3D <0x20>;
		mask =3D <0xf0>;
	};
	status-amber {
		reg =3D <0x20>;
		mask =3D <0xf0>;
	};
	fan1-green {
		reg =3D <0x21>;
		mask =3D <0xf0>;
	};
In /sys/class/leds it's shown, like:
mlxreg:fan1:green
mlxreg:status:amber
mlxreg:fan1: red

I used mlxreg as a device prefix.
Do you think it should be removed?=20

>=20
> > +		MLXREG_CDEV(i).name =3D pdata->data[i].led_cdev_name;
>=20
> Let's avoid using these type of macros in favor of temporary variables.
> However let's agree about final shape thereof after core mfd driver gets
> reviewed.
>=20
>=20
> > +		MLXREG_CDEV(i).brightness =3D brightness;
> > +		MLXREG_CDEV(i).max_brightness =3D 1;
> > +		MLXREG_CDEV(i).brightness_set =3D
> mlxreg_led_brightness_set;
> > +		MLXREG_CDEV(i).brightness_get =3D
> mlxreg_led_brightness_get;
> > +		MLXREG_CDEV(i).blink_set =3D mlxreg_led_blink_set;
> > +		MLXREG_CDEV(i).flags =3D LED_CORE_SUSPENDRESUME;
> > +		pdata->data[i].led =3D data;
> > +		err =3D devm_led_classdev_register(&priv->pdev->dev,
> > +						 &MLXREG_CDEV(i));
> > +		if (err)
> > +			return err;
> > +
> > +		if (MLXREG_CDEV(i).brightness)
> > +			mlxreg_led_brightness_set(
> > +				&MLXREG_CDEV(i),
> > +				MLXREG_CDEV(i).brightness);
> > +		dev_info(MLXREG_CDEV(i).dev,
> > +			 "label: %s, mask: 0x%02x, offset:0x%02x\n",
> > +			 data->label, data->mask, data->reg);
> > +
> > +		INIT_DELAYED_WORK(&pdata->data[i].dwork_led,
> > +				  mlxreg_led_handler);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mlxreg_led_probe(struct platform_device *pdev) {
> > +	struct mlxreg_core_led_platform_data *pdata;
> > +	struct mlxreg_led_priv_data *priv;
> > +
> > +	pdata =3D dev_get_platdata(&pdev->dev);
> > +	if (!pdata) {
> > +		dev_err(&pdev->dev, "Failed to get platform data.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&priv->access_lock);
> > +	priv->pdev =3D pdev;
> > +	priv->pdata =3D pdata;
> > +
> > +	return mlxreg_led_config(priv);
> > +}
> > +
> > +static int mlxreg_led_remove(struct platform_device *pdev) {
> > +	struct mlxreg_led_priv_data *priv =3D dev_get_drvdata(&pdev->dev);
> > +	struct mlxreg_core_led_platform_data *pdata =3D priv->pdata;
> > +	int i;
> > +
> > +	for (i =3D 0; i < pdata->counter; i++)
> > +		cancel_delayed_work(&pdata->data[i].dwork_led);
> > +
> > +	mutex_unlock(&priv->access_lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id mlxreg_led_dt_match[] =3D {
> > +	{ .compatible =3D "mellanox,leds-mlxreg" },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, mlxreg_dt_match);
> > +
> > +static struct platform_driver mlxreg_led_driver =3D {
> > +	.driver =3D {
> > +	    .name =3D "leds-mlxreg",
> > +	    .of_match_table =3D of_match_ptr(mlxreg_led_dt_match),
> > +	},
> > +	.probe =3D mlxreg_led_probe,
> > +	.remove =3D mlxreg_led_remove,
> > +};
> > +
> > +module_platform_driver(mlxreg_led_driver);
> > +
> > +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> > +MODULE_DESCRIPTION("Mellanox LED regmap driver");
> > +MODULE_LICENSE("Dual BSD/GPL"); MODULE_ALIAS("platform:leds-
> mlxreg");
> >
>=20
> --
> Best regards,
> Jacek Anaszewski
