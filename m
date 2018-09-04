From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v7 1/2] leds: core: Introduce LED pattern trigger
Date: Tue, 4 Sep 2018 10:05:06 +0800
Message-ID: <CAMz4kuJwnD1B-5X-pPDbf1vCj7-VQNdX9F+EPCj9VWg2G-vPLQ@mail.gmail.com>
References: <e6d4e7be537a4e4d6fce26c6d446703b1910eab9.1535700092.git.baolin.wang@linaro.org>
 <ef266d4a-ba0e-cba6-ae30-ebbf730e28a2@gmail.com> <20180903215323.GA21489@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903215323.GA21489@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 4 September 2018 at 05:53, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> > +static int pattern_trig_start_pattern(struct led_classdev *led_cdev)
>> > +{
>> > +   struct pattern_trig_data *data = led_cdev->trigger_data;
>> > +
>> > +   if (!data->npatterns)
>> > +           return 0;
>> > +
>> > +   if (data->is_hw_pattern) {
>> > +           return led_cdev->pattern_set(led_cdev, data->patterns,
>> > +                                        data->npatterns, data->repeat);
>> > +   }
>>
>> I have doubts here if it is a good idea to enforce array of tuples
>> as a generic interface for all hw_patterns. It may not fit well for
>> every hw pattern engine. It seems that the only feasible solution will
>> be allowing drivers to come up with their own interfaces, i.e. the
>> approach you proposed at first for your driver. It seems that the
>> ledtrig-pattern with software pattern mechanism will be just
>> a nice side effect of this series :-)
>>
>> Unless someone will propose a better solution.
>
> I believe array of tuples will work for everyone. It is just a LED, it
> can change intensity over time.
>
>> We need a broader consensus here. I'd like to hear Pavel's opinion,
>> since he's been always in favor of common pattern interface, and
>> inspired this work.
>
> I believe Baolin did good work here. I believe it will cover most, if
> not all, hardware engines out there. I think we should merge it, and
> see what happens -- it should be good enough.
>
> (Yes, there's still more work to do, but that will be stuff like RGB
> LED synchronization.)
>
> (And yes, one of the LED chip has pattern engine that can compute
> prime numbers on its own. I don't expect to support
> _that_. Fortunately, nobody but me is likely to want that pattern, so
> we are still okay :-)

Thanks for your explanation here. So I think I should keep the same
logics in next version.

-- 
Baolin Wang
Best Regards
