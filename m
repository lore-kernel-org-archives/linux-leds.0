From: Pavel Machek <pavel@ucw.cz>
Subject: dts: fun with chip names Re: [PATCH v3 1/2] dt: bindings: lm3692x:
 Add bindings for lm3692x LED driver
Date: Thu, 16 Nov 2017 21:11:21 +0100
Message-ID: <20171116201121.GA28848@amd>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <20171116154139.wed7qmpmv2ffyzv2@rob-hp-laptop>
 <d3483e49-650d-1d68-bec6-eeb84d8ac48a@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47386 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932144AbdKPULY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Nov 2017 15:11:24 -0500
Content-Disposition: inline
In-Reply-To: <d3483e49-650d-1d68-bec6-eeb84d8ac48a@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Rob Herring <robh@kernel.org>, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> +Required properties:
> >> +	- compatible:
> >> +		"ti,lm3692x"
> >=20
> > Don't use wildcards in compatible strings.
>=20
> Do you mean to remove the x?  How do we denote a family of parts
> then?

I guess you should specify the exact chip.

Which will present interesting problem for me on Nokia N9/N950; in one
case, compatible chip is produced by two companies, and it looks like
some machines have one and some have the other; but we'd like to share
the dts as user has no chance telling them apart (and it is not
important, anyway).

In second case, chip is refered as APDS990X and I don't know where to
get more exact data.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloN8OkACgkQMOfwapXb+vIFyQCfXRircVGD2/nzXf19sOpXjd+n
fTAAn0qE7ONp9rP/u/zN8yw4rrmGX5fE
=FNHY
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
