From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Date: Sun, 11 Nov 2018 12:30:54 +0100
Message-ID: <20181111113053.GF27666@amd>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1486268620=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Brian Dodge <bdodge09@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--===============1486268620==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline


--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The vendor-prefixes.txt file properly refers to ArcticSand
> as arctic but the driver improperly abbreviated the prefix
> to arc. This was a mistake in the original patch
>=20
> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> ---
>  drivers/video/backlight/arcxcnn_bl.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
>   *
> - * Copyright 2016 ArcticSand, Inc.
> - * Author : Brian Dodge <bdodge@arcticsand.com>
> + * Copyright 2018 pSemi, Inc.
> + * Author : Brian Dodge <bdodge@psemi.com>

Ummm. Copyright 2016-2018?

> @@ -202,27 +202,27 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
>  	if (ret =3D=3D 0)
>  		lp->pdata->initial_brightness =3D prog_val;
>=20
> -	ret =3D of_property_read_u32(node, "arc,led-config-0", &prog_val);
> +	ret =3D of_property_read_u32(node, "arctic,led-config-0", &prog_val);
>  	if (ret =3D=3D 0)
>  		lp->pdata->led_config_0 =3D (u8)prog_val;
>

If there's a dts using this, you want to update it at the same
time. You may want to support both names going forward.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvoEu0ACgkQMOfwapXb+vKd+wCgjtkHtNcgo2reNuCLiQZ5lu/F
TmoAn11a1ivdO1nyig6eUxoIHZPylkpL
=qADy
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--

--===============1486268620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1486268620==--
