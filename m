From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Add driver for MCP45HV51 (digital potentiometer)
Date: Wed, 3 Jan 2018 18:56:28 +0100
Message-ID: <20180103175628.GA31502@amd>
References: <17da226a-247b-153a-6743-3e33264a1f0c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60215 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750819AbeACR43 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jan 2018 12:56:29 -0500
Content-Disposition: inline
In-Reply-To: <17da226a-247b-153a-6743-3e33264a1f0c@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?Ga=EBtan?= Carlier <gcembed@gmail.com>
Cc: linux-leds@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I want to integrate MCP45HV51 I2C device to Linux kernel. It is a digital
> potentiometer.
> I have several questions:
> - Is "leds driver" the correct section ?
> - On which existing I2C leds driver should I base my code to use the most
> recent API/pratice ?
> - Maybe it is not needed to write a C driver and everything can be done v=
ia
> devicetree ?

Umm. What makes you think that LED driver is correct section? LEDs are
little lights...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpNGUsACgkQMOfwapXb+vIPkgCgg/x1Og5R7ykRTOXjlAsju6kr
e4IAn28Ql2suhT/GfMKU2ZouCCVtvFyy
=C7Ok
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
