From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 2/9] dt-bindings: ti-lmu: Remove LM3697
Date: Mon, 15 Oct 2018 23:45:12 +0200
Message-ID: <20181015214512.GA2001@amd>
References: <20181011165123.32198-3-dmurphy@ti.com>
 <20181011182734.GA7973@amd>
 <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
 <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
 <20181012162619.GA28573@bogus>
 <20181012180312.GB5565@amd>
 <60cc9238-aba2-aa6a-64a4-2b5e20835549@gmail.com>
 <CAL_Jsq+Yspr_iNP1eYanvtmiuMf-xNEZ0suDH3tQayV=V5r5=g@mail.gmail.com>
 <73647af4-0258-49a9-d9b6-eeef7e7813dc@gmail.com>
 <5c7f03cc-4d45-6010-523d-46721c218731@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c7f03cc-4d45-6010-523d-46721c218731@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> Given this one seems to have not really been finished, it's probably
> >> okay to make changes in this case. Still, it would be good to see
> >> patches structured so that it's obvious we're breaking things. But how
> >> the patches are structured doesn't matter until there's some agreement
> >> on the end result.
> >=20
> > OK, so if I'm getting it right, the correct patch structure in this case
> > means that changes removing bindings from MFD and moving them along
> > with the modifications to the LED subsystem should be placed in a single
> > patch.
> >=20
> > Dan, could you please arrange the next patch set version accordingly?
>=20
> Yes I can squash the DT bindings patches and call it a "move and modify"

You can do move without problems. But if you plan to modify them,
please try to change as little as possible, make it separate patch and
explain why new version is better than old one.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvFCmgACgkQMOfwapXb+vLlCACdE9/pTkDCsUOQs5V3SQPhXgeN
rnEAn2i3kGhzClVvDPKYX6+2Tw2FyH83
=UNmj
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
