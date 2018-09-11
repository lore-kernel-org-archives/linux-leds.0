From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v8 1/2] leds: core: Introduce LED pattern trigger
Date: Tue, 11 Sep 2018 09:22:25 +0800
Message-ID: <CAMz4ku+Q+hLOOPJ_GFb81gFwAE1=dG=4kVAqZineEA-EETbZXA@mail.gmail.com>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536027873.git.baolin.wang@linaro.org>
 <20180908050208.GY2523@minitux> <0190dc10-99a3-abb7-b196-a537c49a2b6e@gmail.com>
 <CAMz4kuK=t9t0nZaVHguv_BVH5WKTDvxPrxCjPrpws9=VV_57ag@mail.gmail.com> <20180910212051.GB4697@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910212051.GB4697@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 11 September 2018 at 05:20, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> >> I'm still convinced that this will confuse our users and to me it would
>> >> be more logical if this denotes the number of times the pattern should
>> >> be repeated, with e.g. negative numbers denoting infinite.
>> >
>> > Sounds reasonable. Let's change this semantics as you propose.
>> >
>> >> In particular I expect to have to explain why my driver expects that you
>> >> write 0 in the file named "repeat" to make it repeat and 1 to make it
>> >> not repeat.
>>
>> Hm, so there are some cases we need to make clear.
>> 1) If negative numbers present infinite, so what's the meaning of number 0?
>> 2) What we should show for users if repeat number is negative, just
>> show negative numbers or one string "infinite"?
>
> I'd say just -1 is infinite, anything else is error.
>
> And yes, reading it should just display -1.

OK. Thanks.

-- 
Baolin Wang
Best Regards
