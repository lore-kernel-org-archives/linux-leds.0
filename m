From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Tue, 25 Sep 2018 22:00:09 +0200
Message-ID: <9188b107-92da-11aa-9903-848e3f347f8c@gmail.com>
References: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
 <CAMz4kuJx9twJ=wM5qsucV3JH_VS-AC1aWMqpQOwAMkCuKBHLRg@mail.gmail.com>
 <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com> <20180921211758.GC18062@amd>
 <ccac8e5f-e122-9f7d-aa43-fa89c79cb1fe@gmail.com> <20180921221813.GA20355@amd>
 <20180922194451.GA27826@amd> <470f4037-b682-73f8-8063-b4d7a70e04bc@gmail.com>
 <CAMz4kuL431PPMnOAXev-4ZzYwiGwMtz90RQT0JTP2bSdZ7fHUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuL431PPMnOAXev-4ZzYwiGwMtz90RQT0JTP2bSdZ7fHUg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Baolin,

On 09/25/2018 01:15 PM, Baolin Wang wrote:
> On 23 September 2018 at 20:25, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> On 09/22/2018 09:44 PM, Pavel Machek wrote:
>>> On Sat 2018-09-22 00:18:13, Pavel Machek wrote:
>>>> On Sat 2018-09-22 00:11:29, Jacek Anaszewski wrote:
>>>>> On 09/21/2018 11:17 PM, Pavel Machek wrote:
>>>>>> On Fri 2018-09-21 22:59:40, Jacek Anaszewski wrote:
>>>>>>> Hi Baolin,
>>>>>>>
>>>>>>> On 09/21/2018 05:31 AM, Baolin Wang wrote:
>>>>>>>> Hi Jacek and Pavel,
>>>>>>>>
>>>>>>>> On 11 September 2018 at 10:47, Baolin Wang <baolin.wang@linaro.org> wrote:
>>>>>>>>> This patch adds one new led trigger that LED device can configure
>>>>>>>>> the software or hardware pattern and trigger it.
>>>>>>>>>
>>>>>>>>> Consumers can write 'pattern' file to enable the software pattern
>>>>>>>>> which alters the brightness for the specified duration with one
>>>>>>>>> software timer.
>>>>>>>>>
>>>>>>>>> Moreover consumers can write 'hw_pattern' file to enable the hardware
>>>>>>>>> pattern for some LED controllers which can autonomously control
>>>>>>>>> brightness over time, according to some preprogrammed hardware
>>>>>>>>> patterns.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Raphael Teysseyre <rteysseyre@gmail.com>
>>>>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>>>>>>
>>>>>>>> Do you have any comments for the v12 patch set? Thanks.
>>>>>>>
>>>>>>> We will probably have to remove hw_pattern from ledtrig-pattern
>>>>>>> since we are unable to come up with generic interface for it.
>>>>>>> Unless thread [0] will end up with some brilliant ideas. So far
>>>>>>> we're waiting for Pavel's reply.
>>>>>>>
>>>>>>> [0] https://lkml.org/lkml/2018/9/13/1216
>>>>>>
>>>>>> To paint a picture:
>>>>>>
>>>>>> brightness
>>>>>>
>>>>>>    rise hold          lower       hold down
>>>>>>   ^    XXXXXXXXXXXXXXX
>>>>>>   |   X               XX
>>>>>>   |  X                  XX
>>>>>>   | X                     XXXXXXXXXXXXXXXXXXXXXXXXXX
>>>>>>   +-------------------------------------------------------> time
>>>>>>
>>>>>> This is what Baolin's hardware can do, right?
>>>>>>
>>>>>> This is also what pattern trigger can do, right?
>>>>>>
>>>>>> So all we need to do is match the two interfaces, so that hw_pattern
>>>>>> returns -EINVAL on patterns hardware can not actually do.
>>>>>>
>>>>>> I believe I described code to do that in [0] above.
>>>>>
>>>>> You said that we should get the same effect by writing the
>>>>> same series of tuples to either pattern or hw_pattern file.
>>>>>
>>>>> Below command consists of four tuples (marked with brackets
>>>>> to highlight), and it will activate breathing mode in Baolin's
>>>>> hw_pattern:
>>>>>
>>>>> "[0 rise_duration] [brightness high_duration] [brightness fall_duration]
>>>>> [0   low_duration]"
>>>>>
>>>>> Now, I can't see how these four tuples could force the software
>>>>> fallback to produce breathing effect you depicted.
>>>>
>>>> I really should get some sleep now. But my intention was that software
>>>> fallback produces just that with those four tuples. (If it does not,
>>>> we can fix the software fallback to do just that).
>>>
>>> And you are right, v12 1/2 seems to do the wrong thing.
>>>
>>> My "brilliant idea" is to something closer to the original version I
>>> posted here. I'm attaching it for reference.
>>>
>>> I'm also attaching the original documentation. It was clearly designed
>>> to do smooth transitions, too. (But pattern is written in slightly
>>> different way there, AFAICT).
>>>
>>> Clearly, having same semantics for pattern and hw_pattern is possible.
>>
>> Thank you for the attachment. The documentation part makes everything
>> clear. Comparing the patch from the attachment and the Baolin's patch
>> there is one vital part missing, from the original
>> pattern_trig_update():
>>
>> if (data->next->brightness == data->curr->brightness) {
>> [...]
>> } else {
>>         /* Gradual dimming */
>>         led_set_brightness(data->led_cdev, compute_brightness(data));
>>         data->delta_t += UPDATE_INTERVAL;
>>         mod_timer(&data->timer, jiffies
>>                 + msecs_to_jiffies(UPDATE_INTERVAL));
>> }
> 
> I have some confusions about this, if data->next->brightness !=
> data->curr->brightness, we should always do gradual dimming? But
> suppose below pattan values:
> echo "0 100 20 100 40 100 80 100 100 100" > patter
ledtrig-pattern.txt attached by Pavel explains this:

"To make the LED go instantly from one brightness value to another,
use zero-time lengths."

Actually you have it also:
"Duration of 0 means brightness should immediately change to new value"

According to this, to get instant changes your pattern should look
like this:

echo "0 100 0 0 20 100 20 0 40 100 40 0 80 100 80 0 100 100" > pattern

> I do not want to do gradual dimming, just change the brightness with duration.
> 
>> And the compute_brightness() implementation:
>>
>> static int compute_brightness(struct pattern_trig_data *data)
>> {
>>         if (data->delta_t == 0)
>>                 return data->curr->brightness;
>>
>>         if (data->curr->delta_t == 0)
>>                 return data->next->brightness;
>>
>>         return data->curr->brightness + data->delta_t
>>                 * (data->next->brightness - data->curr->brightness)
>>                 / data->curr->delta_t;
>> }
>>
>> With the above the linear gradual dimming is indeed feasible.
>> And for non-linear dimming like breathing mode the hw_pattern will do.
> 
> I am still not sure when we need the linear gradual dimming? When
> failed to set hardware pattern?

No. Linear gradual dimming needs to be applied only if set via pattern
file. In this case we shouldn't attempt to call pattern_set at all,
since we know that we are asked for enabling software engine.

Similarly, in the hw_pattern handler we should call only pattern_set,
and return error code, without falling back to the software engine
in case of error.

>> There is also vital discrepancy between the documentation and the
>> proposed ledtrig-pattern implementation. The doc says:
>>
>> "Duration of 0 means brightness should immediately change to new value"
> 
> OK. Will add in next version.

You already have it added.

>> This syntax seems to be not supported in the Baolin's patch.
>>
>> With all the above covered we will be almost there.
>>
>> Now, only the issues raised by Bjorn need a clarification:
>>
>> On 09/08/2018 07:02 AM, Bjorn Andersson wrote:
>> [...]
>>> The controls for my hardware is:
>>> * a list of brightness values
>>> * the rate of the pattern
>>
>> The two can be described using [brightness delta_t] tuples.
>>
>>> * a flag to indicate that the pattern should be played from start
>>>   to end, end to start or start to end to start
>>
>> As above, but the tuples would have to be suitably arranged.
>>
>> We won't need any specific flag to indicate how the pattern
>> should be played, but instead explicitly give the tuples in the
>> required order. For the start-end-start case the sequence of tuples
>> will need to be tripled, but the middle part should be put in the
>> reverse order.
>>
>>> * a boolean indicating if the pattern should be played once or repeated
>>>   indefinitely.
>>
>> We will have "repeat" file for that.
>>
>> Baolin, would you mind adding the support for gradual dimming to your
>> ledtrig-timer.c implementation?
> 
> Yes, I will do. Thanks.
> 

-- 
Best regards,
Jacek Anaszewski
