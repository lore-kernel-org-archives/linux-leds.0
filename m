From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 7/8] smiapp: Add support for flash, lens and EEPROM
 devices
Date: Sat, 17 Jun 2017 11:19:39 +0200
Message-ID: <20170617091939.GA27430@amd>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-8-git-send-email-sakari.ailus@linux.intel.com>
 <20170616124242.GA8145@amd>
 <20170616124526.GM15419@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170616124526.GM15419-z7MJbOB4PBP+e+fPlCVrcFDQ4js95KgL@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > These types devices aren't directly related to the sensor, but are
> > > nevertheless handled by the smiapp driver due to the relationship of =
these
> > > component to the main part of the camera module --- the sensor.
> > >=20
> > > Additionally, for the async sub-device registration to work, the noti=
fier
> > > containing matching fwnodes will need to be registered. This is natur=
al to
> > > perform in a sensor driver as well.
> > >=20
> > > This does not yet address providing the user space with information o=
n how
> > > to associate the sensor, lens or EEPROM devices but the kernel now ha=
s the
> > > necessary information to do that.
> >=20
> > Do I understand it correctly that basically every sensor driver (in my
> > case et8ek8) needs to get this kind of support? I2c leds are cheap,
> > and may be asociated with pretty much any sensor, AFAICT.
>=20
> That's right.
>=20
> >=20
> > This is quite a lot of boilerplate for that. Would it make sense to
> > provide helper function at least for this?
>=20
> Yes. I've been thinking of having helper functions for notifiers and
> sub-notifiers. Most of the receiver drivers are implementing exactly the
> same thing but with different twists (read: bugs).

Agreed, helpers would be nice. Ping me if you have them, I'll happily
test it with et8ek8. (Or I can try to create them, but...)

If we move lens/flash to the sensor, this one can probably be dropped:

https://git.linuxtv.org/sailus/media_tree.git/commit/?h=3Dccp2&id=3D1796bbc=
e05964f86cf546557a96626b2bdebe65b



									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllE9CsACgkQMOfwapXb+vJiuQCeJ8M9TbbpwNyDxB3i/+C2mSpU
6dkAoK5+QPfQW29IShkTR1LfaIxBaZbd
=Z0xh
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
