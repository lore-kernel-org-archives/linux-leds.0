From: Pavel Machek <pavel@ucw.cz>
Subject: Re: LED devices & poll() for brightness attribute
Date: Thu, 23 Feb 2017 21:23:33 +0100
Message-ID: <20170223202333.GA19376@amd>
References: <20170222090630.GB21558@pali>
 <20170222123929.GD21558@pali>
 <20170222205408.GB8467@amd>
 <201702222216.32131@pali>
 <20170223143726.GB12511@amd>
 <20170223144852.GD24201@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33087 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751195AbdBWUYI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2017 15:24:08 -0500
Content-Disposition: inline
In-Reply-To: <20170223144852.GD24201@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Ok, and this is where the problems start. You are not supposed to
> > control keyboard backlight like that. (In the same way you can't
> > control display backlight like that.)
> >=20
> > There are numerous problems with the shell script:
> >=20
> > 1) how to identify the keyboard backlight LED
>=20
> Exactly same as it is doing desktop. It is possible to 100% reimplement
> desktop logic for identification of keyboard backlight LED

Exactly! If you are reimplementing logic from another project, it is
strong hint that you are doing something wrong.=20

> > 2) there may be more then one
>=20
> Yes and script can be adjusted to use specific one (config option for
> script).

No, you should autoconfigure it, actually. See N900, there are 6 leds
controlling one backlight.

> > 3) synchronization problems
>=20
> This is reason why poll() is needed. So desktop GUI will receive
> information that somebody else changed LED.

Actually, poll will not help you. If both your script and desktop
access the LED at the same time, there will be races. ("Hmm. I just
wrote to the brightness file, and received poll notification. What is
the current brightness?")

> > Your shell script should talk to the desktop, because it already knows
> > where the backlight is, and the problems disappear.
>=20
> Sometime there does not have to be any desktop loaded. It could but it
> does not have to be.
>=20
> Look at TLP scripts. They are very popular, and they have no

Do you have a link?

> > I believe the confusion is not worth it. Talk to the desktop people,
> > there should be good way to control the backlight without reaching
> > lowlevel interfaces directly.
>=20
> And probably every desktop will use own different method like before. No
> thanks. I do not want to depend on particular desktop or implement
> zillions of different desktop APIs. And even depend on desktop.

And I don't want led/brightness file to be used for interprocess
communication. I especially don't want to deal with _6_ keyboard led
files to be used for interprocess communication -- what is desktop
expected to do when you set different brightnesses to each of them?

You don't want to deal with desktop API, yet expect all the desktops
to follow your prefferred API (poll on led/brightness?).

There should be one component controlling the keyboard backlight. Your
scripts should talk to that component.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlivRMUACgkQMOfwapXb+vLupwCaA9eypeIQeVLziWkOxTU8hUc5
lnUAnRrkNCrXSYv4frOg3ZAhmKkHXrm7
=fQpd
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
