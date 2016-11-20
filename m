From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/6] leds: triggers: Add current_brightness trigger
 parameter
Date: Sun, 20 Nov 2016 23:12:50 +0100
Message-ID: <20161120221249.GA26571@amd>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <201611201559.24614@pali>
 <fc7f4360-a9ae-5ec8-46f0-b078a5901d8f@redhat.com>
 <201611202040.46333@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39532 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751613AbcKTWMz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Nov 2016 17:12:55 -0500
Content-Disposition: inline
In-Reply-To: <201611202040.46333@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > If I understood correctly we need to handle two things:
> > >=20
> > > 1) Provide poll() for userspace when LED level is changed (either
> > > by HW
> > >=20
> > >    or other user call)
> > >=20
> > > 2) Deal with fact that on _some_ hardware, special key is hardwired
> > > to
> > >=20
> > >    change LED level
> > >=20
> > > So why for 1) we cannot use existing sysfs file "brightness"? I do
> > > not see any problem with it.
> >=20
> > That was our first attempt at this, but because the brightness may
> > also be changed by triggers / blink-timers, we need to wakeup poll()
> > in those cases too (anything else would be inconsistent) and doing
> > such a wakeup in that case has turned out to cause too much overhead
> > in some cases (even if userspace is not listening), specifically the
> > idle power uses on some systems got multiplied by a factor of 5 or
> > more.
> >=20
> > So this approach was rejected.
>=20
> But approach with exporting new sysfs file with name current_brightness=
=20
> with existence of old brightness sysfs file is not good and in my=20
> opinion it is even worst as current situation (=3D without poll
> support).

It is neccessary, see the current discussion.

> What happen in next 5 years? Somebody point that sysfs file "brightness"=
=20

current_brightness will only appear on machines and in situations,
where we, well, can report current brightness. When you read
"brightness" file, you don't know if you are getting current
brightness or not, and it can't be changed easily.

Please go through the discussion. This design was chosen for a reason.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgyH+EACgkQMOfwapXb+vIMNwCfWmcyvn5y6K4hNrlz9JDdAmCH
V/UAmwagDUokf7N0yGcKgqvn6VCbJQpu
=4t6G
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
