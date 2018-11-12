From: Pavel Machek <pavel@ucw.cz>
Subject: LEDs on USB keyboards was Re: [PATCH 02/24] leds: core: Add support
 for composing LED class device names
Date: Mon, 12 Nov 2018 23:11:04 +0100
Message-ID: <20181112221104.GC11942@amd>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd>
 <a640167b-3a3e-daea-b377-6e82b653c5e8@gmail.com>
 <20181111201605.GA20160@amd>
 <57b77d4e-39a0-aaf2-5952-c2c25dc58593@gmail.com>
 <e72ac342-5253-851a-e54f-b1bd752be628@gmail.com>
 <CACRpkdZwgZ=PmX3PEpR-F76BZ5g9hzvQYc_3QfFYhHvBHqp4Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZwgZ=PmX3PEpR-F76BZ5g9hzvQYc_3QfFYhHvBHqp4Tw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dachaac@gmail.com, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, dmurphy@ti.com, oleg@kaa.org.ua, Sakari Ailus <sakari.ailus@linux.intel.com>, simon@lineageos.org, xiaotong.lu@spreadtrum.com
List-Id: linux-leds@vger.kernel.org


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Couldn't we have here multiple variants that would then be chosen based
> > on device tree definition?
>=20
> It needs to be subsystem specific or something.
> What you say make sense for things based on device
> tree.
>=20
> The problem hit me on an Intel laptop with several
> USB keyboards.
>=20
> OK maybe I am stupid for plugging in two USB keyboards,
> but we should definately support it. Input/HID supports it
> well.

Plugging two USB keyboards should be supported.

Can we get some details... kernel version, architecture, maybe
=2Econfig, where/how it fails?

On my systems, keyboard leds are prefixed with device name, so I see
no chance for duplicities...

input5::capslock/   =20
input5::numlock/    =20
input5::scrolllock/

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvp+ngACgkQMOfwapXb+vLqywCdFaqE3SM9L6Df8+cbZl/qYHAi
7BEAoI8ogyxXrej9w7IRZ6vlaCjzxYNi
=SadW
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
