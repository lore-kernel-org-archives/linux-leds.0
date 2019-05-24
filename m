From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH AUTOSEL 5.1 033/375] leds: avoid races with workqueue
Date: Sat, 25 May 2019 00:55:05 +0200
Message-ID: <20190524225505.GA16076@amd>
References: <20190522192115.22666-1-sashal@kernel.org>
 <20190522192115.22666-33-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522192115.22666-33-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Could we hold this patch for now?

> From: Pavel Machek <pavel@ucw.cz>
>=20
> [ Upstream commit 0db37915d912e8dc6588f25da76d3ed36718d92f ]
>=20
> There are races between "main" thread and workqueue. They manifest
> themselves on Thinkpad X60:
>=20
> This should result in LED blinking, but it turns it off instead:
>=20
>     root@amd:/data/pavel# cd /sys/class/leds/tpacpi\:\:power
>     root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
>     root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
>=20
> It should be possible to transition from blinking to solid on by echo
> 0 > brightness; echo 1 > brightness... but that does not work, either,
> if done too quickly.
>=20
> Synchronization of the workqueue fixes both.
>=20
> Fixes: 1afcadfcd184 ("leds: core: Use set_brightness_work for the blockin=
g op")
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/leds/led-class.c | 1 +
>  drivers/leds/led-core.c  | 5 +++++
>  2 files changed, 6 insertions(+)

> index e3da7c03da1b5..e9ae7f87ab900 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -164,6 +164,11 @@ static void led_blink_setup(struct led_classdev *led=
_cdev,
>  		     unsigned long *delay_on,
>  		     unsigned long *delay_off)
>  {
> +	/*
> +	 * If "set brightness to 0" is pending in workqueue, we don't
> +	 * want that to be reordered after blink_set()
> +	 */
> +	flush_work(&led_cdev->set_brightness_work);
>  	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>  	    led_cdev->blink_set &&
>  	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))

This part is likely buggy. It seems triggers are using this from
atomic context... ledtrig-disk for example.


									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzodkkACgkQMOfwapXb+vI2uwCcDhcBUedPuemmTJH8HBfplj3n
Am0An36r7SaUBERnD+oeUjpUQZCYLV3s
=RkIY
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
