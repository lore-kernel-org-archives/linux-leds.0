From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v8 1/2] leds: core: Introduce LED pattern trigger
Date: Sun, 9 Sep 2018 21:38:42 +0800
Message-ID: <CAMz4kuK=t9t0nZaVHguv_BVH5WKTDvxPrxCjPrpws9=VV_57ag@mail.gmail.com>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536027873.git.baolin.wang@linaro.org>
 <20180908050208.GY2523@minitux> <0190dc10-99a3-abb7-b196-a537c49a2b6e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0190dc10-99a3-abb7-b196-a537c49a2b6e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 9 September 2018 at 04:19, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> Hi Bjorn,
>
> On 09/08/2018 07:02 AM, Bjorn Andersson wrote:
>> On Tue 04 Sep 04:01 PDT 2018, Baolin Wang wrote:
>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>> [..]
>>> +What:               /sys/class/leds/<led>/hw_pattern
>>> +Date:               September 2018
>>> +KernelVersion:      4.20
>>> +Description:
>>> +            Specify a hardware pattern for the LED, for LED hardware that
>>> +            supports autonomously controlling brightness over time, according
>>> +            to some preprogrammed hardware patterns.
>>> +
>>> +            Since different LED hardware can have different semantics of
>>> +            hardware patterns, each driver is expected to provide its own
>>> +            description for the hardware patterns in their ABI documentation
>>> +            file.
>>> +
>>
>> So, after a full circle we're back at drivers with support for hardware
>> patterns should have their own ABI for setting that pattern.
>>
>> The controls for my hardware is:
>> * a list of brightness values
>> * the rate of the pattern
>> * a flag to indicate that the pattern should be played from start
>>   to end, end to start or start to end to start
>> * a boolean indicating if the pattern should be played once or repeated
>>   indefinitely.
>>
>> Given that the interface now is hw specific, what benefit is there to
>> attempt to cram these 4 knobs into "hw_pattern"? Or am I allowed to
>> create additional files for the latter three?
>
> So this is an argument corroborating my concerns raised in [0].
> I really think that we should allow for custom pattern interfaces
> defined by LED class drivers.
>
>>> +What:               /sys/class/leds/<led>/repeat
>>> +Date:               September 2018
>>> +KernelVersion:      4.20
>>> +Description:
>>> +            Specify a pattern repeat number. 0 means repeat indefinitely.
>>> +
>>> +            This file will always return the originally written repeat
>>> +            number.
>>
>> I'm still convinced that this will confuse our users and to me it would
>> be more logical if this denotes the number of times the pattern should
>> be repeated, with e.g. negative numbers denoting infinite.
>
> Sounds reasonable. Let's change this semantics as you propose.
>
>> In particular I expect to have to explain why my driver expects that you
>> write 0 in the file named "repeat" to make it repeat and 1 to make it
>> not repeat.

Hm, so there are some cases we need to make clear.
1) If negative numbers present infinite, so what's the meaning of number 0?
2) What we should show for users if repeat number is negative, just
show negative numbers or one string "infinite"?

-- 
Baolin Wang
Best Regards
