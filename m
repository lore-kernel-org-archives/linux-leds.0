From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Thu, 23 Mar 2017 21:37:49 +0100
Message-ID: <20170323203749.GB8563@amd>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170323055435.29197-1-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> PMICs from Qualcomm. It can operate on fixed parameters or based on a
> lookup-table, altering the duty cycle over time - which provides the
> means for e.g. hardware assisted transitions of LED brightness.

Ok, this is not first hardware that supports something like this. We
have similar hardware that can do blinking on Nokia N900 -- please
take a look at leds-lp55*.c

And it would be really good to provide hardware abstraction. We really
don't want to have different userspace for LPG and for N900 and for
=2E..

Which probably means finding subset that makes sense for everyone.

Hmm. What is difference between "ping_pong" and "reverse"? And do we
really want it? That seems little .. too specialized.

How are different channels on RGB LED synchronized?

> +What:		/sys/class/leds/<led>/pattern
> +Date:		March 2017
> +KernelVersion:	4.12
> +Contact:	Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> +Description:
> +		Comma-separated list of duty cycle values to output from
> +		the ramp generator. Values should be in the range of 0
> +		to 511.

We normally do "space separated" in sysfs.

Can your engine do "smooth transitions"? For example if you want to
slowly turn on the LED on, can you do something more clever than

0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,
=2E..
496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509,
510, 511

? What is the maximum length of the pattern?

Could we do patterns in form of "delay brightness delay brightness"
=2E... ?

> +static enum led_brightness lpg_brightnes_get(struct led_classdev *cdev)
> +{
> +	struct lpg *lpg =3D container_of(cdev, struct lpg, cdev);
> +	unsigned long max =3D (1 << lpg->pwm_size) - 1;
> +
> +	if (!lpg->enabled)
> +		return LED_OFF;
> +
> +	return lpg->pwm_value * cdev->max_brightness / max;
> +}

Does this return something reasonable when pattern is running?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljUMh0ACgkQMOfwapXb+vLKHACghUg3NSTDsr2+HgeZuVy+xIj3
/BEAn2tKEbzi/drr/dQuilW3rIvLK1UG
=4Fv6
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
