From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] dt: bindings: as3645a: Fix the example node
Date: Fri, 8 Dec 2017 15:27:22 +0100
Message-ID: <20171208142722.GC7793@amd>
References: <20171207125012.5765-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171207125012.5765-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: sakari.ailus@iki.fi, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-12-07 06:50:12, Dan Murphy wrote:
> Fix the address-cells and size-cells example node
> to reflect to the correct representation.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> @@ -59,10 +59,10 @@ Example
>  =3D=3D=3D=3D=3D=3D=3D
> =20
>  	as3645a@30 {
> -		#address-cells: 1
> -		#size-cells: 0
> -		reg =3D <0x30>;
>  		compatible =3D "ams,as3645a";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x30>;
>  		flash@0 {
>  			reg =3D <0x0>;
>  			flash-timeout-us =3D <150000>;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloqoUoACgkQMOfwapXb+vJ8DACfchuh/0ziMCbz7lRIeFElNPsb
yHsAn1IGmHUuiwRLxHqS9SV49EdySeGi
=UFPa
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
