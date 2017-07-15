From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: tlc591xx: add missing of_node_put
Date: Sat, 15 Jul 2017 11:02:23 +0200
Message-ID: <20170715090223.GA21365@amd>
References: <1500104933-25286-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500104933-25286-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Richard Purdie <rpurdie@rpsys.net>, kernel-janitors@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2017-07-15 09:48:53, Julia Lawall wrote:
> for_each_child_of_node performs an of_node_get on each iteration, so a
> return from the loop requires an of_node_put.
>=20
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
>=20
> // <smpl>
> @@
> local idexpression n;
> expression e,e1;
> iterator name for_each_child_of_node;
> @@
>=20
>  for_each_child_of_node(e1,n) {
>    ...
> (
>    of_node_put(n);
> |
>    e =3D n
> |
>    return n;
> |
> +  of_node_put(n);
> ?  return ...;
> )
>    ...
>  }
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Pavel Machek <pavel@ucw.cz>

> @@ -230,12 +230,18 @@ tlc591xx_probe(struct i2c_client *client
> =20
>  	for_each_child_of_node(np, child) {
>  		err =3D of_property_read_u32(child, "reg", &reg);
> -		if (err)
> +		if (err) {
> +			of_node_put(child);
>  			return err;
> -		if (reg < 0 || reg >=3D tlc591xx->max_leds)
> +		}
> +		if (reg < 0 || reg >=3D tlc591xx->max_leds) {
> +			of_node_put(child);
>  			return -EINVAL;
> -		if (priv->leds[reg].active)
> +		}
> +		if (priv->leds[reg].active) {
> +			of_node_put(child);
>  			return -EINVAL;
> +		}

I'd combine last two if()s into one...
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllp2h8ACgkQMOfwapXb+vLUxQCdFN3EvjTr+rgCrL5nEF9FxSdg
I8wAn31HvG9PD/vQ/muKD+Ehh78xVEy0
=6Pow
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
