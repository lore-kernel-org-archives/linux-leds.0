From: Pavel Machek <pavel@ucw.cz>
Subject: "Say Y" on CONFIG_LEDS_TRIGGER_ACTIVITY
Date: Tue, 19 Sep 2017 21:50:02 +0200
Message-ID: <20170919195002.GA21940@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35307 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751074AbdISTuF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Sep 2017 15:50:05 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Help text says:

CONFIG_LEDS_TRIGGER_ACTIVITY:

This allows LEDs to be controlled by a immediate CPU usage.
The flash frequency and duty cycle varies from faint flashes to
intense brightness depending on the instant CPU load.
If unsure, say Y.

I don't believe this is important enough trigger that we should
suggest it by default. So I believe this should be changed to "say N".

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlnBdOoACgkQMOfwapXb+vK8CwCfSfthdSAy3yoR7YxGmhqzzJpi
N7IAoJG1OjxEdsSByRzli0gE9SKOUeEL
=87M+
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
