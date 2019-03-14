From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/4] leds: netdev trigger: factor out middle part of
 device_name_store
Date: Thu, 14 Mar 2019 11:15:28 +0100
Message-ID: <20190314101528.GB14455@amd>
References: <20190311144227.GA4404@amd>
 <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190313202615.22883-3-linux@rasmusvillemoes.dk>
 <20190314093111.7ivkdg7ozk4vylio@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314093111.7ivkdg7ozk4vylio@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-03-14 10:31:11, Uwe Kleine-K=F6nig wrote:
1;2802;0c> Hello,
>=20
> On Wed, Mar 13, 2019 at 09:26:13PM +0100, Rasmus Villemoes wrote:
> > +static void set_device(struct led_netdev_data *trigger_data,
> > +		       const char *buf, size_t size)
>=20
> "set_device" is a very generic name. Can you please prefix it with
> "ledtrig_netdev_"?

Its static.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyKKcAACgkQMOfwapXb+vKsgwCePR496MrvDo6ITledDSoc+UIQ
/TEAoJAJfmQ3qHHbDEJPvIrNPVBzvaOY
=R3p9
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
