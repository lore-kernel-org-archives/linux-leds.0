From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v6 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Mon, 30 Nov 2015 11:59:38 +0100
Message-ID: <565C2C1A.3080100@samsung.com>
References: <1448446948-13729-1-git-send-email-ingi2.kim@samsung.com>
 <1448446948-13729-3-git-send-email-ingi2.kim@samsung.com>
 <5655D001.8090803@samsung.com> <5656BC88.2070603@samsung.com>
 <5656D43D.106@samsung.com> <565BB510.2040903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41808 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818AbbK3K7n (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2015 05:59:43 -0500
In-reply-to: <565BB510.2040903@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, andi.shyti@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Ingi,

On 11/30/2015 03:31 AM, Ingi Kim wrote:
> Hi Jacek,
>
> On 2015=EB=85=84 11=EC=9B=94 26=EC=9D=BC 18:43, Jacek Anaszewski wrot=
e:
>> Hi Ingi,
>>
>> On 11/26/2015 09:02 AM, Ingi Kim wrote:
>> [...]
>>>>> +torch_unlock:
>>>>> +    mutex_unlock(&led->lock);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +static int rt5033_led_flash_brightness_set(struct led_classdev_f=
lash *fled_cdev,
>>>>> +                       u32 brightness)
>>>>> +{
>>>>> +    struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cd=
ev);
>>>>> +    struct rt5033_led *led =3D sub_led_to_led(sub_led);
>>>>> +
>>>>> +    mutex_lock(&led->lock);
>>>>> +    sub_led->flash_brightness =3D brightness;
>>>>> +    mutex_unlock(&led->lock);
>>>>
>>>> Mutex protection is redundant in this case. You would need it if d=
evice
>>>> state was also changed here.
>>>
>>> Okay, I'll remove it.
>>>
>>>>
>>>> BTW why flash brightness can't be written to the device here?
>>>>
>>>
>>> Flash brightness is only affected when FLED flashed (strobing).
>>> So, I think it is better to be written in rt5033_led_flash_strobe_s=
et function.
>>
>> strobe_set op should strobe the flash ASAP, and delegating brightnes=
s
>> setting there extends a delay between calling strobe_set op
>> and actual flash strobe. If you set the brightness here, then you
>> wouldn't have to do that in the strobe_set op, of course unless the
>> the brightness is altered through the API of the other LED, in two
>> separate LEDs case.
>>
>
> The brightness may be able to change its brightness in two separate L=
EDs case as you see.
> So, I think it would be better to write brightness setting in strobe_=
op.

Could you motivate your statement, please? Why would it be better?

> In consideration of delay, of course, the brightness is set just when=
 it would be changed.

I think that joint iout arrangement will be prevailing - this is the
case for your board, isn't it? With the modification I am proposing
the gain is clear.

>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int rt5033_led_flash_timeout_set(struct led_classdev_flas=
h *fled_cdev,
>>>>> +                    u32 timeout)
>>>>> +{
>>>>> +    struct rt5033_sub_led *sub_led =3D flcdev_to_sub_led(fled_cd=
ev);
>>>>> +    struct rt5033_led *led =3D sub_led_to_led(sub_led);
>>>>> +
>>>>> +    mutex_lock(&led->lock);
>>>>> +    sub_led->flash_timeout =3D timeout;
>>>>> +    mutex_unlock(&led->lock);
>>>>
>>>> Ditto.
>>>>
>>
>> Timeout should be also written here.
>>
>
> The timeout may be able to change its flash timeout in two separate L=
EDs case as you see.
> So, I think it would be better to write timeout setting in strobe_op.
> In consideration of delay, of course, the timeout is set just when it=
 would be changed.
>
>> If you will add regmap_write in both ops, then mutex protection will
>> have to be preserved, to assure consistency between registers state
>> and sub_led->flash_brightness and sub_led->flash_timeout state.
>>
>
> Thanks, but mutex protection is useless in this case.
> so I try to remove it.
>
>>>
>>>>> +#define RT5033_FLED_CTRL4_VTRREG_MAX    0x60
>>>>
>>>> Rename DEF to MASK.
>>
>> Hmm, here it should be: Rename MAX to MASK.
>>
>
> Oh
> Okay, Thanks :)
>


--=20
Best Regards,
Jacek Anaszewski
