From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] dt: bindings: as3645a: Fix the example node
Date: Wed, 27 Dec 2017 22:19:45 +0100
Message-ID: <20171227211945.GA9205@amd>
References: <20171205133637.30022-1-dmurphy@ti.com>
 <20171206215204.7qyjjd2oue7n7l37@rob-hp-laptop>
 <2c2b1fc0-6156-2897-b597-6911fee64556@ti.com>
 <CAL_JsqKG2TWLTREqNecy_3pOqLFJWa4SM4G4yzyKsZqW7opDvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45416 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751335AbdL0VTr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Dec 2017 16:19:47 -0500
Content-Disposition: inline
In-Reply-To: <CAL_JsqKG2TWLTREqNecy_3pOqLFJWa4SM4G4yzyKsZqW7opDvw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-12-07 09:42:29, Rob Herring wrote:
> On Wed, Dec 6, 2017 at 4:32 PM, Dan Murphy <dmurphy@ti.com> wrote:
> > Rob
> >
> > On 12/06/2017 03:52 PM, Rob Herring wrote:
> >> On Tue, Dec 05, 2017 at 07:36:37AM -0600, Dan Murphy wrote:
> >>> Fix the address-cells and size-cells example node
> >>> to reflect to the correct representation.
> >>>
> >>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/leds/ams,as3645a.txt | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b=
/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> >>> index fdc40e354a64..8a49ccfec29b 100644
> >>> --- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> >>> +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> >>> @@ -59,8 +59,8 @@ Example
> >>>  =3D=3D=3D=3D=3D=3D=3D
> >>>
> >>>      as3645a@30 {
> >>> -            #address-cells: 1
> >>> -            #size-cells: 0
> >>> +            #address-cells =3D <1>;
> >>> +            #size-cells =3D <0>;
> >>>              reg =3D <0x30>;
> >>>              compatible =3D "ams,as3645a";
> >>
> >> Convention is also we put compatible first.
> >>
> >
> > OK I will move that too for v2.
> >
> > Can that be in the same patch or do you want a separate patch?
>=20
> Same patch is fine.

For fixed patch:

Signed-off-by: Pavel Machek <pavel@ucw.cz>

Thanks,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpEDnEACgkQMOfwapXb+vJF5gCcDzl4o3+4TGmuf0rIOnIGyjRS
jIoAoL9LU/VEiBH1EcOB5aY/z8KTxZZp
=atXk
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
