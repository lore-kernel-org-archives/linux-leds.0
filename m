From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v3 1/3] leds: core: Introduce generic pattern interface
Date: Fri, 8 Dec 2017 15:27:55 +0100
Message-ID: <20171208142755.GE7793@amd>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-2-bjorn.andersson@linaro.org>
 <20171115073642.GA21307@kroah.com>
 <20171120232015.GB13906@amd>
 <20171121002102.GD28761@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CGDBiGfvSTbxKZlW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171121002102.GD28761@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--CGDBiGfvSTbxKZlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > +KernelVersion:	4.14
> > >=20
> > > And that kernel version is long since released :)
> >=20
> > Yeah, the other problem is it has some interesting format with ":|"
> > marking repeat,
>=20
> So what would you prefer?
>=20
> We can either add another file ("pattern_repeat"?) that allows you to
> describe this separately or some other symbol.

pattern_repeat should work, yes. And we can make it =3D=3D 0: repeat
forever. =3D=3D 1 ... repeat just once. =3D=3D n, repeat n times.

Some leds can support that in hardware.

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CGDBiGfvSTbxKZlW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloqoWsACgkQMOfwapXb+vJHYACgv3fwEOoYmCHICIx9m2llP5kV
9n4AmwXaGwtR1EXO60RzRioMV8JMGDG6
=X/AB
-----END PGP SIGNATURE-----

--CGDBiGfvSTbxKZlW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
