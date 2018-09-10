From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v8 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 10 Sep 2018 23:20:51 +0200
Message-ID: <20180910212051.GB4697@amd>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536027873.git.baolin.wang@linaro.org>
 <20180908050208.GY2523@minitux>
 <0190dc10-99a3-abb7-b196-a537c49a2b6e@gmail.com>
 <CAMz4kuK=t9t0nZaVHguv_BVH5WKTDvxPrxCjPrpws9=VV_57ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuK=t9t0nZaVHguv_BVH5WKTDvxPrxCjPrpws9=VV_57ag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> I'm still convinced that this will confuse our users and to me it would
> >> be more logical if this denotes the number of times the pattern should
> >> be repeated, with e.g. negative numbers denoting infinite.
> >
> > Sounds reasonable. Let's change this semantics as you propose.
> >
> >> In particular I expect to have to explain why my driver expects that y=
ou
> >> write 0 in the file named "repeat" to make it repeat and 1 to make it
> >> not repeat.
>=20
> Hm, so there are some cases we need to make clear.
> 1) If negative numbers present infinite, so what's the meaning of number =
0?
> 2) What we should show for users if repeat number is negative, just
> show negative numbers or one string "infinite"?

I'd say just -1 is infinite, anything else is error.

And yes, reading it should just display -1.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluW4DMACgkQMOfwapXb+vIRYACfUOm5UgiwdZQQCFVSVG9lOeQE
kUYAoIB9aeDi3jtaGk/9BaMm/73NNuAT
=V+ge
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
