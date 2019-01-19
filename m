From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Date: Sat, 19 Jan 2019 22:46:06 +0100
Message-ID: <20190119214606.GA4712@amd>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com>
 <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com>
 <20190116105537.GA1803@amd>
 <efb4e1c1-0d13-bed7-d262-284fc1a0c9ab@gmail.com>
 <4115ad75-22f7-d9ae-c38f-e0ab61fb6655@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4115ad75-22f7-d9ae-c38f-e0ab61fb6655@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vesa =?iso-8859-1?B?SuTkc2tlbORpbmVu?= <dachaac@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >Moreover, I think that RGB LED class with configurable
> >brightness-model, and with possible color range adjustments via
> >icc-profiles or something similar, is the best solution that has been
> >proposed so far. It is just flexible.
> >
> >I'd like to capitalize on the ideas shared in this thread and have
> >finally LED RGB class materialized.
> >
>=20
> I have now updated my github code with my understanding of the discussion:
> https://github.com/vesajaaskelainen/linux/tree/wip-multi-color-led
>=20
> Commits:
> - dt-bindings: leds: Introduce linux,default-brightness-model for all leds
> https://github.com/vesajaaskelainen/linux/commit/4ffb21d644056686096226bb=
ede7c8c78b0254c2
> - drivers: leds: Add core support for multi color element LEDs
> https://github.com/vesajaaskelainen/linux/commit/627f38bb78cebc694b8e6d73=
5fb088c87925435d
> - dt-bindings: leds: leds-pwm: Introduce multi color element leds support
> https://github.com/vesajaaskelainen/linux/commit/ef6c5730d621e79ea0b02470=
caa83bc39439536a
> - WIP: drivers: leds: leds-pwm: Add multi color element LED support.
> https://github.com/vesajaaskelainen/linux/commit/0430a27823d9162926424b32=
c23be1c53eb9cbe2
>=20
> First two commits are common and could be taken before I am happy with the
> pwm led driver changes. This new conditional feature flag makes it a bit
> harder. Of course one option would be to require it to be enabled.
>=20
> Current set of concepts:
> - brightness-model: hardware, onoff, linear
>   - could be extended in future with other modes like hsv if wanted

Would it be enough to tell userspace what is relation between values
it writes and output power?

Onoff is subset of linear, I guess. We already have max_brightness in
the API.

> # Setting up color to not so bright purple with brightness set to 255
> $ echo "32 0 32 255" > color

> # Setting up color to a bit brighter purple with brightness
> $ echo "128 0 128 255" > color

This would require colorspace conversion in kernel. I have:

    	    scales =3D (1., 0.39, 0.11) # for n900
            val =3D map(lambda x: int((x**2.2)*255), val)
	    (r, g, b) =3D val

	    (r_, g_, b_) =3D m.scales
	    red =3D r*r_
	    ...

x**2.2 is simplified, real expression is more complex. But it is
floating point math...

Do we want to do that?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxDmp4ACgkQMOfwapXb+vLiHACcCLj0rtLbmOrnP63lMapTQ3Hm
xqkAn1NM814Qq9FoyTvD6QjbL0d/AvZm
=mY3B
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
