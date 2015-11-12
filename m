From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v4 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Thu, 12 Nov 2015 16:57:53 +0900
Message-ID: <56444681.9020604@samsung.com>
References: <1447121864-15460-1-git-send-email-ingi2.kim@samsung.com>
 <1447121864-15460-3-git-send-email-ingi2.kim@samsung.com>
 <56421B8F.6010107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52416 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753416AbbKLH55 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Nov 2015 02:57:57 -0500
In-reply-to: <56421B8F.6010107@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Jacek,

Thanks for the review.
your feedback is highly appreciated :)
I'll send next patch set soon.

On 2015=EB=85=84 11=EC=9B=94 11=EC=9D=BC 01:30, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> Thanks for the update. Please find my comments below.
>=20
> On 11/10/2015 03:17 AM, Ingi Kim wrote:
>> This patch adds device driver of Richtek RT5033 PMIC.
>> The driver supports a current regulated output to drive white LEDs.
>=20
> I would add here also the part from leds-rt5033.txt header.
>=20

Okay. I will add.

>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> ---
>>   drivers/leds/Kconfig               |   8 +
>>   drivers/leds/Makefile              |   1 +
>>   drivers/leds/leds-rt5033.c         | 502 +++++++++++++++++++++++++=
++++++++++++
>>   include/linux/mfd/rt5033-private.h |  51 ++++
>>   4 files changed, 562 insertions(+)
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
>> index 0000000..eb89731
>> --- /dev/null
>> +++ b/drivers/leds/leds-rt5033.c
>> @@ -0,0 +1,502 @@
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
>> +#include <linux/led-class-flash.h>
>> +#include <linux/mfd/rt5033.h>
>> +#include <linux/mfd/rt5033-private.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/workqueue.h>
>> +
>> +#define RT5033_LED_FLASH_TIMEOUT_MIN        64000
>> +#define RT5033_LED_FLASH_TIMEOUT_STEP        32000
>> +#define RT5033_LED_FLASH_BRIGHTNESS_MIN        50000
>> +#define RT5033_LED_FLASH_BRIGHTNESS_MAX_1CH    600000
>> +#define RT5033_LED_FLASH_BRIGHTNESS_MAX_2CH    800000
>> +#define RT5033_LED_FLASH_BRIGHTNESS_STEP    25000
>> +#define RT5033_LED_TORCH_BRIGHTNESS_MIN        12500
>> +#define RT5033_LED_TORCH_BRIGHTNESS_STEP    12500
>> +
>> +/* Macro to get offset of rt5033_led_config_data */
>> +#define RT5033_LED_CONFIG_DATA_OFFSET(val, step, min)    (((val) - =
(min)) \
>> +                            / (step))
>> +#define MIN(a, b)        ((a) > (b) ? (b) : (a))
>=20
> Please use min() macro from include/linux/kernel.h
>=20

Oh, I'll check.

>> +#define FLED1_IOUT        (BIT(0))
>> +#define FLED2_IOUT        (BIT(1))
>> +
>> +enum rt5033_fled {
>> +    FLED1,
>> +    FLED2,
>> +};
>> +
>> +struct rt5033_sub_led {
>> +    enum rt5033_fled fled_id;
>> +    struct led_classdev_flash fled_cdev;
>> +    struct work_struct work_brightness_set;
>> +
>> +    u32 torch_brightness;
>> +    u32 flash_brightness;
>> +    u32 flash_timeout;
>> +};
>> +
>> +/* RT5033 Flash led platform data */
>> +struct rt5033_led {
>> +    struct device *dev;
>> +    struct mutex lock;
>> +    struct regmap *regmap;
>> +    struct rt5033_sub_led sub_leds[2];
>> +
>> +    u32 iout_torch_max[2];
>> +    u32 iout_flash_max[2];
>=20
> You're not using above two properties anywhere in the driver.
>=20

Thanks, I'll Remove it.

>> +    u8 fled_mask;
>> +
>> +    /* arrangement of current outputs */
>> +    bool iout_joint;
>> +};
>> +
>> +struct rt5033_led_config_data {
>> +    const char *label[2];
>> +    u32 flash_max_microamp[2];
>> +    u32 flash_max_timeout[2];
>> +    u32 torch_max_microamp[2];
>> +    u32 num_leds;
>> +};
>> +
>> +static struct rt5033_sub_led *flcdev_to_sub_led(
>> +                    struct led_classdev_flash *fled_cdev)
>> +{
>> +    return container_of(fled_cdev, struct rt5033_sub_led, fled_cdev=
);
>> +}
>> +
>> +static struct rt5033_led *sub_led_to_led(struct rt5033_sub_led *sub=
_led)
>> +{
>> +    return container_of(sub_led, struct rt5033_led,
>> +                sub_leds[sub_led->fled_id]);
>> +}
>> +
>> +static int rt5033_fled_used(struct rt5033_led *led, enum rt5033_fle=
d fled_id)
>> +{
>> +    u8 fled_bit =3D (fled_id =3D=3D FLED1) ? FLED1_IOUT : FLED2_IOU=
T;
>> +
>> +    return led->fled_mask & fled_bit;
>> +}
>> +
>> +static void __rt5033_led_brightness_set(struct rt5033_led *led,
>> +                    enum rt5033_fled fled_id,
>> +                    enum led_brightness brightness)
>> +{
>> +    unsigned int val;
>> +
>> +    mutex_lock(&led->lock);
>> +
>> +    if (!brightness) {
>> +        regmap_read(led->regmap, RT5033_REG_FLED_FUNCTION1, &val);
>> +        val &=3D ~(rt5033_fled_used(led, fled_id));
>=20
> Please change val type to the one corresponding with the device regis=
ter
> width, i.e. if the register is 8-bit wide, then val should be u8.
> Please also calculate the value to write directly here, and not with =
use
> of ~rt5033_fled_used, which returns int and is designed for different
> purposes.
>=20

Oh, I misused above function.
Thanks for the comment.

>> +        regmap_write(led->regmap, RT5033_REG_FLED_FUNCTION1, val);
>> +    } else {
>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
>> +                   RT5033_FLED_FUNC1_MASK, RT5033_FLED_PINCTRL |
>> +                   rt5033_fled_used(led, fled_id));
>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_CTRL1,
>> +                   RT5033_FLED_CTRL1_MASK,
>> +                   (brightness - 1) << 4);
>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
>> +                   RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED);
>> +    }
>=20
> How are you distinguishing between setting brightness for iout_joint
> case and for individual LEDs? Have you tested this use case?
> Even if you don't have a board with two separate LEDs,
> you should be able to test two LED class devices with a single
> connected LED.
>=20

Thanks, I missed a iout_joint case :(
I have tested a board with integrated single LED,
It looks fine and all feature works well even if it has limitation.

>> +    mutex_unlock(&led->lock);
>> +}
>> +
>> +static void rt5033_led_brightness_set_work(struct work_struct *work=
)
>> +{
>> +    struct rt5033_sub_led *sub_led =3D
>> +        container_of(work, struct rt5033_sub_led, work_brightness_s=
et);
>> +    struct rt5033_led *led =3D sub_led_to_led(sub_led);
>> +
>> +    __rt5033_led_brightness_set(led, sub_led->fled_id,
>> +                    sub_led->torch_brightness);
>> +}
>> +
>> +static void rt5033_led_brightness_set(struct led_classdev *led_cdev=
,
>> +                      enum led_brightness brightness)
>> +{
>> +    struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cd=
ev);
>> +    struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
>> +
>> +    sub_led->torch_brightness =3D brightness;
>> +    schedule_work(&sub_led->work_brightness_set);
>> +}
>> +
>> +static int rt5033_led_brightness_set_sync(struct led_classdev *led_=
cdev,
>> +                      enum led_brightness brightness)
>> +{
>> +    struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cd=
ev);
>> +    struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
>> +    struct rt5033_led *led =3D sub_led_to_led(sub_led);
>> +
>> +    __rt5033_led_brightness_set(led, sub_led->fled_id, brightness);
>> +
>> +    return 0;
>> +}
>> +
>> +static int rt5033_led_flash_brightness_set(struct led_classdev_flas=
h *fled_cdev,
>> +                       u32 brightness)
>> +{
>> +    struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
>> +    struct rt5033_led *led =3D sub_led_to_led(sub_led);
>> +    u32 flash_brightness_offset;
>> +
>> +    mutex_lock(&led->lock);
>> +
>> +    flash_brightness_offset =3D
>> +        RT5033_LED_CONFIG_DATA_OFFSET(fled_cdev->brightness.val,
>> +                          fled_cdev->brightness.step,
>> +                          fled_cdev->brightness.min);
>=20
> Please assign directly to sub_led->flash_brightness.
>=20

Okay, I'll do.
Thanks.

>> +    sub_led->flash_brightness =3D flash_brightness_offset;
>> +
>> +    mutex_unlock(&led->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static int rt5033_led_flash_timeout_set(struct led_classdev_flash *=
fled_cdev,
>> +                    u32 timeout)
>> +{
>> +    struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
>> +    struct rt5033_led *led =3D sub_led_to_led(sub_led);
>> +    u32 flash_tm_offset;
>> +
>> +    mutex_lock(&led->lock);
>> +
>> +    flash_tm_offset =3D
>> +        RT5033_LED_CONFIG_DATA_OFFSET(fled_cdev->timeout.val,
>> +                          fled_cdev->timeout.step,
>> +                          fled_cdev->timeout.min);
>=20
> Please assign directly to sub_led->flash_tm_offset.
>=20

Okay, I'll do.
Thanks.

>> +    sub_led->flash_timeout =3D flash_tm_offset;
>> +
>> +    mutex_unlock(&led->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static int rt5033_led_flash_strobe_set(struct led_classdev_flash *f=
led_cdev,
>> +                       bool state)
>> +{
>> +    struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cdev)=
;
>> +    struct rt5033_led *led =3D sub_led_to_led(sub_led);
>> +    enum rt5033_fled fled_id =3D sub_led->fled_id;
>> +    unsigned int val;
>=20
> mutex_lock is missing here.
>=20

Oh, I missed.
Thanks.

>> +
>> +    regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION2,
>> +               RT5033_FLED_FUNC2_MASK, 0x0);
>> +    if (state) {
>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_STROBE_C=
TRL2,
>> +                   RT5033_FLED_STRBCTRL2_MASK,
>> +                   sub_led->flash_timeout);
>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_STROBE_CTRL=
1,
>> +                   RT5033_FLED_STRBCTRL1_MASK,
>> +                   sub_led->flash_brightness);
>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
>> +                   RT5033_FLED_FUNC1_MASK,
>> +                   RT5033_FLED_PINCTRL | RT5033_FLED_STRB_SEL |
>> +                   rt5033_fled_used(led, fled_id));
>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION=
2,
>> +                   RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED
>> +                   | RT5033_FLED_SREG_STRB);
>> +
>> +        regmap_read(led->regmap, RT5033_REG_FLED_FUNCTION1, &val);
>> +    }
>> +
>> +    fled_cdev->led_cdev.brightness =3D LED_OFF;
>> +
>> +    mutex_unlock(&led->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct led_flash_ops flash_ops =3D {
>> +    .flash_brightness_set =3D rt5033_led_flash_brightness_set,
>> +    .strobe_set =3D rt5033_led_flash_strobe_set,
>> +    .timeout_set =3D rt5033_led_flash_timeout_set,
>> +};
>> +
>> +static void rt5033_init_flash_properties(struct rt5033_sub_led *sub=
_led,
>> +                     struct rt5033_led_config_data *led_cfg)
>> +{
>> +    struct led_classdev_flash *fled_cdev =3D &sub_led->fled_cdev;
>> +    struct rt5033_led *led =3D sub_led_to_led(sub_led);
>> +    struct led_flash_setting *tm_set, *fl_set;
>> +    enum rt5033_fled fled_id =3D sub_led->fled_id;
>> +
>> +    tm_set =3D &fled_cdev->timeout;
>> +    tm_set->min =3D RT5033_LED_FLASH_TIMEOUT_MIN;
>> +    tm_set->max =3D led_cfg->flash_max_timeout[fled_id];
>> +    tm_set->step =3D RT5033_LED_FLASH_TIMEOUT_STEP;
>> +    tm_set->val =3D tm_set->max;
>> +
>> +    fl_set =3D &fled_cdev->brightness;
>> +    fl_set->min =3D RT5033_LED_FLASH_BRIGHTNESS_MIN;
>> +    if (led->iout_joint)
>> +        fl_set->max =3D MIN(led_cfg->flash_max_microamp[FLED1] +
>> +                  led_cfg->flash_max_microamp[FLED2],
>> +                  RT5033_LED_FLASH_BRIGHTNESS_MAX_2CH);
>> +    else
>> +        fl_set->max =3D MIN(led_cfg->flash_max_microamp[fled_id],
>> +                  RT5033_LED_FLASH_BRIGHTNESS_MAX_1CH);
>> +    fl_set->step =3D RT5033_LED_FLASH_BRIGHTNESS_STEP;
>> +    fl_set->val =3D fl_set->max;
>> +}
>> +
>> +static void rt5033_led_init_fled_cdev(struct rt5033_sub_led *sub_le=
d,
>> +                      struct rt5033_led_config_data *led_cfg)
>> +{
>> +    struct led_classdev_flash *fled_cdev;
>> +    struct led_classdev *led_cdev;
>> +    enum rt5033_fled fled_id =3D sub_led->fled_id;
>> +    u32 flash_tm_offset, flash_brightness_offset;
>> +
>> +    /* Initialize LED Flash class device */
>> +    fled_cdev =3D &sub_led->fled_cdev;
>> +    fled_cdev->ops =3D &flash_ops;
>> +    led_cdev =3D &fled_cdev->led_cdev;
>> +
>> +    led_cdev->name =3D led_cfg->label[fled_id];
>> +
>> +    led_cdev->brightness_set =3D rt5033_led_brightness_set;
>> +    led_cdev->brightness_set_sync =3D rt5033_led_brightness_set_syn=
c;
>> +    led_cdev->max_brightness =3D RT5033_LED_CONFIG_DATA_OFFSET(
>> +                   led_cfg->torch_max_microamp[fled_id],
>> +                   RT5033_LED_TORCH_BRIGHTNESS_STEP,
>> +                   RT5033_LED_TORCH_BRIGHTNESS_MIN);
>> +
>> +    led_cdev->flags |=3D LED_DEV_CAP_FLASH;
>> +    INIT_WORK(&sub_led->work_brightness_set,
>> +          rt5033_led_brightness_set_work);
>=20
> Please rebase your code on top of LED tree devel branch:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds=
=2Egit
>=20
> Those LED core changes will be applied to the for-next branch
> in the beginning of the next week, and they'll allow to get rid of
> work queues and brightness_set_sync ops from drivers. Please refer
> to the patches that remove related code from leds-max77693.c to
> find out how to adapt your driver to benefit from LED core
> optimizations.
>=20
>=20

Okay, I'll see a patch above and fix it.
Thanks

>> +    rt5033_init_flash_properties(sub_led, led_cfg);
>> +
>> +    flash_tm_offset =3D RT5033_LED_CONFIG_DATA_OFFSET(fled_cdev->ti=
meout.val,
>> +                            fled_cdev->timeout.step,
>> +                            fled_cdev->timeout.min);
>> +    flash_brightness_offset =3D
>> +        RT5033_LED_CONFIG_DATA_OFFSET(fled_cdev->brightness.val,
>> +                          fled_cdev->brightness.step,
>> +                          fled_cdev->brightness.min);
>> +
>> +    sub_led->flash_timeout =3D flash_tm_offset;
>> +    sub_led->flash_brightness =3D flash_brightness_offset;
>> +}
>> +
>> +static int rt5033_led_parse_dt(struct rt5033_led *led, struct devic=
e *dev,
>> +                   struct rt5033_led_config_data *cfg,
>> +                   struct device_node **sub_nodes)
>> +{
>> +    struct device_node *np =3D dev->of_node;
>> +    struct device_node *child_node;
>> +    struct rt5033_sub_led *sub_leds =3D led->sub_leds;
>> +    struct property *prop;
>> +    u32 led_sources[2];
>> +    enum rt5033_fled fled_id;
>> +    int i, ret;
>> +
>> +    if (!np)
>> +        return -ENXIO;
>=20
> Probe has been called, so dev->of_node must have been present.
> Please remove above guard.
>=20

Right, dev->of_node is checked before.
Thanks.=20

>> +    for_each_available_child_of_node(np, child_node) {
>> +        prop =3D of_find_property(child_node, "led-sources", NULL);
>> +        if (prop) {
>> +            const u32 *srcs =3D NULL;
>=20
> This should be:
>=20
> const __be32 *srcs =3D NULL;
>=20
> sparse tool detects this type of problems [1].
>=20

Oh, I see. I didn't know about that.
Thanks.

>> +
>> +            for (i =3D 0; i < ARRAY_SIZE(led_sources); ++i) {
>> +                srcs =3D of_prop_next_u32(prop, srcs,
>> +                            &led_sources[i]);
>> +                if (!srcs)
>> +                    break;
>> +            }
>> +        } else {
>> +            dev_err(dev, "led-sources DT property missing\n");
>> +            ret =3D -EINVAL;
>> +            goto err_parse_dt;
>> +        }
>> +
>> +        if (i =3D=3D 2) {
>> +            fled_id =3D FLED1;
>> +            led->fled_mask =3D FLED1_IOUT | FLED2_IOUT;
>> +        } else if (led_sources[0] =3D=3D FLED1) {
>> +            fled_id =3D FLED1;
>> +            led->fled_mask |=3D FLED1_IOUT;
>> +        } else if (led_sources[0] =3D=3D FLED2) {
>> +            fled_id =3D FLED2;
>> +            led->fled_mask |=3D FLED2_IOUT;
>> +        } else {
>> +            dev_err(dev, "Wrong led-sources DT property value.\n");
>> +            ret =3D -EINVAL;
>> +            goto err_parse_dt;
>> +        }
>> +
>> +        if (sub_nodes[fled_id]) {
>> +            dev_err(dev,
>> +                "Conflicting \"led-sources\" DT properties\n");
>> +            ret =3D -EINVAL;
>> +            goto err_parse_dt;
>> +        }
>> +
>> +        sub_nodes[fled_id] =3D child_node;
>> +        sub_leds[fled_id].fled_id =3D fled_id;
>> +
>> +        cfg->label[fled_id] =3D
>> +            of_get_property(child_node, "label", NULL) ? :
>> +                    child_node->name;
>> +
>> +        ret =3D of_property_read_u32(child_node, "led-max-microamp"=
,
>> +                       &cfg->torch_max_microamp[fled_id]);
>> +        if (ret) {
>> +            dev_err(dev, "failed to parse led-max-microamp\n");
>> +            goto err_parse_dt;
>> +        }
>> +
>> +        ret =3D of_property_read_u32(child_node, "flash-max-microam=
p",
>> +                       &cfg->flash_max_microamp[fled_id]);
>> +        if (ret) {
>> +            dev_err(dev, "failed to parse flash-max-microamp\n");
>> +            goto err_parse_dt;
>> +        }
>> +
>> +        ret =3D of_property_read_u32(child_node, "flash-max-timeout=
-us",
>> +                       &cfg->flash_max_timeout[fled_id]);
>> +        if (ret) {
>> +            dev_err(dev, "failed to parse flash-max-timeout-us\n");
>> +            goto err_parse_dt;
>> +        }
>> +
>> +        if (++cfg->num_leds =3D=3D 2 ||
>> +            (rt5033_fled_used(led, FLED1) &&
>> +             rt5033_fled_used(led, FLED2))) {
>> +            of_node_put(child_node);
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (cfg->num_leds =3D=3D 0) {
>> +        dev_err(dev, "No DT child node found for connected LED(s).\=
n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +
>> +err_parse_dt:
>> +    of_node_put(child_node);
>> +    return ret;
>> +}
>> +
>> +static int rt5033_led_probe(struct platform_device *pdev)
>> +{
>> +    struct rt5033_dev *rt5033 =3D dev_get_drvdata(pdev->dev.parent)=
;
>> +    struct rt5033_led *led;
>> +    struct rt5033_sub_led *sub_leds;
>> +    struct device_node *sub_nodes[2] =3D {};
>> +    struct rt5033_led_config_data led_cfg =3D {};
>> +    int init_fled_cdev[2], i, ret;
>> +
>> +    led =3D devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
>> +    if (!led)
>> +        return -ENOMEM;
>> +
>> +    platform_set_drvdata(pdev, led);
>> +    led->dev =3D &pdev->dev;
>> +    led->regmap =3D rt5033->regmap;
>> +    sub_leds =3D led->sub_leds;
>> +
>> +    ret =3D rt5033_led_parse_dt(led, &pdev->dev, &led_cfg, sub_node=
s);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (led_cfg.num_leds =3D=3D 1 && rt5033_fled_used(led, FLED1) &=
&
>> +        rt5033_fled_used(led, FLED2))
>> +        led->iout_joint =3D true;
>> +
>> +    mutex_init(&led->lock);
>> +
>> +    init_fled_cdev[FLED1] =3D
>> +            led->iout_joint || rt5033_fled_used(led, FLED1);
>> +    init_fled_cdev[FLED2] =3D
>> +            !led->iout_joint && rt5033_fled_used(led, FLED2);
>> +
>> +    for (i =3D FLED1; i <=3D FLED2; ++i) {
>> +        if (!init_fled_cdev[i])
>> +            continue;
>> +
>> +        rt5033_led_init_fled_cdev(&sub_leds[i], &led_cfg);
>> +        ret =3D led_classdev_flash_register(led->dev,
>> +                          &sub_leds[i].fled_cdev);
>> +        if (ret < 0) {
>> +            if (i =3D=3D FLED2)
>> +                goto err_register_led2;
>> +            else
>> +                goto err_register_led1;
>> +        }
>> +    }
>> +
>> +    regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION1,
>> +               RT5033_FLED_FUNC1_MASK, RT5033_FLED_RESET);
>> +
>> +    return 0;
>> +
>> +err_register_led2:
>> +    led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
>> +err_register_led1:
>> +    mutex_destroy(&led->lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static int rt5033_led_remove(struct platform_device *pdev)
>> +{
>> +    struct rt5033_led *led =3D platform_get_drvdata(pdev);
>> +    struct rt5033_sub_led *sub_leds =3D led->sub_leds;
>> +
>> +    if (led->iout_joint || rt5033_fled_used(led, FLED1)) {
>> +        led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
>> +        cancel_work_sync(&sub_leds[FLED1].work_brightness_set);
>> +    }
>> +
>> +    if (!led->iout_joint && rt5033_fled_used(led, FLED2)) {
>> +        led_classdev_flash_unregister(&sub_leds[FLED2].fled_cdev);
>> +        cancel_work_sync(&sub_leds[FLED2].work_brightness_set);
>> +    }
>> +
>> +    mutex_destroy(&led->lock);
>> +
>> +    return 0;
>> +}
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
>> index 1b63fc2..b20c7e4 100644
>> --- a/include/linux/mfd/rt5033-private.h
>> +++ b/include/linux/mfd/rt5033-private.h
>> @@ -93,6 +93,57 @@ enum rt5033_reg {
>>   #define RT5033_RT_CTRL1_UUG_MASK    0x02
>>   #define RT5033_RT_HZ_MASK        0x01
>>
>> +/* RT5033 FLED Function1 register */
>> +#define RT5033_FLED_FUNC1_MASK        0x97
>> +#define RT5033_FLED_EN_LEDCS1        0x01
>> +#define RT5033_FLED_EN_LEDCS2        0x02
>> +#define RT5033_FLED_STRB_SEL        0x04
>> +#define RT5033_FLED_PINCTRL        0x10
>> +#define RT5033_FLED_RESET        0x80
>> +
>> +/* RT5033 FLED Function2 register */
>> +#define RT5033_FLED_FUNC2_MASK        0x81
>> +#define RT5033_FLED_ENFLED        0x01
>> +#define RT5033_FLED_SREG_STRB        0x80
>> +
>> +/* RT5033 FLED Strobe Control1 */
>> +#define RT5033_FLED_STRBCTRL1_MASK        0xFF
>> +#define RT5033_FLED_STRBCTRL1_TM_CUR_MAX    0xE0
>> +#define RT5033_FLED_STRBCTRL1_FL_CUR_DEF    0x0D
>> +#define RT5033_FLED_STRBCTRL1_FL_CUR_MAX    0x1F
>> +
>> +/* RT5033 FLED Strobe Control2 */
>> +#define RT5033_FLED_STRBCTRL2_MASK    0x3F
>> +#define RT5033_FLED_STRBCTRL2_TM_DEF    0x0F
>> +#define RT5033_FLED_STRBCTRL2_TM_MAX    0x3F
>> +
>> +/* RT5033 FLED Control1 */
>> +#define RT5033_FLED_CTRL1_MASK        0xF7
>> +#define RT5033_FLED_CTRL1_TORCH_CUR_DEF    0x20
>> +#define RT5033_FLED_CTRL1_TORCH_CUR_MAX    0xF0
>> +#define RT5033_FLED_CTRL1_LBP_DEF    0x02
>> +#define RT5033_FLED_CTRL1_LBP_MAX    0x07
>> +
>> +/* RT5033 FLED Control2 */
>> +#define RT5033_FLED_CTRL2_MASK        0xFF
>> +#define RT5033_FLED_CTRL2_VMID_DEF    0x37
>> +#define RT5033_FLED_CTRL2_VMID_MAX    0x3F
>> +#define RT5033_FLED_CTRL2_TRACK_ALIVE    0x40
>> +#define RT5033_FLED_CTRL2_MID_TRACK    0x80
>> +
>> +/* RT5033 FLED Control4 */
>> +#define RT5033_FLED_CTRL4_MASK        0xE0
>> +#define RT5033_FLED_CTRL4_RESV        0x14
>> +#define RT5033_FLED_CTRL4_VTRREG_DEF    0x40
>> +#define RT5033_FLED_CTRL4_VTRREG_MAX    0x60
>> +#define RT5033_FLED_CTRL4_TRACK_CLK    0x80
>> +
>> +/* RT5033 FLED Control5 */
>> +#define RT5033_FLED_CTRL5_MASK        0xC0
>> +#define RT5033_FLED_CTRL5_RESV        0x10
>> +#define RT5033_FLED_CTRL5_TA_GOOD    0x40
>> +#define RT5033_FLED_CTRL5_TA_EXIST    0x80
>> +
>>   /* RT5033 control register */
>>   #define RT5033_CTRL_FCCM_BUCK_MASK        0x00
>>   #define RT5033_CTRL_BUCKOMS_MASK        0x01
>>
>=20
> [1] Documentation/sparse.txt
>=20
