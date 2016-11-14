From: Pavel Machek <pavel@ucw.cz>
Subject: Help with LED subsystem maintainance
Date: Mon, 14 Nov 2016 21:31:18 +0100
Message-ID: <20161114203118.GA5365@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:37780 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932462AbcKNUbY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Nov 2016 15:31:24 -0500
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Would it make sense to list me as a co-maintainer for the LED
subsystem?

I'd leave patch collection / git tree maintenance to you, but I guess
I can help with design, locking, etc...

Thanks and best regards,
								Pavel

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/MAINTAINERS b/MAINTAINERS
index 01bff8e..d2934e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6884,6 +6884,7 @@ F:	drivers/scsi/53c700*
 LED SUBSYSTEM
 M:	Richard Purdie <rpurdie@rpsys.net>
 M:	Jacek Anaszewski <j.anaszewski@samsung.com>
+M:	Pavel Machek <pavel@ucw.cz>
 L:	linux-leds@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-le=
ds.git
 S:	Maintained




--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgqHxYACgkQMOfwapXb+vKofACfXUafV26wb8iKnqKzSjjavNfT
1EUAnjSk+o+9YTp4XKwFpYESr7Fr+sch
=gAUc
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
