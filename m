From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v3 2/3] leds: Add driver for Qualcomm LPG
Date: Tue, 21 Nov 2017 00:22:11 +0100
Message-ID: <20171120232211.GC13906@amd>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-3-bjorn.andersson@linaro.org>
 <19018aa2-c460-1d5e-8dd2-1cfa557be2f2@gmail.com>
 <20171120211033.GZ28761@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171120211033.GZ28761@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-11-20 13:10:33, Bjorn Andersson wrote:
> On Sun 19 Nov 13:36 PST 2017, Jacek Anaszewski wrote:
>=20
> > Hi Bjorn,
> >=20
> > Thanks for the patch. Please refer to my comments in the code.
> >=20
> > On 11/15/2017 08:13 AM, Bjorn Andersson wrote:
> [..]
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > index 52ea34e337cd..ccc3aa4b2474 100644
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -651,6 +651,13 @@ config LEDS_POWERNV
> > >  	  To compile this driver as a module, choose 'm' here: the module
> > >  	  will be called leds-powernv.
> > > =20
> > > +config LEDS_QCOM_LPG
> > > +	tristate "LED support for Qualcomm LPG"
> > > +	depends on LEDS_CLASS
> >=20
> > You were mentioning that this driver is for a MFD child block,
> > so we should probably depend on the parent MFD driver?
> >=20
>=20
> There's no build time dependency between the two, so it's not strictly
> necessary.
>=20
> Adding a dependency on MFD_SPMI_PMIC would indirectly add a dependency
> on ARCH_QCOM, which limit build testing and stop some static code
> checkers to check the driver.
>=20
> So, unless you strongly object I would prefer not to mention the
> MFD.

OTOH, this way even users that can't have qualcom LPG are asked the
question.

So right way is depends on LEdS_CLASS && (BUILD_TEST || MFD_SPMI_PMIC).

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloTY6MACgkQMOfwapXb+vJ7NgCgqqmrZYp6fAYBRo9TKgPfuNto
qy4AnjskseY9GyVshFleQvxjAnMfVOO5
=+L2Z
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
