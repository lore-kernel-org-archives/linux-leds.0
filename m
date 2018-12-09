From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] led: triggers: Add LED_INIT_DEFAULT_TRIGGER flag
Date: Sun, 9 Dec 2018 20:01:33 +0100
Message-ID: <20181209190133.GD6331@amd>
References: <20181209184942.22391-1-jacek.anaszewski@gmail.com>
 <20181209184942.22391-2-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209184942.22391-2-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org
List-Id: linux-leds@vger.kernel.org


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2018-12-09 19:49:42, Jacek Anaszewski wrote:
> Add the flag LED_INIT_DEFAULT_TRIGGER for indicating that trigger
> being set is a default trigger for the LED class device, and
> thus it should be initialized with settings provided in the fwnode.
>=20
> Set the flag in the led_trigger_set_default(). It is expected to be
> cleared in the activate() op of a trigger after trigger fwnode
> initialization data is parsed and applied. This should happen only
> once after LED class device registration, to allow leaving triggers
> in the idle state on re-apply and let the users apply their own
> settings without being interfered with the default ones.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Aha, I see the user now. Sorry for the noise.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwNZo0ACgkQMOfwapXb+vLRiwCgvH4IZ0IkS5IjxYKUpWDPltZz
iYwAn09jbAXIiyd75nezMHLipMplWH65
=oaoo
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
