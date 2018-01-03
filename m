From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: proper framework for meter sink?
Date: Wed, 3 Jan 2018 13:23:26 +0100
Message-ID: <20180103122326.GB28083@amd>
References: <649fa764-6598-8f05-90c0-e10a4d36b08f@rempel-privat.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <649fa764-6598-8f05-90c0-e10a4d36b08f-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Paul Fertser <fercerpav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I wont to use existing LED triggers by setting multiple LEDs on trigger.
> The triggers should use brightness value by different trigger intensity
> and the driver should set different amount of LEDs depending on
> brightness value.

Well... we don't really have "trigger intensities" inside the kernel.

Are you sure this is something kernel should do?

> With other words LED meter controller by kernel LED framework. It should
> be possible to configure LED arrays by Device Tree.
> Initially i was thinking about some kind of extended leds-gpio.c driver
> which will convert brightness value to LED position. But one my friend
> pointed me that metes exist in different configurations and it make no
> sense to bind it to LED framework.
>=20
> Do you have any ideas, suggestions, tips? I know there are lot of user
> space based variants. On other hand kernel already have almost every
> thing what I need.


We could have triggers like "on if value is above X", and then you
could use few of them to implement a meter.

But I guess this would be better done in userspace... Why not do it there?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpMyz4ACgkQMOfwapXb+vKg2ACgtxQ8CUOsZWhW/qSNkZYb6Fse
gHkAoIcT+NOac4gNX91gPWMP/qBRYB5k
=xUFR
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
