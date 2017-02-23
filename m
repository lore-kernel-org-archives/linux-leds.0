From: Pavel Machek <pavel@ucw.cz>
Subject: Re: LED devices & poll() for brightness attribute
Date: Thu, 23 Feb 2017 22:03:21 +0100
Message-ID: <20170223210321.GB19376@amd>
References: <20170222090630.GB21558@pali>
 <20170223144852.GD24201@pali>
 <20170223202333.GA19376@amd>
 <201702232144.54558@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34422 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751282AbdBWVM3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2017 16:12:29 -0500
Content-Disposition: inline
In-Reply-To: <201702232144.54558@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > 2) there may be more then one
> > >=20
> > > Yes and script can be adjusted to use specific one (config option
> > > for script).
> >=20
> > No, you should autoconfigure it,
>=20
> Why? Because you prefer autoconfiguration and all other people must use=
=20
> it only? Does not seems a good argument.
>=20
> For machine which does not change, static policy file is enough too. And=
=20
> for this simple case it will work correctly.
>=20
> Why everybody must be forced to use some autoconfiguration and does not=
=20
> allow user to use his own manual configuration?

Why everybody must be forced to poll() on brightness file?

> > actually. See N900, there are 6 leds controlling one backlight.
>=20
> I'm not saying that one script must be universal for everything. My=20
> script is enough for machine with single keyboard led. And for other=20
> people who have only one backlight keyboard it will work fine too.

> For other cases something other could be written...

For other cases, you need to communicate with the desktop.

> > And I don't want led/brightness file to be used for interprocess
> > communication.
>=20
> You are not forced to use something. I'm proposing extending current ABI=
=20
> which can be used for processes who want those notification.

Your proposal does not help you with your problem, unless you get
desktop people to poll() on the brightness files, and do something
inteligent with the results.

Hmm. And doing something inteligent will be quite hard given that we
have 6 of those files on N900.

So, if you seriously want to do this, can you

1) write specification explaining how desktops should poll() the
brightness files

2) get someone to volunteer to implement that specification for at
least GNOME and KDE?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlivThkACgkQMOfwapXb+vL75gCaA4LlSC2sU0sBazrWHcrQcuR6
mtcAnivB4Bz56Cpq1snHeT/qkR01RO9L
=op+z
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
