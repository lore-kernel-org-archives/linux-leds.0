From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/8] dt: bindings: Add a binding for referencing EEPROM
 from camera sensors
Date: Wed, 19 Jul 2017 09:52:55 +0200
Message-ID: <20170719075255.yuar2xbeyisgl3we@flea>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-4-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uo6vgdgzagsyy4mc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497433639-13101-4-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--uo6vgdgzagsyy4mc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed, Jun 14, 2017 at 12:47:14PM +0300, Sakari Ailus wrote:
> Many camera sensor devices contain EEPROM chips that describe the
> properties of a given unit --- the data is specific to a given unit can
> thus is not stored e.g. in user space or the driver.
>=20
> Some sensors embed the EEPROM chip and it can be accessed through the
> sensor's I2C interface. This property is to be used for devices where the
> EEPROM chip is accessed through a different I2C address than the sensor.
>=20
> The intent is to later provide this information to the user space.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> Reviewed-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt=
 b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index a18d9b2..ae259924 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -76,6 +76,9 @@ Optional properties
> =20
>  - lens-focus: A phandle to the node of the focus lens controller.
> =20
> +- eeprom: A phandle to the node of the EEPROM describing the camera sens=
or
> +  (i.e. device specific calibration data), in case it differs from the
> +  sensor node.

Wouldn't it makes sense (especially if you want to provide user space
access) to reuse what nvmem provides for this?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--uo6vgdgzagsyy4mc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbw/XAAoJEBx+YmzsjxAgHCQP/RnrFORonpEQ6NCzkvuRFav9
LBLitQG0pR4z3JT5/44I/kUFMogu5dXn1HmjSKFK5N7jlD1DYD0FSZcMBIIPSe2e
oir3ahObGlyyFhormObIu988pm1Qek2MFjeNn0Xfd9B8Gkqax0ZFjPgY4whVLQBK
DRPa18BhAONWBuFBpP9/Wu/Vg+rhp7ShvZFxfBzWpdyLnICD6A7/RsF9/xWJLWj7
uxFyqf9nXgRN0bCz+r010LRgdTdLxleFMXh41r1HZh12YPJtYGhQ49KRtV0TftG1
+RHIj3Wr7QPfytX/u+YCTiHR8+NvyorMLMegFn3VF6qpAKzvgktQZuy75+JSJShw
zMBrLUM4YxILq8vCxdR4kF2SrtUyIn9iLVVct/sLetTVzU/wQB/mcRM0Dl5f1NcO
sKWLygbAVYZOPGVb7TXz72PFJSch9nUDNeZOQ027PNITalDmULeqwzR8mXxzxXBp
bEeSXGk5kS3/sRMVvVM6CSa8R07GfiGNLAx6z/+PgBcpjZ6mAx7XEJzrrInlmE0t
y0ADWyV1+S0pGDVGu4MDP0UqOYrhRZWu48ziTdpLkYpPizv0e2XFjpJIZgNqprmr
PQjiqKTu06KbeafgnCgolfDbUiVD6y6NR6kQywB+aPLdh4HVyTWZs+Fqo064lH+d
wlsrBw8EW4iS57/JP1Gj
=DJey
-----END PGP SIGNATURE-----

--uo6vgdgzagsyy4mc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
