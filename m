From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v2 1/3] leds: core: Introduce generic pattern interface
Date: Sat, 12 Aug 2017 21:22:15 +0200
Message-ID: <20170812192215.GB23619@amd>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-2-bjorn.andersson@linaro.org>
 <20170706031801.GB12954@xo-6d-61-c0.localdomain>
 <beb9b4c3-4922-1ebb-5017-a4b791cdb4d7@gmail.com>
 <20170716211456.GV1618@tuxbook>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170716211456.GV1618@tuxbook>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Hmm, they are only [brightness duration] tuples, and no definition of
> > R, G and B LED device is covered here, so how it can be useful for RGB
> > LEDs?
> >=20
>=20
> The typical Qualcomm PMIC sports 4-8 LPG channels. The output of these
> channels can be configured to some extent, but in theory any combination
> of the 8 could be hooked up to the three channels of a RGB LED.
>=20
> So looking at the LPG hw block, there's no such thing as RGB.

Well, there are certainly RGB leds. And we need kernel to know about
them, so user can (for example) ask for white color.

> Further more, per the 96boards specification we're expected to have
> different triggers on the different "colors" of the TRILED.

So the specs is stupid. We may end up allowing that, but lets not
introduce a bad design just because of that.

[You may get that functionality by lying in the dts and claiming it is
three LEDs, not one RGB LED.]

You want to be able to set a color of RGB LED... which is not as easy
as it looks.


									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmPVWcACgkQMOfwapXb+vJEDgCgiiqcqBgpIMFFB/ZU8+0/D/RI
eRoAoIyeMwcgdAIhPhx1y3Zmg18GpW0r
=OykU
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
