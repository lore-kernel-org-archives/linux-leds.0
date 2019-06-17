From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Mon, 17 Jun 2019 13:03:14 -0700
Message-ID: <20190617200314.GT137143@google.com>
References: <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
 <20190611223019.GH137143@google.com>
 <20190612110325.xdn3q2aod52oalge@holly.lan>
 <20190612192642.GK137143@google.com>
 <20190617130150.GA21113@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617130150.GA21113@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Brian Norris <briannorris@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, kernel@collabora.com
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On Mon, Jun 17, 2019 at 03:01:51PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > Certainly "linear" (this device will work more or less correctly if the
> > > userspace applies perceptual curves). Not sure about logarithmic since
> > > what is actually useful is something that is "perceptually linear"
> > > (logarithmic is merely a way to approximate that).
> > > 
> > > I do wonder about a compatible string like most-detailed to
> > > least-detailed description. This for a PWM with the auto-generated
> > > tables we'd see something like:
> > > 
> > > cie-1991,perceptual,non-linear
> > > 
> > > For something that is non-linear but we are not sure what its tables are
> > > we can offer just "non-linear".
> > 
> > Thanks for the feedback!
> > 
> > It seems clear that we want a string for the added flexibility. I can
> > work on a patch with the compatible string like description you
> > suggested and we can discuss in the review if we want to go with that
> > or prefer something else.
> 
> Compatible-like string seems overly complicated.

I see the merit in the sense that it allows to provide more precision
for if userspace wants/needs it, without requiring userspace to know all
possible (future) options. If userspace wants to keep things simple it
can just check for check for "s == 'non-linear'" and
"s.ends_with(',non-linear')"

In any case, I posted a first version of the patch:

https://lore.kernel.org/patchwork/patch/1088760/

Maybe best to center the discussion there?

> > > Instead one valid value for the sysfs should be "unknown" and this be
> > > the default for drivers we have not analysed (this also makes it easy to
> > > introduce change here).
> > 
> > An "unknown" value sounds good, it allows userspace to just do what it
> > did/would hace done before this attribute existed.
> 
> What about simply not presenting the attribute when we don't have the
> information?

I'm open to either, I mentioned it earlier and Daniel seemed to prefer
the 'unknown' value so I went with it in the first version (it's also
slightly less code).

Cheers

Matthias
