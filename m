From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 1/2] leds: core: Introduce LED pattern trigger
Date: Thu, 13 Sep 2018 21:37:20 +0200
Message-ID: <48df13cd-af36-7753-8469-54d67937b54d@gmail.com>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536027873.git.baolin.wang@linaro.org>
 <20180908050208.GY2523@minitux> <20180910211935.GA4697@amd>
 <dd1f8dd2-d577-ab12-e67a-7ed71459055a@gmail.com> <20180912191820.GA27704@amd>
 <a82e3d9c-1df8-9e73-7371-613ad550693d@gmail.com> <20180912204156.GA15541@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180912204156.GA15541@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 09/12/2018 10:41 PM, Pavel Machek wrote:
> Hi!
> 
>>>>> No, we are not back to full circle.
>>>>>
>>>>> Or at least we should not be.
>>>>>
>>>>> Yes, hw_pattern can have some limitation pattern does not, but if you
>>>>> take values from hw_pattern file and put them into pattern file, you
>>>>> should get the same pattern (with more power being consumed). And that
>>>>> property is kind of important for me, because it should keep the ABI
>>>>> reasonable.
>>>>
>>>> If you looked at what we agreed on with Baolin, you'd realize
>>>> that this property is in no way preserved.
>>>> This is what the whole story is about - we're introducing hw_pattern
>>>> because of difficulties in describing breathing pattern by a series
>>>> of [brightness delta_t] tuples.
>>>>
>>>> And Bjorn presented another example. I'm inclined to leave the
>>>> definition of hw_pattern semantics to the LED class drivers,
>>>> and allow them to create related sysfs files.
>>>
>>> Please lets not do that.
>>>
>>> We already have drivers that do that and it is complete
>>> nightmare. Some take binary code for the tiny CPU driving the LED.
>>>
>>> What exactly is the problem? [brightness delta_t] can describe
>>
>> You wrote:
>>
>> <quote>
>> Yes, hw_pattern can have some limitation pattern does not, but if you
>> take values from hw_pattern file and put them into pattern file, you
>> should get the same pattern (with more power being consumed).
>> </quote>
>>
>> The problem is that we decided to introduce hw_pattern to
>> to take away from drivers a responsibility for translating
>> a series of tuples, approximating the brightness curve,
>> to the values that can be written to the hardware registers.
>>
>> Because this is what would need to be done to check if hw can support
>> given series of tuples and activate it. Actually with this approach
>> we wouldn't need hw_pattern at all, since pattern alone would do.
>> But implementation thereof is what we could call a nightmare.
>>
>> What follows, your claim from the quotation is inaccurate:
>> values from hw_pattern written to the pattern file will not
>> produce the same pattern, at least in case of what was proposed
>> in [0] for drivers/leds/leds-sc27xx-bltc.c.
> 
> That sounds easy, see below.
> 
>>> anything single LED can do in finite time. You are right, that
>>> [brightness delta_t] sequence may get rather long, and it may be hard
>>> to turn that sequence into parameters. Are there any _interesting_
>>> sequences hardware can do but [brightness delta_t] can not store
>>> reasonably?
>>
>> Please propose the implementation of pattern_set for
>> drivers/leds/leds-sc27xx-bltc.c breathing pattern, that will
>> setup breathing mode basing on the values from tuples.
>>
>> Use Baolin's patch [0] for a reference of what hardware expects.
>>
>> [0] https://lore.kernel.org/patchwork/patch/984246/
> 
> Yep, so we change documentation to require
> 
> 0 rise_duration brightness high_duration brightness fall_duration 0 low_duration"
> 
> ...and we are done; at least as long as user writes expected pattern
> to the file.
> 
> I'd actually like to see this at begining of function:
>     if (pattern[0].brightness != 0)
>         return -EINVAL;
>     if (pattern[2].brightness != 0)
>         return -EINVAL;
>     if (pattern[3].brightness != 0)
>         return -EINVAL;
>     if (pattern[1].brightness != pattern[2].brightness)
>         return -EINVAL;
> 
> ..so if user writes something unexpected, he gets the error back.
> 
> What am I missing?

I suppose that breathing pattern means smooth rise and fall of
brightness. I'd even say that it should be a non-linear function.

I'm not sure if you noticed my quotation of your statement from the
previous message, because the modification you proposed doesn't
introduce any novelty to the related matter.

The difference between pattern and discussed hw_pattern
semantics is that:

- hw_pattern semantics for leds-sc27xx-bltc.c requires only four
  tuples to setup the breathing pattern.

- the same four tuples written to the pattern file would result
  in four brightness changes

-- 
Best regards,
Jacek Anaszewski
