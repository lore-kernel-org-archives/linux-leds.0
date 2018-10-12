From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 2/9] dt-bindings: ti-lmu: Remove LM3697
Date: Fri, 12 Oct 2018 20:03:12 +0200
Message-ID: <20181012180312.GB5565@amd>
References: <20181011165123.32198-1-dmurphy@ti.com>
 <20181011165123.32198-3-dmurphy@ti.com>
 <20181011182734.GA7973@amd>
 <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
 <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
 <20181012162619.GA28573@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181012162619.GA28573@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, lee.jones@linaro.org, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > >>
> > >> NAK.
> > >=20
> > > Thanks for the NAK.
> > >=20
> > > This NAK was NAK'd by other maintainer in the V2 RFC patchset
> > >=20
> > > https://lore.kernel.org/patchwork/patch/993171/
> >=20
> > I confirm. LM3697 is a standalone device and not a cell of any
> > MFD device.
> >=20
> > Waiting for DT maintainer's ack.
>=20
> You all sort out what you want... I can't follow it all, and I'm not=20
> going to spend the time trying to figure out what is going on here.

This is what I want:

> As this is worded, changing the driver is a Linux problem and irrelevant=
=20
> to the binding. Now if you want to move documentation to a location that=
=20
> makes more sense, then fine. But structure patches that way and make it=
=20
> clear that from an binding ABI perspective, nothing is changing.

=2E..but apparently I did not have enough authority to get it.

(I'm ok with move, and it is possible that binding does need some
fixups besides the move; still it should be done as fixup not as a new
binding).

Thanks,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvA4eAACgkQMOfwapXb+vKgBQCfUIZ/eXRCOTCJUVJpsOGMC5nR
58oAn37DSu7PFR32erjNbDh23QXc4GIz
=qPga
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
