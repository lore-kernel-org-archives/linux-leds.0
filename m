From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Sat, 29 Dec 2018 20:07:26 +0100
Message-ID: <20181229190726.GA29851@amd>
References: <20181219193455.GA21159@amd>
 <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com>
 <20181219201047.GA23448@amd>
 <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <71d3ac12-5beb-0a26-71e1-5eae798e7b9f@gmail.com>
 <2bca210b-76ad-d5a9-906c-4151695050c3@gmail.com>
 <45ce01f0-af6e-1cc6-5126-fb557c7d2a82@ti.com>
 <b7c69135-1641-48cb-1770-c4c77a989efe@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b7c69135-1641-48cb-1770-c4c77a989efe@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>With the "color" sysfs file it will make more sense to allow for user
> >>defined color palettes.
> >>
> >
> >I think defining these values in the device tree or acpi severely limits=
 the devices
> >capabilities.  Especially in development phases.  If the knobs were expo=
sed then the user space
> >can create new experiences.  The color definition should be an absolute =
color defined in the dt and
> >either the framework or user space needs to mix these appropriately.  IM=
O user space should set the policy
> >of the user experience and the dt/acpi needs to set the capabilities.
> >
> >I do like Pavels idea on defining the more standard binding pattern to "=
group" leds into a single group.
> >
> >Maybe the framework could take these groups and combine/group them into =
a single node with the groups colors.
>=20
> There is still HSV approach [0] in store. One problem with proposed
> implementation is fixed algorithm of RGB <-> HSV color space conversion.
> Maybe allowing for some board specific adjustments in DT would add
> more flexibility.
>=20
> [0] https://lkml.org/lkml/2017/8/31/255

Yes we could do HSV. Problem is that that we do not really have RGB
available. We do have integers for red, green and blue, but they do
not correspond to RGB colorspace.

Anyway, this should not be driver specific; all drivers should use one
interface.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwnxe4ACgkQMOfwapXb+vLLuQCgsyA/q+pXpxpRmzHx11NczCI6
Lg8AnRKIDTsN4WEaM0y3R9pl1m6AeVpJ
=BqLo
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
