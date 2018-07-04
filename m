From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Wed, 4 Jul 2018 08:53:05 +0200
Message-ID: <20180704065305.GA23509@amd>
References: <20180703155328.GA18299@arbeit>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703155328.GA18299@arbeit>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: jacek.anaszewski@gmail.com, ben.whitten@gmail.com, geert+renesas@glider.be, w@1wt.eu, pombredanne@nexb.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-07-03 17:53:28, Andreas Klinger wrote:
> Send out a morse code by using LEDs.
>=20
> This is useful especially on embedded systems without displays to tell the
> user about error conditions and status information.
>=20
> The trigger will be called "morse"
>=20
> The string to be send is written into the file morse_string and sent out
> with a workqueue. Supported are letters and digits.
>=20
> With the file dot_unit the minimal time unit can be adjusted in
> milliseconds.
>=20
> Also add documentation for the morse led trigger
>=20
> Thanks to Greg and Geert for suggesting improvements
>=20
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>

As I stated before, I don't think morse encoder belongs in kernel.

LED pattern trigger should be merged, instead.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAls8btEACgkQMOfwapXb+vIl/wCeN+xEVRwOmIgwfh5wGeO83+ss
+G8An1B7SRgMEcZNiLOksSbMiilQkECn
=jugO
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
