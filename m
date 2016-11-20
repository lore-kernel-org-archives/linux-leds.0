From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 1/6] leds: triggers: Add current_brightness trigger parameter
Date: Sun, 20 Nov 2016 15:59:24 +0100
Message-ID: <201611201559.24614@pali>
References: <20161117222441.31464-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3324781.bsPTHiQ76T";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20161117222441.31464-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

--nextPart3324781.bsPTHiQ76T
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 17 November 2016 23:24:36 Hans de Goede wrote:
> In some cases it may be desirable for userspace to be notified when
> a trigger event happens. This commit adds support for a poll-able
> current_brightness trigger specific sysfs attribute which triggers
> may register:
>=20
> What:		/sys/class/leds/<led>/current_brightness
> Date:		November 2016
> KernelVersion:	4.10
> Description:
> 	Triggers which support it may register a current_brightness
> 	file. This file supports poll() to detect when the trigger
> 	modifies the brightness of the LED.
> 	Reading this file will always return the current brightness
> 	of the LED.
> 	Writing this file sets the current brightness of the LED,
> 	without influencing the trigger.

Personally I do not like this new sysfs attribute...

Now when somebody look at /sys/class/leds/<something>/, the first thing=20
which say would be:

"What the hell, why there are two files (brightness and=20
current_brightness) for changing LED level? And which should I use?"

If I understood correctly we need to handle two things:

1) Provide poll() for userspace when LED level is changed (either by HW
   or other user call)

2) Deal with fact that on _some_ hardware, special key is hardwired to
   change LED level

So why for 1) we cannot use existing sysfs file "brightness"? I do not=20
see any problem with it.

And for 2) we even do not know on which machines is such hardwired=20
feature enabled. Yes, on _some_ (not *all*) Dell machines there is Fn=20
key combination which changes level of one LED device. But kernel does=20
not know if hardware on which is running is doing such thing or not.=20
Some machines do not have to have key for such action and we do not know=20
it.

And what about situation when somebody wants to configure e.g. mouse=20
movement (or keypress) trigger to enable/disable LED device (which=20
belongs to keyboard brightness)? In this case user explicitly know that=20
his Fn+Space change level of LED device, so can be careful to not press=20
it. With your read-only trigger you basically disable such (I think=20
useful) feature.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3324781.bsPTHiQ76T
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgxukwACgkQi/DJPQPkQ1JhxwCeIhQDHSKDz8w3dkObuWrluKJX
9PEAoLih62MqdDVoL7htlTcY/vzm7jXa
=LcqY
-----END PGP SIGNATURE-----

--nextPart3324781.bsPTHiQ76T--
