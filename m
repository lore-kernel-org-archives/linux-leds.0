From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1] leds: lp3952: Remove ACPI support for lp3952
Date: Tue, 21 Mar 2017 21:17:40 +0100
Message-ID: <20170321201739.GA20824@amd>
References: <20170321193315.33238-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:37262 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757076AbdCUURx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Mar 2017 16:17:53 -0400
Content-Disposition: inline
In-Reply-To: <20170321193315.33238-1-andriy.shevchenko@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, Tony Makkiel <tony.makkiel@daqri.com>


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-03-21 21:33:15, Andy Shevchenko wrote:
> In ACPI world any ID should be carefully chosen and registered
> officially. The discussion as I read it gets to wilful assignment an ID
> for non-existing real DSDT example.
>=20
> Rafael already told [2] how this device would be enumerated using
> compatible string.
>=20
> Based on above, remove non-official ACPI IDs and enumeration from the
> driver.

Hmm. Do any "real users" have hardware with TXNW3952 ACPI ID?

									Pavel

> -static const struct acpi_device_id lp3952_acpi_match[] =3D {
> -	{"TXNW3952", 0},
> -	{}
> -};
> -
> -MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> -#endif
> -
>  static struct i2c_driver lp3952_i2c_driver =3D {
>  	.driver =3D {
>  			.name =3D LP3952_NAME,
> -			.acpi_match_table =3D ACPI_PTR(lp3952_acpi_match),
>  	},
>  	.probe =3D lp3952_probe,
>  	.remove =3D lp3952_remove,

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljRimMACgkQMOfwapXb+vKNyACgsmo+3/00pYSIMOGnPL+5Bsqk
eh8AnArKMllx/snNIEOnYGJcPgTLIT6o
=wd3Z
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
