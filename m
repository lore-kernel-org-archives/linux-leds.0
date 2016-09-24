From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v3 1/2] leds: ncp5623: Add device tree binding
 documentation
Date: Sat, 24 Sep 2016 13:58:24 +0200
Message-ID: <20160924115823.GA8696@amd>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-2-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474025672-5040-2-git-send-email-florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +Example
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +led1: ncp5623@38 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	compatible =3D "onnn,ncp5623";
> +	reg =3D <0x38>;
> +	onnn,led-iref-microamp =3D <10>;
> +
> +	led1r@0 {
> +		label =3D "ncp:power:red";
> +		linux,default-trigger =3D "default-on";
=2E..
> +	led1b@1 {
> +		label =3D "ncp:power:blue";
> +		reg =3D <1>;

Actually... the three LEDs are packaged such as this is one colorful
light to the user, right? Some day we'll need to group them, so that
kernel can automatically tell this is one led, and probably add extra
attributes, such as values that produce white light.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfmal8ACgkQMOfwapXb+vKfSgCfYdfS0bEWuBVsrsZ5TrI0ql0B
IjwAn1dsz2s01n/B90R2Bc2wE3/OpXYO
=4MrU
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
