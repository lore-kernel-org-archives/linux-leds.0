From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [bug report] leds: Add support for Philips PCA955x I2C LED
 drivers
Date: Thu, 17 Aug 2017 13:27:38 +0200
Message-ID: <20170817112738.GA19377@amd>
References: <20170817102847.n4h5ez6zlfclkcjs@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57793 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751601AbdHQL1l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2017 07:27:41 -0400
Content-Disposition: inline
In-Reply-To: <20170817102847.n4h5ez6zlfclkcjs@mwanda>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ncase@xes-inc.com, linux-leds@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Hello Nate Case,
>=20
> The patch f46e9203d9a1: "leds: Add support for Philips PCA955x I2C
> LED drivers" from Jul 16, 2008, leads to the following static checker
> warning:
>=20
> 	drivers/leds/leds-pca955x.c:476 pca955x_probe()
> 	warn: this array is probably non-NULL. 'pdata->leds + i->name'
>=20
> drivers/leds/leds-pca955x.c
>    465                  switch (pca955x_led->type) {
>    466                  case PCA955X_TYPE_NONE:
>    467                          break;
>    468                  case PCA955X_TYPE_GPIO:
>    469                          ngpios++;
>    470                          break;
>    471                  case PCA955X_TYPE_LED:
>    472                          /*
>    473                           * Platform data can specify LED names and
>    474                           * default triggers
>    475                           */
>    476                          if (pdata->leds[i].name)
>                                     ^^^^^^^^^^^^^^^^^^^
> The comment implies that we should be testing pdata->leds[i].name[0] to
> see if any string has been set?

Someone was already submitting patch from this one, no?

And please don't mark this one as a "bug report". There's no bug. Your
code analysis tool found a way to make kernel code shorter... well, so
what?


									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmVfaoACgkQMOfwapXb+vJqKgCeIamYeKtGC4WbC9oUMsoo1OC5
D3EAnjCgkn8Q+xNksQDZ2yfEcG7cD3OL
=Gj3g
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
