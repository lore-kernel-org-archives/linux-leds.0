From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] Qualcomm Light Pulse Generator
Date: Sun, 16 Jul 2017 23:15:42 +0200
Message-ID: <20170716211542.GA25658@amd>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170715091032.GA26602@amd>
 <20170716053429.GR1618@tuxbook>
 <20170706031813.GC12954@xo-6d-61-c0.localdomain>
 <20170716205304.GU1618@tuxbook>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170716205304.GU1618@tuxbook>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > >   DT: leds: Add Qualcomm Light Pulse Generator binding
> > > >=20
> > > > This one should be first.
> > > >=20
> > >=20
> > > Okay, no problems.
> > >=20
> > > > And I guess I'd prefer the driver to go in first, before the generic
> > > > pattern interface.
> > > >=20
> > >=20
> > > The driver won't compile without the additions to the header file. Wo=
uld
> > > you like the rest of the driver to go in first, then the generic
> > > interface and finally the pattern part of the driver?
> > >=20
> > > Large portions of the driver doesn't make sense without the pattern
> > > part, so I think I would prefer it to go in as one patch.
> >=20
> > Can we get minimum driver without the pattern parts?
>=20
> It's possible to do, but I must admit I find it slightly contrived.
>=20
> The overall design of different parts of the driver does relate to how I
> decided to structure and implement the pattern support, so this would
> mean that the driver we merge has a conceptual dependency on a
> out-of-tree part.

Ok... but I guess that's something we can live with?

> May I ask about the reasoning for your request? Is it just to not leave
> the driver hanging while we conclude the discussion on the pattern
> interface?

Yes; it would be good to have driver in the tree. OTOH new userland
interface is a "big" decission, and we'll have to support the
interface "forever" once it is merged.

Actually even complete driver (but w/o the userland interface) would
be acceptable. Drivers we can fix. Userland interfaces... not so.

Best regards,
   	       	       	      	   	    		      Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllr134ACgkQMOfwapXb+vIoJQCgmt6ZwDGOeBe7uR47r8d1ANlI
AX0An0oClmxzY5MTdSFLabJxz6fKCK8Z
=Wqy+
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
