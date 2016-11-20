From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 1/6] leds: triggers: Add current_brightness trigger parameter
Date: Sun, 20 Nov 2016 20:40:46 +0100
Message-ID: <201611202040.46333@pali>
References: <20161117222441.31464-1-hdegoede@redhat.com> <201611201559.24614@pali> <fc7f4360-a9ae-5ec8-46f0-b078a5901d8f@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2532207.jKEoEL815l";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <fc7f4360-a9ae-5ec8-46f0-b078a5901d8f@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

--nextPart2532207.jKEoEL815l
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 20 November 2016 19:45:40 Hans de Goede wrote:
> Hi,
>=20
> On 20-11-16 15:59, Pali Roh=C3=A1r wrote:
> > On Thursday 17 November 2016 23:24:36 Hans de Goede wrote:
> >> In some cases it may be desirable for userspace to be notified
> >> when a trigger event happens. This commit adds support for a
> >> poll-able current_brightness trigger specific sysfs attribute
> >> which triggers may register:
> >>=20
> >> What:		/sys/class/leds/<led>/current_brightness
> >> Date:		November 2016
> >> KernelVersion:	4.10
> >>=20
> >> Description:
> >> 	Triggers which support it may register a current_brightness
> >> 	file. This file supports poll() to detect when the trigger
> >> 	modifies the brightness of the LED.
> >> 	Reading this file will always return the current brightness
> >> 	of the LED.
> >> 	Writing this file sets the current brightness of the LED,
> >> 	without influencing the trigger.
> >=20
> > Personally I do not like this new sysfs attribute...
> >=20
> > Now when somebody look at /sys/class/leds/<something>/, the first
> > thing which say would be:
> >=20
> > "What the hell, why there are two files (brightness and
> > current_brightness) for changing LED level? And which should I
> > use?"
> >=20
> > If I understood correctly we need to handle two things:
> >=20
> > 1) Provide poll() for userspace when LED level is changed (either
> > by HW
> >=20
> >    or other user call)
> >=20
> > 2) Deal with fact that on _some_ hardware, special key is hardwired
> > to
> >=20
> >    change LED level
> >=20
> > So why for 1) we cannot use existing sysfs file "brightness"? I do
> > not see any problem with it.
>=20
> That was our first attempt at this, but because the brightness may
> also be changed by triggers / blink-timers, we need to wakeup poll()
> in those cases too (anything else would be inconsistent) and doing
> such a wakeup in that case has turned out to cause too much overhead
> in some cases (even if userspace is not listening), specifically the
> idle power uses on some systems got multiplied by a factor of 5 or
> more.
>=20
> So this approach was rejected.

But approach with exporting new sysfs file with name current_brightness=20
with existence of old brightness sysfs file is not good and in my=20
opinion it is even worst as current situation (=3D without poll support).

What happen in next 5 years? Somebody point that sysfs file "brightness"=20
and sysfs file "current_brightness" is still not good and invent=20
"really_current_brightness" sysfs with new logic? No this is really not=20
a way...

I understand that extending current "brightness" sysfs is complicated,=20
but it is not a reason to not doing it and inventing new crippling sysfs=20
file which duplicate existing one (with some modifications).

Anyway, I cannot believe that power usage is increased by factor 5 with=20
exporting poll support. If we are going to change brightness level=20
(either by trigger or timer) we still need to do wakeup.

And we can do some optimizations, e.g. do not send poll event when=20
nobody is listening or postpone event so we do not send too many events=20
in 1s interval (or choose longer interval).

Polling support is not in mainline kernel yet, so we can change its=20
behaviour without breaking ABI. And we can define (if it help us!) that=20
evens can be send to userspace with some delay (e.g. 1-3s).

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2532207.jKEoEL815l
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgx/D4ACgkQi/DJPQPkQ1J3LgCfQhiDK0rNpNGSrGcSMG0OqzUC
fakAoMDC0sqjy7/7eo+exLunLJ/9VTde
=5VQo
-----END PGP SIGNATURE-----

--nextPart2532207.jKEoEL815l--
