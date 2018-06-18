From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: ledtrig-activity: use ktime_get_boot_ns()
Date: Mon, 18 Jun 2018 17:07:15 +0200
Message-ID: <20180618150715.GA30470@amd>
References: <20180618144210.72367-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180618144210.72367-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, y2038@lists.linaro.org, Kees Cook <keescook@chromium.org>, Willy Tarreau <w@1wt.eu>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> get_monotonic_boottime() is deprecated, so let's convert this to
> the simpler ktime_get_boot_ns().
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Have you tested it?

> diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigg=
er/ledtrig-activity.c
> index 5081894082bd..589c1bc4d0b9 100644
> --- a/drivers/leds/trigger/ledtrig-activity.c
> +++ b/drivers/leds/trigger/ledtrig-activity.c
> @@ -37,7 +37,6 @@ static void led_activity_function(struct timer_list *t)
>  	struct activity_data *activity_data =3D from_timer(activity_data, t,
>  							 timer);
>  	struct led_classdev *led_cdev =3D activity_data->led_cdev;
> -	struct timespec boot_time;
>  	unsigned int target;
>  	unsigned int usage;
>  	int delay;
> @@ -57,7 +56,7 @@ static void led_activity_function(struct timer_list *t)
>  		return;
>  	}
> =20
> -	get_monotonic_boottime(&boot_time);
> +	curr_boot =3D ktime_get_boot_ns();
> =20
>  	cpus =3D 0;
>  	curr_used =3D 0;
> @@ -76,7 +75,6 @@ static void led_activity_function(struct timer_list *t)
>  	 * down to 16us, ensuring we won't overflow 32-bit computations below
>  	 * even up to 3k CPUs, while keeping divides cheap on smaller systems.
>  	 */
> -	curr_boot =3D timespec_to_ns(&boot_time) * cpus;

Original code is pretty weird (notice the * cpus), so I'm
double-checking.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsnyqMACgkQMOfwapXb+vK/uQCZAYTmI74qMgeQqz0FH7Sa5OPu
rUoAn1VvVHnQiLdQXQp3rI6H+fvFl0a1
=0SR+
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
