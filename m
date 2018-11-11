From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 05/24] dt-bindings: sc27xx-blt: Add function and color
 properties
Date: Sun, 11 Nov 2018 15:29:41 +0100
Message-ID: <20181111142941.GA5215@amd>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-6-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541542052-10081-6-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Xiaotong Lu <xiaotong.lu@spreadtrum.com>, Baolin Wang <baolin.wang@linaro.org>
List-Id: linux-leds@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-11-06 23:07:13, Jacek Anaszewski wrote:
> Refer to new "function" and "color" properties and mark "label"
> as deprecated.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>

Don't you want to keep both color and label? New dts on old kernel
should still work...?

Ok, I see these are only examples....

								Pavel


> @@ -25,17 +27,17 @@ led-controller@200 {
>  	reg =3D <0x200>;
> =20
>  	led@0 {
> -		label =3D "red";
> +		color =3D "red";
>  		reg =3D <0x0>;
>  	};
> =20
>  	led@1 {
> -		label =3D "green";
> +		color =3D "green";
>  		reg =3D <0x1>;
>  	};
> =20
>  	led@2 {
> -		label =3D "blue";
> +		color =3D "blue";
>  		reg =3D <0x2>;
>  	};
>  };

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvoPNUACgkQMOfwapXb+vKuwQCfb+wupIpbOy21flY+y3H9dWuV
Sl0AoLchTRSfoLQGrDsanAPqL1g176X4
=jS8d
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
