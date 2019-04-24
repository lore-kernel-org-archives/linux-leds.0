From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 04/26] dt-bindings: leds: Add LED_COLOR_ID definitions
Date: Wed, 24 Apr 2019 15:49:15 +0200
Message-ID: <20190424134915.GB14360@amd>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-5-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417205439.17685-5-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Baolin Wang <baolin.wang@linaro.org>, Dan Murphy <dmurphy@ti.com>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-04-17 22:54:17, Jacek Anaszewski wrote:
> Add common LED color identifiers.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>
> ---
>  include/dt-bindings/leds/common.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds=
/common.h
> index da0539490cea..d8c8c38700bd 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -56,4 +56,15 @@
>  #define LED_FUNCTION_WLAN "wlan"
>  #define LED_FUNCTION_WPS "wps"
> =20
> +/* Standard LED colors */
> +#define LED_COLOR_ID_WHITE	0
> +#define LED_COLOR_ID_RED	1
> +#define LED_COLOR_ID_GREEN	2
> +#define LED_COLOR_ID_BLUE	3
> +#define LED_COLOR_ID_AMBER	4
> +#define LED_COLOR_ID_VIOLET	5
> +#define LED_COLOR_ID_YELLOW	6
> +#define LED_COLOR_ID_IR		7
> +#define LED_COLOR_ID_COUNT	8

The "_COUNT" define confused me. I was trying to figure out what color
it is. We sometimes have "_MAX" in that meaning.

Probably can be merged with previous patch?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzAaVsACgkQMOfwapXb+vKlcACeLRg3DUaro1K2Ez6hua8Y7WQ9
IJ8AnR0VOOi7clRoT8THP7Vd5xiTk6em
=keiw
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
