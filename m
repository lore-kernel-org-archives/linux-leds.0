From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: LED devices & poll() for brightness attribute
Date: Thu, 23 Feb 2017 21:44:54 +0100
Message-ID: <201702232144.54558@pali>
References: <20170222090630.GB21558@pali> <20170223144852.GD24201@pali> <20170223202333.GA19376@amd>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2839672.BiBJvZ136h";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36068 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751191AbdBWUqX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2017 15:46:23 -0500
In-Reply-To: <20170223202333.GA19376@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart2839672.BiBJvZ136h
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 23 February 2017 21:23:33 Pavel Machek wrote:
> Hi!
>=20
> > > Ok, and this is where the problems start. You are not supposed to
> > > control keyboard backlight like that. (In the same way you can't
> > > control display backlight like that.)
> > >=20
> > > There are numerous problems with the shell script:
> > >=20
> > > 1) how to identify the keyboard backlight LED
> >=20
> > Exactly same as it is doing desktop. It is possible to 100%
> > reimplement desktop logic for identification of keyboard backlight
> > LED
>=20
> Exactly! If you are reimplementing logic from another project, it is
> strong hint that you are doing something wrong.

Manual configuration is another option.

> > > 2) there may be more then one
> >=20
> > Yes and script can be adjusted to use specific one (config option
> > for script).
>=20
> No, you should autoconfigure it,

Why? Because you prefer autoconfiguration and all other people must use=20
it only? Does not seems a good argument.

=46or machine which does not change, static policy file is enough too. And=
=20
for this simple case it will work correctly.

Why everybody must be forced to use some autoconfiguration and does not=20
allow user to use his own manual configuration?

> actually. See N900, there are 6 leds controlling one backlight.

I'm not saying that one script must be universal for everything. My=20
script is enough for machine with single keyboard led. And for other=20
people who have only one backlight keyboard it will work fine too.

=46or other cases something other could be written...

> > > 3) synchronization problems
> >=20
> > This is reason why poll() is needed. So desktop GUI will receive
> > information that somebody else changed LED.
>=20
> Actually, poll will not help you. If both your script and desktop
> access the LED at the same time, there will be races.

But does not have to be. If your own scripts are under your control then=20
you can use it race-free.

> ("Hmm. I just
> wrote to the brightness file, and received poll notification. What is
> the current brightness?")

Value read *after* receiving poll notification. By poll notification we=20
know that brightness was changed. And to get new up-to-date value, new=20
read() must be done.

If value is changed again, you will receive another poll notification.

I do not see any race here. You will get poll notification about every=20
change, so what is the problem? You do not miss any change for sure.

> > > Your shell script should talk to the desktop, because it already
> > > knows where the backlight is, and the problems disappear.
> >=20
> > Sometime there does not have to be any desktop loaded. It could but
> > it does not have to be.
> >=20
> > Look at TLP scripts. They are very popular, and they have no
>=20
> Do you have a link?

https://github.com/linrunner/TLP

http://linrunner.de/en/tlp/docs/tlp-configuration.html

> > > I believe the confusion is not worth it. Talk to the desktop
> > > people, there should be good way to control the backlight
> > > without reaching lowlevel interfaces directly.
> >=20
> > And probably every desktop will use own different method like
> > before. No thanks. I do not want to depend on particular desktop
> > or implement zillions of different desktop APIs. And even depend
> > on desktop.
>=20
> And I don't want led/brightness file to be used for interprocess
> communication.

You are not forced to use something. I'm proposing extending current ABI=20
which can be used for processes who want those notification.

If you do not want it, just do not use it.

> I especially don't want to deal with _6_ keyboard led
> files to be used for interprocess communication -- what is desktop
> expected to do when you set different brightnesses to each of them?
>=20
> You don't want to deal with desktop API, yet expect all the desktops
> to follow your prefferred API (poll on led/brightness?).
>=20
> There should be one component controlling the keyboard backlight.
> Your scripts should talk to that component.

Yes, somebody creates some right central daemon and everybody who want=20
to use LED kernel API will be forced to use that one "right" daemon?

And what happens if somebody write new daemon with new userspace ABI=20
just because that previous was incorrect/broken/does not fit all needs?

No kernel must not force which userspace application will be used for=20
some operation. This sounds like Microsoft product...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2839672.BiBJvZ136h
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlivScYACgkQi/DJPQPkQ1L4fACcCZPX6bPjAuLqzgtYCsatqaUS
XtQAmgPQ5IZLHRu9Cqymp7vtOnzj6tiH
=t49P
-----END PGP SIGNATURE-----

--nextPart2839672.BiBJvZ136h--
