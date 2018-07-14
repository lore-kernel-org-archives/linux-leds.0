From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Sat, 14 Jul 2018 23:20:33 +0200
Message-ID: <20180714212033.GA31950@amd>
References: <1665b877dc2f886a90a00e3ca3b7425372d99b6e.1530248085.git.baolin.wang@linaro.org>
 <CAMz4kuJfPKykB6G-8C25mmMCfQgefv-Y=k2OQYZR_e0Tvg3guQ@mail.gmail.com>
 <8da1b769-8aa3-9698-467a-2e7b0707fecf@gmail.com>
 <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > It also drew my attention to the issue of desired pattern sysfs
> > interface semantics on uninitialized pattern. In your implementation
> > user seems to be unable to determine if the pattern is activated
> > or not. We should define the semantics for this use case and
> > describe it in the documentation. Possibly pattern could
> > return alone new line character then.

Let me take a step back: we have triggers.. like LED blinking.

How is that going to interact with patterns? We probably want the
patterns to be ignored in that case...?

Which suggest to me that we should treat patterns as a trigger. I
believe we do something similar with blinking already.

Then it is easy to determine if pattern is active, and pattern
vs. trigger issue is solved automatically.

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltKaSEACgkQMOfwapXb+vKJGwCdEF3ulFFXbcvA4gYX9fRI9HwR
u4sAoJO/HWV9eFgalZ/ymHT3IN5s5VSR
=f5Gu
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
