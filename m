From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: lm3533: constify attribute_group structure
Date: Fri, 11 Aug 2017 14:34:38 +0200
Message-ID: <20170811123437.GB16126@amd>
References: <20170810162809.GA6903@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170810162809.GA6903@amitoj-Inspiron-3542>
Sender: linux-kernel-owner@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-08-10 12:28:09, Amitoj Kaur Chawla wrote:
> Functions working with attribute_groups provided by <linux/device.h>
> work with const attribute_group. These attribute_group structures do not
> change at runtime so mark them as const.
>=20
> File size before:
>  text      data     bss     dec     hex filename
>  8272      4608      64   12944    3290 drivers/leds/leds-lm3533.o
>=20
> File size after:
>  text      data     bss     dec     hex filename
>  8368      4512      64   12944    3290 drivers/leds/leds-lm3533.o
>=20
> This change was made with the help of Coccinelle.
>=20
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>

patches 1,2:

Acked-by: Pavel Machek <pavel@ucw.cz>

								Pavel

> -static struct attribute_group lm3533_led_attribute_group =3D {
> +static const struct attribute_group lm3533_led_attribute_group =3D {
>  	.is_visible	=3D lm3533_led_attr_is_visible,
>  	.attrs		=3D lm3533_led_attributes
>  };

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmNpF0ACgkQMOfwapXb+vLp+gCffx9oEJ59AQ2Pd2l3ESOYM4m3
c0sAniqz2/ThcPC88xlwjvCJTRYGHUFN
=aXuy
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
