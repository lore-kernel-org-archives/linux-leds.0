From: Pavel Machek <pavel@ucw.cz>
Subject: Re: RGB LED class Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX
 family of the RGB LED driver
Date: Tue, 29 Jan 2019 00:04:08 +0100
Message-ID: <20190128230408.GB5728@amd>
References: <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com>
 <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com>
 <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com>
 <8dfa2854-2814-6874-ab8e-1858e9a18acf@gmail.com>
 <20190118000235.GB27661@amd>
 <61fa89eb-c12e-8f9c-9457-9d6d17ba7717@gmail.com>
 <20190119213629.GA3654@amd>
 <9d2e0220-69f0-faaa-adb9-13d905f9c51d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9d2e0220-69f0-faaa-adb9-13d905f9c51d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>What algorithm would be used for mapping brightness levels to RGB values
> >>in case of devices without hardware support for that?
> >
> >Output power =3D brightness / max_brightness * pwm_channel[x].
>=20
> IIUC you mean it as a formula for calculating r,g,b, values?
> I.e., on brightness setting we would have to do this calculation for
> each of three channels?
>=20
> Then, it will result in changing hue as well. That's why we're
> discussing HSV.

It should not change the hue, AFAICT, modulo the rounding errors.

> >>s/pwm/color/
> >
> >s/pwm/power/ would work for me.
>=20
> Power implies physical units. I'd prefer "intensity".

Intensity would work for me, too.

> >>Besides white also other color presets could be defined in DT.
> >
> >They should not be neccessary. When userspace knows what is white and
> >that power is linear with values in power_channels, it should be able
> >to do colorspace conversion itself.
>=20
> Have you verified it in practice? Would it allow to convert RGB values
> of the color displayed on the monitor to LED RGB class intensities,
> allowing to achieve similar color on the LED?

Yes, I think so.

My code is in unicsy_demo repository, in monitor/notint.py .


									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxPimgACgkQMOfwapXb+vLTPACeMpWgjVPi9frKciJFP7fvH/CE
8v8AoIBkFjvwbnPWsHWUoVfg3EEBw3XX
=cqao
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
