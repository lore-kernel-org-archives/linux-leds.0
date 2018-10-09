From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v14 1/2] leds: core: Introduce LED pattern trigger
Date: Tue, 9 Oct 2018 20:01:19 +0800
Message-ID: <CAMz4kuKJ73mHzYotwmx08h1sJJiKAZNCspo0_v7L-2Ec+5rEQg@mail.gmail.com>
References: <c3a6f08ac978c309bb0b002a0384c4f0ad0f59cd.1538494476.git.baolin.wang@linaro.org>
 <9bf6236e-83af-7156-b26b-7d88ece2d81e@gmail.com> <CAMz4kuJ4iB7pn+i29aypnbxxPK_UDjus=EiNZ2WefBB0onZPTg@mail.gmail.com>
 <7051613e-f2db-260f-85d7-d40278fd11cb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7051613e-f2db-260f-85d7-d40278fd11cb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek and Pavel,

On 5 October 2018 at 04:00, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> Hi Baolin,
>
> On 10/03/2018 03:21 AM, Baolin Wang wrote:
>> Hi Jacek,
>>
>> On 3 October 2018 at 04:25, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>> Hi Baolin,
>>>
>>> Thank you for the v14. We'll probably need v15, though :-)
>>>
>>> I added the comments in the code below.
>>>
>>> On 10/02/2018 05:43 PM, Baolin Wang wrote:
>>>> This patch adds one new led trigger that LED device can configure
>>>> the software or hardware pattern and trigger it.
>>>>
>>>> Consumers can write 'pattern' file to enable the software pattern
>>>> which alters the brightness for the specified duration with one
>>>> software timer.
>>>>
>>>> Moreover consumers can write 'hw_pattern' file to enable the hardware
>>>> pattern for some LED controllers which can autonomously control
>>>> brightness over time, according to some preprogrammed hardware
>>>> patterns.
>>>>
>>>> Signed-off-by: Raphael Teysseyre <rteysseyre@gmail.com>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>>>> ---
>>>> Changes from v13:
>>>>  - Add duration validation for gradual dimming.
>>>>  - Coding style optimization.
>>>>
>>>> Changes from v12:
>>>>  - Add gradual dimming support for software pattern.
>>>>
>>>> Changes from v11:
>>>>  - Change -1 means repeat indefinitely.
>>>>
>>>> Changes from v10:
>>>>  - Change 'int' to 'u32' for delta_t field.
>>>>
>>>> Changes from v9:
>>>>  - None.
>>>>
>>>> Changes from v8:
>>>>  - None.
>>>>
>>>> Changes from v7:
>>>>  - Move the SC27XX hardware patterns description into its own ABI file.
>>>>
>>>> Changes from v6:
>>>>  - Improve commit message.
>>>>  - Optimize the description of the hw_pattern file.
>>>>  - Simplify some logics.
>>>>
>>>> Changes from v5:
>>>>  - Add one 'hw_pattern' file for hardware patterns.
>>>>
>>>> Changes from v4:
>>>>  - Change the repeat file to return the originally written number.
>>>>  - Improve comments.
>>>>  - Fix some build warnings.
>>>>
>>>> Changes from v3:
>>>>  - Reset pattern number to 0 if user provides incorrect pattern string.
>>>>  - Support one pattern.
>>>>
>>>> Changes from v2:
>>>>  - Remove hardware_pattern boolen.
>>>>  - Chnage the pattern string format.
>>>>
>>>> Changes from v1:
>>>>  - Use ATTRIBUTE_GROUPS() to define attributes.
>>>>  - Introduce hardware_pattern flag to determine if software pattern
>>>>  or hardware pattern.
>>>>  - Re-implement pattern_trig_store_pattern() function.
>>>>  - Remove pattern_get() interface.
>>>>  - Improve comments.
>>>>  - Other small optimization.
>>>> ---
>>>>  .../ABI/testing/sysfs-class-led-trigger-pattern    |  76 ++++
>>>>  drivers/leds/trigger/Kconfig                       |   7 +
>>>>  drivers/leds/trigger/Makefile                      |   1 +
>>>>  drivers/leds/trigger/ledtrig-pattern.c             | 431 +++++++++++++++++++++
>>>>  include/linux/leds.h                               |  15 +
>>>>  5 files changed, 530 insertions(+)
>>>>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>>>>  create mode 100644 drivers/leds/trigger/ledtrig-pattern.c
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>>>> new file mode 100644
>>>> index 0000000..22d7af7
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>>>> @@ -0,0 +1,76 @@
>>>> +What:                /sys/class/leds/<led>/pattern
>>>> +Date:                September 2018
>>>> +KernelVersion:       4.20
>>>> +Description:
>>>> +             Specify a software pattern for the LED, that supports altering
>>>> +             the brightness for the specified duration with one software
>>>> +             timer. It can do gradual dimming and constant brightness.
>>>> +
>>>> +             The pattern is given by a series of tuples, of brightness and
>>>> +             duration (ms). The LED is expected to traverse the series and
>>>> +             each brightness value for the specified duration. Duration of
>>>> +             0 means brightness should immediately change to new value.
>>>> +
>>>> +             1. When doing gradual dimming, the led brightness will be updated
>>>> +             every 50 milliseconds, so the duration of each step should not
>>>> +             less than 50 milliseconds.
>>>
>>> I'd like to avoid this constraint. Lowest supported delta_t should be 1.
>>>
>>> We should only prevent entering dimming mode if current delta_t
>>> is lower than UPDATE_INTERVAL.
>>
>> I do not think so. If the pattern format is used for dimming and the
>> delta_t is lower than UPDATE_INTERVAL, we should return errors. Since
>> in this case, we can not change to constant mode.
>
> I'll play with the code at weekend and will let you know my findings.

Thanks Jacek. Do you have any more suggestion?

BTW, we have not get a consensus about adding one 'dimming_interval'
file to set the dimming interval instead of fixed 50 ms.
Pavel, I want to hear your suggestion before I submit new patch set? Thanks.

-- 
Baolin Wang
Best Regards
