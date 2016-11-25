From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 21:40:45 +0100
Message-ID: <20161125204045.GA28036@amd>
References: <5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
 <CGME20161124214512epcas4p493721bb45b10e1f41a8ea38e01d6e471@epcas4p4.samsung.com>
 <201611242245.00217@pali>
 <afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
 <20161125100140.GC4062@amd>
 <e32e3d6c-5d6d-c882-21d9-8028c8311b0b@samsung.com>
 <20161125110557.GA13204@amd>
 <2367b9a7-68f7-2038-0d3a-a9561055b4f6@samsung.com>
 <20161125144859.GA20139@amd>
 <9844f7b3-c3e8-99d8-61b6-1550b1b8ab7e@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:43867 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932863AbcKYUku (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Nov 2016 15:40:50 -0500
Content-Disposition: inline
In-Reply-To: <9844f7b3-c3e8-99d8-61b6-1550b1b8ab7e@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>Triggers are not limited to periodic blinking or reporting cpu
> >>activity. There is also oneshot trigger that can be used e.g. when
> >>user touches the screen, as Pali mentioned.
> >
> >Using oneshot trigger for this would be pretty strange.
>=20
> It was only an example to mention other than periodic triggers.
> You could have a trigger that just turns the LED permanently on
> after user touches the screen.

Well.. triggers kind of assume they control the LED. They were not
prepared to deal with hardware changing the brightness behind their
back.

> >Notice that in
> >some cases (thinkpad battery led, for example) we either have firmware
> >controls the LED (but then software can't control it) or we have
> >software controlling the LED (but then we don't know what firmware
> >would put there). Maybe keyboard backlight can be controlled
> >"simultaneously" by both software and firmware, but there are
> >certainly LEDs that can't handle that, and IMO it would be nice to
> >have same interface.
> >
> >>>Well.. actually... I think this is a little bit over complex and
> >>>probably unneccessary. I'd let Hans implement whatever he thinks is
> >>>easiest.
> >>
> >>I'd say this is the trigger approach which is a bit convoluted.
> >
> >In my eyes trigger approach is neccessary at least for some hardware,
> >and things it pretty clear: trigger on =3D=3D LED changes without
> >userspace involvement. trigger off =3D=3D userspace controls the LED.
>=20
> It is likely that it would break many existing users.

Can you elaborate on that?

I just tried with leds on thinkpad

root@duo:/sys/class/leds/tpacpi::power# echo 1 > brightness
root@duo:/sys/class/leds/tpacpi::power# echo 0 > brightness
root@duo:/sys/class/leds/tpacpi::power# cat trigger
[none] bluetooth-power kbd-scrollock kbd-numlock kbd-capslock
kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock kbd-altlock
kbd-shiftllock kbd-shiftrlock kbd-ctrlllock kbd-ctrlrlock AC-online
BAT0-charging-or-full BAT0-charging BAT0-full
BAT0-charging-blink-full-solid rfkill0 phy0rx phy0tx phy0assoc
phy0radio phy0tpt mmc0 timer pattern rfkill1 hci0-power rfkill74
heartbeat
root@duo:/sys/class/leds/tpacpi::power#

I can control the LED from userspace, but then there's no way to put
the LED back to firmware control. That's just broken.

Do you have a proposal how to handle that?

> >So I'd do the trigger here. It is same way we can handle LEDs on
> >thinkpad. Yes, it means you won't be able to do oneshot trigger on
> >backlight. I don't think that's a huge problem.
>=20
> There have been voices in this discussion claiming the opposite. :-)

Well, lets ignore those voices until the voices understand the current
design :-).

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlg4oc0ACgkQMOfwapXb+vJjwQCeJvKUdvBkhGya4cVzuQPhNBFg
y4QAn1rNmUSp5eMRTxTdQmcuFiEeTw8n
=7Eci
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
