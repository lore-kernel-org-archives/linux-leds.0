From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Delete obsolete Versatile driver
Date: Thu, 4 May 2017 14:14:02 +0200
Message-ID: <20170504121402.GB32103@amd>
References: <20170504120308.6738-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53918 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753109AbdEDMOF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2017 08:14:05 -0400
Content-Disposition: inline
In-Reply-To: <20170504120308.6738-1-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-05-04 14:03:08, Linus Walleij wrote:
> All users of the Versatile LED driver are deleted and replaced
> with the very generic leds-syscon. Delete the old driver.

If someone has LEDS_VERSATILE selected, he'll be unhappy if we apply
first.

Are you sure no _users_ have LEDS_VERSATILE selected? Should we give
them some kind of warning? (#warning, printk, ...?)

								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkLGwoACgkQMOfwapXb+vIiXwCguqXtSUtqmhmiBo0KGsDCn6g6
WWoAn1zZ1p1uGKIIh98prrJKW+rqn/W4
=PaBY
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
