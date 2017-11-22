From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Bug when using both "set" and "blink" functions
Date: Wed, 22 Nov 2017 13:36:05 +0100
Message-ID: <20171122123605.GB10654@amd>
References: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34220 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752370AbdKVMgJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Nov 2017 07:36:09 -0500
Content-Disposition: inline
In-Reply-To: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Craig McQueen <craig.mcqueen@innerrange.com.au>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-11-22 00:55:12, Craig McQueen wrote:
> I'd like to control a LED to possibly be any of:
>=20
> * Off
> * On
> * Blinking
>=20
> I've had this working fine in 3.14.x kernel.
>=20
> But when upgrading to 4.4.x, I found that the transition from "blinking" =
to "on" didn't work. Namely, if it's blinking and then I call led_set_brigh=
tness(led_cdev, LED_FULL), then it wouldn't work (I can't remember if it tu=
rned off, or remained blinking; it wasn't on anyway). I worked around it by=
 calling led_set_brightness(led_cdev, LED_OFF) just before led_set_brightne=
ss(led_cdev, LED_FULL).
>=20
> Now I have upgraded to 4.9.x, and found that the transition from "blinkin=
g" to "on" again isn't working. The LED ends up being off instead of on.
>=20
> Examining the code of led_set_brightness():
>=20
> * Behaviour is different depending on whether the brightness is LED_OFF (=
it schedules the blink to be turned off "soon") or other (it alters the bri=
ghtness of subsequent blinks).
> * It looks as though there are race conditions in the transition from bli=
nking to steady off -- it schedules the blink to be turned off "soon", so i=
t's difficult to guarantee a reliable transition from blinking to on/off.
>=20
> The combination of the above two points makes it seem difficult to robust=
ly go from blinking to off/on.
>=20
> So, my questions are:
>=20
> * What is the correct way to use the API to reliably control an LED
> for a combination of off/on/blinking?

You should be able to use sysfs from the userland. .. if that is
broken we need to fix it.

What are you trying to do?
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

iEYEARECAAYFAloVbzUACgkQMOfwapXb+vLpHQCgvMkW5CiLzJGCyTYP+Qq3Nd7Y
0GAAoKm4+hSZ25lfmYgaU1E9UkCTSZgd
=DWfG
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
