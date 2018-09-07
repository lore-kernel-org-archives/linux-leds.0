From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v10 2/2] leds: sc27xx: Add pattern_set/clear interfaces
 for LED controller
Date: Fri, 7 Sep 2018 10:51:04 +0800
Message-ID: <CAMz4kuKVqmHgq6h3Oj=5HmfXNv9SefOM0g9Y6gSqTJ6Bq=H0Vg@mail.gmail.com>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536200860.git.baolin.wang@linaro.org>
 <975a9570c75fb4469c0cef55cc9ed42266f933af.1536200860.git.baolin.wang@linaro.org>
 <20180906211605.GA16899@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906211605.GA16899@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 7 September 2018 at 05:16, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
>> new file mode 100644
>> index 0000000..d8056d5
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
>> @@ -0,0 +1,22 @@
>> +What:                /sys/class/leds/<led>/hw_pattern
>> +Date:                September 2018
>> +KernelVersion:       4.20
>> +Description:
>> +             Specify a hardware pattern for the SC27XX LED. For the SC27XX
>> +             LED controller, it only supports 4 stages to make a single
>> +             hardware pattern, which is used to configure the rise time,
>> +             high time, fall time and low time for the breathing mode.
>> +
>> +             For the breathing mode, the SC27XX LED only expects one brightness
>> +             for the high stage. To be compatible with the hardware pattern
>> +             format, we should set brightness as 0 for rise stage, fall
>> +             stage and low stage.
>> +
>> +             Min stage duration: 125 ms
>> +             Max stage duration: 31875 ms
>> +
>> +             Since the stage duration step is 125 ms, the duration must be
>> +             a multiplier of 125, like 125ms, 250ms, 375ms, 500ms ... 31875ms.
>> +
>> +             Thus the format of the hardware pattern values should be:
>> +             "0 rise_duration brightness high_duration 0 fall_duration 0 low_duration".
>
> If I'm not mistaken, this is:
>
>                 "0 rise_duration brightness high_duration brightness
>                 fall_duration 0 low_duration".
>
> Right?

Hmmm, for SC27XX led, there is no need to set brightness for rise and
fall stage.

>
> With that fixed:
>
> Acked-by: Pavel Machek <pavel@ucw.c>

Thanks.

-- 
Baolin Wang
Best Regards
