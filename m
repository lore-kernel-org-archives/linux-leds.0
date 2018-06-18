From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] leds: ledtrig-activity: use ktime_get_boot_ns()
Date: Mon, 18 Jun 2018 17:47:28 +0200
Message-ID: <CAK8P3a1K19WoEGaqrj6Fx0GYyj1jmA50dS+dMJuF7ugkwjCiug@mail.gmail.com>
References: <20180618144210.72367-1-arnd@arndb.de> <20180618150715.GA30470@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618150715.GA30470@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, y2038 Mailman List <y2038@lists.linaro.org>, Kees Cook <keescook@chromium.org>, Willy Tarreau <w@1wt.eu>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Jun 18, 2018 at 5:07 PM, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> get_monotonic_boottime() is deprecated, so let's convert this to
>> the simpler ktime_get_boot_ns().
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Have you tested it?

No, only build-tested.

>> diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
>> index 5081894082bd..589c1bc4d0b9 100644
>> --- a/drivers/leds/trigger/ledtrig-activity.c
>> +++ b/drivers/leds/trigger/ledtrig-activity.c
>> @@ -37,7 +37,6 @@ static void led_activity_function(struct timer_list *t)
>>       struct activity_data *activity_data = from_timer(activity_data, t,
>>                                                        timer);
>>       struct led_classdev *led_cdev = activity_data->led_cdev;
>> -     struct timespec boot_time;
>>       unsigned int target;
>>       unsigned int usage;
>>       int delay;
>> @@ -57,7 +56,7 @@ static void led_activity_function(struct timer_list *t)
>>               return;
>>       }
>>
>> -     get_monotonic_boottime(&boot_time);
>> +     curr_boot = ktime_get_boot_ns();
>>
>>       cpus = 0;
>>       curr_used = 0;
>> @@ -76,7 +75,6 @@ static void led_activity_function(struct timer_list *t)
>>        * down to 16us, ensuring we won't overflow 32-bit computations below
>>        * even up to 3k CPUs, while keeping divides cheap on smaller systems.
>>        */
>> -     curr_boot = timespec_to_ns(&boot_time) * cpus;
>
> Original code is pretty weird (notice the * cpus), so I'm
> double-checking.

Ok, dropping the *cpus was not intentional, I'll repost a version that puts
it that back. Thanks for pointing this out!

       Arnd
