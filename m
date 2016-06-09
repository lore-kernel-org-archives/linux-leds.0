From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Re: [PATCH v3 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Thu, 9 Jun 2016 16:20:07 +0100
Message-ID: <57598927.6060207@daqri.com>
References: <1465469168-6286-1-git-send-email-tony.makkiel@daqri.com>
 <57595CE5.70905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:36529 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932075AbcFIPUN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jun 2016 11:20:13 -0400
Received: by mail-wm0-f50.google.com with SMTP id n184so230267076wmn.1
        for <linux-leds@vger.kernel.org>; Thu, 09 Jun 2016 08:20:12 -0700 (PDT)
In-Reply-To: <57595CE5.70905@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org



On 09/06/16 13:11, Jacek Anaszewski wrote:
> Hi Tony,
> 
> Thanks for the updated patch. I have some comments in the code below.
> 
> On 06/09/2016 12:46 PM, Tony Makkiel wrote:
>> The chip can drive 2 sets of RGB leds. Controller can
>> be controlled via PWM, I2C and audio synchronisation.
>> This driver uses I2C to communicate with the chip.
>>
>> Datasheet: http://www.ti.com/lit/gpn/lp3952
>>
>> Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
>> ---
>>   drivers/leds/Kconfig        |  12 ++
>>   drivers/leds/Makefile       |   1 +
>>   drivers/leds/leds-lp3952.c  | 359 ++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/leds-lp3952.h |  75 +++++++++
>>   4 files changed, 447 insertions(+)
>>   create mode 100644 drivers/leds/leds-lp3952.c
>>   create mode 100644 include/linux/leds-lp3952.h
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 5ae2834..305faf9 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -228,6 +228,18 @@ config LEDS_LP3944
>>         To compile this driver as a module, choose M here: the
>>         module will be called leds-lp3944.
>>
>> +config LEDS_LP3952
>> +    tristate "LED Support for TI LP3952 2 channel LED driver"
>> +    depends on LEDS_CLASS
>> +    depends on I2C
>> +    select REGMAP_I2C
>> +    help
>> +      This option enables support for LEDs connected to the Texas
>> +      Instruments LP3952 LED driver.
>> +
>> +      To compile this driver as a module, choose M here: the
>> +      module will be called leds-lp3952.
>> +
>>   config LEDS_LP55XX_COMMON
>>       tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>       depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index cb2013d..0684c86 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -26,6 +26,7 @@ obj-$(CONFIG_LEDS_PCA9532)        += leds-pca9532.o
>>   obj-$(CONFIG_LEDS_GPIO_REGISTER)    += leds-gpio-register.o
>>   obj-$(CONFIG_LEDS_GPIO)            += leds-gpio.o
>>   obj-$(CONFIG_LEDS_LP3944)        += leds-lp3944.o
>> +obj-$(CONFIG_LEDS_LP3952)        += leds-lp3952.o
>>   obj-$(CONFIG_LEDS_LP55XX_COMMON)    += leds-lp55xx-common.o
>>   obj-$(CONFIG_LEDS_LP5521)        += leds-lp5521.o
>>   obj-$(CONFIG_LEDS_LP5523)        += leds-lp5523.o
>> diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
>> new file mode 100644
>> index 0000000..a621bda
>> --- /dev/null
>> +++ b/drivers/leds/leds-lp3952.c
>> @@ -0,0 +1,359 @@
>> +/*
>> + * Copyright (c) 2016, DAQRI, LLC.
>> + *
>> + * License Terms: GNU General Public License v2
> 
> You didn't address my remarks regarding GPL license
> boilerplate. Is it intentional?
> 

Sorry, I couldn't find the comment on license 
boiler plate. Can you please remind me what I missed?

>> + *
>> + * leds-lp3952 - LED class driver for TI lp3952 controller
>> + *
>> + * Based on:
>> + * leds-tlc9516 - LED class driver for TLC95XX series
>> + * of I2C driven LED controllers from NXP
>> + *
>> + * Derived from leds-atmel-pwm, leds-bd2802 and initial PWM led 3952
>> + * driver written by Alex Feinman
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio.h>
>> +#include <linux/i2c.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/leds.h>
>> +#include <linux/leds-lp3952.h>
>> +#include <linux/module.h>
>> +#include <linux/notifier.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/reboot.h>
>> +#include <linux/regmap.h>
>> +
>> +#define LP3952_REG_LED_CTRL                 0x00
>> +#define LP3952_REG_R1_BLNK_TIME_CTRL        0x01
>> +#define LP3952_REG_R1_BLNK_CYCLE_CTRL       0x02
>> +#define LP3952_REG_G1_BLNK_TIME_CTRL        0x03
>> +#define LP3952_REG_G1_BLNK_CYCLE_CTRL       0x04
>> +#define LP3952_REG_B1_BLNK_TIME_CTRL        0x05
>> +#define LP3952_REG_B1_BLNK_CYCLE_CTRL       0x06
>> +#define LP3952_REG_ENABLES                  0x0B
>> +#define LP3952_REG_PAT_GEN_CTRL             0x11
>> +#define LP3952_REG_RGB1_MAX_I_CTRL          0x12
>> +#define LP3952_REG_RGB2_MAX_I_CTRL          0x13
>> +#define LP3952_REG_CMD_0                    0x50
>> +#define LP3952_REG_RESET                    0x60
>> +
>> +#define REG_MAX                 LP3952_REG_RESET
>> +
>> +
>> +#define LP3952_PATRN_LOOP                 BIT(1)
>> +#define LP3952_PATRN_GEN_EN               BIT(2)
>> +#define LP3952_ACTIVE_MODE                BIT(6)
>> +#define LP3952_RGB_SEL_MASK    (BIT(0) | BIT(1))
> 
> #define LP3952_RGB_SEL_MASK                    0x03
> 
>> +#define LP3952_LED_MASK_ALL                 0x3f
> 
> Please put all the macro values in the same column. 
Will do
>
> Even though you don't use all features of the device, it is a good
> practice to provide definitions for all bits and in all registers.
> 
> Also, since you are providing header file, please move all macro
> definitions and structures there.
will do.
>
>> +
>> +struct lp3952_ctrl_hdl {
>> +    struct led_classdev cdev;
>> +    char name[15];
>> +    enum lp3952_leds channel;
>> +    void *priv;
>> +};
>> +
>> +struct ptrn_gen_cmd {
>> +    union {
>> +        struct {
>> +            u16 tt:3;
>> +            u16 b:3;
>> +            u16 cet:4;
>> +            u16 g:3;
>> +            u16 r:3;
>> +        };
>> +        struct {
>> +            u8 lsb;
>> +            u8 msb;
>> +        } bytes;
>> +    };
>> +} __packed;
>> +
>> +struct lp3952_led_array {
>> +    u8 ndev;
>> +    struct regmap *regmap;
>> +    struct i2c_client *client;
>> +    struct gpio_desc *enable_gpio;
>> +    struct ptrn_gen_cmd pgm[LP3952_CMD_REG_COUNT];
>> +    struct lp3952_ctrl_hdl *leds;
>> +};
>> +
>> +int lp3952_register_write(struct i2c_client *client, u8 reg, u8 val)
>> +{
>> +    int ret;
>> +    struct lp3952_led_array *priv = i2c_get_clientdata(client);
>> +
>> +    ret = regmap_write(priv->regmap, reg, val);
>> +
>> +    if (ret)
>> +        dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
>> +            __func__, reg, val, ret);
>> +    return ret;
>> +}
>> +
>> +static void lp3952_on_off(struct lp3952_led_array *priv,
>> +              enum lp3952_leds led_id, int on)
>> +{
>> +    int ret, val;
>> +
>> +    dev_dbg(&priv->client->dev, "%s LED %d to %d\n", __func__, led_id, on);
>> +
>> +    val = 1 << led_id;
>> +    if (led_id == LP3952_LED_ALL)
>> +        val = LP3952_LED_MASK_ALL;
>> +
>> +    ret = regmap_update_bits(priv->regmap, LP3952_REG_LED_CTRL, val,
>> +                 on ? val : 0);
>> +    if (ret)
>> +        dev_err(&priv->client->dev, "%s, Error %d\n", __func__, ret);
>> +}
>> +
>> +/*
>> + * Using Imax to control brightness. There are 4 possible
>> + * setting 25, 50, 75 and 100 % of Imax. Possible values are
>> + * values 0-4. 0 meaning turn off.
>> + */
>> +static int lp3952_set_brightness(struct led_classdev *cdev,
>> +                 enum led_brightness value)
>> +{
>> +    unsigned int reg, shift_val;
>> +    struct lp3952_ctrl_hdl *led = container_of(cdev,
>> +                           struct lp3952_ctrl_hdl,
>> +                           cdev);
>> +    struct lp3952_led_array *priv = (struct lp3952_led_array *)led->priv;
>> +
>> +    dev_dbg(cdev->dev, "Brightness request: %d on %d\n", value,
>> +        led->channel);
>> +
>> +    if (value == LED_OFF) {
>> +        lp3952_on_off(priv, led->channel, LED_OFF);
>> +        return 0;
>> +    }
>> +
>> +    if (led->channel > LP3952_RED_1) {
>> +        dev_err(cdev->dev, " %s Invalid LED requested", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (led->channel >= LP3952_BLUE_1) {
>> +        reg = LP3952_REG_RGB1_MAX_I_CTRL;
>> +        shift_val = (led->channel - LP3952_BLUE_1) * 2;
>> +    } else {
>> +        reg = LP3952_REG_RGB2_MAX_I_CTRL;
>> +        shift_val = led->channel * 2;
>> +    }
>> +
>> +    /* Enable the LED in case it is not enabled already */
>> +    lp3952_on_off(priv, led->channel, 1);
>> +
>> +    return (regmap_update_bits(priv->regmap, reg, 3 << shift_val,
>> +                   --value << shift_val));
>> +}
>> +
>> +static int lp3952_register_led_classdev(struct lp3952_led_array *priv)
>> +{
>> +    int i, ret = -ENODEV;
>> +    const char *led_name[] = {
>> +        "lp3952:blue2",
>> +        "lp3952:green2",
>> +        "lp3952:red2",
>> +        "lp3952:blue1",
>> +        "lp3952:green1",
>> +        "lp3952:red1"
>> +    };
>> +
>> +    for (i = 0; i < priv->ndev; i++) {
>> +        sprintf(priv->leds[i].name, "%s", led_name[i]);
>> +        priv->leds[i].cdev.name = priv->leds[i].name;
>> +        priv->leds[i].cdev.brightness = LED_OFF;
>> +        priv->leds[i].cdev.max_brightness = LP3952_BRIGHT_MAX;
>> +        priv->leds[i].cdev.brightness_set_blocking =
>> +                lp3952_set_brightness;
>> +        priv->leds[i].channel = i;
>> +        priv->leds[i].priv = priv;
>> +
>> +        ret = devm_led_classdev_register(&priv->client->dev,
>> +                         &priv->leds[i].cdev);
>> +        if (ret < 0) {
>> +            dev_err(&priv->client->dev,
>> +                "couldn't register LED %s\n",
>> +                priv->leds[i].cdev.name);
>> +            break;
>> +        }
>> +    }
>> +    return ret;
>> +}
>> +
>> +static int lp3952_set_pattern_gen_cmd(struct lp3952_led_array *priv,
>> +                      u8 cmd_index, u8 r, u8 g, u8 b,
>> +                      enum lp3952_tt tt, enum lp3952_cet cet)
>> +{
>> +    int ret;
>> +    struct ptrn_gen_cmd line = {
>> +        .r = r,
>> +        .g = g,
>> +        .b = b,
>> +        .cet = cet,
>> +        .tt = tt
>> +    };
>> +
>> +    if (cmd_index >= LP3952_CMD_REG_COUNT)
>> +        return -EINVAL;
>> +
>> +    priv->pgm[cmd_index] = line;
> 
> Why actually do you need pgm array? It is accessed only here during
> assignment.

The chip can support upto 8 commands. We are using only 1 command (Chip maintains
settings of last command). But if somebody in the future wants to utilize the 
whole 8 command sets (say to, have custom lighting effects), they 
can program so using the pgm array(with this function). But for normal operation 
just 1 array/command would do.

> 
>> +    ret = lp3952_register_write(priv->client,
>> +                    LP3952_REG_CMD_0 + cmd_index * 2,
>> +
>> +                    line.bytes.msb);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return (lp3952_register_write(priv->client,
>> +                      LP3952_REG_CMD_0 + cmd_index * 2 + 1,
>> +                      line.bytes.lsb));
>> +}
>> +
>> +static int lp3952_configure(struct lp3952_led_array *priv)
>> +{
>> +    int ret;
>> +
>> +    /* Disable any LEDs on from any previous conf. */
>> +    ret = lp3952_register_write(priv->client, LP3952_REG_LED_CTRL, 0);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* enable rgb patter, loop */
>> +    ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
>> +                    LP3952_PATRN_LOOP | LP3952_PATRN_GEN_EN);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Update Bit 6 (Active mode), Select both Led sets, Bit [1:0] */
>> +    ret = regmap_update_bits(priv->regmap, LP3952_REG_ENABLES,
>> +                 LP3952_ACTIVE_MODE | LP3952_RGB_SEL_MASK,
>> +                 LP3952_ACTIVE_MODE);
> 
> Why LP3952_ACTIVE_MODE | LP3952_RGB_SEL_MASK? Mask argument should
> match the bit field to be overwritten with the new value.

We have to make sure 3 bits have specific values.

Bit 6(LP3952_ACTIVE_MODE) needs to be high.
Bit [1:0] decides which leds needs to be controlled. It needs to be set
0 for both LED sets to follow Pattern gen. 

> 
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Set Cmd1 for RGB intensity,cmd and transition time */
>> +    return (lp3952_set_pattern_gen_cmd(priv, 0, I46, I71, I100, TT0,
>> +                       CET197));
>> +}
> 
> Could you explain please, why the pattern has to be set while only
> fixed brightness setting is supported by the driver?
> 
Note we are only setting Command 1 as mentioned in my comment above.
Pattern gen loops on this command. This command sets the intensity 
and transition times. Without setting this register, the LEDs do 
not turn on.

> Do you plan to add support for setting blinking patterns in the future?

Not sure, The driver works as it is for normal led operations.

This can be easily added using device_attribute with help of 
"lp3952_set_pattern_gen_cmd".

> 
>> +static const struct regmap_config lp3952_regmap = {
>> +    .reg_bits = 8,
>> +    .val_bits = 8,
>> +    .max_register = REG_MAX,
>> +};
> 
> You're not enabling regmap cache so regmap_update_bits(), will perform
> I2C readout each time. Is it intentional?
> 
Thank you for the pointer. I did not look into it. Did not expect 
lot of traffic unless there is software blink.
I will find out more about caching mechanism and add an 
appropriate cache type.

>> +static int lp3952_probe(struct i2c_client *client,
>> +            const struct i2c_device_id *id)
>> +{
>> +    int status;
>> +    struct lp3952_ctrl_hdl *leds;
>> +    struct lp3952_led_array *priv;
>> +
>> +    dev_dbg(&client->dev, "%s\n", __func__);
>> +
>> +    priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
>> +
>> +    priv->ndev = LP3952_LED_ALL;
>> +
>> +    leds = devm_kcalloc(&client->dev, priv->ndev, sizeof(*leds),
>> +                GFP_KERNEL);
>> +    if (!leds) {
>> +        devm_kfree(&client->dev, priv);
>> +        return -ENOMEM;
>> +    }
>> +    priv->leds = leds;
>> +    priv->client = client;
>> +    priv->enable_gpio = devm_gpiod_get(&client->dev, NULL, GPIOD_OUT_HIGH);
> 
> How the driver knows which GPIO should it acquire? You're passing NULL
> as the second argument.

In the ACPI asl file, there is only one GPIO associated for lp3952 node.

                    GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
                            IoRestrictionOutputOnly, "\\_SB.GPO2", 
                            0x00, ResourceConsumer, , )

> 
>> +    if (IS_ERR(priv->enable_gpio)) {
>> +        status = PTR_ERR(priv->enable_gpio);
>> +        dev_err(&client->dev, "Failed to enable gpio: %d\n", status);
>> +        return status;
>> +    }
>> +
>> +    priv->regmap = devm_regmap_init_i2c(client, &lp3952_regmap);
>> +    if (IS_ERR(priv->regmap)) {
>> +        int err = PTR_ERR(priv->regmap);
>> +
>> +        dev_err(&client->dev, "Failed to allocate register map: %d\n",
>> +            err);
>> +        return err;
>> +    }
>> +
>> +    i2c_set_clientdata(client, priv);
>> +
>> +    status = lp3952_configure(priv);
>> +    if (status) {
>> +        dev_err(&client->dev, "Probe failed. Device not found (%d)\n",
>> +            status);
>> +        return status;
>> +    }
>> +
>> +    status = lp3952_register_led_classdev(priv);
>> +    if (status) {
>> +        dev_err(&client->dev, "Unable to register led_classdev: %d\n",
>> +            status);
>> +        return status;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int lp3952_remove(struct i2c_client *client)
>> +{
>> +    struct lp3952_led_array *priv;
>> +
>> +    priv = i2c_get_clientdata(client);
>> +    lp3952_on_off(priv, LP3952_LED_ALL, 0);
>> +    gpiod_set_value(priv->enable_gpio, 0);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct i2c_device_id lp3952_id[] = {
>> +    {LP3952_NAME, 0},
>> +    {}
>> +};
>> +
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id lp3952_acpi_match[] = {
>> +    {LP3952_NAME, 0},
>> +    {}
>> +};
> 
> Could you please share how did you apply ACPI overlay?

I am using the initrd ACPI method of Octavian's patch.

https://lkml.org/lkml/2016/3/31/333

> 
>> +
>> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
>> +#endif
>> +
>> +static struct i2c_driver lp3952_i2c_driver = {
>> +    .driver = {
>> +           .name = LP3952_NAME,
>> +           .owner = THIS_MODULE,
>> +#ifdef CONFIG_ACPI
>> +           .acpi_match_table = ACPI_PTR(lp3952_acpi_match),
>> +#endif
>> +           },
>> +    .probe = lp3952_probe,
>> +    .remove = lp3952_remove,
>> +    .id_table = lp3952_id,
>> +};
>> +
>> +module_i2c_driver(lp3952_i2c_driver);
>> +
>> +MODULE_AUTHOR("Tony Makkiel <tony.makkiel@daqri.com>");
>> +MODULE_DESCRIPTION("lp3952 I2C LED controller driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/leds-lp3952.h b/include/linux/leds-lp3952.h
>> new file mode 100644
>> index 0000000..3ea120a
>> --- /dev/null
>> +++ b/include/linux/leds-lp3952.h
>> @@ -0,0 +1,75 @@
>> +/*
>> + * Copyright (C) 2016, DAQRI LLC
>> + *
>> + * License Terms: GPL v2
>> + *
>> + * TI lp3952 Controller driver
>> + *
>> + * Author: Tony Makkiel <tony.makkiel@daqri.com>
>> + *
>> + */
>> +
>> +#ifndef LEDS_LP3952_H_
>> +#define LEDS_LP3952_H_
>> +
>> +/* ACPI iasl compiler wont take name LP3952,
>> + * "ASL_MSG_HID_LENGTH". Hence the name TLP3952
>> + */
>> +#define LP3952_NAME             "TLP3952"
>> +#define LP3952_CMD_REG_COUNT            8
>> +#define LP3952_BRIGHT_MAX               4
>> +
>> +/* Transition Time in ms */
>> +enum lp3952_tt {
>> +    TT0,
>> +    TT55,
>> +    TT110,
>> +    TT221,
>> +    TT422,
>> +    TT885,
>> +    TT1770,
>> +    TT3539
>> +};
>> +
>> +/* Command Execution Time in ms */
>> +enum lp3952_cet {
>> +    CET197,
>> +    CET393,
>> +    CET590,
>> +    CET786,
>> +    CET1180,
>> +    CET1376,
>> +    CET1573,
>> +    CET1769,
>> +    CET1966,
>> +    CET2163,
>> +    CET2359,
>> +    CET2556,
>> +    CET2763,
>> +    CET2949,
>> +    CET3146
>> +};
>> +
>> +/* Max Current in % */
>> +enum lp3952_colour_I_log_0 {
>> +    I0,
>> +    I7,
>> +    I14,
>> +    I21,
>> +    I32,
>> +    I46,
>> +    I71,
>> +    I100
>> +};
>> +
>> +enum lp3952_leds {
>> +    LP3952_BLUE_2,
>> +    LP3952_GREEN_2,
>> +    LP3952_RED_2,
>> +    LP3952_BLUE_1,
>> +    LP3952_GREEN_1,
>> +    LP3952_RED_1,
>> +    LP3952_LED_ALL
>> +};
>> +
>> +#endif /* LEDS_LP3952_H_ */
>>
> 
> 
