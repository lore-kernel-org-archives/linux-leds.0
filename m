From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Wed, 8 Aug 2018 23:09:26 +0200
Message-ID: <20180808210926.GC15831@amd>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <20180808195903.GB20912@amd>
 <f6b3534b-2ee9-782e-35e5-e103c34528bc@ti.com>
 <20180808210215.GA15831@amd>
 <f18a5616-bb25-da0d-aec8-585e042b4919@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f18a5616-bb25-da0d-aec8-585e042b4919@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-08-08 16:04:43, Dan Murphy wrote:
> On 08/08/2018 04:02 PM, Pavel Machek wrote:
> > Hi!
> >=20
> >>>> +	- #size-cells : 0
> >>>> +	- control-bank-cfg - : Indicates which sink is connected to which =
control bank
> >>>> +		0 - All HVLED outputs are controlled by bank A
> >>>> +		1 - HVLED1 is controlled bank B, HVLED2/3 are controlled by bank A
> >>>> +		2 - HVLED2 is controlled bank B, HVLED1/3 are controlled by bank A
> >>>> +		3 - HVLED1/2 are controlled by bank B, HVLED3 is controlled by ba=
nk A
> >>>> +		4 - HVLED3 is controlled by bank B, HVLED1/2 are controlled by ba=
nk A
> >>>> +		5 - HVLED1/3 is controlled by bank B, HVLED2 is controlled by ban=
k A
> >>>> +		6 - (default) HVLED1 is controlled by bank A, HVLED2/3 are contro=
lled by bank B
> >>>> +		7 - All HVLED outputs are controlled by bank B
> >>>
> >>> This is quite long way to describe a bitmask, no? Could we make
> >>> it so that control-bank-cfg is not needed?
> >>
> >> The problem we have here is there is a potential to control
> >> 3 different LED string but only 2 sinks.  So control bank A can contro=
l 2 LED strings and control
> >> bank b can control 1 LED string. =20
> >>
> >=20
> > Can we forget about the LED strings, and just expose the sinks as
> > Linux LED devices?
>=20
> 2 sinks 3 LED strings.  How do you know which LED string is which and wha=
t bank it belongs
> to when setting the brightness.  Each Bank has a separate register for br=
ightness control.

Yes, and LED strings are statically assigned to banks, right?

So why not simply forget about LED strings for sake of hw
abstractions, and work just with banks?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltrXAYACgkQMOfwapXb+vLRgwCgun7cHxER0vRxtMReDpdcMpAT
I18AoJ9ajaQ301rF1GcXRgL1KIJpZP1i
=EMdf
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
