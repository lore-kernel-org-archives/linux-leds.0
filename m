From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Tue, 25 Sep 2018 19:24:03 +0800
Message-ID: <CAMz4kuL-MeTuYjADGU+ajczwtnidQ54wEgctBQN_PC28-7gszQ@mail.gmail.com>
References: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
 <20180924235452.GI2523@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924235452.GI2523@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 25 September 2018 at 07:54, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 10 Sep 19:47 PDT 2018, Baolin Wang wrote:
> [..]
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> [..]
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
>
> This captures the infinite case much better, thanks!
>
> Given that 0 is described as invalid, does this imply that setting a new
> pattern the repeat will be disabled? And hence if my hardware supports
> only infinite or no-repeat setting a new pattern is the way to disable
> further repeats (rather than just setting repeat = 0)?

It won't. A new pattern setting will not affect your infinite or
no-repeat setting.

> Regardless, I believe the semantics of these two files will work fine
> for my Qualcomm LPG driver.

Thanks.

-- 
Baolin Wang
Best Regards
