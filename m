From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [patch v3 1/1] leds: add driver for support Mellanox regmap LEDs
 for BMC
Date: Wed, 2 Aug 2017 13:11:36 +0200
Message-ID: <20170802111136.GA1120@amd>
References: <1501518091-100730-1-git-send-email-vadimp@mellanox.com>
 <1501518091-100730-2-git-send-email-vadimp@mellanox.com>
 <20170802083858.GA754@amd>
 <AM4PR05MB33304B09E2DACFBA55BABD1FA2B00@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50734 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752939AbdHBLLi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2017 07:11:38 -0400
Content-Disposition: inline
In-Reply-To: <AM4PR05MB33304B09E2DACFBA55BABD1FA2B00@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "=jacek.anaszewski@gmail.com" <=jacek.anaszewski@gmail.com>


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> > =3Djacek.anaszewski@gmail.com

That email address looks funny.

> > > +/* Codes for LEDs. */
> > > +#define MLXREG_LED_OFFSET_HALF	0x01 /* Offset from solid:
> > 3Hz blink */
> > > +#define MLXREG_LED_OFFSET_FULL	0x02 /* Offset from solid:
> > 6Hz
> >=20
> > Can it do half brightness?
>=20
>=20
> This is about blinking  frequency. Hardware support 6 hz blinking mode an=
d 3hz blinking mode.
> If solid orange f.e. has bit mask 1100, setting 1101 or 1110 will blink o=
range with 3 or 6 KHz.

OFFSET_HALF -> OFFSET_BLINK_3HZ?

Otherwise looks good,

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmBs2gACgkQMOfwapXb+vLu8QCfS1GhalpBX3y29It4tb6tOyJj
E5YAnRl+bJ3EUhjXFxjmxjvnJS51qa/8
=XYY1
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
