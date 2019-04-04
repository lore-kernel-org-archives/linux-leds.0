From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Thu, 4 Apr 2019 13:07:39 -0700
Message-ID: <CAE_wzQ_4Jb+4dDTFGQ7+sbQ-M8Qm8U_k7ug2DoZKKjTbf6pPTQ@mail.gmail.com>
References: <20190308203801.57920-1-ncrews@chromium.org> <20190308210843.GA16125@amd>
 <CAHX4x85=_76=Kyepf3Nw++4yVKOZujhLsonzaicZOnY5fi-Pfw@mail.gmail.com>
 <20190404112415.GB18653@amd> <CAE_wzQ96MkKb7uSoVBNkOZexevUKPf4jHyQZneg7YNCEs7SHfQ@mail.gmail.com>
 <20190404190326.GC27340@amd> <CAE_wzQ8mr1OMKB+ASfsCdGcs70YrzEMN4Htfg1+O51=ByhXchw@mail.gmail.com>
 <20190404192331.GB29984@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404192331.GB29984@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Nick Crews <ncrews@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Daniel Erat <derat@google.com>, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 4, 2019 at 12:23 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > > > Yeah, well, we not let the cros_kbd_led_backlight.c use chromeos:: in
> > > > > the first place. But it happened. We want all backlights for the
> > > > > system keyboard to use common name, and "chromeos" is not really
> > > > > suitable for that. "platform" is.
> > > >
> > > > Pavel, who exactly wants this and why? Looking at today's -next I see:
> > > >
> > > > dtor@dtor-ws:~/kernel/linux-next ((next-20190404))$ git grep
> > > > "::kbd_backlight" | wc -l
> > > > 18
> > > > dtor@dtor-ws:~/kernel/linux-next ((next-20190404))$ git grep
> > > > "platform::kbd_backlight" | wc -l
> > > > 0
> > > >
> > > > so there isn't a single instance of "platform::kbd_backlight" and we
> > > > definitely not changing existing names.
> > >
> > > Yeah, we made mistakes in the past. We _don't_ want userspace to have
> > > ever growing list of names for userspace to follow.
> > >
> > > Backlight of internal keyboard is pretty common concept and there
> > > should be one name for it.
> >
> > It is the *function* that is interesting to userspace, not full name,
> > and we have proper standardization there.
>
> Well, if full name is not interesting, as you argue, why do we have
> this discussion?

Because I need to understand why you believe that device name for
kbd_backlight matters, and having wilco::kbd_backlight is a bad idea,
but, for example, having max77650::kbd_backlight is perfectly fine if
somebody decided to wire it in this way.

Thanks.

-- 
Dmitry
