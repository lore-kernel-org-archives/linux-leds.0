From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC] ledtrig-dither: A Poor man's adjustable LED brightness.
Date: Mon, 28 Aug 2017 11:10:33 +0200
Message-ID: <20170828091033.GB25025@amd>
References: <20170815213541.26985-1-me@paulo.costa.nom.br>
 <20170815223413.GA8886@amd>
 <CADbEYbk5US=SDpwPV8SLNsZMwrYgktPcXRp8RjYpm9+6iC8HAA@mail.gmail.com>
 <20170816223022.GA13540@amd>
 <CADbEYbkGYO7dSuMcK4SjtWch+2GjPL7axPuk7UHohWLCfkj61Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52680 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbdH1JKf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Aug 2017 05:10:35 -0400
Content-Disposition: inline
In-Reply-To: <CADbEYbkGYO7dSuMcK4SjtWch+2GjPL7axPuk7UHohWLCfkj61Q@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paulo Costa <me@paulo.costa.nom.br>
Cc: linux-leds@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-08-17 01:21:37, Paulo Costa wrote:
> > Hmm. You could do led=3Don, udelay(100), led=3Doff. Do that 100 times a
> > second, and I believe you'll get quite nice low levels.
>=20
> I don't want to keep the CPU busy on a delay() just for blinking led,
> even if only for a few micros.

Well... it will enable you to have nice low brigtness. Few
microseconds should not be a problem.

> > Now... nice hack. Probably can be improved. But is it suitable for
> > mainline?
>=20
> Thank you =3D)
>=20
> It's a proof of concept for now, definitely not ready for mainline.
>=20
> Instead of a LED trigger + wrapper LED entry, I think this should kick in
> if we set 'myled/dither=3D1' or something like that.
>=20
> Now, do you think it would be a nice addition / Should I put more work on=
 it?

Actually, I'm not sure. Sounds a bit too hacky to me... Your
choice. If your goal is to learn about kernel, you are on the right
track :-).

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmj3gkACgkQMOfwapXb+vIjvwCeOMmwzD5Do6VhGqz/QOPP1Ohj
+dMAnAlJC/nSXToPRN1rhJuZQ56ouTgy
=Dmqb
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
