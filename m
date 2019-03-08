From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
Date: Fri, 8 Mar 2019 23:13:07 +0100
Message-ID: <20190308221307.GB16125@amd>
References: <20190308203801.57920-1-ncrews@chromium.org>
 <CAE_wzQ-Ds5a9iPuLTpV5mBHBtoUUh_-fRw66s0Su7eOifygqKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE_wzQ-Ds5a9iPuLTpV5mBHBtoUUh_-fRw66s0Su7eOifygqKQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@chromium.org>
Cc: Nick Crews <ncrews@chromium.org>, enric.balletbo@collabora.com, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, lkml <linux-kernel@vger.kernel.org>, dlaurie@chromium.org, Daniel Erat <derat@google.com>, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > This patch is meant to be applied on top of the for-next
> > branch of the platform/chrome repository, as it uses some of
> > the code staged there.
> >
> > The EC is in charge of controlling the keyboard backlight on
> > the Wilco platform. We expose a standard LED class device at
> > /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> > after the standard Chrome OS keyboard backlight driver at
> > drivers/platform/chrome/cros_kbd_led_backlight.c
> >
> > Some Wilco devices do not support a keyboard backlight. This
> > is checked in probe(), and in this case the sysfs entry will
> > not appear, and everything will behave normally.
>=20
> It would be even better if we did not register platform device if EC
> does not support backlight.
>=20
> > +       data->led.brightness_set =3D keyboard_led_set_brightness;
> > +       data->led.brightness_get =3D keyboard_led_get_brightness;
>=20
> wilco_ec_mailbox() may sleep, so you need to assign it to
> led.brightness_set_blocking.

Hmm. Seeing get method there... can the EC change the brightness
without command from kernel?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyC6PIACgkQMOfwapXb+vJgYACfaU3yqM27r6b74FhCd4n08Tgc
PasAoKN1IIyZGfLN4wpS9meOEMoVtC9G
=zU94
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
