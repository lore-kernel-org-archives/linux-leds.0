From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Add driver for MCP45HV51 (digital potentiometer)
Date: Wed, 3 Jan 2018 20:00:26 +0100
Message-ID: <20180103190026.GA4564@amd>
References: <17da226a-247b-153a-6743-3e33264a1f0c@gmail.com>
 <20180103175628.GA31502@amd>
 <b4331c91-b35c-5e02-d70e-daf7cc689442@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33823 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750913AbeACTA1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jan 2018 14:00:27 -0500
Content-Disposition: inline
In-Reply-To: <b4331c91-b35c-5e02-d70e-daf7cc689442@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?Ga=EBtan?= Carlier <gcembed@gmail.com>
Cc: linux-leds@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-01-03 19:38:31, Ga=EBtan Carlier wrote:
> Hi Pavel,
> On 01/03/2018 06:56 PM, Pavel Machek wrote:
> >Hi!
> >
> >>I want to integrate MCP45HV51 I2C device to Linux kernel. It is a digit=
al
> >>potentiometer.
> >>I have several questions:
> >>- Is "leds driver" the correct section ?
> >>- On which existing I2C leds driver should I base my code to use the mo=
st
> >>recent API/pratice ?
> >>- Maybe it is not needed to write a C driver and everything can be done=
 via
> >>devicetree ?
> >
> >Umm. What makes you think that LED driver is correct section? LEDs are
> >little lights...
>=20
> I know that, but like Led and Backlight, digital potentiometers are just a
> device that needs a 0 to 255 value...
> So I don't know where to put it maybe in IIO driver ?

Is that _output_ device? What does it control?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpNKEkACgkQMOfwapXb+vK9UgCgmyBxv/BKFKCl4bkIJbkt5DQ7
YRcAnRp3PYdaoIdwRS9ZMe6aEOoWFtQP
=8eb4
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
