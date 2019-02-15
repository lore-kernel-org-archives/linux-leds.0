From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Fri, 15 Feb 2019 14:02:07 +0100
Message-ID: <20190215130207.GB32198@amd>
References: <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com>
 <20190213230731.GA8557@amd>
 <42078a81-e32e-81b7-528f-d1adb60d31c3@redhat.com>
 <20190213233806.GA11867@amd>
 <562e2acd-a60a-2aea-4050-6d9414d23a4e@redhat.com>
 <20190214111423.GE6132@amd>
 <92cf09b8-726d-4f1b-94ba-368a66af2246@redhat.com>
 <2b6faaa5-b21e-a512-de7d-ca21be5045fc@gmail.com>
 <20190214230307.GA17358@amd>
 <2a5e2002-e5f1-6da3-8a43-317801b69657@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2a5e2002-e5f1-6da3-8a43-317801b69657@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >Hardware can automatically control the LED according to the charging
> >status, or it can be used as normal software-controlled LED.
> >
> >I believe we should use trigger to select if hardware controls it or
> >not (and then add driver-specific files to describe the
> >details). Other proposal is in the mail thread, too.
>=20
> Right, so there are really 2 orthogonal issues here:

For completeness, there are actually 3 issues:

> 1) With this hardware the LED is either turned on/off automatically
> by the PMIC based on charging state; or it is under user control.
>=20
> This is different from the led_classdev_notify_brightness_hw_changed
> case, where the hardware may update the state underneath the driver,
> but the driver can still always update the state itself. In this case
> if the LED is in hw-control mode then the driver cannot turn it on/off.
>=20
> Pavel suggested modeling this with a new "hardware' trigger, where
> setting the trigger to this trigger will enable the hw-controlled
> mode and setting any other trigger will switch thing to the user-controll=
ed
> mode.
>=20
> 2) This hardware can do blinking / breathing. There are various issues wi=
th
> this:
>=20
> 2.1) Blinking is more or less covered by the timer trigger. But breathing=
 is
> not the pattern trigger is a poor match since there is only 1 fixed patte=
rn
>=20
> 2.2) The supported blinking frequencies are very limited, so it might be =
better
> to keep the standard software blinking mode and have a special sysfs attr=
ibute
> to select the hardware blink support
>=20
> 2.3) The user can also select between continuous on / blinking / breathing
> when the LED is under hardware control (it will then be on / blinking / b=
reathing)
> when charging.

3) Your hardware supports "composed" triggers:

You can do "breathing while charging", can do "blinking while
charging" and you probably could do "blinking while disk is active" or
"breathing while microphone is muted".

We don't have such support in LED subsystem, AFAICT. Anyway, I'd say
3) Does not need to be solved now...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxmuE8ACgkQMOfwapXb+vLudQCgqQS77n5Tsm6sjJ5KCzmEdqP/
qxUAn06KMMaz2kPH8f+lqCCXxQJT+vyT
=tSOZ
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
