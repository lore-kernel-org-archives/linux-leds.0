From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color
 properties
Date: Wed, 12 Dec 2018 10:59:29 +0100
Message-ID: <20181212095929.GA13437@amd>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
 <5bea0eb8.1c69fb81.6b921.80e6@mx.google.com>
 <dfb5bd23-bcb9-7501-a608-969cb0464168@gmail.com>
 <0a0b176c-4eb4-4b0e-6c3c-b3c6c8f5fff5@gmail.com>
 <CAL_JsqKEpbJjExkQKSXwYma9wPPO+8E0QMTyWTPs1nkGSd49_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKEpbJjExkQKSXwYma9wPPO+8E0QMTyWTPs1nkGSd49_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > We would also probably need different DT properties for different
> > types of devices, since e.g. for network case the network interface
> > name would fit better for the LED name, than the phy name,
> > and we would need to know what type of device name we're going
> > to look for.
> >
> > Pavel gave following examples:
> >
> > eth0:green:link
> > adsl0:green:link
> > adsl0:red:error
> >
> > So we would have e.g.:
> >
> > associated-vl42-device =3D <&camera1>;
> > associated-network-device =3D <&phy1>;
> > associated-block-device =3D <&phy1>;
>=20
> Variable property names are kind of a pain to parse.
>=20
> Perhaps when LEDs are associated with a device, we shouldn't care
> within the context of the LED subsystem what the name is. The
> association is more important and if you have that exposed, then you
> don't really need to care what the name is. You still have to deal
> with a device with more than 1 LED, but that becomes a problem local
> to that device.
>=20
> What I'm getting at is following a more standard binding pattern of
> providers and consumers like we have for gpios, clocks, etc. So we'd
> have something like this:
>=20
> ethernet {
>   ...
>   leds =3D <&green_led>, <&red_led>;
>   led-names =3D "link", "err";
> };
>=20
> We can still support defining LED names as we've done, but we don't
> have to come up with some elaborate naming convention that covers
> every single case.

I see that it would be more consistent with how gpios work, but I'm
afraid this does not fit LEDs properly.

With power LED, you want to be able to say "this is just on". Some
poeple like heartbeat, and have LED for that. There may be LED for
"disk activity", meaning activity on any harddrive. And there may be
activity LED for specific disk.

Only in the last case it would be suitable to have LED reference as a
child of an device...

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

iEYEARECAAYFAlwQ3AEACgkQMOfwapXb+vLW1wCdFi1UWGwFwbU0j+ZGao50rC9A
lZ0AoJakjBzMr4Cnacqy7Zw3QTF0pKES
=LuwX
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
