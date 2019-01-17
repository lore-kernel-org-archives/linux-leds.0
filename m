From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Date: Thu, 17 Jan 2019 11:06:51 +0100
Message-ID: <20190117100651.GB17930@amd>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com>
 <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com>
 <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com>
 <20190116220401.GA28024@amd>
 <8c7dde3e-5f3c-80a5-ec57-73ce8e39deef@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8c7dde3e-5f3c-80a5-ec57-73ce8e39deef@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> You know what? First, submit driver with similar functionality to
> >>> existing RGB drivers, using same interface existing drivers are
> >>> using. When that is accepted, we can talk about extending
> >>> kernel<->user interfaces.
> >>>
> >>
> >> I could do that but then there is no way for users to have any other c=
olor but "white" with this driver.
> >> That defeats the purpose of the device itself.
> >=20
> > No, that is not what I meant.
> >=20
> > We do have RGB drivers in tree, they just present three separate LEDs
> > -- red, green and blue. I ask you to do the same for initial
> > submission.
> >=20
>=20
> For clarification you are asking me to register a LED class per
> output pin?

Yes.

> As explained before the Master brightness register has absolute control o=
ver the output current
> to the LED outputs regardless of the color control setting.
>=20

Yes, just set master brightness to 255 and you can ignore it.

> > You'll still be able to set brightness independently on the
> > red/green/blue LEDs...
> >=20
>=20
> But which one would control the overall brightness of the cluster?

You would not have that control in initial version of the patch.

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxAU7sACgkQMOfwapXb+vLcUwCgk7gzWalf88kSfQTICoLiUKgw
xMIAoI7BHm0fNZlXPU3Cqctc5PX+JhlV
=x4S1
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
