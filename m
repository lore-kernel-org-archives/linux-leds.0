From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: LED devices & poll() for brightness attribute
Date: Wed, 22 Feb 2017 22:16:32 +0100
Message-ID: <201702222216.32131@pali>
References: <20170222090630.GB21558@pali> <20170222123929.GD21558@pali> <20170222205408.GB8467@amd>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2146411.mVDJWEQZBj";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36396 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933298AbdBVVQg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Feb 2017 16:16:36 -0500
In-Reply-To: <20170222205408.GB8467@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart2146411.mVDJWEQZBj
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 22 February 2017 21:54:08 Pavel Machek wrote:
> On Wed 2017-02-22 13:39:29, Pali Roh=C3=A1r wrote:
> > On Wednesday 22 February 2017 13:25:57 Pavel Machek wrote:
> > > Hi!
> > >=20
> > > > But this support is useful just for one single central
> > > > userspace application which will control all leds in system
> > > > other application which will change state by /sys/class/leds/
> > > > will de-synchronize that one central application.
>=20
> Actually this is wrong.
>=20
> > > Yes. Does it matter for some real use case?
> >=20
> > Yes. E.g. systemd has already some support for changing leds. And I
> > do not want to be forced to use systemd (or any other specific
> > application) just because it already controls leds.
>=20
> So... you don't want to use systemd, so don't use systemd. What is
> the problem? :-)
>=20
> > And my own application for controlling leds should know current
> > state of them if it is possible.
>=20
> If you have at most one application controlling each LED, you are
> fine. That's quite common situation, serial port can also be opened
> at most once. Do you actually have two applications accessing one
> led? If so, what applications?

=46irst application which controls leds is integrated into desktop=20
environment. In basic/default settings it do nothing automatically, just=20
show GUI bar to user and allow user to adjust LED level.

Second one is basic shell script executed at specific situation (e.g.=20
power adapter was unplugged) which changes LED level.

Now you have two independent applications which both could change LED=20
level and at least one of them needs to know if another one changed=20
level so can adjust GUI bar correctly.

I think this starts to be real situation for lot of users as more=20
desktops (gnome, kde, ...) have already GUI bars for setting keyboard=20
backlight and more users writes own scripts which at specific=20
time/condition call echo > brightness.

Yes, if somebody uses GUI bar for manual keyboard backlight probably=20
does not use led trigger or blinking feature. Probably that GUI desktop=20
application could turn off them (do not know if kde/gnome application=20
really turn off them).

> > > > So I think new ABI is not sufficient and I would propose to add
> > > > poll() support also for changes done by userspace, write() to
> > > > attribute /sys/class/leds/.../brightness.
> > >=20
> > > Not easily possible, as we have triggers, and this was discussed
> > > in great great lengths before. Please go through that
> > > discussion.
> >=20
> > Without triggers and blinking it should be possible.
> >=20
> > Just notify only when some application do echo > brightness.
>=20
> Yes, we _could_ do that. Would be slightly confusing
> w.r.t. triggers. But is it good idea?

Above situation for setting manual level of led is normal. And in this=20
situation setting trigger or blink support does not make sense.=20
Specially when user want to manually set led level.

I think it is good idea to provide some poll-able sysfs for this change.=20
And if brightness is used for writing, then I would expect that=20
brightness also provide poll() state.

Yes, it could be little confusing due to triggers/blinking support, but=20
I think it is better as providing new sysfs file and it does not make=20
this interface worse...

> Userspace could easily keep /var/run/led/XXX/brightness, and inotify
> works over regular files..

That would need to force all application to decide on this specific=20
path. And looks bad as kernel already provides brightness attribute, why=20
it should not also notify for changes on it?

> And yes, with three color LEDs, userspace daemon managing LED state
> will be pretty much mandatory...

Why it should be running daemon? Script which you start when you want=20
change is also enough... no need to have permanently running process.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2146411.mVDJWEQZBj
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlit/7AACgkQi/DJPQPkQ1LApQCfSdFP9bqxk5bQTOQG999KhsGP
hKIAoKpI3EUDsCIIlIp8qtLNJaiU+nFi
=lpoq
-----END PGP SIGNATURE-----

--nextPart2146411.mVDJWEQZBj--
