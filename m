From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/2] leds: core: Introduce generic pattern interface
Date: Mon, 16 Jul 2018 23:43:54 +0200
Message-ID: <20180716214354.GA10734@amd>
References: <05c235df7bbcc4b898e7b263bf38338d9c822005.1531711385.git.baolin.wang@linaro.org>
 <6ecb22d5-fac4-dbe9-87e7-196d87d6d06f@lechnology.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6ecb22d5-fac4-dbe9-87e7-196d87d6d06f@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, jacek.anaszewski@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-07-16 11:51:01, David Lechner wrote:
> On 07/16/2018 06:10 AM, Baolin Wang wrote:
> >From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> >Some LED controllers have support for autonomously controlling
> >brightness over time, according to some preprogrammed pattern or
> >function.
> >
> >This adds a new optional operator that LED class drivers can implement
> >if they support such functionality as well as a new device attribute to
> >configure the pattern for a given LED.
> >
>=20
> Hmm... I was hoping that this would be a generic pattern trigger that
> could be used by any LED (e.g. gpio LEDs), not just LEDs with hardware
> support. I guess I cannot really test this after all.
>=20
> I think it looks good for your use case though.

Generic trigger doing patterns on any hardware would be welcome, too.

I even have a copy of code somewhere, if you want to dust it off,
clean up and merge...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltNEZoACgkQMOfwapXb+vLr8wCfSAhGyEvmu8sdlw1crcLm1/Qg
whYAoJa4On8pQxgK8jAsPP5TpXuiyytL
=T15q
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
