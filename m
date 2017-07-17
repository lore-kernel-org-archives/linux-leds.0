From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/3] leds: core: Introduce generic pattern interface
Date: Mon, 17 Jul 2017 23:08:40 +0200
Message-ID: <61a2d8d2-7bf0-c8ff-90a2-728d8368da0a@gmail.com>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-2-bjorn.andersson@linaro.org>
 <20170706031801.GB12954@xo-6d-61-c0.localdomain>
 <beb9b4c3-4922-1ebb-5017-a4b791cdb4d7@gmail.com>
 <20170716211456.GV1618@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170716211456.GV1618@tuxbook>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

On 07/16/2017 11:14 PM, Bjorn Andersson wrote:
> On Sun 16 Jul 11:49 PDT 2017, Jacek Anaszewski wrote:
> 
>> Hi,
>>
>> On 07/06/2017 05:18 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> Some LED controllers have support for autonomously controlling
>>>> brightness over time, according to some preprogrammed pattern or
>>>> function.
>>>>
>>>> This adds a new optional operator that LED class drivers can implement
>>>> if they support such functionality as well as a new device attribute to
>>>> configure the pattern for a given LED.
>>>
>>>> @@ -61,3 +61,23 @@ Description:
>>>>  		gpio and backlight triggers. In case of the backlight trigger,
>>>>  		it is useful when driving a LED which is intended to indicate
>>>>  		a device in a standby like state.
>>>> +
>>>> +What:		/sys/class/leds/<led>/pattern
>>>> +Date:		July 2017
>>>> +KernelVersion:	4.14
>>>> +Description:
>>>> +		Specify a pattern for the LED, for LED hardware that support
>>>> +		altering the brightness as a function of time.
>>>> +
>>>> +		The pattern is given by a series of tuples, of brightness and
>>>> +		duration (ms). The LED is expected to traverse the series and
>>>> +		each brightness value for the specified duration.
>>>> +
>>>> +		Additionally a repeat marker ":|" can be appended to the
>>>> +		series, which should cause the pattern to be repeated
>>>> +		endlessly.
>>>> +
>>>> +		As LED hardware might have different capabilities and precision
>>>> +		the requested pattern might be slighly adjusted by the driver
>>>> +		and the resulting pattern of such operation should be returned
>>>> +		when this file is read.
>>>
>>> Well. I believe this is mostly useful for RGB LEDs. Unfortunately, having patterns
>>> per-LED will present opportunity for different channels becoming de-synchronized
>>> from each other, which will not look nice.
>>
>> Hmm, they are only [brightness duration] tuples, and no definition of
>> R, G and B LED device is covered here, so how it can be useful for RGB
>> LEDs?
>>
> 
> The typical Qualcomm PMIC sports 4-8 LPG channels. The output of these
> channels can be configured to some extent, but in theory any combination
> of the 8 could be hooked up to the three channels of a RGB LED.
> 
> So looking at the LPG hw block, there's no such thing as RGB.
> 
>> I've been working on addition of RGB LED support to the LED core for
>> some time now, in the way as we agreed upon at [0], but it turns out to
>> be less trivial if we want to do it in an elegant way.
>>
> 
> Generally 3 predefined LPG blocks are routed to the TRILED current sink.
> 
> Exposing the TRILED block as a RGB LED instance would make sense in its
> own, but it doesn't give us a coherent solution for the LPG.
> 
> The current board I'm working on (DragonBoard820c) has 4 LEDs, 3 of them
> are connected to the TRILED and the fourth is on a "GPIO" in current
> sink mode.
> 
> By having each LPG represented as a LED device gives us a unified view
> of the hardware even though there are two different types of current
> sinks.
> 
> 
> Further more, per the 96boards specification we're expected to have
> different triggers on the different "colors" of the TRILED.

What is the function of TRILED block then? My first impression was
that it allows for setting brightness on all three LED synchronously?

> 
> So I do not agree with imposing this kind of decisions on the board
> design just to support this higher level feature.
> 
>> Less elegant way would be duplicating led-core functions and changing
>> single enum led_brightness argument with the three ones (or a struct
>> containing three brightness components)
>>
>> I chose to go the elegant way and tried to introduce led_classdev_base
>> type that would be customizable with the set of ops, that would allow
>> for making the number of brightness components to be set at once
>> customizable. This of course entails significant amount of changes in
>> the LED core and some changes in LED Trigger core.
>>
> 
> I think that the RGB interface has to be a "frontend" of any
> configurable LED instances and not tied to a particular hardware
> controller.

That doesn't assure brightness setting synchronization which is
especially vital in case of triggers like timer.

> For patterns you need to have some sort of synchronization between the
> channels, but for non-pattern cases you can have any combination of LED
> drivers to drive the individual components and I believe this should be
> possible to expose through our RGB interface.
> 
>> Unfortunately I can't predict how much time it will take
>> to submit an RFC due to limited amount of time I can spend working
>> on it.
>>
>> [0] https://www.spinics.net/lists/linux-leds/msg07959.html
> 
> Regards,
> Bjorn
> 

-- 
Best regards,
Jacek Anaszewski
