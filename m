From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Fri, 17 Nov 2017 12:20:32 +0100
Message-ID: <20171117112032.GA13855@amd>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4@gmail.com>
 <0a78c883-f074-cc19-3c0c-fc05607400e9@ti.com>
 <20171115222323.GA18290@amd>
 <82336eb7-2b89-d37b-d688-4e4302766346@gmail.com>
 <16189eab-5541-9550-c027-1c9d2b5fa6d7@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:37312 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbdKQLUf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 06:20:35 -0500
Content-Disposition: inline
In-Reply-To: <16189eab-5541-9550-c027-1c9d2b5fa6d7@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> If that does not yet exist... you want to create glue layer to be able
> >> to use LED as a display backlight. (It may already exist, no idea).
> >>
> >> ...
> >>
> >> Actually or maybe a LED trigger. Just set LED's trigger to "this is
> >> display backlight".
> >=20
> > There is one already:
> >=20
> > drivers/leds/trigger/ledtrig-backlight.c
> >=20
> > It adds a LED class device to the fb_notifier_list
> > (drivers/video/fbdev/core/fb_notify.c)
> >=20
> > using fb_register_client(). The same is used in
> > backlight_device_register (drivers/video/backlight/backlight.c).
> >=20
> > Actually why do you want to have this driver in the LED subsystem,
> > if it is advertised as "designed for LCD display backlighting"?
>=20
> Well this is also advertised as a driver for Smart phone and tablet devic=
es.  And having worked with the Android lighting
> solutions this is the preferred subsystem for Android.  The Android OS ma=
nages the led brightness based on ALS values and in
> turn calls into the driver to control the brightness register through the=
 vendor provided lighting HAL.
>=20

Well.. if it can control other LEDs than just backlight, I believe it
can stay in the LED subsystem.

> I am going to look at the backlight source to figure out how to get the s=
ame functionality using the backlight subsystem.
> Otherwise I will plug in this driver to the backlight subsystem through t=
he notifier.
>=20

The backlight trigger should be ok.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloOxgAACgkQMOfwapXb+vJlKACcD0C1bIT8JLHXg1TqcV77BreI
iWgAn0gVkrfNTT81auusAT9qwA45QxUx
=G/Vt
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
