From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Fri, 1 Dec 2017 01:28:58 +0100
Message-ID: <20171201002858.GD2808@amd>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
 <20171130094019.GA21887@amd>
 <545eb1a6-3235-9fe6-1d0d-958aa13e5170@gmail.com>
 <20171130223406.GC2808@amd>
 <20171201101351.3e57f2b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57205 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751125AbdLAA3A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Nov 2017 19:29:00 -0500
Content-Disposition: inline
In-Reply-To: <20171201101351.3e57f2b1@canb.auug.org.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > of_device_get_match_data will return PM8058_LED_TYPE_*
> > > which clearly is a led type identifier.
> > >=20
> > > Thus unsigned long looks reasonable. =20
> >=20
> > Hmm. Ok. So u32 would actually make even more sense there (because
> > PM8058_LED_TYPE_* does not really need to be 64-bit), but it would
> > cause a warning.
> >=20
> > I don't like this. This fix actually makes code waste memory and is
> > uglier.
> >=20
> > ...but we get a warning fix. So I don't like the patch, but it is an
> > improvement...
>=20
> I *think* you can get away with (u32)(unsigned long)ptr ...

Yes, that should work. It would actually be my preferred solution.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlogokoACgkQMOfwapXb+vLsaACfUHg6dqim086tiMWZCthTQnDk
afEAoMKFGtPcHNbadcFCpJ3HaMGJgLmm
=y/An
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
