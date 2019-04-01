From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 2/5] dt: bindings: Add multicolor class dt bindings
 documention
Date: Mon, 1 Apr 2019 23:29:21 +0200
Message-ID: <20190401212921.GB14681@amd>
References: <20190401173400.14238-1-dmurphy@ti.com>
 <20190401173400.14238-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401173400.14238-3-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


>  .../bindings/leds/leds-class-multicolor.txt   | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-mul=
ticolor.txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor=
=2Etxt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> new file mode 100644
> index 000000000000..4b1a26104c79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> @@ -0,0 +1,140 @@
> +* Multicolor LED properties
> +
> +Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  Thes=
e devices
> +can be grouped together and also provide a modeling mechanism so that the
> +cluster LEDs can vary in hue and intensity to produce a wide range of co=
lors.
> +
> +The nodes and properties defined in this document are unique to the mult=
icolor=20
> +LED class.  Common LED nodes and properties are inherited from the commo=
n.txt
> +within this documentation directory.
> +
> +Required LED Child properties:
> +	- color : This is the color ID of the LED.  Definitions can be found
> +		  in include/linux/leds/common.txt
> +
> +Optional LED Child properties:
> +	- available-brightness-models : This is the phandle to the brightness-m=
odel
> +					node(s) that this LED cluster can support.
> +
> +Required Brightness model properties
> +	- led-brightness-model : This flag alerts the device driver and class
> +				 code that this node is a brightness model node
> +				 and to process the properties differently.
> +
> +Required Brightness model child properties
> +	- model_name : This is the name of the model presented to the user.  Th=
is
> +		       should be a color that the LED cluster can produce for
> +		       the device it is attached to.
> +	- layout : This is the LED layout for the levels.  This layout will
> +		   determine the color order of the levels.  The layout and
> +		   level-x properties array should be the same size.
> +	- level-x : These are the values for the LEDs to produce the color that
> +		    is defined.  These values are placed in the array according
> +		    to the layout property.

> +led-controller@30 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	compatible =3D "ti,lp5024";
> +	reg =3D <0x29>;
> +
> +	lp5024_model_yellow: brightness-models {
> +		led-brightness-model;
> +		model@0 {
> +			model_name =3D "yellow";
> +			layout =3D <LED_COLOR_ID_RED
> +				  LED_COLOR_ID_GREEN
> +				  LED_COLOR_ID_BLUE>;
> +			level-1 =3D <255 227 40>;
> +			level-2 =3D <255 240 136>;
> +			level-3 =3D <255 247 196>;
> +		};
> +	};

I don't think this works. RGB LED can show millions of colors. Do you
propose to have millions of entries in dts?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyigrEACgkQMOfwapXb+vIIuwCfapsOqy/hViTm+IIuOpTFbTFg
kO0AoLpn7h95WXsbCxMm1FEDe1Q1sio6
=4MRp
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
