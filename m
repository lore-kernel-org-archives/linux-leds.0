From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v14 1/2] leds: core: Introduce LED pattern trigger
Date: Wed, 10 Oct 2018 18:00:48 +0200
Message-ID: <20181010160041.GA22121@amd>
References: <c3a6f08ac978c309bb0b002a0384c4f0ad0f59cd.1538494476.git.baolin.wang@linaro.org>
 <9bf6236e-83af-7156-b26b-7d88ece2d81e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9bf6236e-83af-7156-b26b-7d88ece2d81e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

[Oops. I wrote this but forgot to send it? Anyway.. I guess it is
redundant now.]

> > +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> > @@ -0,0 +1,76 @@
> > +What:		/sys/class/leds/<led>/pattern
> > +Date:		September 2018
> > +KernelVersion:	4.20
> > +Description:
> > +		Specify a software pattern for the LED, that supports altering
> > +		the brightness for the specified duration with one software
> > +		timer. It can do gradual dimming and constant brightness.
> > +
> > +		The pattern is given by a series of tuples, of brightness and
> > +		duration (ms). The LED is expected to traverse the series and
> > +		each brightness value for the specified duration. Duration of
> > +		0 means brightness should immediately change to new value.
> > +
> > +		1. When doing gradual dimming, the led brightness will be updated
> > +		every 50 milliseconds, so the duration of each step should not
> > +		less than 50 milliseconds.
>=20
> I'd like to avoid this constraint. Lowest supported delta_t should be 1.
>=20
> We should only prevent entering dimming mode if current delta_t
> is lower than UPDATE_INTERVAL.

I agree that documenting it like this is strange. I don't think this
should be part of ABI as we may want to adjust it in the future.

> I also propose to make the dimming interval configurable via sysfs
> dimming_interval file.

I believe we should provide "right" dimming_interval. 50msec sounds
good. If we find it is too low / too high, we might want to adjust it.

If we find out that different users need different values, I guess we
can still add "dimming_interval" knob, but I'd suggest waiting until
such need arises.

[Now, I don't have strong feelings here, and patch would probably be
okay with me even if it has dimming_interval, but I'd prefer to keep
it simple. We are at v14 of the patch...]

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlu+IjAACgkQMOfwapXb+vJKGACgsHAAydYbN5GADkbD3KjEsy91
qKIAn3vRLOcAeeemxCOYBEwNIcLUlrIG
=Y0m2
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
