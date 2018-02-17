From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 1/2] leds: fix Kconfig text for MLXCPLD and SYSCON
Date: Sat, 17 Feb 2018 22:16:32 +0100
Message-ID: <20180217211632.GB9543@amd>
References: <1518682525-101578-1-git-send-email-vadimp@mellanox.com>
 <1518682525-101578-2-git-send-email-vadimp@mellanox.com>
 <20180215064841.GA2942@localhost>
 <AM4PR05MB3330009C62578134F5AE5E46A2F40@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57830 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751540AbeBQVQY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Feb 2018 16:16:24 -0500
Content-Disposition: inline
In-Reply-To: <AM4PR05MB3330009C62578134F5AE5E46A2F40@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-02-15 15:55:53, Vadim Pasternak wrote:
>=20
>=20
> > -----Original Message-----
> > From: Pavel Machek [mailto:pavel@ucw.cz]
> > Sent: Thursday, February 15, 2018 8:49 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: jacek.anaszewski@gmail.com; rpurdie@rpsys.net; linux-
> > leds@vger.kernel.org; jiri@resnulli.us
> > Subject: Re: [PATCH v7 1/2] leds: fix Kconfig text for MLXCPLD and SYSC=
ON
> >=20
> > On Thu 2018-02-15 08:15:24, Vadim Pasternak wrote:
> > > It fixes grammatical errors in Kconfig file for LEDS_SYSCON and
> > > LEDS_MLXCPLD.
> > >
> > > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > > Reported-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > ---
> > >  drivers/leds/Kconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig index
> > > a3fdf83..ed44013 100644
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -674,7 +674,7 @@ config LEDS_SYSCON
> > >  	depends on MFD_SYSCON
> > >  	depends on OF
> > >  	help
> > > -	  This option enabled support for the LEDs on syscon type
> > > +	  This option enable support for the LEDs on syscon type
> >=20
> > "enables".
>=20
> Sorry.
>=20
> Let's fix also these two?
> drivers/leds/Kconfig:     This option enable support for on-chip LED driv=
ers found
> drivers/leds/Kconfig:     This option enable support for LEDs found on th=
e LaCie 2Big

Yes please.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqIm7AACgkQMOfwapXb+vJ4ggCeJaxeZpWiWESq8fsfymge6yRp
X7YAn1hlH0M+i8nycw87e8rL1jh2vIDD
=asR6
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
