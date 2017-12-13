From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH] leds: as3645a: Fix checkpatch warnings
Date: Wed, 13 Dec 2017 13:56:46 +0100
Message-ID: <20171213125646.GB18897@amd>
References: <20171212215011.30066-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171212215011.30066-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-12-12 15:50:11, Dan Murphy wrote:
> Fix two checkpatch warnings for 80 char
> length and for a quoted string across multiple
> line warnings.
>=20
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>

Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

> ---
>  drivers/leds/leds-as3645a.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index 9a257f969300..f883616d9e60 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -360,7 +360,8 @@ static int as3645a_set_flash_brightness(struct led_cl=
assdev_flash *fled,
>  {
>  	struct as3645a *flash =3D fled_to_as3645a(fled);
> =20
> -	flash->flash_current =3D as3645a_current_to_reg(flash, true, brightness=
_ua);
> +	flash->flash_current =3D as3645a_current_to_reg(flash, true,
> +						      brightness_ua);
> =20
>  	return as3645a_set_current(flash);
>  }
> @@ -455,8 +456,8 @@ static int as3645a_detect(struct as3645a *flash)
> =20
>  	/* Verify the chip model and version. */
>  	if (model !=3D 0x01 || rfu !=3D 0x00) {
> -		dev_err(dev, "AS3645A not detected "
> -			"(model %d rfu %d)\n", model, rfu);
> +		dev_err(dev, "AS3645A not detected (model %d rfu %d)\n",
> +			model, rfu);
>  		return -ENODEV;
>  	}
> =20


(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloxI44ACgkQMOfwapXb+vI9/ACeMr6B9vt2r3VKOKq4tndatnEw
Z8kAoLL4A3F+MHldRuqfN6UIuTw9acHK
=PjMp
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
