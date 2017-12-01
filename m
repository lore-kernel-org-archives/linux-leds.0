From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: pm8058: Silence pointer to integer size warning
Date: Fri, 1 Dec 2017 09:36:42 +0100
Message-ID: <20171201083642.GA4960@amd>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171201051656.31694-1-bjorn.andersson@linaro.org>
 <20171201075715.2bkjpjfqbitz2bem@dell>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38452 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbdLAIgo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Dec 2017 03:36:44 -0500
Content-Disposition: inline
In-Reply-To: <20171201075715.2bkjpjfqbitz2bem@dell>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-12-01 07:57:15, Lee Jones wrote:
> On Thu, 30 Nov 2017, Bjorn Andersson wrote:
>=20
> > The pointer returned by of_device_get_match_data() doesn't have the same
> > size as u32 on 64-bit architectures, causing a compile warning when
> > compile-testing the driver on such platform.
> >=20
> > Cast the return value of of_device_get_match_data() to unsigned long and
> > then to u32 to silence this warning.
> >=20
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks!

Acked-by: Pavel Machek <pavel@ucw.cz>

> > diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
> > index a52674327857..8988ba3b2d65 100644
> > --- a/drivers/leds/leds-pm8058.c
> > +++ b/drivers/leds/leds-pm8058.c
> > @@ -106,7 +106,7 @@ static int pm8058_led_probe(struct platform_device =
*pdev)
> >  	if (!led)
> >  		return -ENOMEM;
> > =20
> > -	led->ledtype =3D (u32)of_device_get_match_data(&pdev->dev);
> > +	led->ledtype =3D (u32)(unsigned long)of_device_get_match_data(&pdev->=
dev);
>=20
> Wouldn't (u32)(void *) be even more correct?
>=20
> ... if the compiler will let you get away with it.

Afaict that would still produce the warning. of_device_get_match_data
already returns void *.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlohFJoACgkQMOfwapXb+vIH6QCfVix3nw8RTT6N2jGwVyIvhcz6
+bIAmwbeJmw4f/m0v40HL0uuYjyZnBl5
=3VJ8
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
