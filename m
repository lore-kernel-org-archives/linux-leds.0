From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v14 1/2] leds: core: Introduce LED pattern trigger
Date: Thu, 11 Oct 2018 10:05:58 +0800
Message-ID: <CAMz4kuKAafWqf4VZ4vwJoZeUi2g+m7drEZettqd2UzXvOn4Vxg@mail.gmail.com>
References: <c3a6f08ac978c309bb0b002a0384c4f0ad0f59cd.1538494476.git.baolin.wang@linaro.org>
 <9bf6236e-83af-7156-b26b-7d88ece2d81e@gmail.com> <20181010160041.GA22121@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010160041.GA22121@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 11 October 2018 at 00:00, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
> [Oops. I wrote this but forgot to send it? Anyway.. I guess it is
> redundant now.]
>
>> > +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>> > @@ -0,0 +1,76 @@
>> > +What:              /sys/class/leds/<led>/pattern
>> > +Date:              September 2018
>> > +KernelVersion:     4.20
>> > +Description:
>> > +           Specify a software pattern for the LED, that supports altering
>> > +           the brightness for the specified duration with one software
>> > +           timer. It can do gradual dimming and constant brightness.
>> > +
>> > +           The pattern is given by a series of tuples, of brightness and
>> > +           duration (ms). The LED is expected to traverse the series and
>> > +           each brightness value for the specified duration. Duration of
>> > +           0 means brightness should immediately change to new value.
>> > +
>> > +           1. When doing gradual dimming, the led brightness will be updated
>> > +           every 50 milliseconds, so the duration of each step should not
>> > +           less than 50 milliseconds.
>>
>> I'd like to avoid this constraint. Lowest supported delta_t should be 1.
>>
>> We should only prevent entering dimming mode if current delta_t
>> is lower than UPDATE_INTERVAL.
>
> I agree that documenting it like this is strange. I don't think this
> should be part of ABI as we may want to adjust it in the future.
>
>> I also propose to make the dimming interval configurable via sysfs
>> dimming_interval file.
>
> I believe we should provide "right" dimming_interval. 50msec sounds
> good. If we find it is too low / too high, we might want to adjust it.
>
> If we find out that different users need different values, I guess we
> can still add "dimming_interval" knob, but I'd suggest waiting until
> such need arises.
>
> [Now, I don't have strong feelings here, and patch would probably be
> okay with me even if it has dimming_interval, but I'd prefer to keep
> it simple. We are at v14 of the patch...]

Make sense. I will leave this feature until someone has the
dimming_interval adjustment. Thanks.

-- 
Baolin Wang
Best Regards
