From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 4/6] leds: netdev trigger: move name length checking
 to netdev_trig_set_device
Date: Mon, 18 Mar 2019 12:26:14 +0100
Message-ID: <20190318112614.GD6101@amd>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-5-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314140619.3309-5-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-03-14 15:06:17, Rasmus Villemoes wrote:
> It's better to check that size is sane in the function that does the
> memcpy'ing and 0-termination to the IFNAMSIZ-sized buffer instead of
> relying on callers getting it right. Not rejecting size upfront does
> mean we would do the cancel_delayed_work_sync(), but that gets fixed
> up by the set_baseline_state() call.
>=20
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Exactly. 2,4:

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyPgFYACgkQMOfwapXb+vJHowCeMH7W7PGfHHfcMCmYt6AUt7HL
xxUAoIyD0WjFwmL2KmYJtVhen8/AmiOi
=vaYf
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
