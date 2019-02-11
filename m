From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/2] Intel Cherry Trail Whiskey Cove LEDs support
Date: Mon, 11 Feb 2019 14:05:54 +0100
Message-ID: <20190211130554.GA10203@amd>
References: <20190209221213.24052-1-jekhor@gmail.com>
 <20190211115951.GC9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190211115951.GC9224@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-02-11 13:59:51, Andy Shevchenko wrote:
> On Sun, Feb 10, 2019 at 01:12:12AM +0300, Yauhen Kharuzhy wrote:
> > This patch series introduces new driver for controlling LEDs connected
> > to Intel Cherry Trail Whiskey Cove PMIC (general-purpose LED and charger
> > status led). Only simple 'always on' and blinking modes are supported
> > for now, no breathing.
> >=20
> > Driver was tested only with Lenovo Yoga Book notebook, and I don't have
> > any documentation for the PMIC, so proposals and testing are welcome.
> >=20
>=20
> I'm not sure you have a correct Cc list here. LED maintainers are
> M:      Jacek Anaszewski <jacek.anaszewski@gmail.com>
> M:      Pavel Machek <pavel@ucw.cz>
>=20
> Also would be nice to cc to Hans de Goede.

I follow the list. I beileve Jacek does, too.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxhczIACgkQMOfwapXb+vI+KQCdGaLwZGMbRwjtrDHUgSqwNfOH
T5gAn2yJmb3vQX6jF0jvIW491WJaB/RC
=6Pzg
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
