From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
Date: Thu, 4 Apr 2019 21:23:31 +0200
Message-ID: <20190404192331.GB29984@amd>
References: <20190308203801.57920-1-ncrews@chromium.org>
 <20190308210843.GA16125@amd>
 <CAHX4x85=_76=Kyepf3Nw++4yVKOZujhLsonzaicZOnY5fi-Pfw@mail.gmail.com>
 <20190404112415.GB18653@amd>
 <CAE_wzQ96MkKb7uSoVBNkOZexevUKPf4jHyQZneg7YNCEs7SHfQ@mail.gmail.com>
 <20190404190326.GC27340@amd>
 <CAE_wzQ8mr1OMKB+ASfsCdGcs70YrzEMN4Htfg1+O51=ByhXchw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE_wzQ8mr1OMKB+ASfsCdGcs70YrzEMN4Htfg1+O51=ByhXchw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@google.com>
Cc: Nick Crews <ncrews@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Daniel Erat <derat@google.com>, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > Yeah, well, we not let the cros_kbd_led_backlight.c use chromeos:: =
in
> > > > the first place. But it happened. We want all backlights for the
> > > > system keyboard to use common name, and "chromeos" is not really
> > > > suitable for that. "platform" is.
> > >
> > > Pavel, who exactly wants this and why? Looking at today's -next I see:
> > >
> > > dtor@dtor-ws:~/kernel/linux-next ((next-20190404))$ git grep
> > > "::kbd_backlight" | wc -l
> > > 18
> > > dtor@dtor-ws:~/kernel/linux-next ((next-20190404))$ git grep
> > > "platform::kbd_backlight" | wc -l
> > > 0
> > >
> > > so there isn't a single instance of "platform::kbd_backlight" and we
> > > definitely not changing existing names.
> >
> > Yeah, we made mistakes in the past. We _don't_ want userspace to have
> > ever growing list of names for userspace to follow.
> >
> > Backlight of internal keyboard is pretty common concept and there
> > should be one name for it.
>=20
> It is the *function* that is interesting to userspace, not full name,
> and we have proper standardization there.

Well, if full name is not interesting, as you argue, why do we have
this discussion?
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlymWbMACgkQMOfwapXb+vIRUgCgho7OJjwsAgoIWqnCfbMgmfEf
CUkAnA+NfFWvB1SSaxxOG9QtPTkwaFkC
=9MDq
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
