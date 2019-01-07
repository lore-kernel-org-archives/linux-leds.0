From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 2/5] leds: Add helper for getting default pattern from
 Device Tree
Date: Mon, 7 Jan 2019 18:49:24 +0100
Message-ID: <20190107174924.GD933@amd>
References: <1546596524-19863-1-git-send-email-krzk@kernel.org>
 <1546596524-19863-3-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546596524-19863-3-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Multiple LED triggers might need to access default pattern so add a
> helper for that.
>=20
>  }
>  EXPORT_SYMBOL_GPL(led_update_brightness);
> =20
> +u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int=
 *size)
> +{
> +	struct device_node *np =3D dev_of_node(led_cdev->dev);
> +	u32 *pattern;
> +	int count;
> +
> +	if (!np)
> +		return NULL;
> +
> +	count =3D of_property_count_u32_elems(np, "led-pattern");
> +	if (count < 0)
> +		return NULL;
> +
> +	pattern =3D kcalloc(count, sizeof(*pattern), GFP_KERNEL);
> +	if (!pattern)
> +		return NULL;
> +
> +	if (of_property_read_u32_array(np, "led-pattern", pattern, count))
> +		goto err;

Just kfree and return here. No need for goto if that is just one case.


>  /**
> + * led_get_default_pattern - return default pattern
> + *
> + * @led_cdev: the LED to get default pattern for
> + * @size:     pointer for storing the number of elements in returned arr=
ay,
> + *            modified only if return !=3D NULL
> + *
> + * Return:    Allocated array of integers with default pattern from Devi=
ceTree
> + *            or NULL.  Caller is responsible for kfree().
> + */

"DeviceTree" -> "device tree".

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwzkSQACgkQMOfwapXb+vLwSgCfdaKAiixyvS4Tz4W44YVe4BPx
GycAoKUZZI+UmdPW/GG9OipPvZBV68Mn
=zeZf
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
