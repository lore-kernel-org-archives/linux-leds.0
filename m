From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v4 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Thu, 12 Nov 2015 19:07:33 +0900
Message-ID: <564464E5.1080005@samsung.com>
References: <1447121864-15460-1-git-send-email-ingi2.kim@samsung.com>
 <1447121864-15460-3-git-send-email-ingi2.kim@samsung.com>
 <56421B8F.6010107@samsung.com> <56444681.9020604@samsung.com>
 <564459FE.8020209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <564459FE.8020209@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 2015=EB=85=84 11=EC=9B=94 12=EC=9D=BC 18:21, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> On 11/12/2015 08:57 AM, Ingi Kim wrote:
> [...]
>>>> +        regmap_write(led->regmap, RT5033_REG_FLED_FUNCTION1, val)=
;
>>>> +    } else {
>>>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1=
,
>>>> +                   RT5033_FLED_FUNC1_MASK, RT5033_FLED_PINCTRL |
>>>> +                   rt5033_fled_used(led, fled_id));
>>>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_CTRL1,
>>>> +                   RT5033_FLED_CTRL1_MASK,
>>>> +                   (brightness - 1) << 4);
>>>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2=
,
>>>> +                   RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED);
>>>> +    }
>>>
>>> How are you distinguishing between setting brightness for iout_join=
t
>>> case and for individual LEDs? Have you tested this use case?
>>> Even if you don't have a board with two separate LEDs,
>>> you should be able to test two LED class devices with a single
>>> connected LED.
>>>
>>
>> Thanks, I missed a iout_joint case :(
>> I have tested a board with integrated single LED,
>> It looks fine and all feature works well even if it has limitation.
>=20
> Please also test two separate LEDs case, by defining two child
> nodes in DT, and in a result you will get two LED class devices.
> After that you can set brightness separately for each LED class
> device, and you'll be able to verify that the driver works properly
> by observing the single LED connected to both outputs.
> In order to make the testing even more valuable, you can
> set triggers for both LEDs
>=20

Oh, I ask of you, please do not misconstrue.
I'm sorry if my expression is rather misleading.

I have verified this driver works properly.
It already tested with two child nodes and observed single LED
that is connected to both outputs.

I just wanted to say that it works properly as you said.
