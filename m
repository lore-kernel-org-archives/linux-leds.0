From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274
 LED driver
Date: Thu, 23 May 2019 14:50:12 +0200
Message-ID: <20190523125012.GB20354@amd>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-7-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, broonie@kernel.org, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +++ b/drivers/leds/leds-lm36274.c

> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
> +{
> +	struct fwnode_handle *child =3D NULL;
> +	char label[LED_MAX_NAME_SIZE];
> +	struct device *dev =3D &lm36274_data->pdev->dev;
> +	const char *name;
> +	int child_cnt;
> +	int ret =3D -EINVAL;
> +
> +	/* There should only be 1 node */
> +	child_cnt =3D device_get_child_node_count(dev);
> +	if (child_cnt !=3D 1)
> +		return ret;

I'd do explicit "return -EINVAL" here.

> +static int lm36274_probe(struct platform_device *pdev)
> +{
> +	struct ti_lmu *lmu =3D dev_get_drvdata(pdev->dev.parent);
> +	struct lm36274 *lm36274_data;
> +	int ret;
> +
> +	lm36274_data =3D devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
> +				    GFP_KERNEL);
> +	if (!lm36274_data) {
> +		ret =3D -ENOMEM;
> +		return ret;
> +	}

And certainly do "return -ENOMEM" explicitly here.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzmlwQACgkQMOfwapXb+vKGTQCfXMX0uKvUxpwhTf9eLraj5005
zNIAn05ddGsfmRuYiC1Yw79dIQwKFUNn
=UqIj
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
