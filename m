From: Doug Anderson <dianders@google.com>
Subject: Re: [RFC 0/2] backlight: pwm_bl: support linear brightness to human eye
Date: Thu, 14 Sep 2017 09:01:33 -0700
Message-ID: <CAD=FV=VnrEdbh35TTSOc8-SuicENutXKPBdENumrKZEMLRSRyA@mail.gmail.com>
References: <20170904153504.27963-1-enric.balletbo@collabora.com>
 <239c9153-c0ea-319c-b554-3c727b75c8cd@linaro.org> <000001d32664$db62b2a0$922817e0$@gmail.com>
 <CAD=FV=WohimLMHQTp=iTaggvfoO+yqZTiJZkSdO2UyEr33TRpQ@mail.gmail.com>
 <f6eb109d-96f3-4978-93b0-2b8506189e45@linaro.org> <CAD=FV=W4qH2JzskqU4VsH_1RU687DNsngsBB_zRbUeZRWptkAQ@mail.gmail.com>
 <CAFqH_53hL_UCVQg2p8sdsGaoyWOou9a3Kd5H7MVMVLumH5_cAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqH_53hL_UCVQg2p8sdsGaoyWOou9a3Kd5H7MVMVLumH5_cAg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Lee Jones <lee.jones@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandru M Stan <amstan@chromium.org>
List-Id: linux-leds@vger.kernel.org

Hi,

On Thu, Sep 14, 2017 at 3:46 AM, Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
> Based on this seems reasonable maintain current implementation to not
> break backward compability. Even, I think makes sense improve current
> implementation by adding somekind of piecewise linear concept to the
> brightness levels, similar to Doug's suggestion. So if we want, i.e,
> 256 levels or more, instead of specify the full table in the DT we can
> only specify some points in DT but the driver can expose to userspace
> more steps (how many?) between two brightness levels.

It seems sane to me.  Personally I'd say that if you're using
piecewise linear you just pick a number of levels to expose, perhaps
16383, or 32767, or 65535) and expose that many levels for everyone.
It's possible that bumping the brightness up by "1" will not actually
change a hardware register, but that seems like it would be fine,
right?

Probably you'd want to require some sort of dt change to enable
piecewise linear since it seems plausible that you could break
existing boards if you started interpolating.

> Of course, this
> doesn't makes the live of the future users easier but I think will
> make the live of the current users of this interface more flexible
> (specially when you want lots of levels)
>
> Then, to make the user live easier, there is the thing about human
> perception, we can move brightness-levels to be optional and fall to
> apply the human perception code if it's not specified. Here the thing
> and point of discussion is, if the cie1931 is the right algorithm to
> do the 'magic' in the driver. From what I investigated seems that is
> but I might be wrong.

I don't personally know, so hopefully someone else can comment.


-Doug
