From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/6] dt-bindings: leds: Add LED bindings for the LM36274
Date: Mon, 8 Apr 2019 12:10:40 +0200
Message-ID: <20190408101039.GC30958@amd>
References: <20190405145540.27703-1-dmurphy@ti.com>
 <20190405145540.27703-6-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405145540.27703-6-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-04-05 09:55:39, Dan Murphy wrote:
> Add the LM36274 LED specific bindings.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lm36274.txt | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.txt b/Do=
cumentation/devicetree/bindings/leds/leds-lm36274.txt
> new file mode 100644
> index 000000000000..359990d85b28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
> @@ -0,0 +1,82 @@
> +* Texas Instruments LM36274 4-Channel LCD Backlight Driver w/Integrated =
Bias
> +
> +The LM36274 is an integrated four-channel WLED driver and LCD bias suppl=
y.
> +The backlight boost provides the power to bias four parallel LED strings=
 with
> +up to 29-V total output voltage. The 11-bit LED current is rogrammable v=
ia

29V

								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyrHh8ACgkQMOfwapXb+vItWQCbBx2RPdPw60W1yLJxHH47DSW5
W1sAniGLQF1mjllOFEkUE/rvSou1fL5A
=pXGZ
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
