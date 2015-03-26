From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v4 3/3] leds: Add ktd2692 flash LED driver
Date: Thu, 26 Mar 2015 13:56:39 +0900
Message-ID: <55139187.4000301@samsung.com>
References: <1427247044-3748-1-git-send-email-ingi2.kim@samsung.com>
 <1427247044-3748-4-git-send-email-ingi2.kim@samsung.com>
 <20150325135336.GM18321@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61036 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbbCZE4m (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 00:56:42 -0400
In-reply-to: <20150325135336.GM18321@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Sakari,

Thanks for the review

On 2015=EB=85=84 03=EC=9B=94 25=EC=9D=BC 22:53, Sakari Ailus wrote:
> Hi Ingi,
>=20
> Thank you for the patch.
>=20
> On Wed, Mar 25, 2015 at 10:30:44AM +0900, Ingi Kim wrote:
>> This patch adds a driver to support the ktd2692 flash LEDs.
>> ktd2692 can control flash current by ExpressWire interface.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> ---
>>  drivers/leds/Kconfig        |   9 +
>>  drivers/leds/Makefile       |   1 +
>>  drivers/leds/leds-ktd2692.c | 412 +++++++++++++++++++++++++++++++++=
+++++++++++
>>  3 files changed, 422 insertions(+)
>>  create mode 100644 drivers/leds/leds-ktd2692.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 25b320d..9311cfc4 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -498,6 +498,15 @@ config LEDS_MENF21BMC
>>  	  This driver can also be built as a module. If so the module
>>  	  will be called leds-menf21bmc.
>> =20
>> +config LEDS_KTD2692
>> +	tristate "Flash LED support for the KTD2692 Driver"
>=20
> Does ktd2692 act as something else as well? If not, how about "KTD269=
2 LED
> flash support"?
>=20

Right, KTD2692 driver acts just for flash led.

>> +	depends on LEDS_CLASS_FLASH && GPIOLIB
>> +	help
>> +	  This option enables support for the KTD2692 connected through
>> +	  ExpressWire Interface. Say Y to enabled these.
>> +	  It depends on LEDS_CLASS_FLASH for using flash led (strobe) and
>> +	  GPIOLIB for using gpio pin to control Expresswire interface
>=20
> The dependencies are shown by make *config, I would drop them from he=
re.
>=20

Did you mean help message about dependencies? or config (LEDS_CLASS_FLA=
SH, GPIOLIB)
if you mean latter, I don't know exactly what you say.
if it wasn't, I should drop superfluous help message

>> +
>>  comment "LED driver for blink(1) USB RGB LED is under Special HID d=
rivers (HID_THINGM)"
>> =20
>>  config LEDS_BLINKM
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index cbba921..289513b 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -58,6 +58,7 @@ obj-$(CONFIG_LEDS_BLINKM)		+=3D leds-blinkm.o
>>  obj-$(CONFIG_LEDS_SYSCON)		+=3D leds-syscon.o
>>  obj-$(CONFIG_LEDS_VERSATILE)		+=3D leds-versatile.o
>>  obj-$(CONFIG_LEDS_MENF21BMC)		+=3D leds-menf21bmc.o
>> +obj-$(CONFIG_LEDS_KTD2692)		+=3D leds-ktd2692.o
>> =20
>>  # LED SPI Drivers
>>  obj-$(CONFIG_LEDS_DAC124S085)		+=3D leds-dac124s085.o
>> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692=
=2Ec
>> new file mode 100644
>> index 0000000..c31ec9d
>> --- /dev/null
>> +++ b/drivers/leds/leds-ktd2692.c
>> @@ -0,0 +1,412 @@
>> +/*
>> + * LED driver : leds-ktd2692.c
>> + *
>> + * Copyright (C) 2015 Samsung Electronics
>> + * Ingi Kim <ingi2.kim@samsung.com>
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/led-class-flash.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_gpio.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/workqueue.h>
>> +
>> +#define GET_BIT(bit, val)			(((val) >> (bit)) & 0x01)
>> +
>> +/* Value related the flash mode */
>> +#define KTD2692_FLASH_MODE_TIMEOUT_LEVELS	8
>> +#define KTD2692_FLASH_MODE_TIMEOUT_DISABLE	0
>> +#define KTD2692_FLASH_MODE_TIMEOUT_DEFAULT_US	1049000
>> +#define KTD2692_FLASH_MODE_TIMEOUT_MAX_US	1835000
>> +#define KTD2692_FLASH_MODE_CURR_PERCENT(x)	(((x) * 16) / 100)
>> +
>> +/* Macro for getting offset of flash timeout */
>> +#define GET_TIMEOUT_OFFSET(timeout, step)	((timeout) / (step))
>> +
>> +/* Adjust a multiple of brightness */
>> +#define KTD2692_BRIGHTNESS_RANGE_255_TO_16(x)	(((x) >> 4) & 0x0F)
>> +#define KTD2692_BRIGHTNESS_RANGE_255_TO_8(x)	(((x) >> 5) & 0x0F)
>> +#define KTD2692_BRIGHTNESS_RANGE_255_TO_4(x)	(((x) >> 6) & 0x0F)
>> +
>> +/* Base register address */
>> +#define KTD2692_REG_LVP_BASE			0x00
>> +#define KTD2692_REG_FLASH_TIMEOUT_BASE		0x20
>> +#define KTD2692_REG_MIN_CURRENT_SET_BASE	0x40
>> +#define KTD2692_REG_MOVIE_CURRENT_BASE		0x60
>> +#define KTD2692_REG_FLASH_CURRENT_BASE		0x80
>> +#define KTD2692_REG_MODE_BASE			0xA0
>> +
>> +/* Set bit coding time for expresswire interface */
>> +#define KTD2692_TIME_RESET_US			700
>> +#define KTD2692_TIME_DATA_START_TIME_US		10
>> +#define KTD2692_TIME_HIGH_END_OF_DATA_US	350
>> +#define KTD2692_TIME_LOW_END_OF_DATA_US		10
>> +#define KTD2692_TIME_SHORT_BITSET_US		4
>> +#define KTD2692_TIME_LONG_BITSET_US		12
>> +
>> +/* KTD2692 default length of name */
>> +#define KTD2692_NAME_LENGTH			20
>> +
>> +/* KTD2692 default name */
>> +#define KTD2692_DEFAULT_NAME			"ktd2692"
>> +
>> +enum ktd2692_bitset {
>> +	KTD2692_LOW =3D 0,
>> +	KTD2692_HIGH,
>> +};
>> +
>> +/* Movie / Flash Mode Control */
>> +enum ktd2692_led_mode {
>> +	KTD2692_MODE_DISABLE =3D 0,	/* default */
>> +	KTD2692_MODE_MOVIE,
>> +	KTD2692_MODE_FLASH,
>> +};
>> +
>> +struct ktd2692_context {
>> +	/* Related LED Flash class device */
>> +	struct led_classdev_flash fled_cdev;
>> +
>> +	struct mutex lock;
>> +	struct regulator *regulator;
>> +	struct work_struct work_brightness_set;
>> +
>> +	int aux_gpio;
>> +	int ctrl_gpio;
>> +
>> +	enum ktd2692_led_mode mode;
>> +	enum led_brightness torch_brightness;
>> +};
>> +
>> +static struct ktd2692_context *fled_cdev_to_led(
>> +				struct led_classdev_flash *fled_cdev)
>> +{
>> +	return container_of(fled_cdev, struct ktd2692_context, fled_cdev);
>> +}
>> +
>> +static void ktd2692_led_regulator_enable(struct ktd2692_context *le=
d)
>> +{
>> +	struct led_classdev_flash *fled_cdev =3D &led->fled_cdev;
>> +	struct led_classdev *led_cdev =3D &fled_cdev->led_cdev;
>> +	int ret;
>> +
>> +	if (regulator_is_enabled(led->regulator) > 0)
>> +		return;
>=20
> What's the purpose of this? Why not to just call regulator_enable() i=
nstead?
>=20
> This way you could easily mess up with other users of the same regula=
tor.
>=20

I want to harmonize all APIs in here...

but I'd better simplify code if it would make a mess

>> +
>> +	ret =3D regulator_enable(led->regulator);
>> +	if (ret)
>> +		dev_err(led_cdev->dev, "Failed to enable vin:%d\n", ret);
>> +}
>> +
>> +static void ktd2692_led_regulator_disable(struct ktd2692_context *l=
ed)
>> +{
>> +	struct led_classdev_flash *fled_cdev =3D &led->fled_cdev;
>> +	struct led_classdev *led_cdev =3D &fled_cdev->led_cdev;
>> +	int ret;
>> +
>> +	if (!regulator_is_enabled(led->regulator))
>> +		return;
>> +
>> +	ret =3D regulator_disable(led->regulator);
>> +	if (ret)
>> +		dev_err(led_cdev->dev, "Failed to disable vin:%d\n", ret);
>> +}
>> +
>> +static void ktd2692_expresswire_start(struct ktd2692_context *led)
>> +{
>> +	gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
>> +	udelay(KTD2692_TIME_DATA_START_TIME_US);
>> +}
>> +
>> +static void ktd2692_expresswire_reset(struct ktd2692_context *led)
>> +{
>> +	gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
>> +	udelay(KTD2692_TIME_RESET_US);
>> +}
>> +
>> +static void ktd2692_expresswire_end(struct ktd2692_context *led)
>> +{
>> +	gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
>> +	udelay(KTD2692_TIME_LOW_END_OF_DATA_US);
>> +	gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
>> +	udelay(KTD2692_TIME_HIGH_END_OF_DATA_US);
>> +}
>> +
>> +static void ktd2692_expresswire_set_bit(struct ktd2692_context *led=
, bool bit)
>> +{
>> +	if (bit) {
>> +		gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
>> +		udelay(KTD2692_TIME_SHORT_BITSET_US);
>> +		gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
>> +		udelay(KTD2692_TIME_LONG_BITSET_US);
>> +	} else {
>> +		gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
>> +		udelay(KTD2692_TIME_LONG_BITSET_US);
>> +		gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
>> +		udelay(KTD2692_TIME_SHORT_BITSET_US);
>> +	}
>> +}
>> +
>> +static void ktd2692_expresswire_write(struct ktd2692_context *led, =
u8 value)
>> +{
>> +	int i;
>> +
>> +	ktd2692_expresswire_start(led);
>> +	for (i =3D 7; i >=3D 0; i--)
>> +		ktd2692_expresswire_set_bit(led, GET_BIT(i, value));
>=20
> I think this would be cleaner as:
>=20
> value & BIT(i)
>=20
> Casting an integer as bool will result in true if it's non-zero, so y=
ou
> don't need to cast.
>=20

Thanks for good suggestion
I'll try

>> +	ktd2692_expresswire_end(led);
>> +}
>> +
>> +static void ktd2692_brightness_set(struct ktd2692_context *led,
>> +					enum led_brightness brightness)
>> +{
>> +	mutex_lock(&led->lock);
>> +
>> +	if (brightness =3D=3D LED_OFF) {
>> +		led->mode =3D KTD2692_MODE_DISABLE;
>> +		gpio_set_value(led->aux_gpio, KTD2692_LOW);
>> +		goto out;
>> +	}
>> +
>> +	ktd2692_expresswire_write(led, KTD2692_REG_MOVIE_CURRENT_BASE |
>> +				KTD2692_BRIGHTNESS_RANGE_255_TO_8(brightness));
>> +	led->mode =3D KTD2692_MODE_MOVIE;
>> +
>> +out:
>> +	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
>> +	mutex_unlock(&led->lock);
>> +}
>> +
>> +static void ktd2692_brightness_set_work(struct work_struct *work)
>> +{
>> +	struct ktd2692_context *led =3D
>> +		container_of(work, struct ktd2692_context, work_brightness_set);
>> +
>> +	ktd2692_brightness_set(led, led->torch_brightness);
>> +}
>> +
>> +static void ktd2692_led_brightness_set(struct led_classdev *led_cde=
v,
>> +					enum led_brightness brightness)
>> +{
>> +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev)=
;
>> +	struct ktd2692_context *led =3D fled_cdev_to_led(fled_cdev);
>> +
>> +	led->torch_brightness =3D brightness;
>> +	schedule_work(&led->work_brightness_set);
>> +}
>> +
>> +static int ktd2692_led_brightness_set_sync(struct led_classdev *led=
_cdev,
>> +					enum led_brightness brightness)
>> +{
>> +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev)=
;
>> +	struct ktd2692_context *led =3D fled_cdev_to_led(fled_cdev);
>> +
>> +	ktd2692_brightness_set(led, brightness);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *=
fled_cdev,
>> +						bool state)
>> +{
>> +	struct ktd2692_context *led =3D fled_cdev_to_led(fled_cdev);
>> +	struct led_flash_setting *timeout =3D &fled_cdev->timeout;
>> +	u32 flash_tm_reg;
>> +
>> +	mutex_lock(&led->lock);
>> +
>> +	if (state =3D=3D 0) {
>> +		led->mode =3D KTD2692_MODE_DISABLE;
>> +		gpio_set_value(led->aux_gpio, KTD2692_LOW);
>> +		goto done;
>> +	}
>> +
>> +	flash_tm_reg =3D GET_TIMEOUT_OFFSET(timeout->val, timeout->step);
>> +	ktd2692_expresswire_write(led, flash_tm_reg
>> +			| KTD2692_REG_FLASH_TIMEOUT_BASE);
>> +
>> +	led->mode =3D KTD2692_MODE_FLASH;
>> +	gpio_set_value(led->aux_gpio, KTD2692_HIGH);
>> +
>> +done:
>> +	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
>> +
>> +	fled_cdev->led_cdev.brightness =3D LED_OFF;
>> +	led->mode =3D KTD2692_MODE_DISABLE;
>> +
>> +	mutex_unlock(&led->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ktd2692_led_flash_timeout_set(struct led_classdev_flash =
*fled_cdev,
>> +						u32 timeout)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void ktd2692_init_flash_timeout(u32 flash_timeout_us,
>> +					struct led_flash_setting *setting)
>> +{
>> +	setting->min =3D KTD2692_FLASH_MODE_TIMEOUT_DISABLE;
>> +	setting->max =3D KTD2692_FLASH_MODE_TIMEOUT_MAX_US;
>> +	setting->step =3D KTD2692_FLASH_MODE_TIMEOUT_MAX_US
>> +			/ (KTD2692_FLASH_MODE_TIMEOUT_LEVELS - 1);
>> +	setting->val =3D flash_timeout_us;
>> +}
>> +
>> +static void ktd2692_setup(struct ktd2692_context *led)
>> +{
>> +	led->mode =3D KTD2692_MODE_DISABLE;
>> +	ktd2692_expresswire_reset(led);
>> +	gpio_set_value(led->aux_gpio, KTD2692_LOW);
>> +
>> +	ktd2692_expresswire_write(led, KTD2692_FLASH_MODE_CURR_PERCENT(45)
>> +					 | KTD2692_REG_FLASH_CURRENT_BASE);
>> +}
>> +
>> +static int ktd2692_parse_dt(struct ktd2692_context *led, struct dev=
ice *dev,
>> +				u32 *flash_timeout_us)
>> +{
>> +	struct device_node *np =3D dev->of_node;
>> +
>> +	int ret;
>> +
>> +	led->ctrl_gpio =3D of_get_named_gpio(np, "ctrl-gpio", 0);
>> +	if (!gpio_is_valid(led->ctrl_gpio)) {
>> +		dev_err(dev, "no ctrl-gpio property found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	led->aux_gpio =3D of_get_named_gpio(np, "aux-gpio", 0);
>> +	if (!gpio_is_valid(led->aux_gpio)) {
>> +		dev_err(dev, "no aux-gpio property found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D devm_gpio_request_one(dev, led->ctrl_gpio,
>> +					GPIOF_OPEN_SOURCE, "ctrl-gpio");
>> +	if (ret) {
>> +		dev_err(dev, "failed to request ctrl-gpio %d error %d\n",
>> +				led->ctrl_gpio, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D devm_gpio_request_one(dev, led->aux_gpio,
>> +					GPIOF_OPEN_SOURCE, "aux-gpio");
>> +	if (ret) {
>> +		dev_err(dev, "failed to request aux-gpio %d error %d\n",
>> +				led->aux_gpio, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D of_property_read_u32(np, "flash-timeout-us", flash_timeout=
_us);
>> +	/* default setting */
>> +	if (ret)
>> +		*flash_timeout_us =3D KTD2692_FLASH_MODE_TIMEOUT_DEFAULT_US;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct led_flash_ops flash_ops =3D {
>> +	.strobe_set =3D ktd2692_led_flash_strobe_set,
>> +	.timeout_set =3D ktd2692_led_flash_timeout_set,
>> +};
>> +
>> +static int ktd2692_probe(struct platform_device *pdev)
>> +{
>> +	struct ktd2692_context *led;
>> +	struct led_classdev *led_cdev;
>> +	struct led_classdev_flash *fled_cdev;
>> +	struct led_flash_setting flash_timeout;
>> +	u32 flash_timeout_us;
>> +	int ret;
>> +
>> +	led =3D devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
>> +	if (!led)
>> +		return -ENOMEM;
>> +
>> +	if (!pdev->dev.of_node)
>> +		return -ENXIO;
>> +
>> +	fled_cdev =3D &led->fled_cdev;
>> +	led_cdev =3D &fled_cdev->led_cdev;
>> +
>> +	ret =3D ktd2692_parse_dt(led, &pdev->dev, &flash_timeout_us);
>> +	if (ret)
>> +		return ret;
>> +
>> +	led->regulator =3D devm_regulator_get(&pdev->dev, "vin");
>> +	if (IS_ERR(led->regulator)) {
>> +		dev_err(&pdev->dev, "regulator get failed\n");
>> +		return PTR_ERR(led->regulator);
>> +	}
>> +
>> +	ktd2692_init_flash_timeout(flash_timeout_us, &flash_timeout);
>> +
>> +	fled_cdev->timeout =3D flash_timeout;
>> +	fled_cdev->ops =3D &flash_ops;
>> +
>> +	led_cdev->name =3D KTD2692_DEFAULT_NAME;
>> +	led_cdev->brightness_set =3D ktd2692_led_brightness_set;
>> +	led_cdev->brightness_set_sync =3D ktd2692_led_brightness_set_sync;
>> +	led_cdev->flags |=3D LED_CORE_SUSPENDRESUME;
>> +	led_cdev->flags |=3D LED_DEV_CAP_FLASH;
>=20
> You could unify the above two lines.
>=20

Is it better to unify code than separate?

>> +
>> +	mutex_init(&led->lock);
>> +	INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_work);
>> +
>> +	platform_set_drvdata(pdev, led);
>> +
>> +	ret =3D led_classdev_flash_register(&pdev->dev, fled_cdev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->name);
>=20
> You should do mutex_destroy() here.
>=20

Right. I should do
Thanks

>> +		cancel_work_sync(&led->work_brightness_set);
>> +		return ret;
>> +	}
>> +
>=20
> This is a LED flash device. Do you intend to add support for the V4L2=
 flash
> API as well?
>=20

I hope :-)
maybe I would support extend version later

>> +	ktd2692_setup(led);
>> +	ktd2692_led_regulator_enable(led);
>=20
> Hmm. I guess the regulator was already enabled, assuming you have tes=
ted
> this. :-)
>=20

Oh, I'll check.
Isn't it necessary to use this API if the regulator was enabled?

>> +
>> +	return 0;
>> +}
>> +
>> +static int ktd2692_remove(struct platform_device *pdev)
>> +{
>> +	struct ktd2692_context *led =3D platform_get_drvdata(pdev);
>> +
>> +	ktd2692_led_regulator_disable(led);
>> +	led_classdev_flash_unregister(&led->fled_cdev);
>> +	cancel_work_sync(&led->work_brightness_set);
>> +
>> +	mutex_destroy(&led->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id ktd2692_match[] =3D {
>> +	{ .compatible =3D "kinetic,ktd2692", },
>> +	{ /* sentinel */ },
>> +};
>> +
>> +static struct platform_driver ktd2692_driver =3D {
>> +	.driver =3D {
>> +		.name  =3D "leds-ktd2692",
>> +		.of_match_table =3D ktd2692_match,
>> +	},
>> +	.probe  =3D ktd2692_probe,
>> +	.remove =3D ktd2692_remove,
>> +};
>> +
>> +module_platform_driver(ktd2692_driver);
>> +
>> +MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
>> +MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
>> +MODULE_LICENSE("GPL v2");
>=20
