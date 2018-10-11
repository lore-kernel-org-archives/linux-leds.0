From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v14 1/2] leds: core: Introduce LED pattern trigger
Date: Thu, 11 Oct 2018 11:06:53 +0800
Message-ID: <CAMz4kuLYzEpbrA7Mbg=CgWLnrVP5K-2pR-V=kEk=XWXf-iwN+A@mail.gmail.com>
References: <c3a6f08ac978c309bb0b002a0384c4f0ad0f59cd.1538494476.git.baolin.wang@linaro.org>
 <61e45737-a739-8cba-3582-93f5901c1066@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <61e45737-a739-8cba-3582-93f5901c1066@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 11 October 2018 at 04:43, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> Hi Baolin,
>
> I've finally managed to test this patch and it turned out
> that this implementation doesn't prevent what I had concerns
> about, i.e. setting intervals less then 50ms.
>
> What user needs to do to achieve that is just e.g.:
>
> echo "10 1 10 0 20 1 20 0 30 1 30 0" > pattern
>
> Please refer below to my remaining remarks.

But this is not used for gradual dimming, this pattern is used for
constant brightness. According to the ABI, we do not need limit the
duration larger than 50 ms for constant brightness. Only for gradual
dimming, we need limit the duration larger than 50 ms, since the
interval step is 50ms.

But according to your suggestion as below:
> "The tuple with duration less than dimming_interval is treated as
> a step change of brightness, i.e. the subsequent brightness will be
> applied without adding intervening dimming intervals"

For gradual dimming, we also do not need to limit the duration larger
than 50 ms. So below patterns are all valid now:

echo "10 1 10 0 20 1 20 0 30 1 30 0" > pattern
echo "10 1  20 1  30 1 " > pattern


> On 10/02/2018 05:43 PM, Baolin Wang wrote:
>> This patch adds one new led trigger that LED device can configure
>
> s/one new led trigger/a new LED trigger/

Sure.

>
>> the software or hardware pattern and trigger it.
>
> Please change the above line to the following:
>
> to employ software or hardware pattern engine.

Sure.

>
>>
>> Consumers can write 'pattern' file to enable the software pattern
>> which alters the brightness for the specified duration with one
>> software timer.
>>
>> Moreover consumers can write 'hw_pattern' file to enable the hardware
>> pattern for some LED controllers which can autonomously control
>> brightness over time, according to some preprogrammed hardware
>> patterns.
>>
>> Signed-off-by: Raphael Teysseyre <rteysseyre@gmail.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>> ---
>> Changes from v13:
>>  - Add duration validation for gradual dimming.
>>  - Coding style optimization.
>>
>> Changes from v12:
>>  - Add gradual dimming support for software pattern.
>>
>> Changes from v11:
>>  - Change -1 means repeat indefinitely.
>>
>> Changes from v10:
>>  - Change 'int' to 'u32' for delta_t field.
>>
>> Changes from v9:
>>  - None.
>>
>> Changes from v8:
>>  - None.
>>
>> Changes from v7:
>>  - Move the SC27XX hardware patterns description into its own ABI file.
>>
>> Changes from v6:
>>  - Improve commit message.
>>  - Optimize the description of the hw_pattern file.
>>  - Simplify some logics.
>>
>> Changes from v5:
>>  - Add one 'hw_pattern' file for hardware patterns.
>>
>> Changes from v4:
>>  - Change the repeat file to return the originally written number.
>>  - Improve comments.
>>  - Fix some build warnings.
>>
>> Changes from v3:
>>  - Reset pattern number to 0 if user provides incorrect pattern string.
>>  - Support one pattern.
>>
>> Changes from v2:
>>  - Remove hardware_pattern boolen.
>>  - Chnage the pattern string format.
>>
>> Changes from v1:
>>  - Use ATTRIBUTE_GROUPS() to define attributes.
>>  - Introduce hardware_pattern flag to determine if software pattern
>>  or hardware pattern.
>>  - Re-implement pattern_trig_store_pattern() function.
>>  - Remove pattern_get() interface.
>>  - Improve comments.
>>  - Other small optimization.
>> ---
>>  .../ABI/testing/sysfs-class-led-trigger-pattern    |  76 ++++
>>  drivers/leds/trigger/Kconfig                       |   7 +
>>  drivers/leds/trigger/Makefile                      |   1 +
>>  drivers/leds/trigger/ledtrig-pattern.c             | 431 +++++++++++++++++++++
>>  include/linux/leds.h                               |  15 +
>>  5 files changed, 530 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>>  create mode 100644 drivers/leds/trigger/ledtrig-pattern.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>> new file mode 100644
>> index 0000000..22d7af7
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>> @@ -0,0 +1,76 @@
>> +What:                /sys/class/leds/<led>/pattern
>> +Date:                September 2018
>> +KernelVersion:       4.20
>> +Description:
>> +             Specify a software pattern for the LED, that supports altering
>> +             the brightness for the specified duration with one software
>> +             timer. It can do gradual dimming and constant brightness.
>
> s/constant brightness/step change of brightness/

OK.

>
>> +
>> +             The pattern is given by a series of tuples, of brightness and
>> +             duration (ms). The LED is expected to traverse the series and
>> +             each brightness value for the specified duration. Duration of
>> +             0 means brightness should immediately change to new value.
>> +
>> +             1. When doing gradual dimming, the led brightness will be updated
>> +             every 50 milliseconds, so the duration of each step should not
>> +             less than 50 milliseconds. The gradual dimming format of the
>> +             software pattern values should be:
>
> Despite I pronounced the dimming_interval as only a "nice to have"
> feature, now it looks to me to be really useful to have it included in
> this patch. For the reasons below:
>
> 1) You could refer directly to the dimming_interval here.
> 2) I've been wondering how to treat the case when user requests the
>    interval less than dimming_interval. In v13 you were skipping such
>    tuple, and in v14 you're not allowing for it at all. How about,
>    instead of the two above approaches, describe such a case as:
>
> "The tuple with duration less than dimming_interval is treated as
> a step change of brightness, i.e. the subsequent brightness will be
> applied without adding intervening dimming intervals"

Good point. I will implement it in next version. So we will not limit
the duration larger than dimming_interval (50ms).

But according to Pavel's suggestion (I also agree with his points), we
can keep it simple now and leave the feature introducing the
'dimming_interval' file until someone complains 50ms interval should
be adjusted.

>
>> +             "brightness_1 duration_1 brightness_2 duration_2 brightness_3
>> +             duration_3 ...". For example:
>> +
>> +             echo 0 1000 255 2000 > pattern
>> +
>> +             It will make the LED go gradually from zero-intensity to max (255)
>> +             intensity in 1000 milliseconds, then back to zero intensity in 2000
>> +             milliseconds:
>> +
>> +             LED brightness
>> +                 ^
>> +             255-|       / \            / \            /
>> +                 |      /    \         /    \         /
>> +                 |     /       \      /       \      /
>> +                 |    /          \   /          \   /
>> +               0-|   /             \/             \/
>> +                 +---0----1----2----3----4----5----6------------> time (s)
>> +
>> +             2. To make the LED go instantly from one brigntess value to another,
>> +             we should use use zero-time lengths. So the format should be:
>> +             "brightness_1 duration_1 brightness_1 0 brightness_2 duration_2
>> +             brightness_2 0 ...". For example:
>> +
>> +             echo 0 1000 0 0 255 2000 255 0 > pattern
>> +
>> +             It will make the LED stay off for one second, then stay at max brightness
>> +             for two seconds:
>> +
>> +             LED brightness
>> +                 ^
>> +             255-|        +---------+    +---------+
>> +                 |        |         |    |         |
>> +                 |        |         |    |         |
>> +                 |        |         |    |         |
>> +               0-|   -----+         +----+         +----
>> +                 +---0----1----2----3----4----5----6------------> time (s)
>
> I'd also add that writing malformed pattern deactivates any
> active one.

Sure.

>
>> +
>> +What:                /sys/class/leds/<led>/hw_pattern
>> +Date:                September 2018
>> +KernelVersion:       4.20
>> +Description:
>> +             Specify a hardware pattern for the LED, for LED hardware that
>> +             supports autonomously controlling brightness over time, according
>> +             to some preprogrammed hardware patterns.
>> +
>> +             Since different LED hardware can have different semantics of
>> +             hardware patterns, each driver is expected to provide its own
>> +             description for the hardware patterns in their ABI documentation
>> +             file.
>
> Add also:
>
> It deactivates any active software pattern.

Sure.

>> +struct pattern_trig_data {
>> +     struct led_classdev *led_cdev;
>> +     struct led_pattern patterns[MAX_PATTERNS];
>> +     struct led_pattern *curr;
>> +     struct led_pattern *next;
>> +     struct mutex lock;
>> +     u32 npatterns;
>> +     int repeat;
>> +     int last_repeat;
>> +     int delta_t;
>> +     bool is_indefinite;
>> +     bool is_hw_pattern;
>> +     struct timer_list timer;
>> +};
>> +
>> +static void pattern_trig_update_patterns(struct pattern_trig_data *data)
>> +{
>> +     data->curr = data->next;
>> +     if (!data->is_indefinite && data->curr == data->patterns)
>> +             data->repeat--;
>> +
>> +     if (data->next == data->patterns + data->npatterns - 1)
>> +             data->next = data->patterns;
>> +     else
>> +             data->next++;
>> +
>> +     data->delta_t = 0;
>> +}
>> +
>> +static int pattern_trig_compute_brightness(struct pattern_trig_data *data)
>> +{
>> +     int step_brightness;
>> +
>> +     if (data->delta_t == 0)
>> +             return data->curr->brightness;
>> +
>> +     step_brightness = abs(data->next->brightness - data->curr->brightness);
>> +     step_brightness = data->delta_t * step_brightness / data->curr->delta_t;
>> +
>> +     if (data->next->brightness > data->curr->brightness)
>> +             return data->curr->brightness + step_brightness;
>> +     else
>> +             return data->curr->brightness - step_brightness;
>> +}
>> +
>> +static void pattern_trig_timer_function(struct timer_list *t)
>> +{
>> +     struct pattern_trig_data *data = from_timer(data, t, timer);
>> +
>> +     mutex_lock(&data->lock);
>> +
>> +     for (; ;) {
>> +             if (!data->is_indefinite && !data->repeat)
>> +                     break;
>> +
>> +             if (data->curr->brightness == data->next->brightness) {
>> +                     /* Constant brightness */
>> +                     led_set_brightness(data->led_cdev,
>> +                                        data->curr->brightness);
>> +                     mod_timer(&data->timer,
>> +                               jiffies + msecs_to_jiffies(data->curr->delta_t));
>> +
>> +                     /* Skip the step with zero duration */
>> +                     pattern_trig_update_patterns(data);
>> +                     /* Select next step */
>> +                     pattern_trig_update_patterns(data);
>> +                     break;
>> +             } else {
>> +                     /* Gradual dimming */
>> +
>> +                     /*
>> +                      * If the accumulation time is larger than current
>> +                      * step duration, we should go next one and re-check
>> +                      * if we repeated done.
>> +                      */
>> +                     if (data->delta_t > data->curr->delta_t) {
>> +                             pattern_trig_update_patterns(data);
>> +                             continue;
>> +                     }
>> +
>> +                     led_set_brightness(data->led_cdev,
>> +                                        pattern_trig_compute_brightness(data));
>> +                     mod_timer(&data->timer,
>> +                               jiffies + msecs_to_jiffies(UPDATE_INTERVAL));
>> +                     /* Accumulate the gradual dimming time */
>> +                     data->delta_t += UPDATE_INTERVAL;
>> +                     break;
>> +             }
>> +     }
>> +
>> +     mutex_unlock(&data->lock);
>> +}
>> +
>> +static bool pattern_trig_is_sane(struct pattern_trig_data *data)
>> +{
>> +     int i;
>> +
>> +     /* At least 2 steps for software pattern. */
>> +     if (data->npatterns < 2)
>> +             return false;
>> +
>> +     /*
>> +      * No need valid the duration for constant brightness, just
>
> s/No need valid/No need to validate/

OK.

>
>> +      * return true.
>> +      */
>> +     if (data->patterns[0].brightness == data->patterns[1].brightness)
>> +             return true;
>
> Hmm, this should be covered in the ABI documentation.

OK.

>
>> +     /*
>> +      * Should valid the duration if is less than 50 ms for gradual
>> +      * dimming mode.
>> +      */
>> +     for (i = 0; i < data->npatterns; i++) {
>> +             if (data->patterns[i].delta_t < UPDATE_INTERVAL)
>> +                     return false;
>> +     }
>
> And this could be skipped, provided we will agree on treating delta_t
> less than dimming_interval as step brightness change.

Yes. Will remove this logic here and I think the
pattern_trig_is_sane() is redundant now which can be removed too.
Thanks for your comments.

-- 
Baolin Wang
Best Regards
