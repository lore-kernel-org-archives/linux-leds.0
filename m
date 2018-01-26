From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Fri, 26 Jan 2018 11:25:07 +0100
Message-ID: <20180126102507.GA13775@amd>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40741 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752642AbeAZKZK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jan 2018 05:25:10 -0500
Content-Disposition: inline
In-Reply-To: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, sakari.ailus@iki.fi


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-01-26 09:38:28, Andy Shevchenko wrote:
> LM3555 is supported by AS3645A.
> Clarify this in Kconfig by referencing to AS3645A.
>=20
> No functional change.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 3e763d2a0cb3..0961882fa57f 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -601,6 +601,8 @@ config LEDS_LM355x
>  	  This option enables support for LEDs connected to LM355x.
>  	  LM355x includes Torch, Flash and Indicator functions.
> =20
> +	  Note, LM3555 is driven by AS3645A.
> +

I took a look at the driver. It seems to me lm355x only handles lm3554
and lm3556? Perhaps Kconfig help should say that explicitely?

(I guess lm3555 is somehow different from the other two?)
								Pavel

>  config LEDS_OT200
>  	tristate "LED support for the Bachmann OT200"
>  	depends on LEDS_CLASS && HAS_IOMEM && (X86_32 || COMPILE_TEST)

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlprAgMACgkQMOfwapXb+vJFxwCeIzwRNcv8mHPR8HahALu1RZoo
ycYAoIHFGbtXVj4Da6mA9Z+dDTdqo2uZ
=ZzlW
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
