From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v2 3/3] leds: rt5033: Add RT5033 Flash led device driver
Date: Tue, 13 Oct 2015 11:58:28 +0900
Message-ID: <561C7354.9080504@samsung.com>
References: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
 <1444655578-19806-4-git-send-email-ingi2.kim@samsung.com>
 <561BCD71.9020001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45164 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751009AbbJMC7I (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 12 Oct 2015 22:59:08 -0400
In-reply-to: <561BCD71.9020001@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Jacek,

Thanks for your kind comments
I also append reply below

On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 00:10, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> Thanks for the update. Few comments below.
>=20
> On 10/12/2015 03:12 PM, Ingi Kim wrote:
>> This patch adds device driver of Richtek RT5033 PMIC.
>> The driver supports a current regulated output to drive
>> white LEDs for camera flash.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> ---
>>   drivers/leds/Kconfig               |   8 ++
>>   drivers/leds/Makefile              |   1 +
>>   drivers/leds/leds-rt5033.c         | 223 +++++++++++++++++++++++++=
++++++++++++
>>   include/linux/mfd/rt5033-private.h |  49 ++++++++
>>   include/linux/mfd/rt5033.h         |  22 +++-
>>   5 files changed, 301 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/leds/leds-rt5033.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 42990f2..29613e3 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -345,6 +345,14 @@ config LEDS_PCA963X
>>         LED driver chip accessed via the I2C bus. Supported
>>         devices include PCA9633 and PCA9634
>>
>> +config LEDS_RT5033
>> +    tristate "LED support for RT5033 PMIC"
>> +    depends on LEDS_CLASS_FLASH && OF
>> +    depends on MFD_RT5033
>> +    help
>> +      This option enables support for on-chip LED driver on
>> +      RT5033 PMIC.
>> +
>>   config LEDS_WM831X_STATUS
>>       tristate "LED support for status LEDs on WM831x PMICs"
>>       depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index b503f92..bcc4d93 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -23,6 +23,7 @@ obj-$(CONFIG_LEDS_COBALT_QUBE)        +=3D leds-co=
balt-qube.o
>>   obj-$(CONFIG_LEDS_COBALT_RAQ)        +=3D leds-cobalt-raq.o
>>   obj-$(CONFIG_LEDS_SUNFIRE)        +=3D leds-sunfire.o
>>   obj-$(CONFIG_LEDS_PCA9532)        +=3D leds-pca9532.o
>> +obj-$(CONFIG_LEDS_RT5033)        +=3D leds-rt5033.o
>>   obj-$(CONFIG_LEDS_GPIO_REGISTER)    +=3D leds-gpio-register.o
>>   obj-$(CONFIG_LEDS_GPIO)            +=3D leds-gpio.o
>>   obj-$(CONFIG_LEDS_LP3944)        +=3D leds-lp3944.o
>> diff --git a/drivers/leds/leds-rt5033.c b/drivers/leds/leds-rt5033.c
>> new file mode 100644
>> index 0000000..b470c94
>> --- /dev/null
>> +++ b/drivers/leds/leds-rt5033.c
>> @@ -0,0 +1,223 @@
>> +/*
>> + * led driver for RT5033
>> + *
>> + * Copyright (C) 2015 Samsung Electronics, Co., Ltd.
>> + * Ingi Kim <ingi2.kim@samsung.com>
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + *
>> + */
>> +
>> +#include <linux/mfd/rt5033.h>
>> +#include <linux/mfd/rt5033-private.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define RT5033_LED_FLASH_TIMEOUT_MIN        64000
>> +#define RT5033_LED_FLASH_TIMEOUT_STEPS        32000
>> +#define RT5033_LED_TORCH_CURRENT_LEVEL_MAX    16
>> +
>> +/* Macro for getting offset of flash timeout */
>> +#define GET_TIMEOUT_OFFSET(tm, step)    ((tm) / (step) - 2)
>> +
>> +static struct rt5033_led *flcdev_to_led(
>> +                struct led_classdev_flash *fled_cdev)
>> +{
>> +    return container_of(fled_cdev, struct rt5033_led, fled_cdev);
>> +}
>> +
>> +static int rt5033_led_brightness_set(struct led_classdev *led_cdev,
>> +                     enum led_brightness brightness)
>> +{
>> +    struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cd=
ev);
>> +    struct rt5033_led *led =3D flcdev_to_led(fled_cdev);
>=20
> I assume that you don't use mutex here deliberately?
>=20

Actually I'm not sure why flash driver uses mutex.
In consideration of blocking competition, however, I'd be better to use=
 it

>> +    if (!brightness) {
>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
>> +                   RT5033_FLED_CTRL2_MASK, 0x0);
>> +    } else {
>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
>> +                   RT5033_FLED_FUNC1_MASK, RT5033_FLED_PINCTRL);
>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_CTRL1,
>> +                   RT5033_FLED_CTRL1_MASK,
>> +                   (brightness - 1) << 4);
>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
>> +                   RT5033_FLED_CTRL2_MASK, RT5033_FLED_ENFLED);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void rt5033_init_flash_timeout(struct rt5033_led *led)
>> +{
>> +    struct led_flash_setting *setting;
>> +
>> +    setting =3D &led->fled_cdev.timeout;
>> +    setting->min =3D RT5033_LED_FLASH_TIMEOUT_MIN;
>> +    setting->max =3D led->data->flash_max_timeout;
>> +    setting->step =3D RT5033_LED_FLASH_TIMEOUT_STEPS;
>> +    setting->val =3D led->data->flash_max_timeout;
>> +}
>> +
>> +static int rt5033_led_parse_dt(struct rt5033_led *led, struct devic=
e *dev)
>> +{
>> +    struct device_node *np =3D dev->of_node;
>> +    struct device_node *child_node;
>> +    struct rt5033_led_config_data *data;
>> +    int ret =3D 0;
>> +
>> +    if (!np)
>> +        return -ENXIO;
>> +
>> +    data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>=20
> This way data will remain allocated until driver removal, whereas
> you are using it only in rt5033_init_flash_timeout during driver
> probing AFAICS. Please define local variable in rt5033_led_probe,
> pass its pointer to this function and than pass the pointer to
> rt5033_init_flash_timeout.
>=20

You're right, I should have moved it to local,
I'll try to fix it.


>> +    child_node =3D of_get_next_available_child(np, NULL);
>> +    if (!child_node) {
>> +        dev_err(dev, "DT child node isn't found\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    led->fled_cdev.led_cdev.name =3D
>> +        of_get_property(child_node, "label", NULL) ? : child_node->=
name;
>> +
>> +    ret =3D of_property_read_u32(child_node, "led-max-microamp",
>> +                   &data->torch_max_microamp);
>> +    if (ret) {
>> +        dev_err(dev, "failed to parse led-max-microamp\n");
>> +        return ret;
>> +    }
>=20
> data->torch_max_microamp isn't used anywhere, while it should be used
> for initializing led_cdev->max_brightness.
>=20

Oh, I see.
I'll fix it

>> +
>> +    ret =3D of_property_read_u32(child_node, "flash-max-microamp",
>> +                   &data->flash_max_microamp);
>> +    if (ret) {
>> +        dev_err(dev, "failed to parse flash-max-microamp\n");
>> +        return ret;
>> +    }
>=20
> data->flash_max_microamp also isn't used anywhere. Does your device
> support flash brightness setting? If yes then you should implement
> also flash_brightness_set op. Otherwise this property is redundant.
>=20

Yes, It support to set flash brightness.
I should implement it.

>> +    ret =3D of_property_read_u32(child_node, "flash-max-timeout-us"=
,
>> +                   &data->flash_max_timeout);
>> +    if (ret)
>> +        dev_err(dev, "failed to parse flash-max-timeout-us\n");
>> +
>> +    of_node_put(child_node);
>> +    led->data =3D data;
>> +
>> +    return ret;
>> +}
>> +
>> +static int rt5033_led_flash_timeout_set(struct led_classdev_flash *=
fled_cdev,
>> +                    u32 timeout)
>> +{
>> +    return 0;
>> +}
>> +
>> +static int rt5033_led_flash_strobe_set(struct led_classdev_flash *f=
led_cdev,
>> +                       bool state)
>> +{
>> +    struct rt5033_led *led =3D flcdev_to_led(fled_cdev);
>> +    u32 flash_tm_reg;
>=20
> I think that you need a mutex here and in rt5033_led_flash_strobe_set=
=2E Otherwise following is possible:
>=20
> Process 1:
>     rt5033_led_flash_strobe_set(led_cdev, 1);
>=20
>     regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION1,
>             RT5033_FLED_FUNC1_MASK, RT5033_FLED_RESET);
>     fled_cdev->led_cdev.brightness =3D LED_OFF;
>=20
> Process 2:
>     led_set_brightness(led_cdev, 1);
>=20
>     fled_cdev->led_cdev.brightness =3D 1;
>=20
>     rt5033_led_brightness_set(led_cdev, LED_FULL);
>=20
>     regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
>             RT5033_FLED_FUNC1_MASK, RT5033_FLED_PINCTRL);
>     regmap_update_bits(led->regmap,    RT5033_REG_FLED_CTRL1,
>             RT5033_FLED_CTRL1_MASK,
>             (brightness - 1) << 4);
>     regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
>             RT5033_FLED_CTRL2_MASK, RT5033_FLED_ENFLED);
>=20
> Process 1:
>     regmap_update_bits(led->regmap,    RT5033_REG_FLED_STROBE_CTRL2,
>         RT5033_FLED_STRBCTRL2_MASK, flash_tm_reg);
>     regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION1,
>         RT5033_FLED_FUNC1_MASK, RT5033_FLED_STRB_SEL
>         | RT5033_FLED_PINCTRL);
>     regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION2,
>         RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED
>=20
> In a result LED class device will report brightness value 1,
> whereas it would be inconsistent with hardware state, since
> flash strobe turns torch mode off.
>=20
>=20

Thanks for your explanation in detail,
I was worried about cases of using shared resource for flash led.
because I thought flash led would be called just from camera or directl=
y itself.
I should consider using mutex

>> +
>> +    regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION1,
>> +               RT5033_FLED_FUNC1_MASK, RT5033_FLED_RESET);
>> +    fled_cdev->led_cdev.brightness =3D LED_OFF;
>> +
>> +    if (state) {
>> +        flash_tm_reg =3D GET_TIMEOUT_OFFSET(fled_cdev->timeout.val,
>> +                          fled_cdev->timeout.step);
>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_STROBE_C=
TRL2,
>> +                   RT5033_FLED_STRBCTRL2_MASK, flash_tm_reg);
>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION=
1,
>> +                   RT5033_FLED_FUNC1_MASK, RT5033_FLED_STRB_SEL
>> +                   | RT5033_FLED_PINCTRL);
>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION=
2,
>> +                   RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED
>> +                   | RT5033_FLED_SREG_STRB);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct led_flash_ops flash_ops =3D {
>> +    .strobe_set =3D rt5033_led_flash_strobe_set,
>> +    .timeout_set =3D rt5033_led_flash_timeout_set,
>> +};
>> +
>> +static int rt5033_led_probe(struct platform_device *pdev)
>> +{
>> +    struct rt5033_dev *rt5033 =3D dev_get_drvdata(pdev->dev.parent)=
;
>> +    struct rt5033_led *led;
>> +    struct led_classdev *led_cdev;
>> +    int ret;
>> +
>> +    led =3D devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
>> +    if (!led)
>> +        return -ENOMEM;
>> +
>> +    platform_set_drvdata(pdev, led);
>> +    led->dev =3D &pdev->dev;
>> +    led->regmap =3D rt5033->regmap;
>> +
>> +    ret =3D rt5033_led_parse_dt(led, &pdev->dev);
>> +    if (ret)
>> +        return ret;
>> +
>> +    rt5033_init_flash_timeout(led);
>> +    led->fled_cdev.ops =3D &flash_ops;
>> +    led_cdev =3D &led->fled_cdev.led_cdev;
>> +
>> +    led_cdev->max_brightness =3D RT5033_LED_TORCH_CURRENT_LEVEL_MAX=
;
>=20
> This should depend on led-max-microamp.
>=20

Right, I'll fix it

>> +    led_cdev->brightness_set_sync =3D rt5033_led_brightness_set;
>> +    led_cdev->flags |=3D LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH=
;
>=20
> You need also a work queue since your ops can sleep.
>

Ok, I'll try to implement it
=20
>> +
>> +    ret =3D led_classdev_flash_register(&pdev->dev, &led->fled_cdev=
);
>> +    if (ret < 0) {
>> +        dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->na=
me);
>> +        return ret;
>> +    }
>> +
>> +    regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION1,
>> +               RT5033_FLED_FUNC1_MASK, RT5033_FLED_RESET);
>> +
>> +    return 0;
>> +}
>> +
>> +static int rt5033_led_remove(struct platform_device *pdev)
>> +{
>> +    struct rt5033_led *led =3D platform_get_drvdata(pdev);
>> +
>> +    led_classdev_flash_unregister(&led->fled_cdev);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct platform_device_id rt5033_led_id[] =3D {
>> +    { "rt5033-led", },
>> +    { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(platform, rt5033_led_id);
>> +
>> +static const struct of_device_id rt5033_led_match[] =3D {
>> +    { .compatible =3D "richtek,rt5033-led", },
>> +    { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, rt5033_led_match);
>> +
>> +static struct platform_driver rt5033_led_driver =3D {
>> +    .driver =3D {
>> +        .name =3D "rt5033-led",
>> +        .of_match_table =3D rt5033_led_match,
>> +    },
>> +    .probe        =3D rt5033_led_probe,
>> +    .id_table    =3D rt5033_led_id,
>> +    .remove        =3D rt5033_led_remove,
>> +};
>> +module_platform_driver(rt5033_led_driver);
>> +
>> +MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
>> +MODULE_DESCRIPTION("Richtek RT5033 LED driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("platform:rt5033-led");
>> diff --git a/include/linux/mfd/rt5033-private.h b/include/linux/mfd/=
rt5033-private.h
>> index 1b63fc2..c8e99e4 100644
>> --- a/include/linux/mfd/rt5033-private.h
>> +++ b/include/linux/mfd/rt5033-private.h
>> @@ -93,6 +93,55 @@ enum rt5033_reg {
>>   #define RT5033_RT_CTRL1_UUG_MASK    0x02
>>   #define RT5033_RT_HZ_MASK        0x01
>>

[..]

>>
>> +/* RT5033 Flash led platform data */
>> +struct rt5033_led_config_data {
>> +    u32 torch_max_microamp;
>> +    u32 flash_max_microamp;
>> +    u32 flash_max_timeout;
>> +    enum led_brightness max_brightness;
>> +};
>> +
>> +struct rt5033_led {
>> +    struct device        *dev;
>> +    struct rt5033_dev    *rt5033;
>> +    struct regmap        *regmap;
>> +
>> +    struct led_classdev_flash fled_cdev;
>> +    struct rt5033_led_config_data  *data;
>=20
> It is not needed to have config data here.
>=20

Okay, I try to move config data to local.

>> +};
>> +
>>   #endif /* __RT5033_H__ */
>>
>=20
>=20
