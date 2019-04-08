From: Guenter Roeck <groeck@google.com>
Subject: Re: Keyboard backlight LED naming was Re: [PATCH v5 2/3]
 platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Mon, 8 Apr 2019 06:31:44 -0700
Message-ID: <CABXOdTcrQELWVc5SwPHAk6BP5wq=kQg6K_g-7p+Y73tPFAFTdQ@mail.gmail.com>
References: <20190404171007.160878-1-ncrews@chromium.org> <20190404171007.160878-2-ncrews@chromium.org>
 <20190405201534.GA4426@roeck-us.net> <20190406084157.GA27043@amd>
 <CAE_wzQ9WG1+K1ZzVoii8ukDe_g+4Ha0bh6YvsRhceinwPjC+Kw@mail.gmail.com>
 <20190407221846.GB6327@amd> <CAE_wzQ_5Ha6hNt28_+j-pF3mAdXXifv9CuotDCeXff8KC1DNmA@mail.gmail.com>
 <20190408094113.GB30958@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408094113.GB30958@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dmitry Torokhov <dtor@google.com>, Guenter Roeck <linux@roeck-us.net>, Nick Crews <ncrews@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org

On Mon, Apr 8, 2019 at 2:41 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > > > > This document also states "The naming scheme above leaves scope
> > > > > > for further attributes should they be needed". It does not perm=
it,
> > > > > > however, to redefine one of the fields to mean "location", much=
 less
> > > > > > the declaration that a devicename of "platform" shall refer to =
an
> > > > > > "internal" backlight, or that there shall be no more than one
> > > > > > "internal" backlight in a given system.
> > > > >
> > > > > "platform" is as good devicename as "wilco" or "chromeos".
> > > >
> > > > No, because "platform" is not a device, it is something that you ar=
e
> > > > trying to assign a magic meaning to.
> > >
> > > "chromeos" is not a device, either.
> >
> > I agree, it is not a device name. We do not assign any specific
> > meaning to it though. We could change it to "cros_ec" if so desired
> > and nothing should break.
>
> Yes. And you can also change it to "platform" and nothing will break
> :-). Can we end the discussion here?
>
> If not, lets take a look at existing names:
>
> ./drivers/platform/x86/asus-laptop.c:           cdev->name =3D "asus::kbd=
_backlight";
> ./drivers/platform/x86/samsung-laptop.c:                samsung->kbd_led.=
name =3D "samsung::kbd_backlight";
> ./drivers/platform/x86/thinkpad_acpi.c:         .name           =3D "tpac=
pi::kbd_backlight",
> ./drivers/platform/x86/toshiba_acpi.c:          dev->kbd_led.name =3D "to=
shiba::kbd_backlight";
> ./drivers/platform/x86/asus-wmi.c:              asus->kbd_led.name =3D "a=
sus::kbd_backlight";
> ./drivers/platform/x86/dell-laptop.c:   .name           =3D "dell::kbd_ba=
cklight",
> ./drivers/platform/chrome/cros_kbd_led_backlight.c:     cdev->name =3D "c=
hromeos::kbd_backlight";
> ./drivers/hwmon/applesmc.c:     .name                   =3D "smc::kbd_bac=
klight",
> ./drivers/hid/hid-asus.c:       drvdata->kbd_backlight->cdev.name =3D "as=
us::kbd_backlight";
> ./drivers/hid/hid-google-hammer.c:      kbd_backlight->cdev.name =3D "ham=
mer::kbd_backlight";
> ./drivers/input/misc/ims-pcu.c:          "pcu%d::kbd_backlight", pcu->dev=
ice_no);
>
> asus, samsung, toshiba, asus, dell, chromeos... Those are really not
> device names, either. But in these cases, LED is probably controlled
> by EC, or by ACPI BIOS talking to the EC. People usually call such
> devices "platform devices".
>
> (Linux Platform Device Driver - CodeProject
> =EF=BF=BChttps://www.codeproject.com/tips/1080177/linux-platform-device-d=
river
> A platform device is one which is hardwired on the board and hence not
> hot-pluggable. )
>
> You can take a look at discussion around micmute LED.
>
> Thus "platform" is quite suitable name in your case, and incidentaly,
> it will be more useful for userspace than "cros_ec".
>
No, it isn't. All those name are at least roughly associated with the
driver name, and they all do reflect the abbreviated driver name.
"platform" isn't, and is prone to duplicates.

If you want the location reflected in the led sysfs atttribute name,
say so. "platform" is neither a driver name nor a location. On a side
note, appending a number to the attribute name is not a good idea. In
addition to not being backward compatible, it would be prone to
renumbering at each reboot.

Guenter

>                                                                 Pavel
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
