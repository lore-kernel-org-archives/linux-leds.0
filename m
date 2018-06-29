From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: ledtrig-morse: send out morse code
Date: Fri, 29 Jun 2018 09:17:24 +0200
Message-ID: <20180629071724.GA10079@amd>
References: <20180628134227.GA1719@arbeit>
 <20180628185630.GA6095@amd>
 <20180628202955.GA1534@imap.1und1.de>
 <20180628204516.GA29146@amd>
 <20180629064147.GA3219@arbeit>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629064147.GA3219@arbeit>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: jacek.anaszewski@gmail.com, ben.whitten@gmail.com, geert+renesas@glider.be, w@1wt.eu, pombredanne@nexb.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Yeah, well... I don't think decoding sentences in morse code is going
> > to be much fun.
> >=20
> > And we don't really want encoder in kernel. Just do encoding in
> > userspace, and use pattern trigger to display it.
> >=20
> > For many uses, morse code is "too geeky", and other patterns will be
> > used.
> >=20
> > Like " X    " for error 1, " X X     " for error 2, " .xX .xX " for
> > charging, " .xXx. " for everything okay...
> >=20
>=20
> The hardware i'm using is not able to adjust brightness. It can just swit=
ch the
> LED on or off. That's it.
>=20
> If anybody is interested i can submit a version 2 of the morse trigger wi=
th the
> improvements suggested by Greg and Geert. Please let me know.

I'd prefer more general pattern trigger.
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAls13QMACgkQMOfwapXb+vLowgCfe9CsRq/3XG1Brkcz+YqSw9dn
W+oAnjSOqYBGnSZNhoTUKy+6GXaEeov3
=Kq2f
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
