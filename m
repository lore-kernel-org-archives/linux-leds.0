From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v3 1/2] drivers: led: is31fl319x: 1/3/6/9-channel light
 effect led driver
Date: Wed, 13 Jul 2016 11:26:11 +0200
Message-ID: <57860933.5020108@samsung.com>
References: <cover.1468007377.git.hns@goldelico.com>
 <524f16ecba240bacf57924f43ec38404cfdcde8f.1468007377.git.hns@goldelico.com>
 <57854FB0.1080605@gmail.com>
 <55F90A44-0B60-4342-8143-56F85EA24772@goldelico.com>
 <5785F17D.3010108@samsung.com>
 <D91D4F2A-D5CE-48FB-97DE-E9CFE2C01E3F@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48730 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752702AbcGMJ0W (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Jul 2016 05:26:22 -0400
In-reply-to: <D91D4F2A-D5CE-48FB-97DE-E9CFE2C01E3F@goldelico.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>

On 07/13/2016 10:52 AM, H. Nikolaus Schaller wrote:
> Hi Jacek,
>
>> Am 13.07.2016 um 09:45 schrieb Jacek Anaszewski <j.anaszewski@samsung.com>:
>>
>> Hi Nikolaus,
>>
>> On 07/13/2016 08:09 AM, H. Nikolaus Schaller wrote:
>> [...]
>>>>> +	/*
>>>>> +	 * Kernel conventions require per-LED led-max-microamp property.
>>>>> +	 * But the chip does not allow to limit individual LEDs.
>>>>> +	 * So we take minimum from all subnodes.
>>>>
>>>> Why minimum? Choose maximum and reduce max_brightness properties
>>>> of the sub-LEDs with lesser led-max-microamp.
>>>
>>> Hm. Is this really the correct way to handle it?
>>>
>>> Assume you connect an LED which is specified with 10mA peak current.
>>> And another with 20mA peak current.
>>>
>>> So you define led-max-microamp in the DT as 10 mA and 20 mA.
>>>
>>> Firstly a user can set the brightness only to 50% of LED_FULL since it is limited
>>> by a reduced max_brightness. And heshe finds that not all LEDs have the same
>>> max_brightness. The first LED will have 127 and the second one 255 for reasons
>>> not directly understandable.
>>
>> You have to know that led-max-microamp property was introduced
>> to standarize Device Tree definition of maximum brightness allowed for
>> a sub-LED.
>
>>
>> Earlier people defined max-brightness property in DT, but at
>> some point we realized that brightness level is not a proper unit for
>> describing a hardware property.
>
> Indeed it isn't. It could be if it were brightness in some physical unit, but
> here it is a user-space range definition.
>
>> It was not global max-microamp setting that appears in recent LED
>> controllers that drove the introduction of led-max-microamp property.
>
>>
>> If you question the idea of having different maximum brightness per
>> sub-LEDs controlled by the same device, then it means that you have
>> objections to the entire idea of LED subsystem max_brightness property,
>> whereas it has been broadly accepted and successfully used for years.
>
> Perhaps the max_brightness visible in user space could be standardized
> to be always identical to LED_FULL.

The patch that introduced max_brightness property claims that it
overrides the legacy LED_FULL enum.

>>
>>> This entangles "brightness" with "max-current" - which are IMHO two independent
>>> things.
>>
>> The fact that recent LED controllers use the same notion for one of its
>> settings shouldn't mislead us.
>
> BTW, some LEDs may have the same brightness (measured physical light
> intensity) at very different currents, but that is not the key point.
>
>>
>>> Next, this will set the hardware limit to 20 mA. So there will be current peaks
>>> of 20 mA for an LED where the DT developer thinks to have specified a led-max-microamp
>>> of 10 mA. So you run the LED outside of its specs although the DT seems to
>>> tell that it is inside and user-space thinks it is ok. This will reduce lifetime of LEDs.
>>
>> In what circumstances would such current peaks occur? On reset?
>
> During PWM operation. PWM makes pulses with different duty cycle.
>
> Some % of the time it is 0 mA and some it is some max current. In our chip
> this max current is defined for all LEDs by some global control register.
>
> If you limit to 50% of the max current of all LEDS (e.g. 20 mA) you have
> 10 mA average described in the DT.
>
> But this means permanent pulses of 20 mA e.g. 50% of the time at LED_HALF.
> 50% of the time the current is above what is described in DT.
>
>> Shouldn't such a device be considered as broken by design?
>
> Yes but only if it would do it during reset.
>
> The problem I refer to is during normal operation and occurs because
> we try to pretend that we can limit the max current for each LED individually,
> which the chip does not provide.
>
> We can only limit the average current of each LED and not the peak current.
>
>> What if all LEDs would have low amperage?
>
> Yes, the chip can reduce the max current in steps of 5 mA up to 40 mA. So
> you can reduce it to the lowest led-max-microamp of any of the LEDs. Which
> is the minimum-rule we have in v3.
>
> If all LEDs are the same, this will be like a global limit.
>
>> Would there be some way
>> to protect them from being damaged by current peaks?
>
> Yes, there would be a hardware means to limit the current: series resistors.
>
> But I think neither driver implementation nor DT considerations should drive
> hardware design into a specific solution...
>
> That all is why we initially proposed a new global led-max-microamp DT property.
> It would IMHO better describe the chip in DT and not loose any user-space
> capabilities.
>
> Ah, writing this sentence opens my eyes to where we are not talking about the same
> picture. It appears that I am thinking chip-focussed about describing the
> current-limiting facility of the chip. Hence the global property.
>
> Contrary to that, the subnode led-max-microamp describes the LEDs (and not a chip).
> And leaves it to the driver to set up the chip in a way that the LEDs never get
> more current than specified there. Right?
>
> This means we have to take the minimum (not the maximum) and round it down
> to the nearest value the chip can provide.
>
> I.e. if you specify one LED with 10mA and one with 1000mA, the whole chip would
> limit to 10mA. This means the 1000mA LED will never be visibly bright (even at
> max_brightness). But that is not a fault of the chip or the driver but of the hardware
> designer choosing such imbalanced LEDs.

The only rationale standing behind the introduction of led-max-microamp
property was to provide a means for defining max_brightness property in
a Device Tree, that would fit for its requirements.

As you realized we are not considering global max microamp setting,
which is supported by some LED controllers and cannot be considered
generic feature of this type of devices.

It is the driver originator's responsibility to infer proper (safe)
global max-microamp setting basing on the led-max-microamp values
provided for sub-LEDs.

Since PWM devices are specific and max current cannot be defined for
them uniformly, then they need special treatment. I agree that in
case of your device choosing the lowest value would be the most
suitable approach. All LEDs could be left with max_brightness
uninitialized, which is the hint for the LED core to set it to LED_FULL.


>>> So either "led-max-microamp" is the wrong name for this property (could better
>>> be "led-max-average-microamp") or the whole logic is broken.
>>>
>>> This is why we hesitate to hide (or even disable because you can't set the limit
>>> to 10mA by DT) the current limiting chip feature by such a difficult to understand
>>> automatic feature.
>>>
>>> Using the minimum of all led-max-microamp keeps everything on the safe
>>> side, running some LEDs with less current than specified. But never outside
>>> of the spec. And all LEDs have the same max_brightness which is IMHO
>>> more intuitive for the user.
>>>
>>> Our original proposal was to define led-max-microamp for the whole chip
>>> instead of individual LEDs, which is IMHO much easier to understand,
>>> because it corresponds one-to-one with the data sheet.
>>
>>
>
> BR and thanks,
> Nikolaus
>
>
>


-- 
Best regards,
Jacek Anaszewski
