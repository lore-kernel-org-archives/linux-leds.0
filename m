From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/3] led: ledtrig-transient: add support for hrtimer
Date: Mon, 8 May 2017 23:06:02 +0200
Message-ID: <20170508210602.GA7260@amd>
References: <20170430213701.12297-1-dtwlin@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46797 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbdEHVGF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 May 2017 17:06:05 -0400
Content-Disposition: inline
In-Reply-To: <20170430213701.12297-1-dtwlin@google.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lin <dtwlin@google.com>
Cc: corbet@lwn.net, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, hdegoede@redhat.com, mark.rutland@arm.com, tony.makkiel@daqri.com, linz@li-pro.net, robh@kernel.org, romlem@google.com, joelaf@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-04-30 14:36:58, David Lin wrote:
> Hi,
>=20
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

Yes, and objection still stands: You are misusing LED subsystem for
vibration motors. We already have support for haptic feedback in input
subsystem.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkQ3boACgkQMOfwapXb+vIMpACgrwOJTvFE22hfL00YK7yZVSRD
MKIAn0BPS7ZRu2QYvoaYDS6qf1jMZiKm
=ulW9
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
