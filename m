From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] led: triggers: Add LED_INIT_DEFAULT_TRIGGER flag
Date: Sun, 9 Dec 2018 20:00:37 +0100
Message-ID: <20181209190037.GC6331@amd>
References: <20181209184942.22391-1-jacek.anaszewski@gmail.com>
 <20181209184942.22391-2-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209184942.22391-2-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org
List-Id: linux-leds@vger.kernel.org


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Set the flag in the led_trigger_set_default(). It is expected to be
> cleared in the activate() op of a trigger after trigger fwnode
> initialization data is parsed and applied. This should happen only
> once after LED class device registration, to allow leaving triggers
> in the idle state on re-apply and let the users apply their own
> settings without being interfered with the default ones.

This is not exactly english :-(. "without interference from"?

I guess we could wait with this till we have an in-tree user?

Thanks,
								Pavel

> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>  drivers/leds/led-triggers.c | 2 ++
>  include/linux/leds.h        | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 52b12e601ebe..9421222ca7a0 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -201,10 +201,12 @@ void led_trigger_set_default(struct led_classdev *l=
ed_cdev)
>  	down_write(&led_cdev->trigger_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
>  		if (!strcmp(led_cdev->default_trigger, trig->name)) {
> +			led_cdev->flags |=3D LED_INIT_DEFAULT_TRIGGER;
>  			led_trigger_set(led_cdev, trig);
>  			break;
>  		}
>  	}
> +
>  	up_write(&led_cdev->trigger_lock);
>  	up_read(&triggers_list_lock);
>  }
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 7393a316d9fa..6f05a5816371 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -51,6 +51,7 @@ struct led_classdev {
>  #define LED_PANIC_INDICATOR	BIT(20)
>  #define LED_BRIGHT_HW_CHANGED	BIT(21)
>  #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
> +#define LED_INIT_DEFAULT_TRIGGER BIT(23)
> =20
>  	/* set_brightness_work / blink_timer flags, atomic, private. */
>  	unsigned long		work_flags;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwNZlUACgkQMOfwapXb+vIRBQCcC4EG0Yg+hp2ckp+IheOu2/DB
PHsAnAwMxfNZT5rpwHZPeUFSbNeObGIY
=eo+E
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
