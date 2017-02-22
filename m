From: Pavel Machek <pavel@ucw.cz>
Subject: Re: LED devices & poll() for brightness attribute
Date: Wed, 22 Feb 2017 13:25:57 +0100
Message-ID: <20170222122557.GA3807@amd>
References: <20170222090630.GB21558@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170222090630.GB21558@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> But this support is useful just for one single central userspace
> application which will control all leds in system other application
> which will change state by /sys/class/leds/ will de-synchronize that one
> central application.

Yes. Does it matter for some real use case?

> So I think new ABI is not sufficient and I would propose to add poll()
> support also for changes done by userspace, write() to attribute
> /sys/class/leds/.../brightness.

Not easily possible, as we have triggers, and this was discussed in
great great lengths before. Please go through that discussion.
								Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAlitg1UACgkQMOfwapXb+vKdGQCfaeXqrIAEdXMBafCVgKwjPL5Q
py4AmJJhjJHLwME4fpjp+U1lviOmiXQ=
=1X/P
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
