From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 7/8] smiapp: Add support for flash, lens and EEPROM
 devices
Date: Sat, 17 Jun 2017 14:17:44 +0200
Message-ID: <20170617121744.GA419@amd>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-8-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497433639-13101-8-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> These types devices aren't directly related to the sensor, but are
> nevertheless handled by the smiapp driver due to the relationship of these
> component to the main part of the camera module --- the sensor.
>=20
> Additionally, for the async sub-device registration to work, the notifier
> containing matching fwnodes will need to be registered. This is natural to
> perform in a sensor driver as well.
>=20
> This does not yet address providing the user space with information on how
> to associate the sensor, lens or EEPROM devices but the kernel now has the
> necessary information to do that.

> -static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
> +static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev,
> +						   struct smiapp_sensor *sensor)
>  {
> +	static const char *props[] =3D { "flash", "lens", "eeprom" };
>  	struct smiapp_hwconfig *hwcfg;

Binding says "lens-focus" but this uses just "lens". I prefer
lens-focus, because we may also have lens-aperture...

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllFHegACgkQMOfwapXb+vK1mwCfWbnNXbcbXqHDr+9Qb9zJ294F
flsAnRoU1uDmbmCFepIRdw0lKKgh6aO2
=vLpH
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
