From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: pwm: fix max_brightness works abnormal when
 active_low
Date: Sun, 10 Feb 2019 17:39:30 +0100
Message-ID: <20190210163929.GA5780@amd>
References: <1549802229-31170-1-git-send-email-ysxie@foxmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549802229-31170-1-git-send-email-ysxie@foxmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yisheng Xie <ysxie@foxmail.com>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-02-10 20:37:09, Yisheng Xie wrote:
> When leds-pwm is active_low, smaller number of  duty kept in led_dat
> means less brighness, so we should disable pwm when led_dat->duty is
> equal to period instead of zero, which means max_brightness.

Will all pwm drivers leave the signal 'low' when pwm is disabled? Not
tristate or something?

Plus please use temporary variable. This is really hard to read.

Or maybe

   led_dat->active_low * new_duty =3D=3D led_dat->period

?
									Pavel

> Signed-off-by: Yisheng Xie <ysxie@foxmail.com>
> ---
>  drivers/leds/leds-pwm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index df80c89..07fb772 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -41,7 +41,7 @@ static void __led_pwm_set(struct led_pwm_data *led_dat)
> =20
>  	pwm_config(led_dat->pwm, new_duty, led_dat->period);
> =20
> -	if (new_duty =3D=3D 0)
> +	if (led_dat->active_low ? new_duty =3D=3D led_dat->period : new_duty =
=3D=3D 0)
>  		pwm_disable(led_dat->pwm);
>  	else
>  		pwm_enable(led_dat->pwm);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxgU8EACgkQMOfwapXb+vKdQACgrOCDOEQ6ShjNRvdar2Rp99HI
Om4AoKv2WMNlyJQ0BmYG7EzQSfx5PlXP
=9Vrw
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
