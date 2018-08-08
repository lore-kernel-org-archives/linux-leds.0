From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Wed, 8 Aug 2018 23:02:16 +0200
Message-ID: <20180808210215.GA15831@amd>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <20180808195903.GB20912@amd>
 <f6b3534b-2ee9-782e-35e5-e103c34528bc@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f6b3534b-2ee9-782e-35e5-e103c34528bc@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> +	- #size-cells : 0
> >> +	- control-bank-cfg - : Indicates which sink is connected to which co=
ntrol bank
> >> +		0 - All HVLED outputs are controlled by bank A
> >> +		1 - HVLED1 is controlled bank B, HVLED2/3 are controlled by bank A
> >> +		2 - HVLED2 is controlled bank B, HVLED1/3 are controlled by bank A
> >> +		3 - HVLED1/2 are controlled by bank B, HVLED3 is controlled by bank=
 A
> >> +		4 - HVLED3 is controlled by bank B, HVLED1/2 are controlled by bank=
 A
> >> +		5 - HVLED1/3 is controlled by bank B, HVLED2 is controlled by bank A
> >> +		6 - (default) HVLED1 is controlled by bank A, HVLED2/3 are controll=
ed by bank B
> >> +		7 - All HVLED outputs are controlled by bank B
> >=20
> > This is quite long way to describe a bitmask, no? Could we make
> > it so that control-bank-cfg is not needed?
>=20
> The problem we have here is there is a potential to control
> 3 different LED string but only 2 sinks.  So control bank A can control 2=
 LED strings and control
> bank b can control 1 LED string. =20
>=20

Can we forget about the LED strings, and just expose the sinks as
Linux LED devices?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltrWlcACgkQMOfwapXb+vJXKACeNsGqbtuMFPW3Jtr+9/aN7qRf
YZ8An3/jYlRDulqvn4ZuE/VdMsI+74Bq
=XbIL
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
