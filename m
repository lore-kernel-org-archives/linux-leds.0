From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] ARM: dts: BCM53573: Don't use nonexistent
 "default-off" LED trigger
Date: Fri, 10 Mar 2017 14:20:50 +0100
Message-ID: <20170310132049.GC11875@amd>
References: <20170308064105.26619-1-zajec5@gmail.com>
 <42bce8ea-f1dc-2018-33f1-d296ccd7b677@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:43595 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937383AbdCJNUw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Mar 2017 08:20:52 -0500
Content-Disposition: inline
In-Reply-To: <42bce8ea-f1dc-2018-33f1-d296ccd7b677@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-03-08 09:31:44, Florian Fainelli wrote:
> On 03/07/2017 10:41 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >=20
> > Such a trigger doesn't exist in Linux and is not needed as LED is being
> > turned off by default. This could cause errors in LEDs core code when
> > trying to set default trigger.
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Since you are fixing something, what's the proper Fixes: tag for this
> commit? Likewise for the second patch.

Lets not make submitting patches any harder than it already is.
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljCqDEACgkQMOfwapXb+vJF4gCfeHp0TKeAAqoYQCkDuf9L1rA3
EvQAoJz+k7aNgk/oPFrynI9HlUpU5H9M
=Ohym
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
