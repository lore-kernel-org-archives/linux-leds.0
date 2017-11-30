From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Thu, 30 Nov 2017 23:34:07 +0100
Message-ID: <20171130223406.GC2808@amd>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
 <20171130094019.GA21887@amd>
 <545eb1a6-3235-9fe6-1d0d-958aa13e5170@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54694 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750921AbdK3WeJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Nov 2017 17:34:09 -0500
Content-Disposition: inline
In-Reply-To: <545eb1a6-3235-9fe6-1d0d-958aa13e5170@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-11-30 22:58:55, Jacek Anaszewski wrote:
> On 11/30/2017 10:40 AM, Pavel Machek wrote:
> > On Wed 2017-11-29 19:05:43, Bjorn Andersson wrote:
> >> The pointer returned by of_device_get_match_data() doesn't have the sa=
me
> >> size as u32 on 64-bit architectures, causing issues when compile testi=
ng
> >> the driver on such platform. Make ledtype unsigned long instead, to
> >> solve this problem.
> >>
> >> Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >=20
> > Ummm... no?
> >=20
> > extern const void *of_device_get_match_data(const struct device *dev);
> >=20
> >=20
> >> diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
> >> index a52674327857..cc2afe81720d 100644
> >> --- a/drivers/leds/leds-pm8058.c
> >> +++ b/drivers/leds/leds-pm8058.c
> >> @@ -29,7 +29,7 @@
> >>  struct pm8058_led {
> >>  	struct regmap *map;
> >>  	u32 reg;
> >> -	u32 ledtype;
> >> +	unsigned long ledtype;
> >=20
> > Make it void *. u32 is buggy. unsigned long is merely ugly code. void
> > * is not nice, but certainly better than unsigned long.
>=20
> unsigned long is correct, see below:
>=20
> static const struct of_device_id pm8058_leds_id_table[] =3D {
>         {
>                 .compatible =3D "qcom,pm8058-led",
>                 .data =3D (void *)PM8058_LED_TYPE_COMMON
>         },
>         {
>                 .compatible =3D "qcom,pm8058-keypad-led",
>                 .data =3D (void *)PM8058_LED_TYPE_KEYPAD
>         },
>         {
>                 .compatible =3D "qcom,pm8058-flash-led",
>                 .data =3D (void *)PM8058_LED_TYPE_FLASH
>         },
>         { },
> };
>=20
> of_device_get_match_data will return PM8058_LED_TYPE_*
> which clearly is a led type identifier.
>=20
> Thus unsigned long looks reasonable.

Hmm. Ok. So u32 would actually make even more sense there (because
PM8058_LED_TYPE_* does not really need to be 64-bit), but it would
cause a warning.

I don't like this. This fix actually makes code waste memory and is
uglier.

=2E..but we get a warning fix. So I don't like the patch, but it is an
improvement...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlogh14ACgkQMOfwapXb+vK70QCgwhtskbVdvit+Inb6m6L1gODR
P10AoIwAzqRGch4LLpdP9eipzBvirMxg
=es2L
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
