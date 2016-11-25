From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 12:26:13 +0100
Message-ID: <201611251226.13615@pali>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com> <20161125100140.GC4062@amd> <b159c2e1-dbf7-1ee3-707c-82891c7194db@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart370024548.gsuxmsWiRm";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33855 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbcKYL0R (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Nov 2016 06:26:17 -0500
In-Reply-To: <b159c2e1-dbf7-1ee3-707c-82891c7194db@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, gdg@zplane.com, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

--nextPart370024548.gsuxmsWiRm
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 25 November 2016 12:14:56 Hans de Goede wrote:
> Hi,
>=20
> On 25-11-16 11:01, Pavel Machek wrote:
> > Hi!
> >=20
> >> In view of the above we could report hw brightness changes with
> >> POLLPRI on brightness file, but unfortunately we can't because it
> >> is impossible to guarantee that readout of brightness file will
> >> return the brightness the POLLPRI was meant to notify about.
> >=20
> > Agreed here.
> >=20
> >> That's why a separate read only file seems to be the only proper
> >> solution.
> >=20
> > Yes please. And lets make self-changing leds into a trigger, as
> > proposed, and as Hans' patch should be already doing.
> >=20
> >> Moreover, the file should return the brightness from the time
> >> of last POLLPRI.
> >=20
> > Not sure I agree here. Normally, kernel returns current state for
> > variables, does not track "old" state.
>=20
> Agreed, storing the last state just unnecessarily complicates things.
>=20
> So do we have a consensus on implementing a new hw_brightness_change
> sysfs attribute now, which only some LEDs will have, can be polled
> to detect changed done autonomously by the hardware and returns
> the current / actual LED brightness when read ?
>=20
> As for the modeling how the hotkey controls the LED as a trigger,
> although I do like this from one pov, I can see Jacek's point that
> this is confusing as there really is nothing to configure here,
> where as normally a user could do "echo none > trigger" to break
> the link. So I think that is best (cleanest /minimal non confusing
> API) with just the hw_brightness_change sysfs-attribute and not
> model this as a trigger.

I can accept with this solution (no trigger, event on new sysfs file=20
which returns current/actual brightness state, new sysfs file only for=20
devices which can report brightness state).

But I'm not sure if it is really fixing that original problem with high=20
power usage...

As wrote in some previous emails, consider "actual_brightness" sysfs=20
name which is already used for this purpose by backlight subsystem --=20
because for consistency. backlight devices have: actual_brightness,=20
brightness, max_brightness.

> That, or fall back to my latest patch-set as posted, I still like
> that one the most.
>=20
> Regards,
>=20
> Hans

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart370024548.gsuxmsWiRm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlg4H9UACgkQi/DJPQPkQ1LIAQCfSeb4/2+LgQXfER2wAAflMmPI
JlkAnRMZ/lPPHZvLMAIgjXNbUqjdG/LM
=4dsI
-----END PGP SIGNATURE-----

--nextPart370024548.gsuxmsWiRm--
