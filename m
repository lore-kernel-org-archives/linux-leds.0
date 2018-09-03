From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 3 Sep 2018 23:53:23 +0200
Message-ID: <20180903215323.GA21489@amd>
References: <e6d4e7be537a4e4d6fce26c6d446703b1910eab9.1535700092.git.baolin.wang@linaro.org>
 <ef266d4a-ba0e-cba6-ae30-ebbf730e28a2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ef266d4a-ba0e-cba6-ae30-ebbf730e28a2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: bjorn.andersson@linaro.org, Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +static int pattern_trig_start_pattern(struct led_classdev *led_cdev)
> > +{
> > +	struct pattern_trig_data *data =3D led_cdev->trigger_data;
> > +
> > +	if (!data->npatterns)
> > +		return 0;
> > +
> > +	if (data->is_hw_pattern) {
> > +		return led_cdev->pattern_set(led_cdev, data->patterns,
> > +					     data->npatterns, data->repeat);
> > +	}
>=20
> I have doubts here if it is a good idea to enforce array of tuples
> as a generic interface for all hw_patterns. It may not fit well for
> every hw pattern engine. It seems that the only feasible solution will
> be allowing drivers to come up with their own interfaces, i.e. the
> approach you proposed at first for your driver. It seems that the
> ledtrig-pattern with software pattern mechanism will be just
> a nice side effect of this series :-)
>=20
> Unless someone will propose a better solution.

I believe array of tuples will work for everyone. It is just a LED, it
can change intensity over time.

> We need a broader consensus here. I'd like to hear Pavel's opinion,
> since he's been always in favor of common pattern interface, and
> inspired this work.

I believe Baolin did good work here. I believe it will cover most, if
not all, hardware engines out there. I think we should merge it, and
see what happens -- it should be good enough.

(Yes, there's still more work to do, but that will be stuff like RGB
LED synchronization.)

(And yes, one of the LED chip has pattern engine that can compute
prime numbers on its own. I don't expect to support
_that_. Fortunately, nobody but me is likely to want that pattern, so
we are still okay :-)=20

https://gitlab.com/tui/tui/blob/master/ofone/tests.notcc/primes.nc

)
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluNrVMACgkQMOfwapXb+vJ5fgCfZH6qXX2O1Uaq4FdANEL8rNhR
BdcAn0Q95ZTd5C2NKYMwtmkOQWSzc+Lg
=7xnK
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
