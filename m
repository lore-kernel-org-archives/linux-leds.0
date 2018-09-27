From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Thu, 27 Sep 2018 23:47:05 +0200
Message-ID: <20180927214705.GB17346@amd>
References: <CAMz4kuJx9twJ=wM5qsucV3JH_VS-AC1aWMqpQOwAMkCuKBHLRg@mail.gmail.com>
 <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com>
 <20180921211758.GC18062@amd>
 <ccac8e5f-e122-9f7d-aa43-fa89c79cb1fe@gmail.com>
 <20180921221813.GA20355@amd>
 <20180922194451.GA27826@amd>
 <470f4037-b682-73f8-8063-b4d7a70e04bc@gmail.com>
 <CAMz4kuL431PPMnOAXev-4ZzYwiGwMtz90RQT0JTP2bSdZ7fHUg@mail.gmail.com>
 <9188b107-92da-11aa-9903-848e3f347f8c@gmail.com>
 <CAMz4kuLE4WkMHVW3bUwOdcx8wSfZOXJhN47-B4_cBe1JiXef=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuLE4WkMHVW3bUwOdcx8wSfZOXJhN47-B4_cBe1JiXef=A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Actually you have it also:
> > "Duration of 0 means brightness should immediately change to new value"
> >
> > According to this, to get instant changes your pattern should look
> > like this:
> >
> > echo "0 100 0 0 20 100 20 0 40 100 40 0 80 100 80 0 100 100" > pattern
>=20
> Make sense. Thanks for your explanation.

Thanks for all the work and sorry for all the confusion!

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlutT9kACgkQMOfwapXb+vLbTQCeILW0TTKQKVhafEafhYvgJwyx
+1oAn1nZD8b2b/0KWcvEmSKo2Lm3vV/o
=sFvr
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
