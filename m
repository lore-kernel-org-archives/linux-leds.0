From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 1/2] leds: core: Introduce LED pattern trigger
Date: Tue, 11 Sep 2018 20:43:12 +0200
Message-ID: <dd1f8dd2-d577-ab12-e67a-7ed71459055a@gmail.com>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536027873.git.baolin.wang@linaro.org>
 <20180908050208.GY2523@minitux> <20180910211935.GA4697@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910211935.GA4697@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel,

On 09/10/2018 11:19 PM, Pavel Machek wrote:
> On Fri 2018-09-07 22:02:08, Bjorn Andersson wrote:
>> On Tue 04 Sep 04:01 PDT 2018, Baolin Wang wrote:
>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>> [..]
>>> +What:		/sys/class/leds/<led>/hw_pattern
>>> +Date:		September 2018
>>> +KernelVersion:	4.20
>>> +Description:
>>> +		Specify a hardware pattern for the LED, for LED hardware that
>>> +		supports autonomously controlling brightness over time, according
>>> +		to some preprogrammed hardware patterns.
>>> +
>>> +		Since different LED hardware can have different semantics of
>>> +		hardware patterns, each driver is expected to provide its own
>>> +		description for the hardware patterns in their ABI documentation
>>> +		file.
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
> 
> No, we are not back to full circle.
> 
> Or at least we should not be.
> 
> Yes, hw_pattern can have some limitation pattern does not, but if you
> take values from hw_pattern file and put them into pattern file, you
> should get the same pattern (with more power being consumed). And that
> property is kind of important for me, because it should keep the ABI
> reasonable.

If you looked at what we agreed on with Baolin, you'd realize
that this property is in no way preserved.
This is what the whole story is about - we're introducing hw_pattern
because of difficulties in describing breathing pattern by a series
of [brightness delta_t] tuples.

And Bjorn presented another example. I'm inclined to leave the
definition of hw_pattern semantics to the LED class drivers,
and allow them to create related sysfs files.

>>> +What:		/sys/class/leds/<led>/repeat
>>> +Date:		September 2018
>>> +KernelVersion:	4.20
>>> +Description:
>>> +		Specify a pattern repeat number. 0 means repeat indefinitely.
>>> +
>>> +		This file will always return the originally written repeat
>>> +		number.
>>
>> I'm still convinced that this will confuse our users and to me it would
>> be more logical if this denotes the number of times the pattern should
>> be repeated, with e.g. negative numbers denoting infinite.
>>
>> In particular I expect to have to explain why my driver expects that you
>> write 0 in the file named "repeat" to make it repeat and 1 to make it
>> not repeat.
> 
> Ok, -1 works for me :-).
> 
> Thanks,
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski
