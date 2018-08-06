From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 6 Aug 2018 10:06:17 +0200
Message-ID: <20180806080617.GA19523@amd>
References: <c43374283744539702023053c896efe3c73b7833.1533441631.git.baolin.wang@linaro.org>
 <3d7e8701-d92b-9f51-befa-a585b5957488@gmail.com>
 <CAMz4kuLSBLReVSo4zXf8b64kwCmRt2PS=JkeD2wJO41X-WmBQQ@mail.gmail.com>
 <20180806070958.GA5231@amd>
 <CAMz4kuKdtFDfvc4Lrx6yG5yu=qYRPj8MS5phxcLBkdKAPwXZyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuKdtFDfvc4Lrx6yG5yu=qYRPj8MS5phxcLBkdKAPwXZyQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-08-06 15:33:12, Baolin Wang wrote:
> Hi Pavel,
>=20
> On 6 August 2018 at 15:09, Pavel Machek <pavel@ucw.cz> wrote:
> > Hi!
> >
> >> > In current implementation this file on read returns the number
> >> > of remaining repeat intervals. I'd add that to this description.
> >>
> >> I saw Pavel's comments that he did not suggest do this. So I will keep
> >> the original description?
> >
> > If that is accepted, the code should return originally written number.
>=20
> But I think it is more reasonable if user can know how many
> repetitions were left. So for your hardware case, can we add
> pattern_get() interface back to get the repetition number?

Well, I'd say that we are mostly seeing "infinite" repetitions, or one
repetition.

Yes, interface could be added to the lowlever driver -- but I'm not
sure hardware really supports getting that information; could be
tricky on N900 for example.

I'd keep it simple for now.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltoAXkACgkQMOfwapXb+vINPgCeM8R1YrNqeXKoGB7to5s9Nodi
OcAAn18cPCIZ2NWLtPWT8uiTGpwE2jlz
=F074
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
