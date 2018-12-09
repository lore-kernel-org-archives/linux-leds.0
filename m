From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] led: triggers: Break the for loop after default
 trigger is found
Date: Sun, 9 Dec 2018 19:58:47 +0100
Message-ID: <20181209185847.GB6331@amd>
References: <20181209184942.22391-1-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209184942.22391-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org
List-Id: linux-leds@vger.kernel.org


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2018-12-09 19:49:41, Jacek Anaszewski wrote:
> It is of no avail to continue iterating through registered
> triggers in the led_trigger_set_default() after the trigger to set
> has been found. Add "break" statement to fix this omission.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 17d73db1456e..52b12e601ebe 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -200,8 +200,10 @@ void led_trigger_set_default(struct led_classdev *le=
d_cdev)
>  	down_read(&triggers_list_lock);
>  	down_write(&led_cdev->trigger_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (!strcmp(led_cdev->default_trigger, trig->name))
> +		if (!strcmp(led_cdev->default_trigger, trig->name)) {
>  			led_trigger_set(led_cdev, trig);
> +			break;
> +		}
>  	}
>  	up_write(&led_cdev->trigger_lock);
>  	up_read(&triggers_list_lock);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwNZecACgkQMOfwapXb+vJqOACgmfbn4ZU0GE/Y4e63y5ciJhEG
6v8An2sq4nj0m5dD04LbNtArKGkfqBZt
=5dK7
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
