From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 1/2] leds: core: Introduce LED pattern trigger
Date: Fri, 10 Aug 2018 20:10:56 +0200
Message-ID: <90e7f2b4-b706-4784-a7c6-30dba1614e67@gmail.com>
References: <1dc5d394324b2bf1ffe229b8e42691fab6d749e0.1533556992.git.baolin.wang@linaro.org>
 <c18fd41f-831c-ab74-57e5-d4151f4b47cc@gmail.com>
 <CAMz4kuL8ufCqbqgegozJt3P7JON0AzA9KrbvcvOB15McA5S=zA@mail.gmail.com>
 <5d594e9b-9889-adc2-cc59-f4f45eea7ddb@gmail.com>
 <CAMz4kuJBT2m8YpsAFufiGQFOYCgBbyf9Rrhce+396pRoW802aw@mail.gmail.com>
 <cc29be64-47a5-2bc1-f1be-64b4ad7e1a6d@gmail.com>
 <CAMz4kuKs09P4_9k=_U1jYOpYz_8UHkHGpD_Wketpd35uqdBRoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuKs09P4_9k=_U1jYOpYz_8UHkHGpD_Wketpd35uqdBRoA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-leds@vger.kernel.org

Hi Baolin,

On 08/10/2018 05:26 PM, Baolin Wang wrote:
> Hi Jacek,
> 
> On 9 August 2018 at 21:21, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>> Hi Baolin,
>>
>> On 08/09/2018 07:48 AM, Baolin Wang wrote:
>> [...]
>>>>>>> +static int pattern_trig_start_pattern(struct pattern_trig_data *data,
>>>>>>> +                                   struct led_classdev *led_cdev)
>>>>>>> +{
>>>>>>> +     if (!data->npatterns)
>>>>>>> +             return 0;
>>>>>>> +
>>>>>>> +     if (led_cdev->pattern_set) {
>>>>>>> +             return led_cdev->pattern_set(led_cdev, data->patterns,
>>>>>>> +                                          data->npatterns, data->repeat);
>>>>>>
>>>>>> I think that it would be more flexible if software pattern fallback
>>>>>> was applied in case of pattern_set failure. Otherwise, it would
>>>>>> lead to the situation where LED class devices that support hardware
>>>>>> blinking couldn't be applied the same set of patterns as LED class
>>>>>> devices that don't implement pattern_set. The latter will always have to
>>>>>> resort to using software pattern engine which will accept far greater
>>>>>> amount of pattern combinations.
>>>>>
>>>>> Hmmm, I am not sure this is useful for hardware pattern, since the LED
>>>>> hardware can be diverse which is hard to be compatible with software
>>>>> pattern.
>>>>>
>>>>> For example, for our SC27XX LED, it only supports 4 hardware patterns
>>>>> setting (low time, rising time, high time and falling time) to make it
>>>>> work at breathing mode. If user provides 3 or 5 patterns values, it
>>>>> will failed to issue pattern_set(). But at this time, we don't want to
>>>>> use software pattern instead since it will be not the breathing mode
>>>>> expected by user. I don't know if there are other special LED
>>>>> hardware.
>>>>
>>>> Good point. So this is the issue we should dwell on, since the
>>>> requested pattern effect should look similar on all devices.
>>>> Of course in case of software pattern it will be often impossible
>>>> to achieve the same fluency. Similarly as in case of rendering graphics
>>>> with and without acceleration.
>>>>
>>>> In case of your device, I'd say that we'd need more complex description
>>>> of breathing mode pattern. More complex than just four intervals.
>>>> It should reflect all the intervals the hardware engine needs to perform
>>>> to achieve the breathing effect. Can this information be inferred from
>>>> the docs?
>>>
>>> >From our docs, it only provides registers to set the low time, rising
>>> time, high time and falling time (value unit is 0.125s and max value
>>> is 63 = 7.875s) to enable breathing mode. So each interval value can
>>> be 1 ~ 63. But that is still hard for software pattern to simulate the
>>> breathing mode performed by hardware pattern.
>>
>> Software fallback is not expected to show similar performance to the
>> hardware engine on the whole span of the supported time range.
>>
>> Having min rise time value at 125ms, and given that max_brightness
>> is 255, then we'd have 255 / 125 = 2.04 of brightness level rise per
>> 1ms. So, the pattern for rising edge could look like (assuming we
>> stop at 254):
>>
>> 0 1 2 1 4 1 6 1 8 1 10 1 ... 254 1
> 
> Right, maybe this can work, maybe not. Since we can met different
> cases when failed to issue pattern_set(). Maybe the LED hardware
> occurs some errors, in this case we should shutdown the LED, not
> enable the software pattern instead, which still can not work. 

This is arguable. Timer trigger always resorts to using software
fallback if blink_set() fails.

> Maybe
> driver can set NULL for pattern_set/clear interfaces to disable
> hardware pattern, then next time user will perform the patterns with
> software pattern mode.

Resetting any ops after LED class driver is probed should be
deemed forbidden, since LED core can make some decisions basing on
whether given ops are initialized or not.

> For our SC27XX LED, like I said if user provides only 3 pattern values
> which will failed to issue pattern_set(). But I still do not need use
> software patterns to show similar performance, instead it will still
> keep the last hardware pattern performance ( It did not overlap the
> previous hardware pattern setting). Maybe different drivers have
> different error handling, that's why I think we can leave driver to
> choose the proper way to handle.

ABI semantics is generic, i.e. common for all drivers. Driver can
always log any problems occurred while setting pattern, but it shouldn't
necessarily need to prevent pattern trigger from using software
fallback.

> Honestly, can we keep this pattern trigger simple and easy at first?
> If some drivers want to use software patterns to perform again once
> their hardware patterns performed failed (IMHO our SC27XX LED do not
> need), then we can add this feature, at that time we will have users
> to test and optimize the feature. Maybe I am wrong:)

In other words you want to prevent users from exploiting the flexibility
of pattern trigger, and limit them to using always only breathing
scheme for SC27XX LED. What if someone would like to employ pattern
trigger for encoding morse message to report system errors?

And secondly, we cannot keep the interface simple at first and then
change it, because this is against Linux rule, which says that
interface cannot break existing users.

>> Now, I'm starting to wonder if we shouldn't have specialized trigger
>> for breathing patterns, that would accept brightness level change per
>> time period. Pattern trigger needs more flexibility and inferring if the
>> hardware can handle given series of pattern intervals would entail
>> unnecessary code complexity.
>>
>> Such breathing trigger would require triplets comprised of
>> start brightness, end brightness and a duration of the brightness
>> transition.
> 
> But this is the only place we can set the hardware patterns according
> to our previous discussion. Thanks.

Thinking more about it, introducing another trigger for something being
also a pattern is a bad idea.

Perhaps, as an alternative, we could allow for providing mathematical
formula to define the edge of brightness change.

I wonder what Pavel thinks.

-- 
Best regards,
Jacek Anaszewski
