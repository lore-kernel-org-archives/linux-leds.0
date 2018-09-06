From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: pwm: silently error out on EPROBE_DEFER
Date: Thu, 6 Sep 2018 17:35:48 +0200
Message-ID: <20180906153548.GA10088@amd>
References: <20180906135904.13803-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180906135904.13803-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, sre@kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-09-06 15:59:04, Jerome Brunet wrote:
> When probing, if we fail to get the pwm due to probe deferal, we shouldn't
> print an error message. Just be silent in this case.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/leds/leds-pwm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index df80c89ebe7f..5d3faae51d59 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -100,8 +100,9 @@ static int led_pwm_add(struct device *dev, struct led=
_pwm_priv *priv,
>  		led_data->pwm =3D devm_pwm_get(dev, led->name);
>  	if (IS_ERR(led_data->pwm)) {
>  		ret =3D PTR_ERR(led_data->pwm);
> -		dev_err(dev, "unable to request PWM for %s: %d\n",
> -			led->name, ret);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(dev, "unable to request PWM for %s: %d\n",
> +				led->name, ret);
>  		return ret;
>  	}

Hmm, sometimes probing is deffered forever, and in such case debug
message is useful.

Do you see excessive number of these?
								=09
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluRSVQACgkQMOfwapXb+vK+YgCfUI4NqQjSSwLFdtosQU/WwyBR
/CwAniFEtMy49wZsLFs5DZuz30f8hAtu
=QU1u
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
