From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/5] leds: lm3697: Introduce the lm3697 driver
Date: Sat, 13 Apr 2019 22:06:05 +0200
Message-ID: <20190413200605.GA3013@amd>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-6-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190325142403.30447-6-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-03-25 09:24:03, Dan Murphy wrote:
> Introduce the lm3697 LED driver for
> backlighting and display.
>=20
> Datasheet location:
> http://www.ti.com/lit/ds/symlink/lm3697.pdf
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig       |   8 +-
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-lm3697.c | 401 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 409 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/leds/leds-lm3697.c
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 735009e73414..688bb9a6f275 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -776,9 +776,15 @@ config LEDS_NIC78BX
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-nic78bx.
> =20
> +config LEDS_LM3697
> +	tristate "LED driver for LM3697"
> +	depends on LEDS_TI_LMU_COMMON
> +	help
> +	  Say Y to enable the LM3697 LED driver for TI LMU devices.
> +	  This supports the LED device LM3697.
> +
>  config LEDS_TI_LMU_COMMON
>  	tristate "LED driver for TI LMU"
> -	depends on REGMAP
>  	help
>            Say Y to enable the LED driver for TI LMU devices.
>            This supports common features between the TI LM3532, LM3631, L=
M3632,

Is deleting "depends on REGMAP" intentional? AFAICT you are using it.

Plus we'd normally expect "COMMON" first and then specific driver. Not
sure if Kconfig can handle it out-of-order...


> +static int lm3697_init(struct lm3697 *priv)
> +{
> +	struct lm3697_led *led;
> +	int i, ret;
> +
> +	if (priv->enable_gpio) {
> +		gpiod_direction_output(priv->enable_gpio, 1);
> +	} else {
> +		ret =3D regmap_write(priv->regmap, LM3697_RESET, LM3697_SW_RESET);
> +		if (ret) {
> +			dev_err(&priv->client->dev, "Cannot reset the device\n");
> +			goto out;
> +		}
> +	}
> +
> +	ret =3D regmap_write(priv->regmap, LM3697_CTRL_ENABLE, 0x0);
> +	if (ret) {
> +		dev_err(&priv->client->dev, "Cannot write ctrl enable\n");
> +		goto out;
> +	}
> +
> +	ret =3D regmap_write(priv->regmap, LM3697_OUTPUT_CONFIG, priv->bank_cfg=
);
> +	if (ret)
> +		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");

Missing goto out?

> +	for (i =3D 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
> +		led =3D &priv->leds[i];
> +		ret =3D ti_lmu_common_set_ramp(&led->lmu_data);
> +		if (ret)
> +			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
> +	}
> +out:
> +	return ret;
> +}
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyyQS0ACgkQMOfwapXb+vL00QCdGGMKXU+pkn1FlSPwGqjwH4ji
xNYAn2oruAF4VI90Pl3mq0SHs1pcvvgv
=/Je9
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
