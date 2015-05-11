From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v8 3/3] leds: Add ktd2692 flash LED driver
Date: Mon, 11 May 2015 11:24:19 +0900
Message-ID: <555012D3.2060206@samsung.com>
References: <1431054225-16635-1-git-send-email-ingi2.kim@samsung.com>
 <1431054225-16635-4-git-send-email-ingi2.kim@samsung.com>
 <554C74EB.8070905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35098 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751378AbbEKCYW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 10 May 2015 22:24:22 -0400
In-reply-to: <554C74EB.8070905@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Jacek,
Thanks for the review

I can improve this driver for your attention
I'm trying to rebase source code for merging it and resending soon.

Thank you

On 2015=EB=85=84 05=EC=9B=94 08=EC=9D=BC 17:33, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> Thanks for the update. It looks like we're almost there.
> I can see only two minor issues.
>=20
> On 05/08/2015 05:03 AM, Ingi Kim wrote:
>> This patch adds a driver to support the ktd2692 flash LEDs.
>> ktd2692 can control flash current by ExpressWire interface.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>> Reviewed-by: Varka Bhadram <varkabhadram@gmail.com>
>> ---
>>   drivers/leds/Kconfig        |   9 +
>>   drivers/leds/Makefile       |   1 +
>>   drivers/leds/leds-ktd2692.c | 443 ++++++++++++++++++++++++++++++++=
++++++++++++
>>   3 files changed, 453 insertions(+)
>>   create mode 100644 drivers/leds/leds-ktd2692.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 51059bb..bfbdbd1 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -505,6 +505,15 @@ config LEDS_MENF21BMC
>>         This driver can also be built as a module. If so the module
>>         will be called leds-menf21bmc.
>>
>> +config LEDS_KTD2692
>> +    tristate "KTD2692 LED flash support"
>=20
> Please keep the style of description in line with the existing
> drivers. How about:
>=20
> "LED support for KTD2692 flash LED controller"
>=20

Sure, I'll change it

>> +    depends on LEDS_CLASS_FLASH && GPIOLIB && OF
>> +    help
>> +      This option enables support for KTD2692 LED flash connected
>> +      through ExpressWire interface.
>> +
>> +      Say Y to enable this driver.
>> +
>>   comment "LED driver for blink(1) USB RGB LED is under Special HID =
drivers (HID_THINGM)"
>>
>>   config LEDS_BLINKM
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index a739ae2..ed5ed79 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -59,6 +59,7 @@ obj-$(CONFIG_LEDS_BLINKM)        +=3D leds-blinkm.=
o
>>   obj-$(CONFIG_LEDS_SYSCON)        +=3D leds-syscon.o
>>   obj-$(CONFIG_LEDS_VERSATILE)        +=3D leds-versatile.o
>>   obj-$(CONFIG_LEDS_MENF21BMC)        +=3D leds-menf21bmc.o
>> +obj-$(CONFIG_LEDS_KTD2692)        +=3D leds-ktd2692.o
>>
>>   # LED SPI Drivers
>>   obj-$(CONFIG_LEDS_DAC124S085)        +=3D leds-dac124s085.o
>> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692=
=2Ec
>> new file mode 100644
>> index 0000000..9d878a4
>> --- /dev/null
>> +++ b/drivers/leds/leds-ktd2692.c
>> @@ -0,0 +1,443 @@
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
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/led-class-flash.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/workqueue.h>
>> +
>> +/* Value related the movie mode */
>> +#define KTD2692_MOVIE_MODE_CURRENT_LEVELS    16
>> +#define KTD2692_MM_TO_FL_RATIO(x)        ((x) / 3)
>> +#define KTD2962_MM_MIN_CURR_THRESHOLD_SCALE    8
>> +
>> +/* Value related the flash mode */
>> +#define KTD2692_FLASH_MODE_TIMEOUT_LEVELS    8
>> +#define KTD2692_FLASH_MODE_TIMEOUT_DISABLE    0
>> +#define KTD2692_FLASH_MODE_CURR_PERCENT(x)    (((x) * 16) / 100)
>> +
>> +/* Macro for getting offset of flash timeout */
>> +#define GET_TIMEOUT_OFFSET(timeout, step)    ((timeout) / (step))
>> +
>> +/* Base register address */
>> +#define KTD2692_REG_LVP_BASE            0x00
>> +#define KTD2692_REG_FLASH_TIMEOUT_BASE        0x20
>> +#define KTD2692_REG_MM_MIN_CURR_THRESHOLD_BASE    0x40
>> +#define KTD2692_REG_MOVIE_CURRENT_BASE        0x60
>> +#define KTD2692_REG_FLASH_CURRENT_BASE        0x80
>> +#define KTD2692_REG_MODE_BASE            0xA0
>> +
>> +/* Set bit coding time for expresswire interface */
>> +#define KTD2692_TIME_RESET_US            700
>> +#define KTD2692_TIME_DATA_START_TIME_US        10
>> +#define KTD2692_TIME_HIGH_END_OF_DATA_US    350
>> +#define KTD2692_TIME_LOW_END_OF_DATA_US        10
>> +#define KTD2692_TIME_SHORT_BITSET_US        4
>> +#define KTD2692_TIME_LONG_BITSET_US        12
>> +
>> +/* KTD2692 default length of name */
>> +#define KTD2692_NAME_LENGTH            20
>> +
>> +enum ktd2692_bitset {
>> +    KTD2692_LOW =3D 0,
>> +    KTD2692_HIGH,
>> +};
>> +
>> +/* Movie / Flash Mode Control */
>> +enum ktd2692_led_mode {
>> +    KTD2692_MODE_DISABLE =3D 0,    /* default */
>> +    KTD2692_MODE_MOVIE,
>> +    KTD2692_MODE_FLASH,
>> +};
>> +
>> +struct ktd2692_led_config_data {
>> +    /* maximum LED current in movie mode */
>> +    u32 movie_max_microamp;
>> +    /* maximum LED current in flash mode */
>> +    u32 flash_max_microamp;
>> +    /* maximum flash timeout */
>> +    u32 flash_max_timeout;
>> +    /* max LED brightness level */
>> +    enum led_brightness max_brightness;
>> +};
>> +
>> +struct ktd2692_context {
>> +    /* Related LED Flash class device */
>> +    struct led_classdev_flash fled_cdev;
>> +
>> +    /* secures access to the device */
>> +    struct mutex lock;
>> +    struct regulator *regulator;
>> +    struct work_struct work_brightness_set;
>> +
>> +    struct gpio_desc *aux_gpio;
>> +    struct gpio_desc *ctrl_gpio;
>> +
>> +    enum ktd2692_led_mode mode;
>> +    enum led_brightness torch_brightness;
>> +};
>> +
>> +static struct ktd2692_context *fled_cdev_to_led(
>> +                struct led_classdev_flash *fled_cdev)
>> +{
>> +    return container_of(fled_cdev, struct ktd2692_context, fled_cde=
v);
>> +}
>> +
>> +static void ktd2692_expresswire_start(struct ktd2692_context *led)
>> +{
>> +    gpiod_direction_output(led->ctrl_gpio, KTD2692_HIGH);
>> +    udelay(KTD2692_TIME_DATA_START_TIME_US);
>> +}
>> +
>> +static void ktd2692_expresswire_reset(struct ktd2692_context *led)
>> +{
>> +    gpiod_direction_output(led->ctrl_gpio, KTD2692_LOW);
>> +    udelay(KTD2692_TIME_RESET_US);
>> +}
>> +
>> +static void ktd2692_expresswire_end(struct ktd2692_context *led)
>> +{
>> +    gpiod_direction_output(led->ctrl_gpio, KTD2692_LOW);
>> +    udelay(KTD2692_TIME_LOW_END_OF_DATA_US);
>> +    gpiod_direction_output(led->ctrl_gpio, KTD2692_HIGH);
>> +    udelay(KTD2692_TIME_HIGH_END_OF_DATA_US);
>> +}
>> +
>> +static void ktd2692_expresswire_set_bit(struct ktd2692_context *led=
, bool bit)
>> +{
>> +    /*
>> +     * The Low Bit(0) and High Bit(1) is based on a time detection
>> +     * algorithm between time low and time high
>> +     * Time_(L_LB) : Low time of the Low Bit(0)
>> +     * Time_(H_LB) : High time of the LOW Bit(0)
>> +     * Time_(L_HB) : Low time of the High Bit(1)
>> +     * Time_(H_HB) : High time of the High Bit(1)
>> +     *
>> +     * It can be simplified to:
>> +     * Low Bit(0) : 2 * Time_(H_LB) < Time_(L_LB)
>> +     * High Bit(1) : 2 * Time_(L_HB) < Time_(H_HB)
>> +     * HIGH  ___           ____    _..     _________    ___
>> +     *          |_________|    |_..  |____|         |__|
>> +     * LOW        <L_LB>  <H_LB>     <L_HB>  <H_HB>
>> +     *          [  Low Bit (0) ]     [  High Bit(1) ]
>> +     */
>> +    if (bit) {
>> +        gpiod_direction_output(led->ctrl_gpio, KTD2692_LOW);
>> +        udelay(KTD2692_TIME_SHORT_BITSET_US);
>> +        gpiod_direction_output(led->ctrl_gpio, KTD2692_HIGH);
>> +        udelay(KTD2692_TIME_LONG_BITSET_US);
>> +    } else {
>> +        gpiod_direction_output(led->ctrl_gpio, KTD2692_LOW);
>> +        udelay(KTD2692_TIME_LONG_BITSET_US);
>> +        gpiod_direction_output(led->ctrl_gpio, KTD2692_HIGH);
>> +        udelay(KTD2692_TIME_SHORT_BITSET_US);
>> +    }
>> +}
>> +
>> +static void ktd2692_expresswire_write(struct ktd2692_context *led, =
u8 value)
>> +{
>> +    int i;
>> +
>> +    ktd2692_expresswire_start(led);
>> +    for (i =3D 7; i >=3D 0; i--)
>> +        ktd2692_expresswire_set_bit(led, value & BIT(i));
>> +    ktd2692_expresswire_end(led);
>> +}
>> +
>> +static void ktd2692_brightness_set(struct ktd2692_context *led,
>> +                   enum led_brightness brightness)
>> +{
>> +    mutex_lock(&led->lock);
>> +
>> +    if (brightness =3D=3D LED_OFF) {
>> +        led->mode =3D KTD2692_MODE_DISABLE;
>> +        gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
>> +    } else {
>> +        ktd2692_expresswire_write(led, brightness |
>> +                    KTD2692_REG_MOVIE_CURRENT_BASE);
>> +        led->mode =3D KTD2692_MODE_MOVIE;
>> +    }
>> +
>> +    ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BAS=
E);
>> +    mutex_unlock(&led->lock);
>> +}
>> +
>> +static void ktd2692_brightness_set_work(struct work_struct *work)
>> +{
>> +    struct ktd2692_context *led =3D
>> +        container_of(work, struct ktd2692_context, work_brightness_=
set);
>> +
>> +    ktd2692_brightness_set(led, led->torch_brightness);
>> +}
>> +
>> +static void ktd2692_led_brightness_set(struct led_classdev *led_cde=
v,
>> +                       enum led_brightness brightness)
>> +{
>> +    struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cd=
ev);
>> +    struct ktd2692_context *led =3D fled_cdev_to_led(fled_cdev);
>> +
>> +    led->torch_brightness =3D brightness;
>> +    schedule_work(&led->work_brightness_set);
>> +}
>> +
>> +static int ktd2692_led_brightness_set_sync(struct led_classdev *led=
_cdev,
>> +                       enum led_brightness brightness)
>> +{
>> +    struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cd=
ev);
>> +    struct ktd2692_context *led =3D fled_cdev_to_led(fled_cdev);
>> +
>> +    ktd2692_brightness_set(led, brightness);
>> +
>> +    return 0;
>> +}
>> +
>> +static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *=
fled_cdev,
>> +                    bool state)
>> +{
>> +    struct ktd2692_context *led =3D fled_cdev_to_led(fled_cdev);
>> +    struct led_flash_setting *timeout =3D &fled_cdev->timeout;
>> +    u32 flash_tm_reg;
>> +
>> +    mutex_lock(&led->lock);
>> +
>> +    if (state =3D=3D 0) {
>=20
> Coccinelle raises a warning here:
>=20
> drivers/leds/leds-ktd2692.c:217:5-10: WARNING: Comparison of bool to =
0/1
>=20
> I had to fix it also in my leds-aat1290 driver recently:)
>=20

Ok, I'll refer to your driver code
Thank you, so kindly :)

>> +        led->mode =3D KTD2692_MODE_DISABLE;
>> +        gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
>> +    } else {
>> +        flash_tm_reg =3D GET_TIMEOUT_OFFSET(timeout->val, timeout->=
step);
>> +        ktd2692_expresswire_write(led, flash_tm_reg
>> +                | KTD2692_REG_FLASH_TIMEOUT_BASE);
>> +
>> +        led->mode =3D KTD2692_MODE_FLASH;
>> +        gpiod_direction_output(led->aux_gpio, KTD2692_HIGH);
>> +    }
>> +
>> +    ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BAS=
E);
>> +
>> +    fled_cdev->led_cdev.brightness =3D LED_OFF;
>> +    led->mode =3D KTD2692_MODE_DISABLE;
>> +
>> +    mutex_unlock(&led->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static int ktd2692_led_flash_timeout_set(struct led_classdev_flash =
*fled_cdev,
>> +                     u32 timeout)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void ktd2692_init_movie_current_max(struct ktd2692_led_confi=
g_data *cfg)
>> +{
>> +    u32 offset, step;
>> +    u32 movie_current_microamp;
>> +
>> +    offset =3D KTD2692_MOVIE_MODE_CURRENT_LEVELS;
>> +    step =3D KTD2692_MM_TO_FL_RATIO(cfg->flash_max_microamp)
>> +        / KTD2692_MOVIE_MODE_CURRENT_LEVELS;
>> +
>> +    do {
>> +        movie_current_microamp =3D step * offset;
>> +        offset--;
>> +    } while ((movie_current_microamp > cfg->movie_max_microamp) &&
>> +        (offset > 0));
>> +
>> +    cfg->max_brightness =3D offset;
>> +}
>> +
>> +static void ktd2692_init_flash_timeout(struct led_classdev_flash *f=
led_cdev,
>> +                       struct ktd2692_led_config_data *cfg)
>> +{
>> +    struct led_flash_setting *setting;
>> +
>> +    setting =3D &fled_cdev->timeout;
>> +    setting->min =3D KTD2692_FLASH_MODE_TIMEOUT_DISABLE;
>> +    setting->max =3D cfg->flash_max_timeout;
>> +    setting->step =3D cfg->flash_max_timeout
>> +            / (KTD2692_FLASH_MODE_TIMEOUT_LEVELS - 1);
>> +    setting->val =3D cfg->flash_max_timeout;
>> +}
>> +
>> +static void ktd2692_setup(struct ktd2692_context *led)
>> +{
>> +    led->mode =3D KTD2692_MODE_DISABLE;
>> +    ktd2692_expresswire_reset(led);
>> +    gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
>> +
>> +    ktd2692_expresswire_write(led, (KTD2962_MM_MIN_CURR_THRESHOLD_S=
CALE - 1)
>> +                 | KTD2692_REG_MM_MIN_CURR_THRESHOLD_BASE);
>> +    ktd2692_expresswire_write(led, KTD2692_FLASH_MODE_CURR_PERCENT(=
45)
>> +                 | KTD2692_REG_FLASH_CURRENT_BASE);
>> +}
>> +
>> +static int ktd2692_parse_dt(struct ktd2692_context *led, struct dev=
ice *dev,
>> +                struct ktd2692_led_config_data *cfg)
>> +{
>> +    struct device_node *np =3D dev->of_node;
>> +    struct device_node *child_node;
>> +    int ret;
>> +
>> +    if (!dev->of_node)
>> +        return -ENXIO;
>> +
>> +    led->ctrl_gpio =3D devm_gpiod_get(dev, "ctrl");
>> +    if (IS_ERR(led->ctrl_gpio)) {
>> +        ret =3D PTR_ERR(led->ctrl_gpio);
>> +        dev_err(dev, "cannot get ctrl-gpio %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    led->aux_gpio =3D devm_gpiod_get(dev, "aux");
>> +    if (IS_ERR(led->aux_gpio)) {
>> +        ret =3D PTR_ERR(led->aux_gpio);
>> +        dev_err(dev, "cannot get aux-gpio %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    led->regulator =3D devm_regulator_get(dev, "vin");
>> +    if (IS_ERR(led->regulator))
>> +        led->regulator =3D NULL;
>> +
>> +    if (led->regulator) {
>> +        ret =3D regulator_enable(led->regulator);
>> +        if (ret)
>> +            dev_err(dev, "Failed to enable supply: %d\n", ret);
>> +    }
>> +
>> +    child_node =3D of_get_next_available_child(np, NULL);
>> +    if (!child_node) {
>> +        dev_err(dev, "No DT child node found for connected LED.\n")=
;
>> +        return -EINVAL;
>> +    }
>> +
>> +    led->fled_cdev.led_cdev.name =3D
>> +        of_get_property(child_node, "label", NULL) ? : child_node->=
name;
>> +
>> +    ret =3D of_property_read_u32(child_node, "led-max-microamp",
>> +                   &cfg->movie_max_microamp);
>> +    if (ret) {
>> +        dev_err(dev, "failed to parse led-max-microamp\n");
>> +        return ret;
>> +    }
>> +
>> +    ret =3D of_property_read_u32(child_node, "flash-max-microamp",
>> +                   &cfg->flash_max_microamp);
>> +    if (ret) {
>> +        dev_err(dev, "failed to parse flash-max-microamp\n");
>> +        return ret;
>> +    }
>> +
>> +    ret =3D of_property_read_u32(child_node, "flash-max-timeout-us"=
,
>> +                   &cfg->flash_max_timeout);
>> +    if (ret)
>> +        dev_err(dev, "failed to parse flash-max-timeout-us\n");
>> +
>> +    of_node_put(child_node);
>> +    return ret;
>> +}
>> +
>> +static const struct led_flash_ops flash_ops =3D {
>> +    .strobe_set =3D ktd2692_led_flash_strobe_set,
>> +    .timeout_set =3D ktd2692_led_flash_timeout_set,
>> +};
>> +
>> +static int ktd2692_probe(struct platform_device *pdev)
>> +{
>> +    struct ktd2692_context *led;
>> +    struct led_classdev *led_cdev;
>> +    struct led_classdev_flash *fled_cdev;
>> +    struct ktd2692_led_config_data led_cfg;
>> +    int ret;
>> +
>> +    led =3D devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
>> +    if (!led)
>> +        return -ENOMEM;
>> +
>> +    fled_cdev =3D &led->fled_cdev;
>> +    led_cdev =3D &fled_cdev->led_cdev;
>> +
>> +    ret =3D ktd2692_parse_dt(led, &pdev->dev, &led_cfg);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ktd2692_init_flash_timeout(fled_cdev, &led_cfg);
>> +    ktd2692_init_movie_current_max(&led_cfg);
>> +
>> +    fled_cdev->ops =3D &flash_ops;
>> +
>> +    led_cdev->max_brightness =3D led_cfg.max_brightness;
>> +    led_cdev->brightness_set =3D ktd2692_led_brightness_set;
>> +    led_cdev->brightness_set_sync =3D ktd2692_led_brightness_set_sy=
nc;
>> +    led_cdev->flags |=3D LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH=
;
>> +
>> +    mutex_init(&led->lock);
>> +    INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_wor=
k);
>> +
>> +    platform_set_drvdata(pdev, led);
>> +
>> +    ret =3D led_classdev_flash_register(&pdev->dev, fled_cdev);
>> +    if (ret) {
>> +        dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->na=
me);
>> +        mutex_destroy(&led->lock);
>> +        return ret;
>> +    }
>> +
>> +    ktd2692_setup(led);
>> +
>> +    return 0;
>> +}
>> +
>> +static int ktd2692_remove(struct platform_device *pdev)
>> +{
>> +    struct ktd2692_context *led =3D platform_get_drvdata(pdev);
>> +    int ret;
>> +
>> +    led_classdev_flash_unregister(&led->fled_cdev);
>> +    cancel_work_sync(&led->work_brightness_set);
>> +
>> +    if (led->regulator) {
>> +        ret =3D regulator_disable(led->regulator);
>> +        if (ret)
>> +            dev_err(&pdev->dev,
>> +                "Failed to disable supply: %d\n", ret);
>> +    }
>> +
>> +    mutex_destroy(&led->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id ktd2692_match[] =3D {
>> +    { .compatible =3D "kinetic,ktd2692", },
>> +    { /* sentinel */ },
>> +};
>> +
>> +static struct platform_driver ktd2692_driver =3D {
>> +    .driver =3D {
>> +        .name  =3D "ktd2692",
>> +        .of_match_table =3D ktd2692_match,
>> +    },
>> +    .probe  =3D ktd2692_probe,
>> +    .remove =3D ktd2692_remove,
>> +};
>> +
>> +module_platform_driver(ktd2692_driver);
>> +
>> +MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
>> +MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
>> +MODULE_LICENSE("GPL v2");
>>
>=20
>=20
