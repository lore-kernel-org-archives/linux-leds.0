From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Thu, 30 Nov 2017 10:40:19 +0100
Message-ID: <20171130094019.GA21887@amd>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35281 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751295AbdK3JkW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Nov 2017 04:40:22 -0500
Content-Disposition: inline
In-Reply-To: <20171130030543.1071-1-bjorn.andersson@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-11-29 19:05:43, Bjorn Andersson wrote:
> The pointer returned by of_device_get_match_data() doesn't have the same
> size as u32 on 64-bit architectures, causing issues when compile testing
> the driver on such platform. Make ledtype unsigned long instead, to
> solve this problem.
>=20
> Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Ummm... no?

extern const void *of_device_get_match_data(const struct device *dev);


> diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
> index a52674327857..cc2afe81720d 100644
> --- a/drivers/leds/leds-pm8058.c
> +++ b/drivers/leds/leds-pm8058.c
> @@ -29,7 +29,7 @@
>  struct pm8058_led {
>  	struct regmap *map;
>  	u32 reg;
> -	u32 ledtype;
> +	unsigned long ledtype;

Make it void *. u32 is buggy. unsigned long is merely ugly code. void
* is not nice, but certainly better than unsigned long.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlof0gMACgkQMOfwapXb+vJtAQCfXV3tHMHMPcwIliFtKWBjkm0A
mYQAoKMagyXk7u7sUHd07LLsdRqcc7Zm
=y0aV
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
