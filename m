From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Mon, 10 Sep 2018 17:41:49 +0200
Message-ID: <20180910154149.GA6845@amd>
References: <20180906135005.6718-1-dmurphy@ti.com>
 <20180906211617.GB16899@amd>
 <b8ac9d52-f16d-5fc4-0e9a-9246b9f984c5@ti.com>
 <20180907133228.GA16297@amd>
 <70f7506c-6a3d-3830-59a4-a246dc6163f7@ti.com>
 <226b8770-7041-39a4-5a06-6002a7c1225f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <226b8770-7041-39a4-5a06-6002a7c1225f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2018-09-08 21:53:00, Jacek Anaszewski wrote:
> Dan,
>=20
> On 09/07/2018 03:52 PM, Dan Murphy wrote:
> [...]
> >>
> >>> And I think Jacek pointed out that the bindings references in this bi=
ndings
> >>> don't even exist.
> >>>
> >>> I am thinking we need to deprecate this MFD driver and consolidate th=
ese drivers
> >>> in the LED directory as we indicated before.  I did not find any ti-l=
mu support
> >>> code.
> >>>
> >>> ti-lmu common core code and then the LED children appending the featu=
re differentiation.
> >>
> >>> Need some maintainer weigh in here.
> >>
> >> Hehe. I'm maintnainer. Fun.
> >=20
> > I know.  I want to see if there was any other opinion.  Especially for =
the LED driver.
> >=20
> [...]
>=20
> I have a question - is this lm3697 LED controller a cell of some MFD
> device? Or is it a self-contained chip?

lm3697 is number for stand-alone device, but same hardware seems to be
embedded into multi-functional chips, with other numbers in lm36xx
series.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAluWkL0ACgkQMOfwapXb+vImQQCffHlXQV24ag2AVempZPEtociN
qZAAl3PXs6dabqtCszyhHbns7S+wrNk=
=Aeim
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
