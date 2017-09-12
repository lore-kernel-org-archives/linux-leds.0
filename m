From: Pavel Machek <pavel@ucw.cz>
Subject: Splitting led drivers to subdirectories?
Date: Tue, 12 Sep 2017 14:54:08 +0200
Message-ID: <20170912125408.GA4074@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49393 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751381AbdILMyK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Sep 2017 08:54:10 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Is it time to start splitting drivers into subdirectories?

I'd quite like to see drivers/leds/i2c/ and drivers/leds/flash/ . That
way it is easier to look at related drivers for inspiration...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm32PAACgkQMOfwapXb+vJLgACgg0NDZepQtup7KKX5EiV3yGmf
vr4AoLCGbPgS63QcgiaBUiqEDk8c2sUO
=YTrL
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
