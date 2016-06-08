From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Re: [PATCH v2 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Wed, 8 Jun 2016 16:30:32 +0100
Message-ID: <57583A18.3060206@daqri.com>
References: <1464967219-31689-1-git-send-email-tony.makkiel@daqri.com>
 <57568904.3030900@samsung.com> <5756C2FE.1020204@daqri.com>
 <5756DE3E.5030207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38829 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752893AbcFHPai (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 8 Jun 2016 11:30:38 -0400
Received: by mail-wm0-f53.google.com with SMTP id m124so22418844wme.1
        for <linux-leds@vger.kernel.org>; Wed, 08 Jun 2016 08:30:37 -0700 (PDT)
In-Reply-To: <5756DE3E.5030207@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Thank you for the comments Jacek.

On 07/06/16 15:46, Jacek Anaszewski wrote:
> On 06/07/2016 02:50 PM, Tony Makkiel wrote:
>>
>>
>> On 07/06/16 09:42, Jacek Anaszewski wrote:
>>> Hi Tony,
>>>
>>> Thanks for the update. I have few more comments below.
>>>
>>> I'd rearrange this this way:
>>>
>>> if (led->channel > LP3952_RED_1) {
>>>      dev_err(cdev->dev, " %s Invalid LED requested", __func__);
>>>      return -EINVAL;
>>> }
>>>
>>> if (led->channel >= LP3952_BLUE_1) {
>>>      reg = LP3952_REG_RGB1_MAX_I_CTRL;
>>>      shift_val = (led->channel - LP3952_BLUE_1) * 2;
>>> } else
>>>      reg = LP3952_REG_RGB2_MAX_I_CTRL;
>>>      shift_val = led->channel * 2;
>>> }
>>>
>>> Also you should control here "enable_gpio", i.e. when
>>> all LEDs are turned off, it should be asserted low and raised high
>>> otherwise.
>> Pulling the gpio low here could be a bad idea. The pin also act as a
>> chip reset, which will revert all the registers to default values.
>> So it might be better to toggle them only when the driver is
>> loaded/removed.
> 
> Ack.
> 
> [...]
> 
>>>> +static int lp3952_configure(struct lp3952_led_array *priv)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    /* Disable any LEDs on from any previous conf. */
>>>> +    ret = lp3952_register_write(priv->client, LP3952_REG_LED_CTRL, 0);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    /* enable rgb patter, loop */
>>>> +    ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
>>>> +                    0x06);
>>>
>>> Please add bit field definitions and use them here,
>>> instead of 0x06 value. It makes code analysis easier.
>> I did not quite understand. Bit 1 enables pattern loop, Bit 2, enables
>> pattern gen. Did you mean something like
>>
>> value = 1 << 1 | 1 << 2;
>> ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
>>                             value);
>>
>> ?
> 
> You could have macros that would define values for these bits:
> 
> #define LP3952_PATTERN_LOOP BIT(1)
> #define LP3952_PATTERN_GEN  BIT(2)
> 
> and then:
> 
> ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
>                             LP3952_PATTERN_LOOP | LP3952_PATTERN_GEN)
> 
> If in doubt, please refer to the other LED class drivers.
> 
> [...]
>>>> +static int lp3952_probe(struct i2c_client *client,
>>>> +            const struct i2c_device_id *id)
>>>> +{
>>>> +    int status;
>>>> +    struct lp3952_ctrl_hdl *leds;
>>>> +    struct lp3952_led_array *priv;
>>>> +    struct lp3952_platform_data *pdata = dev_get_platdata(&client->dev);
>>>> +
>>>> +    if (!pdata) {
>>>> +        dev_err(&client->dev,
>>>> +            "lp3952: failed to obtain platform_data\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>
>>> Actually board files are deprecated. We use Device Tree instead now.
>>> Would it be possible to switch to using it for this driver?
>>> Please refer to Documentation/devicetree/bindings/leds/common.txt.
>>>
>> I will remove platform driver approach. My host board use ACPI instead of
>> Device tree. I do not have firmware code, for the board. But shall
>> try to emulate ACPI entry for the LED from kernel.
> 
> Len, Rafael - any advise on how to approach this case?
> This I2C device is present on x86 Minnowboard Max board.
> I've seen ACPI overlays RFC [1], would it apply to this driver?
> 
> [1] https://lwn.net/Articles/682084/
> 
Also thank you for the link Jacek, managed to build kernel with ACPI 
overlay. Will send updated patch, with ACPI enumeration support and 
all the other changes suggested.
