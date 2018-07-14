From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Sun, 15 Jul 2018 00:29:25 +0200
Message-ID: <20180714222924.GA2776@amd>
References: <1665b877dc2f886a90a00e3ca3b7425372d99b6e.1530248085.git.baolin.wang@linaro.org>
 <CAMz4kuJfPKykB6G-8C25mmMCfQgefv-Y=k2OQYZR_e0Tvg3guQ@mail.gmail.com>
 <8da1b769-8aa3-9698-467a-2e7b0707fecf@gmail.com>
 <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd>
 <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2018-07-15 00:02:57, Jacek Anaszewski wrote:
> Hi Pavel,
>=20
> On 07/14/2018 11:20 PM, Pavel Machek wrote:
> >Hi!
> >
> >>>It also drew my attention to the issue of desired pattern sysfs
> >>>interface semantics on uninitialized pattern. In your implementation
> >>>user seems to be unable to determine if the pattern is activated
> >>>or not. We should define the semantics for this use case and
> >>>describe it in the documentation. Possibly pattern could
> >>>return alone new line character then.
> >
> >Let me take a step back: we have triggers.. like LED blinking.
> >
> >How is that going to interact with patterns? We probably want the
> >patterns to be ignored in that case...?
> >
> >Which suggest to me that we should treat patterns as a trigger. I
> >believe we do something similar with blinking already.
> >
> >Then it is easy to determine if pattern is active, and pattern
> >vs. trigger issue is solved automatically.
>=20
> I'm all for it. I proposed this approach during the previous
> discussions related to possible pattern interface implementations,
> but you seemed not to be so enthusiastic in [0].
>=20
> [0] https://lkml.org/lkml/2017/4/7/350

Hmm. Reading my own email now, I can't decipher it.

I believe I meant "changing patterns from kernel in response to events
is probably overkill"... or something like that.

Sorry about confusion,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltKeUQACgkQMOfwapXb+vIwGwCdGSEWCtTrqnALWtu/u3PaXpkp
nyMAniy/PdfB/SjZFi/V93NsCT/Lybcs
=l8Lc
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
