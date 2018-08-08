From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Thu, 9 Aug 2018 00:00:14 +0200
Message-ID: <20180808220014.GG15831@amd>
References: <20180807160442.8937-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="j2AXaZ4YhVcLc+PQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807160442.8937-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--j2AXaZ4YhVcLc+PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-08-07 11:04:41, Dan Murphy wrote:
> Add the device tree bindings for the lm3697
> led driver for backlighting and display.

What I'd like to see:

> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Doc=
umentation/devicetree/bindings/leds/leds-lm3697.txt
> new file mode 100644
> index 000000000000..7b8e490f1ea1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
> @@ -0,0 +1,64 @@
> +* Texas Instruments - LM3697 Highly Efficient White LED Driver
> +
> +The LM3697 11-bit LED driver provides high-
> +performance backlight dimming for 1, 2, or 3 series
> +LED strings while delivering up to 90% efficiency.
> +
> +This device is suitable for Display and Keypad Lighting
> +
> +Required properties:
> +	- compatible:
> +		"ti,lm3967"
> +	- reg :  I2C slave address
> +	- #address-cells : 1
> +	- #size-cells : 0
> +	- control-bank-cfg - : Indicates which sink is connected to which contr=
ol bank
> +		0 - All HVLED outputs are controlled by bank A
> +		1 - HVLED1 is controlled bank B, HVLED2/3 are controlled by bank A
> +		2 - HVLED2 is controlled bank B, HVLED1/3 are controlled by bank A
> +		3 - HVLED1/2 are controlled by bank B, HVLED3 is controlled by bank A
> +		4 - HVLED3 is controlled by bank B, HVLED1/2 are controlled by bank A
> +		5 - HVLED1/3 is controlled by bank B, HVLED2 is controlled by bank A
> +		6 - (default) HVLED1 is controlled by bank A, HVLED2/3 are controlled =
by bank B
> +		7 - All HVLED outputs are controlled by bank B

Remove control-bank-cfg.

> +Optional properties:
> +	- enable-gpios : gpio pin to enable/disable the device.
> +	- vled-supply : LED supply
> +
> +Required child properties:
> +	- reg : 0 - LED is Controlled by bank A
> +		1 - LED is Controlled by bank B

Add required child property:
        - hvleds =3D <list> -- set of outputs this child controls.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--j2AXaZ4YhVcLc+PQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltrZ+4ACgkQMOfwapXb+vLL9gCeKE/ZW17UyVr+1INwX+EDwkdd
35IAnj1K+K5jYmYK9y6xoviu65b2HH5E
=15nR
-----END PGP SIGNATURE-----

--j2AXaZ4YhVcLc+PQ--
