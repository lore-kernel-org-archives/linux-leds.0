From: Nick Crews <ncrews@chromium.org>
Subject: Re: [PATCH 3/3] platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Fri, 22 Mar 2019 09:49:57 -0600
Message-ID: <CAHX4x85L_WONddW3gCUBm4d99xD8AEUfrh8JFd=gn3m7wyF6Lg@mail.gmail.com>
References: <20190321221334.240059-3-ncrews@chromium.org> <20190322113509.GE8681@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322113509.GE8681@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>, Guenter Roeck <groeck@google.com>, Dmitry Torokhov <dtor@google.com>, Simon Que <sque@google.com>
List-Id: linux-leds@vger.kernel.org

On Fri, Mar 22, 2019 at 5:35 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > The EC is in charge of controlling the keyboard backlight on
> > the Wilco platform. We expose a standard LED class device at
> > /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> > after the standard Chrome OS keyboard backlight driver at
> > drivers/platform/chrome/cros_kbd_led_backlight.c
>
> Please make it platform::kbd_backlight . Userland should not need to
> know what wilco is...

The corresponding device for normal chromeos devices is
"chromeos::kbd_backlight". I wanted to differentiate this device from
that one, so I thought that "wilco" a similar level of specific-ness as
"chromeos". Using "platform" seems too general. The power manager
daemon that controls the backlight just searches for LEDs ending with
"*:kbd_backlight" so it should work for that, and I figured any user just
browsing through sysfs would be able to guess what the LED does.

This is maybe a question for those who will need to maintain the
Chrome OS system after adding this? Could some more
Chrome OS-specific people chime in on this? I also CC'ed Simon
Que, the author of the original driver (Simon, we are talking about
https://lkml.org/lkml/2019/3/21/999)

>
> What is wilco, anyway?

Wilco is a new Chrome OS device which does not use the same embedded
controller as the rest of the Chrome OS ecosystem. Thus, we need this new
driver because the old one will not be compatible.

>
>                                                                         Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
