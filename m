From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Re: [PATCH v2 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Tue, 7 Jun 2016 13:50:06 +0100
Message-ID: <5756C2FE.1020204@daqri.com>
References: <1464967219-31689-1-git-send-email-tony.makkiel@daqri.com>
 <57568904.3030900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35872 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753412AbcFGMuK (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jun 2016 08:50:10 -0400
Received: by mail-wm0-f54.google.com with SMTP id n184so135648049wmn.1
        for <linux-leds@vger.kernel.org>; Tue, 07 Jun 2016 05:50:10 -0700 (PDT)
In-Reply-To: <57568904.3030900@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org



On 07/06/16 09:42, Jacek Anaszewski wrote:
> Hi Tony,
> 
> Thanks for the update. I have few more comments below.
> 
> On 06/03/2016 05:20 PM, Tony Makkiel wrote:
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
>>   drivers/leds/leds-lp3952.c  | 368 ++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/leds-lp3952.h |  83 ++++++++++
>>   4 files changed, 464 insertions(+)
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
>> index 0000000..abdf23a
>> --- /dev/null
>> +++ b/drivers/leds/leds-lp3952.c
>> @@ -0,0 +1,368 @@
>> +/*
>> + * Copyright (c) 2016, DAQRI, LLC.
>> + *
>> + * License Terms: GNU General Public License v2
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
>> +    u32 enable_gpio;
>> +    struct regmap *regmap;
>> +    struct i2c_client *client;
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
>> +static void lp3952_on_off(struct lp3952_led_array *priv, enum lp3952_leds led,
> 
> s/led/led_id/ ?
> 
>> +              int on)
>> +{
>> +    int ret, val;
>> +
>> +    dev_dbg(&priv->client->dev, "%s LED %d to %d\n", __func__, led, on);
>> +
>> +    val = 1 << led;
>> +    if (led == LP3952_LED_ALL)
>> +        val = 0x3f;
> 
> Please add macro definitions for bit fields instead of using numerical
> values directly.
> 
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
>> +    unsigned int reg, val, shift_val;
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
>> +    val = value - 1;
> 
> val is redundant. How about value-- instead?
>  
>> +    reg = LP3952_REG_RGB1_MAX_I_CTRL;
>> +    shift_val = (led->channel - LP3952_BLUE_1) * 2;
>> +
>> +    if (led->channel > LP3952_RED_1) {
>> +        dev_err(cdev->dev, " %s Invalid LED requested", __func__);
>> +        return -EINVAL;
>> +    } else if (led->channel < LP3952_BLUE_1) {
>> +        shift_val = led->channel * 2;
>> +        reg = LP3952_REG_RGB2_MAX_I_CTRL;
>> +    }
> 
> I'd rearrange this this way:
> 
> if (led->channel > LP3952_RED_1) {
>     dev_err(cdev->dev, " %s Invalid LED requested", __func__);
>     return -EINVAL;
> }
> 
> if (led->channel >= LP3952_BLUE_1) {
>     reg = LP3952_REG_RGB1_MAX_I_CTRL;
>     shift_val = (led->channel - LP3952_BLUE_1) * 2;
> } else
>     reg = LP3952_REG_RGB2_MAX_I_CTRL;
>     shift_val = led->channel * 2;
> }
> 
> Also you should control here "enable_gpio", i.e. when
> all LEDs are turned off, it should be asserted low and raised high
> otherwise.
Pulling the gpio low here could be a bad idea. The pin also act as a 
chip reset, which will revert all the registers to default values. 
So it might be better to toggle them only when the driver is 
loaded/removed.
> 
>> +    /* Enable the LED in case it is not enabled already */
>> +    lp3952_on_off(priv, led->channel, 1);
>> +
>> +    return (regmap_update_bits(priv->regmap, reg, 3 << shift_val,
>> +                   val << shift_val));
>> +}
>> +
>> +static int lp3952_register_led_classdev(struct lp3952_led_array *priv)
>> +{
>> +    int ret, i;
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
>> +            goto error;
>> +        }
>> +    }
>> +    return 0;
>> +
>> +error:
>> +    for (; i >= 0; i--)
>> +        devm_led_classdev_unregister(&priv->client->dev,
>> +                         &priv->leds[i].cdev);
> 
> Resources acquired with devm prefixed API are released on driver
> removal.
> 
>> +    return ret;
>> +}
>> +
>> +static void lp3952_unregister_led_classdev(struct lp3952_led_array *priv)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < priv->ndev; i++)
>> +        devm_led_classdev_unregister(&priv->client->dev,
>> +                         &priv->leds[i].cdev);
>> +}
> 
> This is also not needed.
> 
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
> 
> Empty line here please.
> 
>> +    if (cmd_index >= LP3952_CMD_REG_COUNT)
>> +        return -EINVAL;
>> +
>> +    priv->pgm[cmd_index] = line;
>> +    ret = lp3952_register_write(priv->client,
>> +                    LP3952_REG_CMD_0 + cmd_index * 2,
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
>> +                    0x06);
> 
> Please add bit field definitions and use them here,
> instead of 0x06 value. It makes code analysis easier.
I did not quite understand. Bit 1 enables pattern loop, Bit 2, enables 
pattern gen. Did you mean something like

value = 1 << 1 | 1 << 2;
ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
                           value);

?
> 
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Update Bit 6 (Active mode), Select both Led sets, Bit [1:0] */
>> +    ret = regmap_update_bits(priv->regmap, LP3952_REG_ENABLES, 0x43, 0xfc);
> 
> The same applies to 0x43 and 0xfc.
> 
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Set Cmd1 for RGB intensity,cmd and transition time */
>> +    return (lp3952_set_pattern_gen_cmd(priv, 0, I46, I71, I100, TT0,
>> +                       CET197));
>> +}
>> +
>> +static const struct regmap_config lp3952_regmap = {
>> +    .reg_bits = 8,
>> +    .val_bits = 8,
>> +    .max_register = REG_MAX,
>> +};
>> +
>> +static int lp3952_probe(struct i2c_client *client,
>> +            const struct i2c_device_id *id)
>> +{
>> +    int status;
>> +    struct lp3952_ctrl_hdl *leds;
>> +    struct lp3952_led_array *priv;
>> +    struct lp3952_platform_data *pdata = dev_get_platdata(&client->dev);
>> +
>> +    if (!pdata) {
>> +        dev_err(&client->dev,
>> +            "lp3952: failed to obtain platform_data\n");
>> +        return -EINVAL;
>> +    }
> 
> Actually board files are deprecated. We use Device Tree instead now.
> Would it be possible to switch to using it for this driver?
> Please refer to Documentation/devicetree/bindings/leds/common.txt.
> 
I will remove platform driver approach. My host board use ACPI instead of
Device tree. I do not have firmware code, for the board. But shall 
try to emulate ACPI entry for the LED from kernel.

>> +    priv = devm_kzalloc(&client->dev, sizeof(struct lp3952_led_array),
> 
> Instead of using struct type name it is more preferred to pass
> dereferenced pointer as an argument to sizeof. Here it would be:
> 
> sizeof(*priv)
> 
>> +                GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
>> +
>> +    priv->ndev = 6;
>> +
>> +    leds = devm_kcalloc(&client->dev, priv->ndev, sizeof(*leds),
>> +                GFP_KERNEL);
> 
> Like you're doing it here.
> 
>> +    if (!leds) {
>> +        devm_kfree(&client->dev, priv);
>> +        return -ENOMEM;
>> +    }
>> +    priv->leds = leds;
>> +    priv->client = client;
>> +    priv->enable_gpio = pdata->enable_gpio;
>> +    priv->regmap = devm_regmap_init_i2c(client, &lp3952_regmap);
>> +    if (IS_ERR(priv->regmap)) {
>> +        int err = PTR_ERR(priv->regmap);
>> +
>> +        dev_err(&client->dev, "Failed to allocate register map: %d\n",
>> +            err);
>> +        return err;
>> +    }
>> +
>> +    status = gpio_request(priv->enable_gpio, "lp3952_gpio");
>> +    if (status)
>> +        dev_warn(&client->dev, "Unable to disable reset gpio: %d\n",
>> +             status);
>> +
>> +    status = gpio_direction_output(priv->enable_gpio, 1);
>> +    if (status)
>> +        dev_warn(&client->dev, "Unable to disable reset gpio: %d\n",
>> +             status);
> 
> Please switch over to using devm_gpiod API.
> 
>> +
>> +    i2c_set_clientdata(client, priv);
>> +
>> +    status = lp3952_configure(priv);
>> +    if (status) {
>> +        dev_err(&client->dev, "Probe failed. Device not found (%d)\n",
>> +            status);
>> +        devm_kfree(&client->dev, leds);
>> +        devm_kfree(&client->dev, priv);
> 
> You don't need to call this expliciyly here. devm_kfree is useful
> in cases one wants to release devm_ prefixed resource allocation,
> but not necessarily tear down the driver.
> 
>> +        return status;
>> +    }
>> +
>> +    status = lp3952_register_led_classdev(priv);
>> +    if (status) {
>> +        dev_err(&client->dev, "Unable to register led_classdev: %d\n",
>> +            status);
>> +        devm_kfree(&client->dev, leds);
>> +        devm_kfree(&client->dev, priv);
> 
> Ditto.
> 
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
>> +
>> +    lp3952_unregister_led_classdev(priv);
>> +
>> +    devm_kfree(&client->dev, priv->leds);
> 
> Please remove the above line.
> 
>> +    gpio_direction_input(priv->enable_gpio);
>> +    gpio_free(priv->enable_gpio);
>> +    devm_kfree(&client->dev, priv);
> 
> Please remove the above line.
> 
>> +    return 0;
>> +}
>> +
>> +static const struct i2c_device_id lp3952_id[] = {
>> +    {LP3952_NAME, 0},
>> +    {}
>> +};
>> +
>> +static struct i2c_driver lp3952_i2c_driver = {
>> +    .driver = {
>> +           .name = LP3952_NAME,
>> +           .owner = THIS_MODULE,
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
>> index 0000000..393f456
>> --- /dev/null
>> +++ b/include/linux/leds-lp3952.h
>> @@ -0,0 +1,83 @@
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
>> +#define LP3952_NAME             "lp3952"
>> +#define LP3952_DEV_ADDR         0x54
>> +#define LP3952_CMD_REG_COUNT    8
>> +#define LP3952_BRIGHT_MAX       4
>> +/* Following 2 MACRO are specific to Minnowboard Max
>> + * Use the appropriate host specific values when
>> + * instantiating device
>> + */
>> +#define LP3952_BUS_ADDR         7
>> +#define LP3952_NRST_GPIO        464
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
>> +struct lp3952_platform_data {
>> +    u32 enable_gpio;
>> +};
>> +
>> +#endif /* LEDS_LP3952_H_ */
>>
> 
> 
