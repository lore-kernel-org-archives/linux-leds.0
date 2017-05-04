From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Delete obsolete Versatile driver
Date: Thu, 4 May 2017 14:28:47 +0200
Message-ID: <20170504122847.GC32103@amd>
References: <20170504120308.6738-1-linus.walleij@linaro.org>
 <20170504121402.GB32103@amd>
 <CACRpkdaHxKMb=FRKdfNixry3TNPJo_hjqbxBm-oq8NfrHbkuYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54279 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750980AbdEDM2t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2017 08:28:49 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdaHxKMb=FRKdfNixry3TNPJo_hjqbxBm-oq8NfrHbkuYA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-05-04 14:23:39, Linus Walleij wrote:
> On Thu, May 4, 2017 at 2:14 PM, Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > On Thu 2017-05-04 14:03:08, Linus Walleij wrote:
> >> All users of the Versatile LED driver are deleted and replaced
> >> with the very generic leds-syscon. Delete the old driver.
> >
> > If someone has LEDS_VERSATILE selected, he'll be unhappy if we apply
> > first.
> >
> > Are you sure no _users_ have LEDS_VERSATILE selected? Should we give
> > them some kind of warning? (#warning, printk, ...?)
>=20
> Since the driver cannot probe from device tree or ACPI, the device must
> be created in a board file using the device name "versatile-leds" which is
> what the driver matches against.
>=20
> For them to use it they must have out-of-tree boardfiles, and we discoura=
ge
> both out-of-tree code and boardfiles.
>=20
> The last boardfiles using this were deleted in
> commit 7484c727b636a838818e71f6d03114633b25aba2
> "ARM: realview: delete the RealView board files".
>=20
> All Versatile, Integrator and RealView boards (the only one using the
> versatile LEDs), have been migrated to use leds-syscon.c.

Aha, people having out-of-tree boardfiles probably know enough to
handle this.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAlkLHn8ACgkQMOfwapXb+vIr2ACY9YNtdWb73QwXPj125atKC8vw
ywCdGMF9/gTF4QgAyCebTa1DbLZJoIM=
=SJCK
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
