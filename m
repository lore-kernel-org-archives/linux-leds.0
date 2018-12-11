From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color
 properties
Date: Tue, 11 Dec 2018 23:44:37 +0100
Message-ID: <20181211224436.GA27976@amd>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
 <5bea0eb8.1c69fb81.6b921.80e6@mx.google.com>
 <dfb5bd23-bcb9-7501-a608-969cb0464168@gmail.com>
 <0a0b176c-4eb4-4b0e-6c3c-b3c6c8f5fff5@gmail.com>
 <CAL_JsqKEpbJjExkQKSXwYma9wPPO+8E0QMTyWTPs1nkGSd49_g@mail.gmail.com>
 <20181130210814.GA5756@amd>
 <CAL_JsqK4oaUTBemXiTZzLeOKOndQ_GZp2F7mJ0VzGEKVGHY20Q@mail.gmail.com>
 <fa5add90-e1b7-d527-374f-175abdf88455@gmail.com>
 <CAL_Jsq+EsTXghh-bEtBmQ3oXEW45RJZJEJ2Zn1z-LfhvhNiXnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+EsTXghh-bEtBmQ3oXEW45RJZJEJ2Zn1z-LfhvhNiXnQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >> Basically every single device could have a LED associated with it
> > >> ("activity"). Would doing it like this mean we'd have to modify every
> > >> single driver to parse leds / led-names properties?
> > >
> > > Normally, that's how properties like this would work. A driver is also
> > > what knows how the leds should function.
> >
> > This is not true in case of associations where LED controller is
> > an independent device, as in Pavel's example [0].
>=20
> I'm not really following how the HDD example is different. The parent
> of an LED would be the controller. The link to the led node would be
> in the disk controller node. Though maybe if things get complicated
> enough, we'd want to describe the drives or drive bays in DT.

We were talking case where the LED is on GPIO somewhere. And yes,
drive bays would be similar.

And.. often you have a single LED for multiple harddrives, too. Fun
:-).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwQPdQACgkQMOfwapXb+vLnGwCgtFgGl73d1rwY7gfpcDZHaRP5
akgAoIRxzgT8UZQvLrRu5ZLyNwN/Q2xH
=VpU7
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
