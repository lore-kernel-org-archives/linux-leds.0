From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V2 1/2] leds: leds-qti-rgb: Add LED driver for QTI
 TRI_LED module
Date: Tue, 6 Jun 2017 22:13:42 +0200
Message-ID: <20170606201342.GB32171@amd>
References: <20170601072723.12760-1-fenglinw@codeaurora.org>
 <8058ed85-5a64-8dc3-99ea-1ad8128e043d@gmail.com>
 <20170605211609.GA9035@amd>
 <e4efce59-f611-14e5-1d11-09cb660585b2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e4efce59-f611-14e5-1d11-09cb660585b2@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: fenglinw@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, subbaram@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: linux-leds@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> Generally I came to a conclusion that it will be best to register
> >> additional LED RGB class device in an addition to three LED class
> >> devices representing each color. In order to avoid hard to solve
> >> locking problems I propose to allow for simultaneous access to LED
> >> class devices and LED RGB class device gathering them.
> >>
> >> All in all, currently we also don't give an exclusive access to
> >> a particular LED class device, which always can lead to overwriting
> >> current brightness by another process. These issues must be arbitrated
> >> by user space.
> >>
> >> I propose that LED RGB class device exposed following files:
> >>
> >> - red_brightness
> >> - green_brightness
> >> - blue_brightness
> >> - latch_color
> >=20
> > Actually, I'd just do single file, "rgb_brightness" with 3
> > values. Overhead of writing 3 values is pretty much 0.
>=20
> You've always been strongly in favor of one-value-per-file
> sysfs rule of thumb, but I'm OK with this approach as well :-)

Being values of same type (etc), this is actually permitted. And it is
better than hack with latch_color :-).

Good.
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlk3DPYACgkQMOfwapXb+vJ06wCeOst8aduqRiHtSFpzgzojv4fL
2pcAni1rUmGq/T70v9M+zuQwB5u3hR7C
=AMl9
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
