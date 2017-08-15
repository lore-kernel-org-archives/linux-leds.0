From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC] ledtrig-dither: A Poor man's adjustable LED brightness.
Date: Wed, 16 Aug 2017 00:34:13 +0200
Message-ID: <20170815223413.GA8886@amd>
References: <20170815213541.26985-1-me@paulo.costa.nom.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45987 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751471AbdHOWeP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2017 18:34:15 -0400
Content-Disposition: inline
In-Reply-To: <20170815213541.26985-1-me@paulo.costa.nom.br>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paulo Costa <me@paulo.costa.nom.br>
Cc: linux-leds@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-08-15 18:35:41, Paulo Costa wrote:
> While many LED drivers support adjustable brightness levels, usually
> via PWM hardware, most can only be set to ON or OFF.
>=20
> Well, I wish I could adjust the brightness of every led.
> What if we can fake PWMs with kernel timers?

Hmm. Can we simply use blinking trigger to do that?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmTduUACgkQMOfwapXb+vKbNgCghUJVctoO78USx1zwhhwzlpRb
Vl8AmwVfI4yhrY2ofG9j7ilhvpYMbJno
=XR/J
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
