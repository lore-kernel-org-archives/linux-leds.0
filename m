From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Sun, 17 Sep 2017 11:26:28 +0200
Message-ID: <20170917092628.GA6107@amd>
References: <20170917033529.GA12375@olympus.mizrahi.com.ve>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56247 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750793AbdIQJ0b (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Sep 2017 05:26:31 -0400
Content-Disposition: inline
In-Reply-To: <20170917033529.GA12375@olympus.mizrahi.com.ve>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Mizrahi <alan@mizrahi.com.ve>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-09-17 12:35:29, Alan Mizrahi wrote:
> ---

Some kind of changeset comment would be nice here.

Did you solve the crashes? What was the problem?
								Pavel
							=09

> +static struct apu_led_profile apu1_led_profile[] =3D {
> +	{ "apu:1", 1,       APU1_FCH_GPIO_BASE + 0 * APU1_IOSIZE },
> +	{ "apu:2", LED_OFF, APU1_FCH_GPIO_BASE + 1 * APU1_IOSIZE },
> +	{ "apu:3", LED_OFF, APU1_FCH_GPIO_BASE + 2 * APU1_IOSIZE },
> +};
> +
> +static struct apu_led_profile apu2_led_profile[] =3D {
> +	{ "apu2:1", 1,       APU2_FCH_GPIO_BASE + 68 * APU2_IOSIZE },
> +	{ "apu2:2", LED_OFF, APU2_FCH_GPIO_BASE + 69 * APU2_IOSIZE },
> +	{ "apu2:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
> +};

Do the leds have better names than 1/2/3? Are colors known?

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm+P8QACgkQMOfwapXb+vL9AQCdFHZmuwm9Vi8Tuh+7TDoMC2dQ
7UgAnRhMuqx1GuwqjDIHiOOq5lqz/cos
=RG3O
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
