From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] tools/leds: Add led_hw_brightness_mon program
Date: Sun, 29 Jan 2017 17:56:06 +0100
Message-ID: <20170129165606.GA7949@amd>
References: <1485690751-4824-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50874 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751883AbdA2RCK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Jan 2017 12:02:10 -0500
Content-Disposition: inline
In-Reply-To: <1485690751-4824-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-01-29 12:52:31, Jacek Anaszewski wrote:
> LED subsystem supports POLLPRI on "brightness_hw_changed" sysfs file
> of LED class devices. This tool demonstrates how to use the feature.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

I'd name it something shorter. We have "uledmon" so
"led_hw_brightness_mon" is little out of place.

Acked-by: Pavel Machek <pavel@ucw.cz>

							Pavel
						=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAliOHqYACgkQMOfwapXb+vJw6QCeNKbufxTfXTXxCZshVhFr61pY
dlkAn2Ey0St3If06sQ/cgC+epC6IeSZp
=sVr6
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
