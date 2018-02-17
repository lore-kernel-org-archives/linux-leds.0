From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Add more product/board names for PC Engines APU2
Date: Sat, 17 Feb 2018 22:16:37 +0100
Message-ID: <20180217211637.GC9543@amd>
References: <416353feea21248a8e3de5a91c5349a4e9047519.1518690096.git.tredaelli@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57837 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751550AbeBQVQ3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Feb 2018 16:16:29 -0500
Content-Disposition: inline
In-Reply-To: <416353feea21248a8e3de5a91c5349a4e9047519.1518690096.git.tredaelli@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Timothy Redaelli <tredaelli@redhat.com>
Cc: linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-02-15 11:21:36, Timothy Redaelli wrote:
> PC Engines "legacy" coreboot 4.0.8 changed the product/board name from "A=
PU2"
> to "apu2".
> PC Engines "mainline" coreboot uses, instead, "PC Engines apu2" as
> product/board name.
>=20
> This commit adds the 2 variants ("apu2" and "PC Engines apu2") of product=
/board
> name to be compatible with all the APU2 BIOSes.
>=20
> Fixes: 3faee9423ce0 ("leds: Add driver for PC Engines APU/APU2 LEDs")
> Signed-off-by: Timothy Redaelli <tredaelli@redhat.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqIm7UACgkQMOfwapXb+vL2qgCeIrdqYw66DhIYQn/fLNNBWUSU
iSYAoL4esIPiYFI0kSEd6AVkcZp6fzbH
=sN+U
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
