From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/4] dt: lm3532: Add lm3532 dt doc and update ti_lmu
 doc
Date: Thu, 14 Mar 2019 10:39:12 +0100
Message-ID: <20190314093912.GA10637@amd>
References: <20190313123249.17258-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313123249.17258-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, tony@atomide.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Could you maybe slow down a bit.

"Hey, I should review this". "Hmm, there are two new versions in the
mailbox in the meantime, good thing I waited."

> +	ramp-up-ms =3D <1024>;
> +	ramp-down-ms =3D <65536>;

This is wrong.

> +	led@1 {
> +		reg =3D <1>;
> +		led-sources =3D <1>;
> +		ti,led-mode =3D <0>;
> +		label =3D "keypad";

"platform::kbd_backlight"
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyKIUAACgkQMOfwapXb+vKgFACgtQmACUYez0vGBFfqWZsROJVE
Gv8An0KWQRjl4No1PQZgXf23TAcucila
=fUaT
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
