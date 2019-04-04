From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
Date: Thu, 4 Apr 2019 21:03:26 +0200
Message-ID: <20190404190326.GC27340@amd>
References: <20190308203801.57920-1-ncrews@chromium.org>
 <20190308210843.GA16125@amd>
 <CAHX4x85=_76=Kyepf3Nw++4yVKOZujhLsonzaicZOnY5fi-Pfw@mail.gmail.com>
 <20190404112415.GB18653@amd>
 <CAE_wzQ96MkKb7uSoVBNkOZexevUKPf4jHyQZneg7YNCEs7SHfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE_wzQ96MkKb7uSoVBNkOZexevUKPf4jHyQZneg7YNCEs7SHfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@google.com>
Cc: Nick Crews <ncrews@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Daniel Erat <derat@google.com>, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org


--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-04-04 09:13:27, Dmitry Torokhov wrote:
> On Thu, Apr 4, 2019 at 4:24 AM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > On Mon 2019-03-11 09:29:06, Nick Crews wrote:
> > > Thanks for looking this over. I will fix most of your concerns, but
> > > have one question.
> > >
> > > On Fri, Mar 8, 2019 at 2:08 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > >
> > > > On Fri 2019-03-08 13:38:02, Nick Crews wrote:
> > > > > This patch is meant to be applied on top of the for-next
> > > > > branch of the platform/chrome repository, as it uses some of
> > > > > the code staged there.
> > > > >
> > > > > The EC is in charge of controlling the keyboard backlight on
> > > > > the Wilco platform. We expose a standard LED class device at
> > > > > /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> > > > > after the standard Chrome OS keyboard backlight driver at
> > > > > drivers/platform/chrome/cros_kbd_led_backlight.c
> > > >
> > > > Can you make it "platform::kbd_backlight"? We want some consistency
> > > > there.
> > >
> > > The analogous name in the standard driver
> > > drivers/platform/chrome/cros_kbd_led_backlight.c is
> > > "chromeos::kbd_backlight", and I thought "wilco" was a better
> > > substitute for "chromeos" than "platform" would be. What other thing
> > > are you saying "platform" would be consistent with?
> >
> > Yeah, well, we not let the cros_kbd_led_backlight.c use chromeos:: in
> > the first place. But it happened. We want all backlights for the
> > system keyboard to use common name, and "chromeos" is not really
> > suitable for that. "platform" is.
>=20
> Pavel, who exactly wants this and why? Looking at today's -next I see:
>=20
> dtor@dtor-ws:~/kernel/linux-next ((next-20190404))$ git grep
> "::kbd_backlight" | wc -l
> 18
> dtor@dtor-ws:~/kernel/linux-next ((next-20190404))$ git grep
> "platform::kbd_backlight" | wc -l
> 0
>=20
> so there isn't a single instance of "platform::kbd_backlight" and we
> definitely not changing existing names.

Yeah, we made mistakes in the past. We _don't_ want userspace to have
ever growing list of names for userspace to follow.

Backlight of internal keyboard is pretty common concept and there
should be one name for it.

								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlymVP4ACgkQMOfwapXb+vJ8iQCeNEvn/1nF28e8kOOtj+8fFCoI
nHgAniQXBdkEeprilLGs6A11hHMOYOHn
=gWZD
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
