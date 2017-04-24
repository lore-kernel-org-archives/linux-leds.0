From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Mon, 24 Apr 2017 22:18:29 +0200
Message-ID: <20170424201829.GA18679@amd>
References: <20170424044254.145192-1-dtwlin@google.com>
 <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: David Lin <dtwlin@google.com>, rpurdie@rpsys.net, robh@kernel.org, romlem@google.com, joelaf@google.com, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
> Hi David,
>=20
> Thanks for the patch.
>=20
> Unfortunately we cannot switch to using hr timers just like that
> without introducing side effects for many devices. We had similar
> attempt of increasing timer tirgger accuracy two years ago [0].
>=20
> In short words, for drivers that can sleep while setting brightness
> and/or are using a bus like I2C you will not be able to enforce
> 1ms delay period.
>=20
> I recommend you to go through the thread [0] so that we had
> a well defined ground for the discussion on how to address this
> issue properly.
>=20
> Alternatively, in order to avoid all quirks related to LED subsystem,
> I'd propose to implement this feature in the GPIO subsystem, which
> seems to be more suitable place for it.

Actually.. make that "implement it in force feedback subsystem where
it belongs". And we actually have force feedback subsystem, already,
see drivers/input/ff-core.c .

(Nokia N900 actually uses that subsystem for the vibration motor, so
there's existing code...)

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj+XZUACgkQMOfwapXb+vIFrwCfd4z/9L1SKV6z1nY7oI2Xpw2Y
wpEAnRdbbYj2rbDOz2PFJvi8khFLTzmy
=y6yS
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
