From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [bug report] leds: Add support for Philips PCA955x I2C LED
 drivers
Date: Thu, 17 Aug 2017 13:28:29 +0200
Message-ID: <20170817112829.GB19377@amd>
References: <20170817102847.n4h5ez6zlfclkcjs@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57823 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751949AbdHQL2b (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2017 07:28:31 -0400
Content-Disposition: inline
In-Reply-To: <20170817102847.n4h5ez6zlfclkcjs@mwanda>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ncase@xes-inc.com, linux-leds@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-08-17 13:28:47, Dan Carpenter wrote:
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
>=20

=46rom: Colin King <colin.king@canonical.com>
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski
<jacek.anaszewski@gmail.com>, Pavel
        Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
	Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
	Subject: [PATCH][leds-next] leds: pca955x: remove redundant
	null check on array name
	X-Mailer: git-send-email 2.11.0

=46rom: Colin Ian King <colin.king@canonical.com>

The check to see if pdata-leds[i].name is redundant as name is
a 32 byte char array and hence can never be null.  Remove the
redundant check.

Detected by CoverityScan, CID#1454218 ("Array compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-pca955x.c | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index f062d1e7640f..b12b7ea51867 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -473,10 +473,9 @@ static int pca955x_probe(struct i2c_client
*client,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmVfd0ACgkQMOfwapXb+vKNvgCfXupZgJIJlDw/JRkox61Y6toa
ZUQAoJiO8LG7YmNpKYEJmy9S6BcJK9EL
=z4Ol
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
