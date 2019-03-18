From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 3/6] leds: netdev trigger: move newline handling back
 to device_name_store
Date: Mon, 18 Mar 2019 12:25:20 +0100
Message-ID: <20190318112520.GC6101@amd>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-4-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314140619.3309-4-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-03-14 15:06:16, Rasmus Villemoes wrote:
> Currently, setting device_name to a 15-character name requires
> avoiding a trailing newline (e.g. by using 'echo -n' or 'printf'),
> which is inconsistent and potentially surprising. Instead of
> potentially including a newline in the copy and then overwriting it,
> move the newline detection logic to the sysfs handler itself, and
> handle it by passing a smaller buffer size to
> netdev_trig_set_device().
>=20
> This also makes netdev_trig_set_device() a better fit for a future
> user, which will not need the newline truncation logic.
>=20
> We still have to tell userspace we consumed all the bytes it gave us,
> so we have to stash the original value of size.
>=20
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Acked-by: Pavel Machek <pavel@ucw.cz>

> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index 21605033e322..c35439291424 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -114,8 +114,6 @@ static void netdev_trig_set_device(struct led_netdev_=
data *trigger_data,
> =20
>  	memcpy(trigger_data->device_name, buf, size);
>  	trigger_data->device_name[size] =3D 0;
> -	if (size > 0 && trigger_data->device_name[size - 1] =3D=3D '\n')
> -		trigger_data->device_name[size - 1] =3D 0;
> =20
>  	if (trigger_data->device_name[0] !=3D 0)
>  		trigger_data->net_dev =3D
> @@ -134,7 +132,11 @@ static ssize_t device_name_store(struct device *dev,
>  				 size_t size)
>  {
>  	struct led_netdev_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +	size_t orig_size =3D size;
> =20
> +	/* Ignore trailing newline */
> +	if (size > 0 && buf[size - 1] =3D=3D '\n')
> +		size--;
>  	if (size >=3D IFNAMSIZ)
>  		return -EINVAL;
> =20
> @@ -147,7 +149,7 @@ static ssize_t device_name_store(struct device *dev,
>  	set_baseline_state(trigger_data);
>  	spin_unlock_bh(&trigger_data->lock);
> =20
> -	return size;
> +	return orig_size;
>  }
> =20
>  static DEVICE_ATTR_RW(device_name);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyPgCAACgkQMOfwapXb+vIRmACfZ4lWHdc5ZHtR4AXzUFHbpl8e
7JMAoI1HCEF9d3C3UqsFm8tHqxZjyhUQ
=K+os
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
