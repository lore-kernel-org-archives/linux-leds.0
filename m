From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Fri, 7 Apr 2017 14:54:40 +0200
Message-ID: <20170407125440.GD4756@amd>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bf999f34-4509-6f0b-602c-f82d50a18e97-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Second, there are more issues than just patterns with the RGB
> > LED. Most important is ability to set particular colors. You want to
> > set the RGB LED to "white", but that does not mean you can set
> > red=3Dgreen=3Dblue=3D1.0. You want color to look the same on LCD and on=
 the
> > LED, which means coefficients for white and some kind of function for
> > brightness-to-PWM conversion.
>=20
> Shouldn't we leave that entirely to the userspace? Can we come up
> with coefficients that will guarantee the same result on all existing
> LCD devices?

I don't think we should. We want (red =3D 70%, green =3D 80%, blue =3D 20%)
to look approximately the same on all the hardware. That's currently
not the case; even (red =3D green =3D blue =3D 100%) is not white.

I believe easiest solution is "the kernel does the work", as it does
for LCD screens.

[Now... as long as userspace has enough information to display white
and specific colors, I don't care much -- having kernel present
coefficients for userspace would work, too.]

								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljnjBAACgkQMOfwapXb+vIsPwCaAuSwGfzfcVoXSxU/XgiNB0gs
sPkAn1HXmiqsDLIGCLDlb9+jgz+FuLYE
=paYp
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
