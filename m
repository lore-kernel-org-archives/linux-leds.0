From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/8] leds: as3645a: Fix misuse of strlcpy
Date: Fri, 5 Jul 2019 22:23:17 +0200
Message-ID: <20190705202317.GA5445@amd>
References: <cover.1562283944.git.joe@perches.com>
 <79fe35321ff794dccf1d08b415cee40636fa5fce.1562283944.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <79fe35321ff794dccf1d08b415cee40636fa5fce.1562283944.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-07-04 16:57:42, Joe Perches wrote:
> Probable cut&paste typo - use the correct field size.
>=20
> Signed-off-by: Joe Perches <joe@perches.com>

Ack.
									Pavel
> ---
>  drivers/leds/leds-as3645a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index 14ab6b0e4de9..050088dff8dd 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -668,7 +668,7 @@ static int as3645a_v4l2_setup(struct as3645a *flash)
>  	};
> =20
>  	strlcpy(cfg.dev_name, led->name, sizeof(cfg.dev_name));
> -	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfg.dev_name));
> +	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfgind.dev_name)=
);
> =20
>  	flash->vf =3D v4l2_flash_init(
>  		&flash->client->dev, flash->flash_node, &flash->fled, NULL,

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0fsbUACgkQMOfwapXb+vIanwCguZhbbEab7n2anLambt3YwIU5
BnkAoLc4SKnIko69xeOf6HmHCL495jOx
=S9vd
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
