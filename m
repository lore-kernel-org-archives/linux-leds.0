From: Pavel Machek <pavel@ucw.cz>
Subject: Re: LED devices & poll() for brightness attribute
Date: Thu, 23 Feb 2017 15:37:26 +0100
Message-ID: <20170223143726.GB12511@amd>
References: <20170222090630.GB21558@pali>
 <20170222123929.GD21558@pali>
 <20170222205408.GB8467@amd>
 <201702222216.32131@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52407 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdBWOha (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2017 09:37:30 -0500
Content-Disposition: inline
In-Reply-To: <201702222216.32131@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > So... you don't want to use systemd, so don't use systemd. What is
> > the problem? :-)
> >=20
> > > And my own application for controlling leds should know current
> > > state of them if it is possible.
> >=20
> > If you have at most one application controlling each LED, you are
> > fine. That's quite common situation, serial port can also be opened
> > at most once. Do you actually have two applications accessing one
> > led? If so, what applications?
>=20
> First application which controls leds is integrated into desktop=20
> environment. In basic/default settings it do nothing automatically, just=
=20
> show GUI bar to user and allow user to adjust LED level.

Ok. Desktop wants to control the backlight, because it makes sense to
turn it off when the screen is blanked, and dim it when screen is
dimmed. Situation is quite similar to display backlight, actually.

> Second one is basic shell script executed at specific situation (e.g.=20
> power adapter was unplugged) which changes LED level.

Ok, and this is where the problems start. You are not supposed to
control keyboard backlight like that. (In the same way you can't
control display backlight like that.)

There are numerous problems with the shell script:

1) how to identify the keyboard backlight LED

2) there may be more then one

3) synchronization problems

4) need to be root

Your shell script should talk to the desktop, because it already knows
where the backlight is, and the problems disappear.

> > Yes, we _could_ do that. Would be slightly confusing
> > w.r.t. triggers. But is it good idea?
>=20
> Above situation for setting manual level of led is normal. And in this=20
> situation setting trigger or blink support does not make sense.=20
> Specially when user want to manually set led level.
>=20
> I think it is good idea to provide some poll-able sysfs for this change.=
=20
> And if brightness is used for writing, then I would expect that=20
> brightness also provide poll() state.
>=20
> Yes, it could be little confusing due to triggers/blinking support, but=
=20
> I think it is better as providing new sysfs file and it does not make=20
> this interface worse...

I believe the confusion is not worth it. Talk to the desktop people,
there should be good way to control the backlight without reaching
lowlevel interfaces directly.

> > And yes, with three color LEDs, userspace daemon managing LED state
> > will be pretty much mandatory...
>=20
> Why it should be running daemon? Script which you start when you want=20
> change is also enough... no need to have permanently running process.

Because you want to play multiple patterns on the LED.

You probably also want to automatically control the keyboard backlight
LEDs using ambient light sensor. Shell should not be involved.

This is one example of automatic backlight / keyboard backlight / LED
patterns. And yes, this should be integrated with desktop, not using
/sys/class/leds directly.

https://gitlab.com/tui/tui/blob/master/ofone/mond

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAliu86YACgkQMOfwapXb+vJpqgCfd+lsiYzA/OoHJxvbUriqtm1w
cngAnA7ZdOZ7LQ6fngcjbgcTuFObwPBW
=zM0P
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
