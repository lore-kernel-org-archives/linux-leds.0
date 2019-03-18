From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/6] leds: netdev trigger: factor out middle part of
 device_name_store
Date: Mon, 18 Mar 2019 12:24:31 +0100
Message-ID: <20190318112431.GB6101@amd>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-3-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314140619.3309-3-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Take the part of device_name_store that puts the old device (if any),
> copies the new device name, looks the name up etc. into a separate
> helper function. This is preparation for using that helper from a
> function that will initialize the led_netdev_data from a device tree
> node. No functional change.
>=20
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 30 ++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index 8d476b92f58c..21605033e322 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -104,19 +104,9 @@ static ssize_t device_name_show(struct device *dev,
>  	return len;
>  }
> =20
> -static ssize_t device_name_store(struct device *dev,
> -				 struct device_attribute *attr, const char *buf,
> -				 size_t size)
> +static void netdev_trig_set_device(struct led_netdev_data *trigger_data,
> +				   const char *buf, size_t size)
>  {
> -	struct led_netdev_data *trigger_data =3D led_trigger_get_drvdata(dev);
> -
> -	if (size >=3D IFNAMSIZ)
> -		return -EINVAL;
> -
> -	cancel_delayed_work_sync(&trigger_data->work);
> -
> -	spin_lock_bh(&trigger_data->lock);
> -
>  	if (trigger_data->net_dev) {
>  		dev_put(trigger_data->net_dev);
>  		trigger_data->net_dev =3D NULL;

I'd expect the helper function to do the >=3D IFNAMSIZ checking... but
not a huge deal.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyPf+8ACgkQMOfwapXb+vK4eQCcDRDfYmj+pYsMmb1KHtozXF7C
Ls0An0UlaoZ8pJxEOJEuYPMperLCEhKx
=c6Bd
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
