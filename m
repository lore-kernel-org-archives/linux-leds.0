From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH V1 1/2] leds: leds-qti-rgb: Add LED driver for QTI
 TRI_LED module
Date: Wed, 31 May 2017 09:55:36 +0200
Message-ID: <20170531075536.GA13028@amd>
References: <20170531061541.10808-1-fenglinw@codeaurora.org>
 <20170531061541.10808-2-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170531061541.10808-2-fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, subbaram-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, aghayal-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, wruan-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, kgunda-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +- qcom,support-blink:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: An array of integer values to indicate if "blue", "green", =
"red"
> +		LEDs support blink control. The values are listed as the fixed
> +		order for "blue", "green", "red" LEDs.

Normal order is RGB, and no need for the "s.

> +- qcom,on-ms:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: An array of time values (milli-seconds) to represent the
> +		on duration for "blue", "green", "red" LEDs. The values are
> +		listed as the fixed order for "blue", "green", "red" LEDs.
> +		This property has to be defined if "qcom,support-blink" is
> +		present.
> +
> +- qcom,off-ms:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: An array of time values (milli-seconds) to represent the
> +		off duration for "blue", "green", "red" LEDs. The values are
> +		listed as the fixed order for "blue", "green", "red" LEDs.
> +		This property has to be defined if "qcom,support-blink" is
> +		present.

I don't get it; why is this needed?

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkudvgACgkQMOfwapXb+vIBegCgsmDKsTiykhHcnLlnoUjLiqt0
j2YAnjoQwFTA/DKM68UUGo78I+c3mX2b
=2TyU
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
