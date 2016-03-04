From: Evan McClain <aeroevan@gmail.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 04 Mar 2016 15:41:36 -0500
Message-ID: <1457124096.29260.30.camel@gmail.com>
References: <20160303234646.GA17641@dtor-ws>
	 <1457080729.18482.6.camel@gmail.com> <56D957A0.7070300@samsung.com>
	 <20160304191322.GA17145@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-gBhwLv5oWFd+YQ3U79Fu"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33061 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757489AbcCDUlv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 15:41:51 -0500
In-Reply-To: <20160304191322.GA17145@dtor-ws>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Olof Johansson <olofj@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org


--=-gBhwLv5oWFd+YQ3U79Fu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-03-04 at 11:13 -0800, Dmitry Torokhov wrote:
> On Fri, Mar 04, 2016 at 10:38:40AM +0100, Jacek Anaszewski wrote:
> >=20
> > Hi Evan,
> >=20
> > On 03/04/2016 09:38 AM, Evan McClain wrote:
> > >=20
> > > On Thu, 2016-03-03 at 15:46 -0800, Dmitry Torokhov wrote:
> > > >=20
> > > > From: Simon Que <sque@chromium.org>
> > > >=20
> > > > This is a driver for ACPI-based keyboard backlight LEDs found
> > > > on
> > > > Chromebooks. The driver locates \\_SB.KBLT ACPI device and
> > > > exports
> > > > backlight as "chromeos::kbd_backlight" LED class device in
> > > > sysfs.
> > > Was it ever decided where this driver should live? I was planning
> > > on
> > > submitting to platform/chrome since most keyboard backlights seem
> > > to
> > > live over there but I don't think I got a response.
> > >=20
> > It hasn't been decided yet. I can take it, but could you submit one
> > more
> > version, without
> >=20
> > 'owner	=3D THIS_MODULE' in struct platform_driver
> > keyboard_led_driver ?
> >=20
> > It is redundant, because the core will do it.
> >=20
> > Also the line with devm_kzalloc has over 80 characters.
> Also:
>=20
> - preferably use sizeof(*cdev) instead of sizeof(struct ...)
> - do not check cdev->flags & LED_SUSPENDED in
> =C2=A0 keyboard_led_set_brightness() as it is not going to be called when
> led
> =C2=A0 device is suspended anyway

Your patch is definitely better, I was only taking Simon's original
submission and doing the minimal cleanup to help get it submitted (as
someone using mainline linux on a pixel 2/samus).

> - change the MODULE_LICENSE from "GPL v2" to "GPL" as to match the
> =C2=A0 actual license notice

I think this got changed in one of the revisions in error.

> - report ACPI errors in error messages (since we clobber them)
> - preferably use ENXIO instead of ENODEV

Most other drivers seem to use ENODEV on probe, but I'm in the 'learn
through grep' level of understanding for parts of linux.

> - maybe add "depends on CHROME_PLATFORMS || COMPILE_TEST" so that we
> do
> =C2=A0 not prompt for it on non-Chrome platforms

Adding depends on CHROME_PLATFORMS definitely makes sense, but also
might support putting this driver in platform/chrome. Either way I just
selfishly want better mainline support for this laptop.

The only change I made (other than the changes suggested by Jacek) was
to remove the line setting brightness to max_brightness on probe. I can
resubmit a cleaned up patch incorporating your changes unless you would
like to take over.

Thanks
--=20
Evan McClain
https://keybase.io/aeroevan

--=-gBhwLv5oWFd+YQ3U79Fu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJW2fMAAAoJEPQx78gG1JMfsuAH/jvVkffWroqJU5cNj+RdYUMb
V5d6yZiIm9HKNihN3Z0L80fNW/fOWh7/rzlCmYUFlWf7PY2204tZJcr/9yGuwYC+
sURWKO1qf1ZBVtHkoHEnA/h+010I1VFKEdsQEP9dkyhMvsh2+EA4EtgBvGWiax4v
FiMxXmpvcdWMQbf8bOYTS0KXPa+v32dIxOMjY0G868PNtrgLAYKe+lppJ+JqW+li
OBLkwy5qQrhWusjVkfHWpdyhociWJFsh/1YlkN9Dv5xMe1fHmPHvrMw0MCeUtOMC
b1UwOfmuQ6OGU7Cu4xtbTaCcg8tReWBVXaUnYBndXRzhr4AjtS641oEHGZ25000=
=df81
-----END PGP SIGNATURE-----

--=-gBhwLv5oWFd+YQ3U79Fu--
