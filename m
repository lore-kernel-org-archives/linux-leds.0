From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 2/2] leds: Add driver for NCP5623 3-channel I2C LED
 driver
Date: Fri, 30 Sep 2016 23:00:57 +0200
Message-ID: <6a4a5184-92b5-f299-5ef2-16a611234903@gmail.com>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-3-git-send-email-florian.vaussard@heig-vd.ch>
 <d6dfc1aa-941d-fdbb-5fda-74c85b571bc5@gmail.com>
 <4990cd83-ae67-aec4-ae8b-4d0db3cbc9fe@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4990cd83-ae67-aec4-ae8b-4d0db3cbc9fe@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: florian.vaussard@gmail.com, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>
List-Id: linux-leds@vger.kernel.org

Hi Florian,

On 09/29/2016 06:18 PM, Florian Vaussard wrote:
> Hi Jacek,
>
> Thank you for your comments!
>
> Le 18. 09. 16 à 20:20, Jacek Anaszewski a écrit :
>> Hi Florian,
>>
>> Thanks for the updated patch set. I have few comments below.
>>
>> On 09/16/2016 01:34 PM, Florian Vaussard wrote:
>>> The NCP5623 is a 3-channel LED driver from On Semiconductor controlled
>>> through I2C. The PWM of each channel can be independently set with 32
>>> distinct levels. In addition, the intensity of the current source can be
>>> globally set using an external bias resistor fixing the reference
>>> current (Iref) and a dedicated register (ILED), following the
>>> relationship:
>>>
>>> I = 2400*Iref/(31-ILED)
>>>
>>> with Iref = Vref/Rbias, and Vref = 0.6V.
>>>
>>> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
>>> ---
>>>  drivers/leds/Kconfig        |  11 +++
>>>  drivers/leds/Makefile       |   1 +
>>>  drivers/leds/leds-ncp5623.c | 234 ++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 246 insertions(+)
>>>  create mode 100644 drivers/leds/leds-ncp5623.c
>>>
>
> [...]
>
>>> diff --git a/drivers/leds/leds-ncp5623.c b/drivers/leds/leds-ncp5623.c
>>> new file mode 100644
>>> index 0000000..875785a
>>> --- /dev/null
>>> +++ b/drivers/leds/leds-ncp5623.c
>>> @@ -0,0 +1,234 @@
>>> +/*
>>> + * Copyright 2016 Florian Vaussard <florian.vaussard@heig-vd.ch>
>>> + *
>>> + * Based on leds-tlc591xx.c
>>
>> I think that besides LED class facilities the only
>> common thing is led_no. I'd skip this statement.
>>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; version 2 of the License.
>>> + */
>>> +
>>> +#include <linux/bitops.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#define NCP5623_MAX_LEDS    3
>>> +#define NCP5623_MAX_STEPS    31
>>> +#define NCP5623_MAX_CURRENT    31
>>
>> Both values refer in fact to the same thing.
>> And actually the name is not accurate since max current level
>> is 30.
>>
>
> They do not refer to the same thing:
>
> * NCP5623_MAX_STEPS is the maximum number of PWM steps (0x1F -> 100% duty cycle)
> * NCP5623_MAX_CURRENT is related to the current delivered by the current source
> (0x1F -> ILED = ILEDmax = 2400*Iref). In this case, 30 and 31 give the same ILED
> according to the remark in Eq. 2 and according to Fig. 5 in the datasheet, but
> 31 is still a valid value.
>
>>> +#define NCP5623_MAX_CURRENT_UA    30000
>>> +
>>> +#define NCP5623_CMD_SHIFT    5
>>> +#define CMD_SHUTDOWN        (0x00 << NCP5623_CMD_SHIFT)
>>> +#define CMD_ILED        (0x01 << NCP5623_CMD_SHIFT)
>>> +#define CMD_PWM1        (0x02 << NCP5623_CMD_SHIFT)
>>> +#define CMD_PWM2        (0x03 << NCP5623_CMD_SHIFT)
>>> +#define CMD_PWM3        (0x04 << NCP5623_CMD_SHIFT)
>>> +#define CMD_UPWARD_DIM        (0x05 << NCP5623_CMD_SHIFT)
>>> +#define CMD_DOWNWARD_DIM    (0x06 << NCP5623_CMD_SHIFT)
>>> +#define CMD_DIM_STEP        (0x07 << NCP5623_CMD_SHIFT)
>>> +
>>> +#define LED_TO_PWM_CMD(led)    ((0x02 + led) << NCP5623_CMD_SHIFT)
>>> +
>>> +#define NCP5623_DATA_MASK    GENMASK(NCP5623_CMD_SHIFT - 1, 0)
>>> +#define NCP5623_CMD(cmd, data)    (cmd | (data & NCP5623_DATA_MASK))
>>> +
>>> +struct ncp5623_led {
>>> +    int led_no;
>>> +    u32 led_max_current;
>>> +    struct led_classdev ldev;
>>> +    struct ncp5623_priv *priv;
>>> +};
>>> +
>>> +struct ncp5623_priv {
>>> +    struct ncp5623_led leds[NCP5623_MAX_LEDS];
>>> +    u32 led_iref;
>>> +    u32 leds_max_current;
>>> +    struct i2c_client *client;
>>> +};
>>> +
>>> +static struct ncp5623_led *ldev_to_led(struct led_classdev *ldev)
>>> +{
>>> +    return container_of(ldev, struct ncp5623_led, ldev);
>>> +}
>>> +
>>> +static int ncp5623_send_cmd(struct ncp5623_priv *priv, u8 cmd, u8 data)
>>> +{
>>> +    char cmd_data[1] = { NCP5623_CMD(cmd, data) };
>>> +    int err;
>>> +
>>> +    err = i2c_master_send(priv->client, cmd_data, ARRAY_SIZE(cmd_data));
>>> +
>>> +    return (err < 0 ? err : 0);
>>> +}
>>> +
>>> +static int ncp5623_brightness_set(struct led_classdev *led_cdev,
>>> +                  enum led_brightness brightness)
>>> +{
>>> +    struct ncp5623_led *led = ldev_to_led(led_cdev);
>>> +
>>> +    return ncp5623_send_cmd(led->priv, LED_TO_PWM_CMD(led->led_no),
>>> +                brightness);
>>> +}
>>> +
>>> +static int ncp5623_configure(struct device *dev,
>>> +                 struct ncp5623_priv *priv)
>>> +{
>>> +    unsigned int i;
>>> +    unsigned int n;
>>> +    struct ncp5623_led *led;
>>> +    int effective_current;
>>> +    int err;
>>
>> Below way of calculating max_brightness is not clear to me.
>> Let's analyze it below, using values from your DT example.
>>
>>> +
>>> +    /* Setup the internal current source, round down */
>>> +    n = 2400 * priv->led_iref / priv->leds_max_current + 1;
>>
>> n = 2400 * 10 / 20000 + 1 = 2
>>
>>> +    if (n > NCP5623_MAX_CURRENT)
>>> +        n = NCP5623_MAX_CURRENT;
>>> +
>>> +    effective_current = 2400 * priv->led_iref / n;
>>
>> effective_current = 2400 * 10 / 2 = 12000
>>
>>> +    dev_dbg(dev, "setting maximum current to %u uA\n", effective_current);
>>> +
>>> +    err = ncp5623_send_cmd(priv, CMD_ILED, NCP5623_MAX_CURRENT - n);
>>> +    if (err < 0) {
>>> +        dev_err(dev, "cannot set the current\n");
>>> +        return err;
>>> +    }
>>> +
>>> +    /* Setup each individual LED */
>>> +    for (i = 0; i < NCP5623_MAX_LEDS; i++) {
>>> +        led = &priv->leds[i];
>>> +
>>> +        if (led->led_no < 0)
>>> +            continue;
>>> +
>>> +        led->priv = priv;
>>> +        led->ldev.brightness_set_blocking = ncp5623_brightness_set;
>>> +
>>> +        led->ldev.max_brightness = led->led_max_current *
>>> +            NCP5623_MAX_STEPS / effective_current;
>>
>> led->ldev.max_brightness = 20000 * 31 / 12000 = 51
>>
>> This is not intuitive, and I'm not even sure if the result is in line
>> with what you intended.
>>
>
> There is indeed a problem in the case the allowed current on the LED is greater
> than the effective current provided by the current source, as in your example.
> Here I should put something like:
>
> 	led->ldev.max_brightness =
> 		min(NCP5623_MAX_STEPS, x * NCP5623_MAX_STEPS / y);
>
>> Instead I propose the following:
>>
>> n_iled_max =
>>      31 - (priv->led_iref * 2400 / priv->leds_max_current +
>>            !!(priv->led_iref * 2400 % priv->leds_max_current))
>>
>> (n_iled_max =
>>      31 - (24000 / 20000 + !!(24000 % 20000)) = 31 - (1 + 1) = 29)
>>
>> ncp5623_send_cmd(priv, CMD_ILED, n_iled_max)
>>
>
> This is a good proposition, especially with the DIV_ROUND_UP proposed by Pavel.
> I simulated both and I noticed a problem in both cases for very low currents, as
> we would have negative values for the register setting (see attached figure). I
> will fix this in the next version.
>
>> and then below for each LED:
>>
>> led->ldev.max_brightness =
>>      31 - (priv->led_iref * 2400 / led->led_max_current +
>>            !!(priv->led_iref * 2400 % led->led_max_current))
>>
>> (for led-max-microamp = 5000
>>  led->ldev.max_brightness =
>>  31 - (24000 / 5000 + !!(24000 % 5000)) = 31 - (4 + 1) = 26,
>>  which reflects quite well the logarithmic relation shown
>>  on Figure 5 in the documentation)
>>
>
> Here you are mixing the current source and the PWM settings together. For

Indeed, you're right. So, I'll wait for the next version of the patch
to have a well established ground for max_brightness calculation
analysis.

> example, if my current source was set to 20mA at the previous stage, but my LED
> can only sustain 10mA, I must limit the PWM duty cycle to 50%. Thus:
>
> max_brightness = 10mA * 31 / 20mA = 15
>
> (0 => 0% duty cycle, 31 => 100% duty cycle)


-- 
Best regards,
Jacek Anaszewski
