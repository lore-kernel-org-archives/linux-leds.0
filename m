From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Wed, 21 Dec 2016 19:49:48 +0100
Message-ID: <20161221184948.GB21636@amd>
References: <201611242245.00217@pali>
 <afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
 <20161125100140.GC4062@amd>
 <e32e3d6c-5d6d-c882-21d9-8028c8311b0b@samsung.com>
 <20161125110557.GA13204@amd>
 <2367b9a7-68f7-2038-0d3a-a9561055b4f6@samsung.com>
 <20161125144859.GA20139@amd>
 <9844f7b3-c3e8-99d8-61b6-1550b1b8ab7e@samsung.com>
 <20161125204045.GA28036@amd>
 <b35b19a0-5abd-154a-cf3b-d4a7f7e76f00@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50572 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933193AbcLUSuO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Dec 2016 13:50:14 -0500
Content-Disposition: inline
In-Reply-To: <b35b19a0-5abd-154a-cf3b-d4a7f7e76f00@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>In my eyes trigger approach is neccessary at least for some hardware,
> >>>and things it pretty clear: trigger on =3D=3D LED changes without
> >>>userspace involvement. trigger off =3D=3D userspace controls the LED.
> >>
> >>It is likely that it would break many existing users.
> >
> >Can you elaborate on that?
>=20
> There might exist users that adjust LED brightness while having
> active trigger. The best example is default-on trigger - it sets
> brightness only on init, but remains active all the time. Whereas
> this could be fixed, there is another case: think of changing blinking
> brightness - it would be impossible.

I don't see the breakage. For existing blinking and default-on
triggers, existing behaviour would be kept. Difference would be that
for hardware that changes triggers itself (like the keyboard light) we
would present it as a trigger. And you are right -- there would be
user visible changes there. You could not assign blinking, because
=2E. it already has a trigger. But I believe it is reasonable.

> >I just tried with leds on thinkpad
> >
> >root@duo:/sys/class/leds/tpacpi::power# echo 1 > brightness
> >root@duo:/sys/class/leds/tpacpi::power# echo 0 > brightness
> >root@duo:/sys/class/leds/tpacpi::power# cat trigger
> >[none] bluetooth-power kbd-scrollock kbd-numlock kbd-capslock
> >kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock kbd-altlock
> >kbd-shiftllock kbd-shiftrlock kbd-ctrlllock kbd-ctrlrlock AC-online
> >BAT0-charging-or-full BAT0-charging BAT0-full
> >BAT0-charging-blink-full-solid rfkill0 phy0rx phy0tx phy0assoc
> >phy0radio phy0tpt mmc0 timer pattern rfkill1 hci0-power rfkill74
> >heartbeat
> >root@duo:/sys/class/leds/tpacpi::power#
> >
> >I can control the LED from userspace, but then there's no way to put
> >the LED back to firmware control. That's just broken.
> >
> >Do you have a proposal how to handle that?
>=20
> Isn't it under firmware control all the time?

I'm not 100% sure in the thinkpad case. In the N900 case, we have LED
that displays (user_brightness || (user_enabled_indicator && cpu_activity)).

I believe clean way to do that would be a trigger.

> >>>So I'd do the trigger here. It is same way we can handle LEDs on
> >>>thinkpad. Yes, it means you won't be able to do oneshot trigger on
> >>>backlight. I don't think that's a huge problem.
> >>
> >>There have been voices in this discussion claiming the opposite. :-)
> >
> >Well, lets ignore those voices until the voices understand the current
> >design :-).
>=20
> Sheer user is not interested in design, but in usability.

Well, end user is not expected to touch /sys files directly -- we
should create a script for that. /sys should be logical and map well
to what we do in kernel. Being "nice to use from shell" is
secondary...

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhazswACgkQMOfwapXb+vIKagCfcBXI53dLtA8od5JiBw/i3clT
ObQAnRKM8v3qPrli2/wjyQELvQt8XQHQ
=wmJD
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
