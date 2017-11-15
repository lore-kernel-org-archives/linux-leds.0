From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: bindings: lm3692x: Add bindings for lm3692x LED
 driver
Date: Wed, 15 Nov 2017 11:35:16 +0100
Message-ID: <20171115103516.GA456@amd>
References: <20171113205052.25884-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171113205052.25884-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-11-13 14:50:51, Dan Murphy wrote:
> This adds the devicetree bindings for the LM3692x
> I2C LED string driver.
>=20
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>

Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Do=
cumentation/devicetree/bindings/leds/leds-lm3692x.txt
> new file mode 100644
> index 000000000000..cfef67bd4100
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -0,0 +1,28 @@
> +* Texas Instruments - LM3692x Highly Efficient Dual-String White LED Dri=
ver
> +
> +The LM36922 is an ultra-compact, highly efficient,
> +two string white-LED driver designed for LCD display
> +backlighting.
> +
> +Required properties:
> +	- compatible:
> +		"ti,lm3692x"
> +	- reg -  I2C slave address
> +
> +Optional properties:
> +	- label - Used for naming LEDs
> +	- enable-gpio - gpio pin to enable/disable the device.
> +	- supply - "vled" - LED supply
> +
> +Example:
> +
> +leds: leds@6 {
> +	compatible =3D "ti,lm3692x";
> +	reg =3D <0x36>;
> +	label =3D "backlight_cluster";
> +	enable-gpio =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +	vled-supply =3D <&vbatt>;
> +}
> +
> +For more product information please see the link below:
> +http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloMGGQACgkQMOfwapXb+vLM0QCgwXqePc1dGY7qcF6pfKmJkKoN
sBcAoIZGQ6LAgbhbA9M34TZCywsxOlSt
=7uBu
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
