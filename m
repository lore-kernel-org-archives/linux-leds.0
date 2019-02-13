From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Thu, 14 Feb 2019 00:07:31 +0100
Message-ID: <20190213230731.GA8557@amd>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On 12-02-19 21:59, Yauhen Kharuzhy wrote:
> >Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
> >PMIC. Charger and general-purpose leds are supported. Hardware blinking
> >is implemented, breathing is not.
> >
> >This driver was tested with Lenovo Yoga Book notebook.
>=20
> Thank you for working on this. The CHT Whiskey Cove PMIC is
> also used on the GPD win and GPD pocket devices and there LED1
> by default indicates the charging status.
>=20
> Since your driver forces the LED into SWCTL mode on probe()
> this means that any kernel with it enabled will break the
> charging LEDs OOTB function, this is undesirable.

Agreed.

> I believe it would be best to add a custom "mode" attribute
> to the led classdev, with "manual" and "on-when-charging"
> modes, this would then control bits 0-1 of reg 0x5e1f and
> by default these bits should be left as is when the driver
> loads.

No. This is not first hardware when we have something like this, and
we need something generic here.

One possibility would be magic "hardware drives this led"
trigger. Hmm? (Jacek disliked this idea before, but maybe we can
convince him).

Generic "is this driven by hardware or not" attribute might be
possible, too... but its interaction with triggers/brightness/etc
would be confusing.

> Note that in my experience the "charging" mode only works
> when bits 0-1 have the value 10. I've some written notes from
> when I played with this myself and they say:
>=20
>    -CHT WC powerled control 0x5e1f: bits 0-1:
>     0: ????
>     1: Off
>     2: On when charging
>     3: On
>    -CHT WC powerled pattern control 0x5e20: bits 1-2:
>     0: Off
>     1: On
>     2: Blinking
>     3: Glowing
>=20

> As for the 0x5e20 settings, I believe another custom
> sysfs attribute, called "breathing" would be a good idea to
> export the breathing functionality.

We have "pattern" trigger that can do this kind of stuff in
software. But I'm not sure if this is worth supporting.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxkozMACgkQMOfwapXb+vLOSACdGeG4DIvszLQfMOVHwdjnB5iP
8lQAoIRlf65tt/uk4eD4cAPeyYj8jJIC
=CeJk
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
