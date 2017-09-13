From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] led: ledtrig-transient: add support for hrtimer
Date: Wed, 13 Sep 2017 22:20:32 +0200
Message-ID: <20170913202032.GA30844@amd>
References: <20170913175400.42744-1-dtwlin@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170913175400.42744-1-dtwlin@google.com>
Sender: linux-doc-owner@vger.kernel.org
To: David Lin <dtwlin@google.com>
Cc: corbet@lwn.net, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, robh@kernel.org, romlem@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> These patch series add the LED_BRIGHTNESS_FAST flag support for
> ledtrig-transient to use hrtimer so that platforms with high-resolution t=
imer
> support can have better accuracy in the trigger duration timing. The need=
 for
> this support is driven by the fact that Android has removed the timed_oup=
ut [1]
> and is now using led-trigger for handling vibrator control which requires=
 the
> timer to be accurate up to a millisecond. However, this flag support woul=
d also
> allow hrtimer to co-exist with the ktimer without causing warning to the
> existing drivers [2].

NAK.

LEDs do not need extra overhead, and vibrator control should not go
through LED subsystem.

Input subsystem includes support for vibrations and force
feedback. Please use that instead.

									Pavel

> David Lin (3):
>   leds: Replace flags bit shift with BIT() macros
>   leds: Add the LED_BRIGHTNESS_FAST flag
>   led: ledtrig-transient: add support for hrtimer
>=20
>  Documentation/leds/leds-class.txt        |  5 +++
>  drivers/leds/trigger/ledtrig-transient.c | 59 ++++++++++++++++++++++++++=
+++---
>  include/linux/leds.h                     | 19 +++++-----
>  3 files changed, 69 insertions(+), 14 deletions(-)
>=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm5kxAACgkQMOfwapXb+vIVhgCfXO1F5xdBK/Cr/iO9f4H1iS9y
a58AoJqwpVjHK8LCE8ndASy8H7vNjecr
=TX2Z
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
