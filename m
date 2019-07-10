From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 2/4] leds: Add managed API to get a LED from a device
 driver
Date: Wed, 10 Jul 2019 21:11:00 +0200
Message-ID: <20190710191100.GB22995@amd>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-3-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190710123932.28244-3-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
List-Id: linux-leds@vger.kernel.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-07-10 14:39:30, Jean-Jacques Hiblot wrote:
> If the LED is acquired by a consumer device with devm_led_get(), it is
> automatically release when the device is detach.

released, detached.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0mOEQACgkQMOfwapXb+vKPwQCfbNPhMlYP0u1y6gxsoXzLiPWR
16kAnRxjJGGmNwbOB2HyyJgm4cwt7X/F
=gTig
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
