From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v5 2/3] platform/chrome: Add Wilco EC keyboard backlight
 LEDs support
Date: Sun, 7 Apr 2019 14:46:28 -0700
Message-ID: <CAE_wzQ9WG1+K1ZzVoii8ukDe_g+4Ha0bh6YvsRhceinwPjC+Kw@mail.gmail.com>
References: <20190404171007.160878-1-ncrews@chromium.org> <20190404171007.160878-2-ncrews@chromium.org>
 <20190405201534.GA4426@roeck-us.net> <20190406084157.GA27043@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406084157.GA27043@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Guenter Roeck <linux@roeck-us.net>, Nick Crews <ncrews@chromium.org>, enric.balletbo@collabora.com, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, alexandre.belloni@bootlin.com, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, dlaurie@chromium.org, sjg@google.com, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

On Sat, Apr 6, 2019 at 1:41 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Fri 2019-04-05 13:15:34, Guenter Roeck wrote:
> > On Thu, Apr 04, 2019 at 11:10:08AM -0600, Nick Crews wrote:
> > > The EC is in charge of controlling the keyboard backlight on
> > > the Wilco platform. We expose a standard LED class device at
> > > /sys/class/leds/platform::kbd_backlight. This driver is modeled
> > > after the standard Chrome OS keyboard backlight driver at
> > > drivers/platform/chrome/cros_kbd_led_backlight.c
> > >
> > > Some Wilco devices do not support a keyboard backlight. This
> > > is checked via wilco_ec_keyboard_leds_exist() in the core driver,
> > > and a platform_device will only be registered by the core if
> > > a backlight is supported.
> > >
> > > After an EC reset the backlight could be in a non-PWM mode.
> > > Earlier in the boot sequence the BIOS should send a command to
> > > the EC to set the brightness, so things **should** be set up,
> > > but we double check in probe() as we query the initial brightness.
> > > If not set up, then set the brightness to 0.
> > >
> > > Since the EC will never change the backlight level of its own accord,
> > > we don't need to implement a brightness_get() method.
> > >
> > > v5 changes:
> > > -Rename the LED device to "platform::kbd_backlight", to
> > > denote that this is the built-in system keyboard.
> > >
> >
> > NACK.
>
> Please keep it as it is, it is okay.
>
> > Per Documentation/leds/leds-class.txt, LED devices are named
> >       "devicename:colour:function"
>
> You failed to follow threads explaining this is being changed, even
> when I pointed you at them. What you are doing here is not helpful.

Pavel, what I find is unhelpful is you requiring to conform to the new
rules that have not been accepted yet and for which there clearly are
objections. You keep ignoring all the issues that we continue to point
out with your proposed scheme.

I will go and try to reply to Jacek's thread, but it is my firm belief
that changing naming scheme is not what we need to do here.

>
> > This document also states "The naming scheme above leaves scope
> > for further attributes should they be needed". It does not permit,
> > however, to redefine one of the fields to mean "location", much less
> > the declaration that a devicename of "platform" shall refer to an
> > "internal" backlight, or that there shall be no more than one
> > "internal" backlight in a given system.
>
> "platform" is as good devicename as "wilco" or "chromeos".

No, because "platform" is not a device, it is something that you are
trying to assign a magic meaning to.

Thanks.

-- 
Dmitry
