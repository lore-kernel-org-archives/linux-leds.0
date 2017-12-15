From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v4 4/6] dt: bindings: lp8860: Add trigger binding to the
 lp8860
Date: Fri, 15 Dec 2017 22:00:42 +0100
Message-ID: <20171215210042.GC19442@amd>
References: <20171212220143.31210-1-dmurphy@ti.com>
 <20171212220143.31210-5-dmurphy@ti.com>
 <20171215090903.GC8221@amd>
 <76329432-f96e-93ab-ed9b-ade22c8735c9@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <76329432-f96e-93ab-ed9b-ade22c8735c9-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-12-15 11:22:24, Dan Murphy wrote:
> Pavel
>=20
> On 12/15/2017 03:09 AM, Pavel Machek wrote:
> > Hi!
> >=20
> >> @@ -35,6 +37,7 @@ led-controller@2d {
> >>  	led@0 {
> >>  		reg =3D <0>;
> >>  		label =3D "white:display_cluster";
> >> +		linux,default-trigger =3D "backlight";
> >>  	};
> >>  }
> >=20
> > What is "display_cluster"? Is it display backlight?
> >=20
>=20
> This device can be configured to drive all 4 LED strings in display mode
> so that all 4 strings have the same brightness controlled either through =
PWM or
> through the brightness register=20
>=20
> or
>=20
> As cluster string where the brightness of individual strings or clustered=
 strings
> can be controlled via independent brightness control registers.  I am cur=
rently working
> on adding this support to the driver.

Ok; but I guess I'd like to keep this implementation detail away from
kernel, and just expose as display:white:backlight or something like that.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlo0N/oACgkQMOfwapXb+vLV0QCeJLKBRHmCeurE3wZWkv8TPawl
lrEAmwdW33nq4IC7W55zhTigp7Lec22w
=kdTc
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
