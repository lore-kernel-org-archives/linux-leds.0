From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Tue, 07 Jun 2016 16:46:22 +0200
Message-ID: <5756DE3E.5030207@samsung.com>
References: <1464967219-31689-1-git-send-email-tony.makkiel@daqri.com>
 <57568904.3030900@samsung.com> <5756C2FE.1020204@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10829 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754219AbcFGOq1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jun 2016 10:46:27 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O8E00HXGP1B5M70@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 07 Jun 2016 15:46:23 +0100 (BST)
In-reply-to: <5756C2FE.1020204@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>, rjw@rjwysocki.net, lenb@kernel.org
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net

On 06/07/2016 02:50 PM, Tony Makkiel wrote:
>
>
> On 07/06/16 09:42, Jacek Anaszewski wrote:
>> Hi Tony,
>>
>> Thanks for the update. I have few more comments below.
>>
>> I'd rearrange this this way:
>>
>> if (led->channel > LP3952_RED_1) {
>>      dev_err(cdev->dev, " %s Invalid LED requested", __func__);
>>      return -EINVAL;
>> }
>>
>> if (led->channel >= LP3952_BLUE_1) {
>>      reg = LP3952_REG_RGB1_MAX_I_CTRL;
>>      shift_val = (led->channel - LP3952_BLUE_1) * 2;
>> } else
>>      reg = LP3952_REG_RGB2_MAX_I_CTRL;
>>      shift_val = led->channel * 2;
>> }
>>
>> Also you should control here "enable_gpio", i.e. when
>> all LEDs are turned off, it should be asserted low and raised high
>> otherwise.
> Pulling the gpio low here could be a bad idea. The pin also act as a
> chip reset, which will revert all the registers to default values.
> So it might be better to toggle them only when the driver is
> loaded/removed.

Ack.

[...]

>>> +static int lp3952_configure(struct lp3952_led_array *priv)
>>> +{
>>> +    int ret;
>>> +
>>> +    /* Disable any LEDs on from any previous conf. */
>>> +    ret = lp3952_register_write(priv->client, LP3952_REG_LED_CTRL, 0);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* enable rgb patter, loop */
>>> +    ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
>>> +                    0x06);
>>
>> Please add bit field definitions and use them here,
>> instead of 0x06 value. It makes code analysis easier.
> I did not quite understand. Bit 1 enables pattern loop, Bit 2, enables
> pattern gen. Did you mean something like
>
> value = 1 << 1 | 1 << 2;
> ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
>                             value);
>
> ?

You could have macros that would define values for these bits:

#define LP3952_PATTERN_LOOP BIT(1)
#define LP3952_PATTERN_GEN  BIT(2)

and then:

ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
                             LP3952_PATTERN_LOOP | LP3952_PATTERN_GEN)

If in doubt, please refer to the other LED class drivers.

[...]
>>> +static int lp3952_probe(struct i2c_client *client,
>>> +            const struct i2c_device_id *id)
>>> +{
>>> +    int status;
>>> +    struct lp3952_ctrl_hdl *leds;
>>> +    struct lp3952_led_array *priv;
>>> +    struct lp3952_platform_data *pdata = dev_get_platdata(&client->dev);
>>> +
>>> +    if (!pdata) {
>>> +        dev_err(&client->dev,
>>> +            "lp3952: failed to obtain platform_data\n");
>>> +        return -EINVAL;
>>> +    }
>>
>> Actually board files are deprecated. We use Device Tree instead now.
>> Would it be possible to switch to using it for this driver?
>> Please refer to Documentation/devicetree/bindings/leds/common.txt.
>>
> I will remove platform driver approach. My host board use ACPI instead of
> Device tree. I do not have firmware code, for the board. But shall
> try to emulate ACPI entry for the LED from kernel.

Len, Rafael - any advise on how to approach this case?
This I2C device is present on x86 Minnowboard Max board.
I've seen ACPI overlays RFC [1], would it apply to this driver?

[1] https://lwn.net/Articles/682084/

-- 
Best regards,
Jacek Anaszewski
