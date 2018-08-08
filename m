From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Wed, 8 Aug 2018 23:45:27 +0200
Message-ID: <20180808214527.GE15831@amd>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <20180808195903.GB20912@amd>
 <f6b3534b-2ee9-782e-35e5-e103c34528bc@ti.com>
 <20180808210215.GA15831@amd>
 <f18a5616-bb25-da0d-aec8-585e042b4919@ti.com>
 <20180808210926.GC15831@amd>
 <cdf671fa-674d-6e34-177e-c0e9cb4f6137@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cdf671fa-674d-6e34-177e-c0e9cb4f6137@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-08-08 16:41:16, Dan Murphy wrote:
> On 08/08/2018 04:09 PM, Pavel Machek wrote:
> > On Wed 2018-08-08 16:04:43, Dan Murphy wrote:
> >> On 08/08/2018 04:02 PM, Pavel Machek wrote:
> >>> Hi!
> >>>
> >>>>>> +	- #size-cells : 0
> >>>>>> +	- control-bank-cfg - : Indicates which sink is connected to whic=
h control bank
> >>>>>> +		0 - All HVLED outputs are controlled by bank A
> >>>>>> +		1 - HVLED1 is controlled bank B, HVLED2/3 are controlled by ban=
k A
> >>>>>> +		2 - HVLED2 is controlled bank B, HVLED1/3 are controlled by ban=
k A
> >>>>>> +		3 - HVLED1/2 are controlled by bank B, HVLED3 is controlled by =
bank A
> >>>>>> +		4 - HVLED3 is controlled by bank B, HVLED1/2 are controlled by =
bank A
> >>>>>> +		5 - HVLED1/3 is controlled by bank B, HVLED2 is controlled by b=
ank A
> >>>>>> +		6 - (default) HVLED1 is controlled by bank A, HVLED2/3 are cont=
rolled by bank B
> >>>>>> +		7 - All HVLED outputs are controlled by bank B
> >>>>>
> >>>>> This is quite long way to describe a bitmask, no? Could we make
> >>>>> it so that control-bank-cfg is not needed?
> >>>>
> >>>> The problem we have here is there is a potential to control
> >>>> 3 different LED string but only 2 sinks.  So control bank A can cont=
rol 2 LED strings and control
> >>>> bank b can control 1 LED string. =20
> >>>>
> >>>
> >>> Can we forget about the LED strings, and just expose the sinks as
> >>> Linux LED devices?
> >>
> >> 2 sinks 3 LED strings.  How do you know which LED string is which and =
what bank it belongs
> >> to when setting the brightness.  Each Bank has a separate register for=
 brightness control.
> >=20
> > Yes, and LED strings are statically assigned to banks, right?
> >=20
> > So why not simply forget about LED strings for sake of hw
> > abstractions, and work just with banks?
>=20
> How would you set the control bank register for the correct LED string co=
nfiguration?

Have property at each LED saying which which HVLEDs it controls?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltrZHcACgkQMOfwapXb+vLHwACfYdEY9DK0oVLl+0AXiEPOejmr
WMoAoJHQxgp0/N9crbJC2SI1+pALy27G
=qfPP
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--
