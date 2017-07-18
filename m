From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/3] leds: core: Introduce generic pattern interface
Date: Tue, 18 Jul 2017 23:36:58 +0200
Message-ID: <2bcbd6b6-02cd-2aa1-32d7-04f59bb53e64@gmail.com>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-2-bjorn.andersson@linaro.org>
 <20170706031801.GB12954@xo-6d-61-c0.localdomain>
 <beb9b4c3-4922-1ebb-5017-a4b791cdb4d7@gmail.com>
 <20170716211456.GV1618@tuxbook>
 <61a2d8d2-7bf0-c8ff-90a2-728d8368da0a@gmail.com>
 <20170717233936.GB20973@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170717233936.GB20973@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

On 07/18/2017 01:39 AM, Bjorn Andersson wrote:
> On Mon 17 Jul 14:08 PDT 2017, Jacek Anaszewski wrote:
> 
>> On 07/16/2017 11:14 PM, Bjorn Andersson wrote:
>>> On Sun 16 Jul 11:49 PDT 2017, Jacek Anaszewski wrote:
>>>> On 07/06/2017 05:18 AM, Pavel Machek wrote:
> [..]
>>>> I've been working on addition of RGB LED support to the LED core for
>>>> some time now, in the way as we agreed upon at [0], but it turns out to
>>>> be less trivial if we want to do it in an elegant way.
>>>>
>>>
>>> Generally 3 predefined LPG blocks are routed to the TRILED current sink.
>>>
>>> Exposing the TRILED block as a RGB LED instance would make sense in its
>>> own, but it doesn't give us a coherent solution for the LPG.
>>>
>>> The current board I'm working on (DragonBoard820c) has 4 LEDs, 3 of them
>>> are connected to the TRILED and the fourth is on a "GPIO" in current
>>> sink mode.
>>>
>>> By having each LPG represented as a LED device gives us a unified view
>>> of the hardware even though there are two different types of current
>>> sinks.
>>>
>>>
>>> Further more, per the 96boards specification we're expected to have
>>> different triggers on the different "colors" of the TRILED.
>>
>> What is the function of TRILED block then? My first impression was
>> that it allows for setting brightness on all three LED synchronously?
>>
> 
> It's nothing more than one hardware block providing 3 current sinks.

What's the benefit of grouping three sinks? Is there some other gain
besides possibility of turning on/off the whole block at once?


>>>
>>> So I do not agree with imposing this kind of decisions on the board
>>> design just to support this higher level feature.
>>>
>>>> Less elegant way would be duplicating led-core functions and changing
>>>> single enum led_brightness argument with the three ones (or a struct
>>>> containing three brightness components)
>>>>
>>>> I chose to go the elegant way and tried to introduce led_classdev_base
>>>> type that would be customizable with the set of ops, that would allow
>>>> for making the number of brightness components to be set at once
>>>> customizable. This of course entails significant amount of changes in
>>>> the LED core and some changes in LED Trigger core.
>>>>
>>>
>>> I think that the RGB interface has to be a "frontend" of any
>>> configurable LED instances and not tied to a particular hardware
>>> controller.
>>
>> That doesn't assure brightness setting synchronization which is
>> especially vital in case of triggers like timer.
>>
> 
> If you look at any available Android based device you can see what
> happens when you set red, then green and then blue brightness
> independently - from user space even. The LED might be
> red/green/blue/purple whatever, but I would argue that it's not
> noticeable due to the short duration between the updates.

> The case where synchronization matters is if you have pattern
> transitions as you're extending the time of the transition and you can
> spot the color variation in the transitions.

It would require more thorough analysis across various devices
programmed via different buses. Probably in most cases applying
the userspace frontend mentioned by you would work just fine.

And when it comes to higher frequencies, we have had already
attempts of adding hr timer support for "fast LEDs" like the
ones driven through GPIOs, and those could benefit from the
kernel level synchronization.

-- 
Best regards,
Jacek Anaszewski
