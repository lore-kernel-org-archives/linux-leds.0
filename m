From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [bug report] leds: Add support for Philips PCA955x I2C LED
 drivers
Date: Thu, 17 Aug 2017 15:27:40 +0200
Message-ID: <20170817132740.GA20401@amd>
References: <20170817102847.n4h5ez6zlfclkcjs@mwanda>
 <20170817112738.GA19377@amd>
 <20170817114835.ypyhfhurntb4egvx@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33626 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751574AbdHQN1o (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2017 09:27:44 -0400
Content-Disposition: inline
In-Reply-To: <20170817114835.ypyhfhurntb4egvx@mwanda>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ncase@xes-inc.com, linux-leds@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-08-17 14:51:48, Dan Carpenter wrote:
> On Thu, Aug 17, 2017 at 01:27:38PM +0200, Pavel Machek wrote:
> > Hi!
> >=20
> > > Hello Nate Case,
> > >=20
> > > The patch f46e9203d9a1: "leds: Add support for Philips PCA955x I2C
> > > LED drivers" from Jul 16, 2008, leads to the following static checker
> > > warning:

> > >    472                          /*
> > >    473                           * Platform data can specify LED name=
s and
> > >    474                           * default triggers
> > >    475                           */
> > >    476                          if (pdata->leds[i].name)
> > >                                     ^^^^^^^^^^^^^^^^^^^
> > > The comment implies that we should be testing pdata->leds[i].name[0] =
to
> > > see if any string has been set?
> >=20
> > Someone was already submitting patch from this one, no?
> >=20
> > And please don't mark this one as a "bug report". There's no bug. Your
> > code analysis tool found a way to make kernel code shorter... well, so
> > what?
> >=20
>=20
> You didn't read my email.  It was only one sentence long...  :/

I read your subject, and it claimed bug.

Bug normally means: Hey, there's problem with the driver. It oopses my
kernel here.

> >From the comments, it looked like maybe a different test was intended.
> Anyway, that's the point of these warnings is because many times the
> bogus NULL test should be replaced with a correct test.  I don't forward
> the warning if it's obvious that the test should just be deleted.
>=20
> I probably could review the warnings even more but I am pretty busy and
> the code is obviously bogus and it's easier for the author.

Anyway, there was patch on the lists, already...
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmVmcwACgkQMOfwapXb+vJ0TgCgonSf8pNrJsIotunXjak03yE+
0/sAn0zvI7ltjOOXbkqGSGBjjzM1QhMz
=Ci1j
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
