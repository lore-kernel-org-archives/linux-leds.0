From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Thu, 4 Apr 2019 09:13:27 -0700
Message-ID: <CAE_wzQ96MkKb7uSoVBNkOZexevUKPf4jHyQZneg7YNCEs7SHfQ@mail.gmail.com>
References: <20190308203801.57920-1-ncrews@chromium.org> <20190308210843.GA16125@amd>
 <CAHX4x85=_76=Kyepf3Nw++4yVKOZujhLsonzaicZOnY5fi-Pfw@mail.gmail.com> <20190404112415.GB18653@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404112415.GB18653@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Nick Crews <ncrews@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Daniel Erat <derat@google.com>, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 4, 2019 at 4:24 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Mon 2019-03-11 09:29:06, Nick Crews wrote:
> > Thanks for looking this over. I will fix most of your concerns, but
> > have one question.
> >
> > On Fri, Mar 8, 2019 at 2:08 PM Pavel Machek <pavel@ucw.cz> wrote:
> > >
> > > On Fri 2019-03-08 13:38:02, Nick Crews wrote:
> > > > This patch is meant to be applied on top of the for-next
> > > > branch of the platform/chrome repository, as it uses some of
> > > > the code staged there.
> > > >
> > > > The EC is in charge of controlling the keyboard backlight on
> > > > the Wilco platform. We expose a standard LED class device at
> > > > /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> > > > after the standard Chrome OS keyboard backlight driver at
> > > > drivers/platform/chrome/cros_kbd_led_backlight.c
> > >
> > > Can you make it "platform::kbd_backlight"? We want some consistency
> > > there.
> >
> > The analogous name in the standard driver
> > drivers/platform/chrome/cros_kbd_led_backlight.c is
> > "chromeos::kbd_backlight", and I thought "wilco" was a better
> > substitute for "chromeos" than "platform" would be. What other thing
> > are you saying "platform" would be consistent with?
>
> Yeah, well, we not let the cros_kbd_led_backlight.c use chromeos:: in
> the first place. But it happened. We want all backlights for the
> system keyboard to use common name, and "chromeos" is not really
> suitable for that. "platform" is.

Pavel, who exactly wants this and why? Looking at today's -next I see:

dtor@dtor-ws:~/kernel/linux-next ((next-20190404))$ git grep
"::kbd_backlight" | wc -l
18
dtor@dtor-ws:~/kernel/linux-next ((next-20190404))$ git grep
"platform::kbd_backlight" | wc -l
0

so there isn't a single instance of "platform::kbd_backlight" and we
definitely not changing existing names.

Thanks.

-- 
Dmitry
