From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds/trigger/cpu: Add LED trigger for all CPUs
 aggregated
Date: Fri, 10 Feb 2017 22:25:17 +0100
Message-ID: <20170210212517.GB7711@amd>
References: <20170209230735.27007-1-me@paulo.costa.nom.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:43568 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbdBJVZT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Feb 2017 16:25:19 -0500
Content-Disposition: inline
In-Reply-To: <20170209230735.27007-1-me@paulo.costa.nom.br>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paulo Costa <me@paulo.costa.nom.br>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-02-09 21:07:35, Paulo Costa wrote:
> Currently there is one CPU led trigger per cpu ('cpu0', 'cpu1', ...)
>=20
> This patch adds a new trigger, 'cpu', with brightness proportional to
> the number of active CPUs.
>=20
> If multiple brightness levels aren't supported on the LED,
> it effectively indicates if there is any CPU active.
>=20
> This is particularly useful on tiny linux boards with more CPU cores than=
 LED pins.
>=20
> Signed-off-by: Paulo Costa <me@paulo.costa.nom.br>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlieL70ACgkQMOfwapXb+vLuIgCfaV7QwnGTILca/qGEBdEbVcXp
NGkAmgNG2xREKOHmHVt9qnMBKEcsNuq8
=jXY5
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
