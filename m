From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 4 Mar 2016 12:56:44 -0800
Message-ID: <20160304205644.GF17145@dtor-ws>
References: <20160303234646.GA17641@dtor-ws>
 <1457080729.18482.6.camel@gmail.com>
 <56D957A0.7070300@samsung.com>
 <20160304191322.GA17145@dtor-ws>
 <1457124096.29260.30.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:32793 "EHLO
	mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758765AbcCDU4t (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 15:56:49 -0500
Content-Disposition: inline
In-Reply-To: <1457124096.29260.30.camel@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Evan McClain <aeroevan@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Olof Johansson <olofj@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Fri, Mar 04, 2016 at 03:41:36PM -0500, Evan McClain wrote:
> On Fri, 2016-03-04 at 11:13 -0800, Dmitry Torokhov wrote:
> > On Fri, Mar 04, 2016 at 10:38:40AM +0100, Jacek Anaszewski wrote:
> > >=20
> > > Hi Evan,
> > >=20
> > > On 03/04/2016 09:38 AM, Evan McClain wrote:
> > > >=20
> > > > On Thu, 2016-03-03 at 15:46 -0800, Dmitry Torokhov wrote:
> > > > >=20
> > > > > From: Simon Que <sque@chromium.org>
> > > > >=20
> > > > > This is a driver for ACPI-based keyboard backlight LEDs found
> > > > > on
> > > > > Chromebooks. The driver locates \\_SB.KBLT ACPI device and
> > > > > exports
> > > > > backlight as "chromeos::kbd_backlight" LED class device in
> > > > > sysfs.
> > > > Was it ever decided where this driver should live? I was planni=
ng
> > > > on
> > > > submitting to platform/chrome since most keyboard backlights se=
em
> > > > to
> > > > live over there but I don't think I got a response.
> > > >=20
> > > It hasn't been decided yet. I can take it, but could you submit o=
ne
> > > more
> > > version, without
> > >=20
> > > 'owner	=3D THIS_MODULE' in struct platform_driver
> > > keyboard_led_driver ?
> > >=20
> > > It is redundant, because the core will do it.
> > >=20
> > > Also the line with devm_kzalloc has over 80 characters.
> > Also:
> >=20
> > - preferably use sizeof(*cdev) instead of sizeof(struct ...)
> > - do not check cdev->flags & LED_SUSPENDED in
> > =A0 keyboard_led_set_brightness() as it is not going to be called w=
hen
> > led
> > =A0 device is suspended anyway
>=20
> Your patch is definitely better, I was only taking Simon's original
> submission and doing the minimal cleanup to help get it submitted (as
> someone using mainline linux on a pixel 2/samus).
>=20
> > - change the MODULE_LICENSE from "GPL v2" to "GPL" as to match the
> > =A0 actual license notice
>=20
> I think this got changed in one of the revisions in error.
>=20
> > - report ACPI errors in error messages (since we clobber them)
> > - preferably use ENXIO instead of ENODEV
>=20
> Most other drivers seem to use ENODEV on probe, but I'm in the 'learn
> through grep' level of understanding for parts of linux.
>=20
> > - maybe add "depends on CHROME_PLATFORMS || COMPILE_TEST" so that w=
e
> > do
> > =A0 not prompt for it on non-Chrome platforms
>=20
> Adding depends on CHROME_PLATFORMS definitely makes sense, but also
> might support putting this driver in platform/chrome. Either way I ju=
st

Olof, do you want it in platform/chrome?

> selfishly want better mainline support for this laptop.
>=20
> The only change I made (other than the changes suggested by Jacek) wa=
s
> to remove the line setting brightness to max_brightness on probe. I c=
an

I wonder if we should actually read the current brightness before
registering the led device.

Thanks.

--=20
Dmitry
