From: Nick Crews <ncrews@chromium.org>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Tue, 12 Mar 2019 10:05:38 -0600
Message-ID: <CAHX4x85Ve+AHvcO1dPN9x6P3X8RV=rSzoWbYp=S-OeDnjGmOaQ@mail.gmail.com>
References: <20190308203801.57920-1-ncrews@chromium.org> <CAE_wzQ-Ds5a9iPuLTpV5mBHBtoUUh_-fRw66s0Su7eOifygqKQ@mail.gmail.com>
 <20190308221307.GB16125@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308221307.GB16125@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dmitry Torokhov <dtor@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, lkml <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Daniel Erat <derat@google.com>, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

> > > Some Wilco devices do not support a keyboard backlight. This
> > > is checked in probe(), and in this case the sysfs entry will
> > > not appear, and everything will behave normally.
> >
> > It would be even better if we did not register platform device if EC
> > does not support backlight.

Good point Dmitry. I would imagine this would entail exposing the
keyboard_leds_exist() function. What is the best practice for doing that?
I could either imagine EXPORT_SYMBOL_GPL()ing that function, but
that would require making the core driver dependent upon this keyboard
backlight driver in a circular dependency, so there would have to be some
refactoring. The other option I see would be to add this entire driver to
the core module.

Just so I learn something, I don't see performance or stability
concerns with adding one unused platform device, is your rationale
that it would just be cleaner code?

> >
> > > +       data->led.brightness_set = keyboard_led_set_brightness;
> > > +       data->led.brightness_get = keyboard_led_get_brightness;
> >
> > wilco_ec_mailbox() may sleep, so you need to assign it to
> > led.brightness_set_blocking.

Yes, thanks for the catch.

>
> Hmm. Seeing get method there... can the EC change the brightness
> without command from kernel?

No, the EC will never do that, good point. Therefore it looks like
I can just remove the get_brightness() function and the core
library will do the right thing.

Thanks,
Nick
