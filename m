From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V2 1/2] leds: core: add OF variants of LED registering
 functions
Date: Tue, 7 Mar 2017 13:05:47 +0100
Message-ID: <20170307120547.GA2740@amd>
References: <20170306051945.14857-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48726 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754483AbdCGMNS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Mar 2017 07:13:18 -0500
Content-Disposition: inline
In-Reply-To: <20170306051945.14857-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-03-06 06:19:44, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> These new functions allow passing an additional device_node argument
> that will be internally set for created LED device. Thanks to this LED
> core code and triggers will be able to access DT node for reading extra
> info.
>=20
> The easiest solution for achieving this was reworking old functions to
> more generic ones & adding simple defines for API compatibility.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Both patches: Acked-by: Pavel Machek <pavel@ucw.cz>

> ---
> V2: Use new functions instead of adding property to the struct led_classd=
ev.
> ---
>  drivers/leds/led-class.c | 26 ++++++++++++++++----------
>  include/linux/leds.h     | 14 ++++++++++----
>  2 files changed, 26 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 95d971aa2440..349d334d2e98 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -182,11 +182,14 @@ static int led_classdev_next_name(const char *init_=
name, char *name,
>  }
> =20
>  /**
> - * led_classdev_register - register a new object of led_classdev class.
> - * @parent: The device to register.
> + * of_led_classdev_register - register a new object of led_classdev clas=
s.
> + *
> + * @parent: parent of LED device
>   * @led_cdev: the led_classdev structure for this device.
> + * @np: DT node describing this LED
>   */
> -int led_classdev_register(struct device *parent, struct led_classdev *le=
d_cdev)
> +int of_led_classdev_register(struct device *parent, struct device_node *=
np,
> +			    struct led_classdev *led_cdev)
>  {
>  	char name[LED_MAX_NAME_SIZE];
>  	int ret;
> @@ -199,6 +202,7 @@ int led_classdev_register(struct device *parent, stru=
ct led_classdev *led_cdev)
>  				led_cdev, led_cdev->groups, "%s", name);
>  	if (IS_ERR(led_cdev->dev))
>  		return PTR_ERR(led_cdev->dev);
> +	led_cdev->dev->of_node =3D np;
> =20
>  	if (ret)
>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
> @@ -234,7 +238,7 @@ int led_classdev_register(struct device *parent, stru=
ct led_classdev *led_cdev)
> =20
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(led_classdev_register);
> +EXPORT_SYMBOL_GPL(of_led_classdev_register);
> =20
>  /**
>   * led_classdev_unregister - unregisters a object of led_properties clas=
s.
> @@ -276,12 +280,14 @@ static void devm_led_classdev_release(struct device=
 *dev, void *res)
>  }
> =20
>  /**
> - * devm_led_classdev_register - resource managed led_classdev_register()
> - * @parent: The device to register.
> + * devm_of_led_classdev_register - resource managed led_classdev_registe=
r()
> + *
> + * @parent: parent of LED device
>   * @led_cdev: the led_classdev structure for this device.
>   */
> -int devm_led_classdev_register(struct device *parent,
> -			       struct led_classdev *led_cdev)
> +int devm_of_led_classdev_register(struct device *parent,
> +				  struct device_node *np,
> +				  struct led_classdev *led_cdev)
>  {
>  	struct led_classdev **dr;
>  	int rc;
> @@ -290,7 +296,7 @@ int devm_led_classdev_register(struct device *parent,
>  	if (!dr)
>  		return -ENOMEM;
> =20
> -	rc =3D led_classdev_register(parent, led_cdev);
> +	rc =3D of_led_classdev_register(parent, np, led_cdev);
>  	if (rc) {
>  		devres_free(dr);
>  		return rc;
> @@ -301,7 +307,7 @@ int devm_led_classdev_register(struct device *parent,
> =20
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(devm_led_classdev_register);
> +EXPORT_SYMBOL_GPL(devm_of_led_classdev_register);
> =20
>  static int devm_led_classdev_match(struct device *dev, void *res, void *=
data)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 0518903778b6..00dcb9f8293b 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -114,10 +114,16 @@ struct led_classdev {
>  	struct mutex		led_access;
>  };
> =20
> -extern int led_classdev_register(struct device *parent,
> -				 struct led_classdev *led_cdev);
> -extern int devm_led_classdev_register(struct device *parent,
> -				      struct led_classdev *led_cdev);
> +extern int of_led_classdev_register(struct device *parent,
> +				    struct device_node *np,
> +				    struct led_classdev *led_cdev);
> +#define led_classdev_register(parent, led_cdev)				\
> +	of_led_classdev_register(parent, NULL, led_cdev)
> +extern int devm_of_led_classdev_register(struct device *parent,
> +					 struct device_node *np,
> +					 struct led_classdev *led_cdev);
> +#define devm_led_classdev_register(parent, led_cdev)			\
> +	devm_of_led_classdev_register(parent, NULL, led_cdev)
>  extern void led_classdev_unregister(struct led_classdev *led_cdev);
>  extern void devm_led_classdev_unregister(struct device *parent,
>  					 struct led_classdev *led_cdev);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAli+ohsACgkQMOfwapXb+vImgQCeKmcSJ1mU6wYcR1lCiWxZqdq8
qiQAnjKVPL005+zOMu6Kz+zA6qEaKoXR
=n352
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
