From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Sat, 18 Nov 2017 00:58:11 +0100
Message-ID: <20171117235811.GA26296@amd>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4@gmail.com>
 <0a78c883-f074-cc19-3c0c-fc05607400e9@ti.com>
 <20171115222323.GA18290@amd>
 <82336eb7-2b89-d37b-d688-4e4302766346@gmail.com>
 <16189eab-5541-9550-c027-1c9d2b5fa6d7@ti.com>
 <20171117112032.GA13855@amd>
 <000b01d35fc1$57ad0500$07070f00$@gmail.com>
 <17b8e1ce-092a-0449-4733-533162b26499@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55774 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965723AbdKQX6P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 18:58:15 -0500
Content-Disposition: inline
In-Reply-To: <17b8e1ce-092a-0449-4733-533162b26499@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 'Jacek Anaszewski' <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 'Lee Jones' <lee.jones@linaro.org>, 'Daniel Thompson' <daniel.thompson@linaro.org>


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> Well.. if it can control other LEDs than just backlight, I believe it
> >> can stay in the LED subsystem.
> >=20
> > I also agree with your opinion.
>=20
> I will make the necessary changes for v4.

I'm not sure if you need to make any changes. Just add default trigger
to the dts and you should be done.

> Just a heads up I won't be posting v4 until after the US holiday so you
> don't think I abandoned everything.

:-)
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloPd5MACgkQMOfwapXb+vI/HACgr9uF8gGupUn6i50N/pEOUEZf
9GoAoI5zJErfVPAxa9gXiD2yPJgxhuMg
=5lKN
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
