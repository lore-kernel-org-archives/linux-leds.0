From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Fri, 26 Jan 2018 22:05:06 +0100
Message-ID: <20180126210506.GA7801@amd>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
 <20180126102507.GA13775@amd>
 <1516967041.7000.1282.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60781 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751363AbeAZVFI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jan 2018 16:05:08 -0500
Content-Disposition: inline
In-Reply-To: <1516967041.7000.1282.camel@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, sakari.ailus@iki.fi


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-01-26 13:44:01, Andy Shevchenko wrote:
> On Fri, 2018-01-26 at 11:25 +0100, Pavel Machek wrote:
> > On Fri 2018-01-26 09:38:28, Andy Shevchenko wrote:
> > > LM3555 is supported by AS3645A.
> > > Clarify this in Kconfig by referencing to AS3645A.
> > >=20
> > > No functional change.
>=20
> > > 	  This option enables support for LEDs connected to LM355x.
> > >  	  LM355x includes Torch, Flash and Indicator functions.
> > > =20
> > > +	  Note, LM3555 is driven by AS3645A.
> > > +
> >=20
> > I took a look at the driver. It seems to me lm355x only handles lm3554
> > and lm3556?
>=20
> Correct.
>=20
> >  Perhaps Kconfig help should say that explicitely?
>=20
> It's in the title.

Aha.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlprmAIACgkQMOfwapXb+vKVAQCcC2Wggn5rRxcJfgs9w6FydNLM
VegAmwZXoV5RraPvQ9HBodppgZRoiflW
=4NQq
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
