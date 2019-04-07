From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v5 2/3] platform/chrome: Add Wilco EC keyboard backlight
 LEDs support
Date: Sun, 7 Apr 2019 15:26:58 -0700
Message-ID: <CAE_wzQ_5Ha6hNt28_+j-pF3mAdXXifv9CuotDCeXff8KC1DNmA@mail.gmail.com>
References: <20190404171007.160878-1-ncrews@chromium.org> <20190404171007.160878-2-ncrews@chromium.org>
 <20190405201534.GA4426@roeck-us.net> <20190406084157.GA27043@amd>
 <CAE_wzQ9WG1+K1ZzVoii8ukDe_g+4Ha0bh6YvsRhceinwPjC+Kw@mail.gmail.com> <20190407221846.GB6327@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190407221846.GB6327@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Guenter Roeck <linux@roeck-us.net>, Nick Crews <ncrews@chromium.org>, enric.balletbo@collabora.com, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, alexandre.belloni@bootlin.com, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, dlaurie@chromium.org, sjg@google.com, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

On Sun, Apr 7, 2019 at 3:18 PM Pavel Machek <pavel@ucw.cz> wrote:
>
>
> > > > This document also states "The naming scheme above leaves scope
> > > > for further attributes should they be needed". It does not permit,
> > > > however, to redefine one of the fields to mean "location", much less
> > > > the declaration that a devicename of "platform" shall refer to an
> > > > "internal" backlight, or that there shall be no more than one
> > > > "internal" backlight in a given system.
> > >
> > > "platform" is as good devicename as "wilco" or "chromeos".
> >
> > No, because "platform" is not a device, it is something that you are
> > trying to assign a magic meaning to.
>
> "chromeos" is not a device, either.

I agree, it is not a device name. We do not assign any specific
meaning to it though. We could change it to "cros_ec" if so desired
and nothing should break.

Thanks.

-- 
Dmitry
