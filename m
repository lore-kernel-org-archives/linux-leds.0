From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Thu, 28 Sep 2017 17:24:37 +0200
Message-ID: <20170928152437.GB2482@amd>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
 <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua>
 <20170812174623.GA2545@amd>
 <00efd6b5-494f-0f8d-d32b-321236ed8aaa@kaa.org.ua>
 <20170812191300.GA23619@amd>
 <026d9ec2-f2bd-18b9-d5fa-f593d40e2f57@kaa.org.ua>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48982 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752059AbdI1PYk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 28 Sep 2017 11:24:40 -0400
Content-Disposition: inline
In-Reply-To: <026d9ec2-f2bd-18b9-d5fa-f593d40e2f57@kaa.org.ua>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: linux-leds@vger.kernel.org


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Ok, makes sense. How does the board look?
>=20
> Did you mean a photo? Sure http://i.imgur.com/OShLIJx.jpg

Thanks.

> >> The delay between data sends to SPI board should be at least 10 ms
> >> I think it will be bad idea to use shared workqueue from kernel,
> >> so I create separate single threaded work queue :)
> >=20
> > If workqueue support in led core can not take 10 msec wait, we should
> > fix it, not add hacks around...
>=20
> Could you please explain or give a example?
> Because it's not clear for me, how I can use it.

You use cdev.brightness_set_blocking instead of brightness_set...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlnNFDUACgkQMOfwapXb+vK7/ACgs555cwVQ8ZCiflYItfv04wnJ
BwoAn25S+htOt/TU8ln7nmEWZ4D0pVxu
=5ChN
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
