From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: ktd2692: avoid harmless maybe-uninitialized warning
Date: Wed, 25 Jan 2017 23:36:27 +0100
Message-ID: <20170125223627.GA27700@amd>
References: <20170125222247.1210546-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60780 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752475AbdAYWgf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Jan 2017 17:36:35 -0500
Content-Disposition: inline
In-Reply-To: <20170125222247.1210546-1-arnd@arndb.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-01-25 23:22:36, Arnd Bergmann wrote:
> gcc gets confused about the control flow in ktd2692_parse_dt(), causing
> it to warn about what seems like a potential bug:
>=20
> drivers/leds/leds-ktd2692.c: In function 'ktd2692_probe':
> drivers/leds/leds-ktd2692.c:244:15: error: '*((void *)&led_cfg+8)' may be=
 used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> drivers/leds/leds-ktd2692.c:225:7: error: 'led_cfg.flash_max_microamp' ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> drivers/leds/leds-ktd2692.c:232:3: error: 'led_cfg.movie_max_microamp' ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>=20
> The code is fine, and slightly reworking it in an equivalent way lets
> gcc figure that out too, which gets rid of the warning.
>=20
> Fixes: 77e7915b15bb ("leds: ktd2692: Add missing of_node_put")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAliJKGsACgkQMOfwapXb+vLUcwCgpZ86UMyTpFDykXpTxQWUax4a
wTcAoKZxXz9jjppVJxtgSTUSB/ofnjqe
=6MTF
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
