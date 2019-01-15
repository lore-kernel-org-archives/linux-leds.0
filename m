From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Date: Tue, 15 Jan 2019 23:22:23 +0100
Message-ID: <20190115222223.GA17363@amd>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >+The 24-bit RGB value passed in follows the pattern 0xXXRRGGBB
> >+XX - Do not care ignored by the driver
> >+RR - is the 8 bit Red LED value
> >+GG - is the 8 bit Green LED value
> >+BB - is the 8 bit Blue LED value
> >+
> >+Example:
> >+LED module output 4 of the LP5024 will be a yellow color:
> >+echo 0xe6de00 > /sys/class/leds/lp5024\:led4_mod/color
> >+
> >+LED module output 4 of the LP5024 will be dimmed 50%:
> >+echo 0x80 > /sys/class/leds/lp5024\:led4_mod/brightness
> >+
> >+LED banked RGBs of the LP5036 will be a white color:
> >+echo 0xffffff > /sys/class/leds/lp5036\:led_banked/color
>=20
> This part with example cans remain in Documentation/leds if you
> >like.

Does it actually work like that on hardware?

Is it supposed to support "normal" RGB colors as seen on monitors?

Because 100% PWM on all channels does not result in white on hardware
I have.

> >+	} else {
> >+		led_offset =3D (led->led_number * 3);
> >+		red_reg =3D priv->mix_out0_reg + led_offset;
> >+		green_reg =3D priv->mix_out0_reg + led_offset + 1;
> >+		blue_reg =3D priv->mix_out0_reg + led_offset + 2;
> >+	}
> >+
> >+	red_val =3D (mix_value & 0xff0000) >> 16;
> >+	green_val =3D (mix_value & 0xff00) >> 8;
> >+	blue_val =3D (mix_value & 0xff);
>=20
> I've been rather thinking about space separated list of decimal
> "red green blue" values, but maybe this way it will be less
> controversial. Let's if there will be other opinions.

We support maximum brightness > 255, so space separated is certainly
better option than this.

But...

I believe we should have a reasonable design before we do something
like this. There's no guarantee someone will not use lp50xx with just
the white LEDs for example. How will this work? Plus existing hardware
already uses three separate LEDs for RGB LED. Why not provide same
interface?

(Oh and don't try to say "sysfs is slow", without numbers).

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlw+XR8ACgkQMOfwapXb+vJpeACgl+GMGYg39Ygx3SRgpWe4Spwf
wR0An32yc4KI6RpcAkpVt/y8qHFPfuXY
=FRYS
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
