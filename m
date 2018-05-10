From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 2/2] leds: Add Spreadtrum SC27xx breathing light
 controller driver
Date: Thu, 10 May 2018 11:12:32 +0800
Message-ID: <CAMz4kuLYP1aHTAsgN0rkqV8Zj12V4-d1pECTn8x537a9fLRndw@mail.gmail.com>
References: <f393ca5a99059e7086307b99fc435777fe09018b.1525757122.git.baolin.wang@linaro.org>
 <9a2a07b8eb313ae3ba64af911337ee7ff7c9ad43.1525757122.git.baolin.wang@linaro.org>
 <20180509142539.GB25131@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509142539.GB25131@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, xiaotong.lu@spreadtrum.com, Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org, DTML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 9 May 2018 at 22:25, Pavel Machek <pavel@ucw.cz> wrote:
> On Tue 2018-05-08 13:39:45, Baolin Wang wrote:
>> From: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
>>
>> This patch adds Spreadtrum SC27xx PMIC series breathing light controller
>> driver, which can support 3 LEDs. Each LED can work at normal PWM mode
>> and breathing mode.
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
>> new file mode 100644
>> index 0000000..22166fb
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
>> @@ -0,0 +1,19 @@
>> +What:                /sys/class/leds/<led>/rise_time
>> +What:                /sys/class/leds/<led>/high_time
>> +What:                /sys/class/leds/<led>/fall_time
>> +What:                /sys/class/leds/<led>/low_time
>> +Date:                May 2018
>> +KernelVersion:       4.18
>> +Contact:     Xiaotong Lu <xiaotong.lu@spreadtrum.com>
>> +Description:
>> +             Set the pattern generator rise, high, fall and low
>> +             times (0..63). It's unit is 0.125s, it should be > 0.
>> +
>> +             1 - 125 ms
>> +             2 - 250 ms
>> +             3 - 375 ms
>> +             ...
>> +             ...
>> +             ...
>> +             62 - 7.75 s
>> +             63 - 7.875 s
>
> How does this interact with triggers? With manually setting
> brightness? Are the pattern generators independend for the LEDs?

With depending on what mode user selected. If user set the
raise/high/fall/low time values, that means the LED will work at
breathing mode, and we set brightness to turn on/off the breathing
mode LED.

Yes, they are independent for each LED.

>
> Can you generate white breathing pattern? If so, how?

Yes, firstly we should set the raise/high/fall/low time values for red
LED, blue LED and green LED (each LED time values are same), then set
one brightness value to turn on the red LED, blue LED and green LED.

>
> How do you select between normal and breathing modes?

As I explained, when user set the raise/high/fall/low time values,
that means user selects the breathing mode of the LED. Otherwise the
LED works at normal mode.

>
> I'd specify times in miliseconds or something, this is way too
> hardware specific.

But our hardware specification defines magic numbers, not times values
in milliseconds. So I think we should follow our specification's
definition, and user should also follow the same rules.

>
> Now... functionality like this is common between many LED
> controllers. N900 could do this kind of "breathing", too, and it also
> supports other patterns.
>
> I believe we need interface common between different LED controllers.
>
> And I guess it would be easiest if you dropped this part from initial
> merge.
>
> Thanks and best regards,
>
>                                                                 Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



-- 
Baolin.wang
Best Regards
