From: Pavel Machek <pavel@ucw.cz>
Subject: Re: RGB LED class Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX
 family of the RGB LED driver
Date: Sat, 19 Jan 2019 22:36:29 +0100
Message-ID: <20190119213629.GA3654@amd>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com>
 <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com>
 <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com>
 <8dfa2854-2814-6874-ab8e-1858e9a18acf@gmail.com>
 <20190118000235.GB27661@amd>
 <61fa89eb-c12e-8f9c-9457-9d6d17ba7717@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <61fa89eb-c12e-8f9c-9457-9d6d17ba7717@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >First, I think we want to decide if RGB LED should be presented as
> >3 LEDs or as 1 LED... and what to do with existing RGB leds being
> >presented as 3 LEDs.
> >
> >I don't think we want to support both RGB and HSV in the kernel. It is
> >math, and not a nice one.
> >
> >Yes, both have advantages and disadvantages, but having _both_ in
> >kernel has disadvantages of both.
> >
> >One way I could imagine the interface:
> >
> >     RGB LED presented as one LED.
> >
> >     brightness -- controls brightness of whole RGB module.
>=20
> What algorithm would be used for mapping brightness levels to RGB values
> in case of devices without hardware support for that?

Output power =3D brightness / max_brightness * pwm_channel[x].

> >     pwm_channels -- "1000 240 300" -- "red part should be full on, green
> >     should be pwm controlled to 240/1000, blue should be 300/1000"
> >
> >     pwm_white -- "1000 500 400" -- tells userspace what to write to PWM
> >     channels to get approximately white color.
> >
> >     This would assume that RGB LEDs are always pwm controlled. That
> >     seems to be true for hardware I seen.
>=20
> Why pwm in the file names? I don't see any gain and only possible
> problems. Many LED controllers use current level and not PWM
> for driving LEDs.

I want to make sure userspace understands this has linear relation to
output power. I'd like to avoid mentioning color because there power
output is not linear with "RGB"=20

> s/pwm/color/

s/pwm/power/ would work for me.

> Besides white also other color presets could be defined in DT.

They should not be neccessary. When userspace knows what is white and
that power is linear with values in power_channels, it should be able
to do colorspace conversion itself.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxDmF0ACgkQMOfwapXb+vL/LQCfaLBavlaI26/fDnA+2+PM639T
NTAAnAwZBcafnVt7AmOEomXaMxihgxCQ
=1A/N
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
