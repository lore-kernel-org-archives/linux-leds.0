From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: tca6507: Remove unnecessary reg check
Date: Mon, 9 Oct 2017 08:59:19 +0200
Message-ID: <20171009065919.GA5310@amd>
References: <1507488905-23169-1-git-send-email-chris.gekas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49582 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753879AbdJIG7W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Oct 2017 02:59:22 -0400
Content-Disposition: inline
In-Reply-To: <1507488905-23169-1-git-send-email-chris.gekas@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Christos Gkekas <chris.gekas@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-10-08 19:55:05, Christos Gkekas wrote:
> Variable reg is unsigned so checking whether it is less than zero is not
> necessary.
>=20
> Signed-off-by: Christos Gkekas <chris.gekas@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlnbHkcACgkQMOfwapXb+vKBrQCghbmy/NAc952U3UuxpLE1BbgS
gAgAnj/YCckJA1SinRMfM6yE4xiCkv1e
=9klA
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
