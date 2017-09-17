From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Sun, 17 Sep 2017 20:23:59 +0200
Message-ID: <20170917182359.GB15328@amd>
References: <20170917033529.GA12375@olympus.mizrahi.com.ve>
 <20170917092628.GA6107@amd>
 <ace2a1ab-2582-bf40-9de9-715785d73562@mizrahi.com.ve>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40284 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751672AbdIQSYB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Sep 2017 14:24:01 -0400
Content-Disposition: inline
In-Reply-To: <ace2a1ab-2582-bf40-9de9-715785d73562@mizrahi.com.ve>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Mizrahi <alan@mizrahi.com.ve>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-09-17 21:17:04, Alan Mizrahi wrote:
> On 2017-09-17 18:26, Pavel Machek wrote:
> > On Sun 2017-09-17 12:35:29, Alan Mizrahi wrote:
> >> ---
> >=20
> > Some kind of changeset comment would be nice here.
>=20
> That's true, sorry about that.
>=20
> > Did you solve the crashes? What was the problem?
>=20
> The problem was gone after using led_classdev_unregister(), as suggested
> by Jacek.  Thanks for the hint!
>=20
> >> +static struct apu_led_profile apu1_led_profile[] =3D {
> >> +	{ "apu:1", 1,       APU1_FCH_GPIO_BASE + 0 * APU1_IOSIZE },
> >> +	{ "apu:2", LED_OFF, APU1_FCH_GPIO_BASE + 1 * APU1_IOSIZE },
> >> +	{ "apu:3", LED_OFF, APU1_FCH_GPIO_BASE + 2 * APU1_IOSIZE },
> >> +};
> >> +
> >> +static struct apu_led_profile apu2_led_profile[] =3D {
> >> +	{ "apu2:1", 1,       APU2_FCH_GPIO_BASE + 68 * APU2_IOSIZE },
> >> +	{ "apu2:2", LED_OFF, APU2_FCH_GPIO_BASE + 69 * APU2_IOSIZE },
> >> +	{ "apu2:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
> >> +};
> >=20
> > Do the leds have better names than 1/2/3? Are colors known?
>=20
> There are some drivers out there and they all used these names. I think
> using them would prevent confusions.  The enclosures for these devices
> don't have any labels for the leds such as "on" or "error", it's very
> generic.  They are all green.

Ok then, perhaps led can be named apu:green:1 ...?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm+vb8ACgkQMOfwapXb+vKd3ACfYXnd2vM+jchdJvrkausOJrd9
3sQAn39uzUIxGIQXB6G9M0ivLydA7eMa
=6LMj
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
