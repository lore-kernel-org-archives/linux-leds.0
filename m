From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] leds: ncp5623: Add device tree binding
 documentation
Date: Wed, 28 Sep 2016 12:58:58 +0200
Message-ID: <20160928105858.GA24545@amd>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-2-git-send-email-florian.vaussard@heig-vd.ch>
 <20160924115823.GA8696@amd>
 <836aa19e-7b42-9c86-4f95-3b60b816454c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50527 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752672AbcI1K7C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Sep 2016 06:59:02 -0400
Content-Disposition: inline
In-Reply-To: <836aa19e-7b42-9c86-4f95-3b60b816454c@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2016-09-28 12:02:41, Florian Vaussard wrote:
> Hi Pavel,
>=20
> Le 24. 09. 16 =E0 13:58, Pavel Machek a =E9crit :
> > Hi!
> >=20
> >> +Example
> >> +=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +led1: ncp5623@38 {
> >> +	#address-cells =3D <1>;
> >> +	#size-cells =3D <0>;
> >> +	compatible =3D "onnn,ncp5623";
> >> +	reg =3D <0x38>;
> >> +	onnn,led-iref-microamp =3D <10>;
> >> +
> >> +	led1r@0 {
> >> +		label =3D "ncp:power:red";
> >> +		linux,default-trigger =3D "default-on";
> > ...
> >> +	led1b@1 {
> >> +		label =3D "ncp:power:blue";
> >> +		reg =3D <1>;
> >=20
> > Actually... the three LEDs are packaged such as this is one colorful
> > light to the user, right? Some day we'll need to group them, so that
> > kernel can automatically tell this is one led, and probably add extra
> > attributes, such as values that produce white light.
> >=20
>=20
> Actually, it's up to the hardware designer to choose. On my board for ins=
tance,
> this chip is driving an RGB LED, but it can really drive three independen=
t LEDs
> if you want.

Yup. And driving RGB LED is really a bit different from driving three
independent LEDs: you'd for example like to be able to set the RGB LED
to white, and you need to know relative intensities for that.

So it would be good to have hardware description that captures
difference between RGB LED and three LEDs.

(And then, we'll want pattern engine to drive that. One day :-) ).

> I agree that the RGB case is quite common nowadays and currently not very=
 well
> managed by the LED subsystem. But I do not think that this is specific to=
 this
> driver.

No, it is not.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfronIACgkQMOfwapXb+vKFcQCfXxm3DXOW5yTTQaPsnCUO6aGo
hhYAn3aIrYuFsdyx/2wTOoY+O0o5BpBO
=c//6
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
