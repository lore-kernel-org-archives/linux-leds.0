From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: lm3692x: Introduce LM3692x dual string driver
Date: Wed, 15 Nov 2017 14:00:58 +0100
Message-ID: <20171115130057.GA11557@amd>
References: <20171113205052.25884-1-dmurphy@ti.com>
 <20171113205052.25884-2-dmurphy@ti.com>
 <20171115104526.GC456@amd>
 <1b0c05a6-2261-85d5-a3c6-9753f7600a20@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60529 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757338AbdKONBA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Nov 2017 08:01:00 -0500
Content-Disposition: inline
In-Reply-To: <1b0c05a6-2261-85d5-a3c6-9753f7600a20@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> +	ret =3D regmap_write(led->regmap, LM3692X_PWM_CTRL,
> >> +		LM3692X_PWM_FILTER_100 | LM3692X_PWM_SAMP_24MHZ);
> >> +	if (ret)
> >> +		dev_err(&led->client->dev, "Failed programming PWM CTRL\n");
> >> +
> >> +	ret =3D regmap_write(led->regmap, LM3692X_BOOST_CTRL,
> >> +			LM3692X_BRHT_MODE_RAMP_MULTI |
> >> +			LM3692X_BL_ADJ_POL |
> >> +			LM3692X_RAMP_RATE_250us);
> >> +	if (ret)
> >> +		dev_err(&led->client->dev, "Failed programming BOOST CTRL\n");
> >> +
> >> +	ret =3D regmap_write(led->regmap, LM3692X_AUTO_FREQ_HI, 0x00);
> >> +	if (ret)
> >> +		dev_err(&led->client->dev, "Failed programming AUTO HI FREQ\n");
> >=20
> > If something fails, is it wise to continue?

If something fails, is it wise to continue?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloMOokACgkQMOfwapXb+vJOywCfQEXPDEYoFb9gkOitQ8l9BwSS
cwYAn3ct0iFQ6CYVE4n25WVF3zXXr+N5
=b7Bm
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
