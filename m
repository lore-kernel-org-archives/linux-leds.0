From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v4 4/6] dt: bindings: lp8860: Add trigger binding to the
 lp8860
Date: Fri, 15 Dec 2017 10:09:03 +0100
Message-ID: <20171215090903.GC8221@amd>
References: <20171212220143.31210-1-dmurphy@ti.com>
 <20171212220143.31210-5-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171212220143.31210-5-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> @@ -35,6 +37,7 @@ led-controller@2d {
>  	led@0 {
>  		reg =3D <0>;
>  		label =3D "white:display_cluster";
> +		linux,default-trigger =3D "backlight";
>  	};
>  }

What is "display_cluster"? Is it display backlight?

Could we use ":backlight" and perhaps start documentation file listing
"common" LED descriptions so they are shared across machines?

For the record, I'd prefer this to be
"/sys/class/leds/display:white:backlight" in the end... so that we
have nice naming for userspace, consistent between different machines.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlozkS8ACgkQMOfwapXb+vLIRwCeP1awOlpae6487YFuMV/XeTAQ
DpkAn2dgch5hKKuHhI+FyUKd8b9MtN1G
=IDp/
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
