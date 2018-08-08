From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Wed, 8 Aug 2018 21:59:03 +0200
Message-ID: <20180808195903.GB20912@amd>
References: <20180807160442.8937-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807160442.8937-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-08-07 11:04:41, Dan Murphy wrote:
> Add the device tree bindings for the lm3697
> led driver for backlighting and display.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>=20
> v2 - Fixed subject and patch commit message - https://lore.kernel.org/pat=
chwork/patch/971326/
>=20
>  .../devicetree/bindings/leds/leds-lm3697.txt  | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>=20
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

This is quite long way to describe a bitmask, no? Could we make
it so that control-bank-cfg is not needed?

> +Optional properties:
> +	- enable-gpios : gpio pin to enable/disable the device.
> +	- vled-supply : LED supply
> +
> +Required child properties:
> +	- reg : 0 - LED is Controlled by bank A
> +		1 - LED is Controlled by bank B

Can we compute control-bank-cfg from this?

> +Optional child properties:
> +	- label : see Documentation/devicetree/bindings/leds/common.txt
> +	- linux,default-trigger :
> +	   see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +
> +led-controller@36 {
> +	compatible =3D "ti,lm3967";
> +	reg =3D <0x36>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	enable-gpios =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +	vled-supply =3D <&vbatt>;
> +	control-bank-cfg =3D <0>;
> +
> +	led@0 {
> +		reg =3D <0>;
> +		label =3D "white:first_backlight_cluster";
> +		linux,default-trigger =3D "backlight";
> +	};
> +
> +	led@1 {
> +		reg =3D <1>;
> +		label =3D "white:second_backlight_cluster";
> +		linux,default-trigger =3D "frontlight";
> +	};
> +}

Does the example show correct config? AFAICT all controls go to bank
A according to control-bank-cfg, yet led@1 describes bank B...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltrS4cACgkQMOfwapXb+vKAfQCfbzUzq5mBZdpRkhc2+SYn/F4W
QwQAn0BVsaZHm62DgwAMWR6op3an7cC2
=5n4G
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
