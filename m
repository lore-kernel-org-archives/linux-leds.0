From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: ledtrig-heartbeat: Make top brightness
 adjustable
Date: Wed, 9 Nov 2016 12:21:18 +0100
Message-ID: <20161109112117.GA1556@amd>
References: <1478688226-4158-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478688226-4158-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2016-11-09 11:43:46, Jacek Anaszewski wrote:
> LED class heartbeat trigger allowed only for blinking with max_brightness
> value. This patch adds more flexibility by exploiting part of LED core
> software blink infrastructure.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgjBq0ACgkQMOfwapXb+vJwRwCfTcjpGM4vIIcD0DlXqJsVe8FI
eGUAoIY78/W2KHAtOuaSKwNgxT9td817
=JJZZ
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
