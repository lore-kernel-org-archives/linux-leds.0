From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v14 1/2] leds: core: Introduce LED pattern trigger
Date: Wed, 3 Oct 2018 09:21:19 +0800
Message-ID: <CAMz4kuJ4iB7pn+i29aypnbxxPK_UDjus=EiNZ2WefBB0onZPTg@mail.gmail.com>
References: <c3a6f08ac978c309bb0b002a0384c4f0ad0f59cd.1538494476.git.baolin.wang@linaro.org>
 <9bf6236e-83af-7156-b26b-7d88ece2d81e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9bf6236e-83af-7156-b26b-7d88ece2d81e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 3 October 2018 at 04:25, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> Hi Baolin,
>
> Thank you for the v14. We'll probably need v15, though :-)
>
> I added the comments in the code below.
>
> On 10/02/2018 05:43 PM, Baolin Wang wrote:
>> This patch adds one new led trigger that LED device can configure
>> the software or hardware pattern and trigger it.
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
>> +
>> +             The pattern is given by a series of tuples, of brightness and
>> +             duration (ms). The LED is expected to traverse the series and
>> +             each brightness value for the specified duration. Duration of
>> +             0 means brightness should immediately change to new value.
>> +
>> +             1. When doing gradual dimming, the led brightness will be updated
>> +             every 50 milliseconds, so the duration of each step should not
>> +             less than 50 milliseconds.
>
> I'd like to avoid this constraint. Lowest supported delta_t should be 1.
>
> We should only prevent entering dimming mode if current delta_t
> is lower than UPDATE_INTERVAL.

I do not think so. If the pattern format is used for dimming and the
delta_t is lower than UPDATE_INTERVAL, we should return errors. Since
in this case, we can not change to constant mode.

Like you mentioned:

echo "10 49 20 49" > pattern

We can not enter dimming, meanwhile the pattern format is not used for
constant brightness, so should return errors for the invalid pattern
values.

> I also propose to make the dimming interval configurable via sysfs
> dimming_interval file.

So the dimming_interva range is [1, 50] milliseconds?

I am fine with this. Pavel, do you also agree with adding one new file
to set the dimming interval or keep it as simple now?

>
>> The gradual dimming format of the
>> +             software pattern values should be:
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
>> +
>> +What:                /sys/class/leds/<led>/repeat
>> +Date:                September 2018
>> +KernelVersion:       4.20
>> +Description:
>> +             Specify a pattern repeat number. -1 means repeat indefinitely,
>> +             other negative numbers and number 0 are invalid.
>> +
>> +             This file will always return the originally written repeat
>> +             number.
>> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
>> index 4018af7..b76fc3c 100644
>> --- a/drivers/leds/trigger/Kconfig
>> +++ b/drivers/leds/trigger/Kconfig
>> @@ -129,4 +129,11 @@ config LEDS_TRIGGER_NETDEV
>>         This allows LEDs to be controlled by network device activity.
>>         If unsure, say Y.
>>
>> +config LEDS_TRIGGER_PATTERN
>> +     tristate "LED Pattern Trigger"
>> +     help
>> +       This allows LEDs to be controlled by a software or hardware pattern
>> +       which is a series of tuples, of brightness and duration (ms).
>> +       If unsure, say N
>> +
>>  endif # LEDS_TRIGGERS
>> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
>> index f3cfe19..9bcb64e 100644
>> --- a/drivers/leds/trigger/Makefile
>> +++ b/drivers/leds/trigger/Makefile
>> @@ -13,3 +13,4 @@ obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)        += ledtrig-transient.o
>>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)    += ledtrig-camera.o
>>  obj-$(CONFIG_LEDS_TRIGGER_PANIC)     += ledtrig-panic.o
>>  obj-$(CONFIG_LEDS_TRIGGER_NETDEV)    += ledtrig-netdev.o
>> +obj-$(CONFIG_LEDS_TRIGGER_PATTERN)   += ledtrig-pattern.o
>> diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
>> new file mode 100644
>> index 0000000..92a0fd0
>> --- /dev/null
>> +++ b/drivers/leds/trigger/ledtrig-pattern.c
>> @@ -0,0 +1,431 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * LED pattern trigger
>> + *
>> + * Idea discussed with Pavel Machek. Raphael Teysseyre implemented
>> + * the first version, Baolin Wang simplified and improved the approach.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +#include <linux/timer.h>
>> +
>> +#define MAX_PATTERNS         1024
>> +/*
>> + * When doing gradual dimming, the led brightness will be updated
>> + * every 50 milliseconds.
>> + */
>> +#define UPDATE_INTERVAL              50
>> +
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
>
> This whitespace between semicolons looks odd. Please remove it.

Sure.

>
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
>
> Why two "break" statements instead of one here?

Yes, can remove one. Sorry for the quick version patch set without
much self-checking in the night. Thanks for your comments.

-- 
Baolin Wang
Best Regards
