From: Pavel Machek <pavel@ucw.cz>
Subject: Re: LED devices & poll() for brightness attribute
Date: Wed, 22 Feb 2017 21:54:08 +0100
Message-ID: <20170222205408.GB8467@amd>
References: <20170222090630.GB21558@pali>
 <20170222122557.GA3807@amd>
 <20170222123929.GD21558@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56475 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934477AbdBVUyN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Feb 2017 15:54:13 -0500
Content-Disposition: inline
In-Reply-To: <20170222123929.GD21558@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-02-22 13:39:29, Pali Roh=E1r wrote:
> On Wednesday 22 February 2017 13:25:57 Pavel Machek wrote:
> > Hi!
> >=20
> > > But this support is useful just for one single central userspace
> > > application which will control all leds in system other application
> > > which will change state by /sys/class/leds/ will de-synchronize that =
one
> > > central application.

Actually this is wrong.

> > Yes. Does it matter for some real use case?
>=20
> Yes. E.g. systemd has already some support for changing leds. And I do
> not want to be forced to use systemd (or any other specific application)
> just because it already controls leds.

So... you don't want to use systemd, so don't use systemd. What is the
problem? :-)

> And my own application for controlling leds should know current state of
> them if it is possible.

If you have at most one application controlling each LED, you are
fine. That's quite common situation, serial port can also be opened at
most once. Do you actually have two applications accessing one led? If
so, what applications?

> > > So I think new ABI is not sufficient and I would propose to add poll()
> > > support also for changes done by userspace, write() to attribute
> > > /sys/class/leds/.../brightness.
> >=20
> > Not easily possible, as we have triggers, and this was discussed in
> > great great lengths before. Please go through that discussion.
>=20
> Without triggers and blinking it should be possible.
>=20
> Just notify only when some application do echo > brightness.

Yes, we _could_ do that. Would be slightly confusing
w.r.t. triggers. But is it good idea?

Userspace could easily keep /var/run/led/XXX/brightness, and inotify
works over regular files..

And yes, with three color LEDs, userspace daemon managing LED state
will be pretty much mandatory...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlit+nAACgkQMOfwapXb+vKbggCcCSvZo/i5Ha91i81CsO24uuUO
kIkAn219Em5JahYj87mlJkuIksdhJG2V
=n/9f
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
