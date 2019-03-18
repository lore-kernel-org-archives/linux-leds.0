From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/6] leds: netdev trigger: use memcpy in
 device_name_store
Date: Mon, 18 Mar 2019 12:20:28 +0100
Message-ID: <20190318112027.GA6101@amd>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-2-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314140619.3309-2-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-03-14 15:06:14, Rasmus Villemoes wrote:
> If userspace doesn't end the input with a newline (which can easily
> happen if the write happens from a C program that does write(fd,
> iface, strlen(iface))), we may end up including garbage from a
> previous, longer value in the device_name. For example
>=20
> # cat device_name
>=20
> # printf 'eth12' > device_name
> # cat device_name
> eth12
> # printf 'eth3' > device_name
> # cat device_name
> eth32
>=20
> I highly doubt anybody is relying on this behaviour, so switch to
> simply copying the bytes (we've already checked that size is <
> IFNAMSIZ) and unconditionally zero-terminate it; of course, we also
> still have to strip a trailing newline.
>=20
> This is also preparation for future patches.
>=20
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyPfvsACgkQMOfwapXb+vKOvgCgqiyTfYd0+V2ObT2VRP6kXG3J
upAAn17RsHq8Gx6/q0Ui7GNZEKg1GBfd
=ZsZF
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
