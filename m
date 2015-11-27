From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] leds: ns2: Remove work queue
Date: Fri, 27 Nov 2015 12:10:34 +0100
Message-ID: <20151127111034.GK4665@kw.sim.vm.gnt>
References: <1448016268-23024-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5KObZtj3Gjpm0OUY"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:46422 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753890AbbK0LCe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 27 Nov 2015 06:02:34 -0500
Content-Disposition: inline
In-Reply-To: <1448016268-23024-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org


--5KObZtj3Gjpm0OUY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacek,

On Fri, Nov 20, 2015 at 11:44:28AM +0100, Jacek Anaszewski wrote:
> Now the core implements the work queue, remove it from the driver,
> and switch to using brightness_set_blocking op for 'cansleep' case.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Simon Guinot <simon.guinot@sequanux.org>
> ---
>  drivers/leds/leds-ns2.c |   31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)

Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks,

Simon

>=20
> diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
> index a95a612..506b75b 100644
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@ -45,24 +45,12 @@ struct ns2_led_data {
>  	unsigned		cmd;
>  	unsigned		slow;
>  	bool			can_sleep;
> -	int			mode_index;
>  	unsigned char		sata; /* True when SATA mode active. */
>  	rwlock_t		rw_lock; /* Lock GPIOs. */
> -	struct work_struct	work;
>  	int			num_modes;
>  	struct ns2_led_modval	*modval;
>  };
> =20
> -static void ns2_led_work(struct work_struct *work)
> -{
> -	struct ns2_led_data *led_dat =3D
> -		container_of(work, struct ns2_led_data, work);
> -	int i =3D led_dat->mode_index;
> -
> -	gpio_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
> -	gpio_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
> -}
> -
>  static int ns2_led_get_mode(struct ns2_led_data *led_dat,
>  			    enum ns2_led_modes *mode)
>  {
> @@ -112,8 +100,8 @@ static void ns2_led_set_mode(struct ns2_led_data *led=
_dat,
>  		goto exit_unlock;
>  	}
> =20
> -	led_dat->mode_index =3D i;
> -	schedule_work(&led_dat->work);
> +	gpio_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
> +	gpio_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
> =20
>  exit_unlock:
>  	write_unlock_irqrestore(&led_dat->rw_lock, flags);
> @@ -136,6 +124,13 @@ static void ns2_led_set(struct led_classdev *led_cde=
v,
>  	ns2_led_set_mode(led_dat, mode);
>  }
> =20
> +static int ns2_led_set_blocking(struct led_classdev *led_cdev,
> +			enum led_brightness value)
> +{
> +	ns2_led_set(led_cdev, value);
> +	return 0;
> +}
> +
>  static ssize_t ns2_led_sata_store(struct device *dev,
>  				  struct device_attribute *attr,
>  				  const char *buff, size_t count)
> @@ -219,13 +214,16 @@ create_ns2_led(struct platform_device *pdev, struct=
 ns2_led_data *led_dat,
>  	led_dat->cdev.name =3D template->name;
>  	led_dat->cdev.default_trigger =3D template->default_trigger;
>  	led_dat->cdev.blink_set =3D NULL;
> -	led_dat->cdev.brightness_set =3D ns2_led_set;
>  	led_dat->cdev.flags |=3D LED_CORE_SUSPENDRESUME;
>  	led_dat->cdev.groups =3D ns2_led_groups;
>  	led_dat->cmd =3D template->cmd;
>  	led_dat->slow =3D template->slow;
>  	led_dat->can_sleep =3D gpio_cansleep(led_dat->cmd) |
>  				gpio_cansleep(led_dat->slow);
> +	if (led_dat->can_sleep)
> +		led_dat->cdev.brightness_set_blocking =3D ns2_led_set_blocking;
> +	else
> +		led_dat->cdev.brightness_set =3D ns2_led_set;
>  	led_dat->modval =3D template->modval;
>  	led_dat->num_modes =3D template->num_modes;
> =20
> @@ -238,8 +236,6 @@ create_ns2_led(struct platform_device *pdev, struct n=
s2_led_data *led_dat,
>  	led_dat->cdev.brightness =3D
>  		(mode =3D=3D NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
> =20
> -	INIT_WORK(&led_dat->work, ns2_led_work);
> -
>  	ret =3D led_classdev_register(&pdev->dev, &led_dat->cdev);
>  	if (ret < 0)
>  		return ret;
> @@ -250,7 +246,6 @@ create_ns2_led(struct platform_device *pdev, struct n=
s2_led_data *led_dat,
>  static void delete_ns2_led(struct ns2_led_data *led_dat)
>  {
>  	led_classdev_unregister(&led_dat->cdev);
> -	cancel_work_sync(&led_dat->work);
>  }
> =20
>  #ifdef CONFIG_OF_GPIO
> --=20
> 1.7.9.5

--5KObZtj3Gjpm0OUY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlZYOioACgkQgtp0PDeOcDrnvgCfSnP9lQwi/1hrSawsa19fwZCM
3f8AoKADird63zYrAq3LPizGOd53sKID
=zRVJ
-----END PGP SIGNATURE-----

--5KObZtj3Gjpm0OUY--
