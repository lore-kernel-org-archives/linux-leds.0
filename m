From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 10:46:51 +0200
Message-ID: <20140407084651.GA30127@piout.net>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
 <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:46614 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750740AbaDGIq4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 04:46:56 -0400
Content-Disposition: inline
In-Reply-To: <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(adding Thierry Reding)

Hi,

On 06/04/2014 at 23:20:18 +0100, Russell King wrote :
> Some PWM outputs are wired such that the LED they're controlling is
> connected to supply rather than ground.  These PWMs may not support
> output inversion, or when they do, disabling the PWM may set the
> PWM output low, causing a "brightness" value of zero to turn the LED
> fully on.
>=20
> The platform data for this driver already indicates that this was
> thought about, and we have the "active_low" property there already.
> However, the implementation for this is missing.
>=20
> Add the trivial implementation for this feature.
>=20
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  drivers/leds/leds-pwm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index e1b4c23a409a..1d47742c551f 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -70,6 +70,10 @@ static void led_pwm_set(struct led_classdev *led_cdev,
> =20
>  	duty *=3D brightness;
>  	do_div(duty, max);
> +
> +	if (led_dat->active_low)
> +		duty =3D led_dat->period - duty;
> +
>  	led_dat->duty =3D duty;
> =20

This will conflict with my patch (which is still lacking proper review)
there:
http://thread.gmane.org/gmane.linux.leds/482

I would say that it is better to hide the polarity inversion in the PWM
driver for your specific PWM. Else we will end up with all the drivers
using PWMs trying to detect whether the PWM supports inversion and if it
is not the case, calculating the inverted duty cycle.

So, I would go for my patch which is adding the missing polarity
inversion setting when using platform data and then implement software
polarity inversion in your underlying PWM driver. That also avoids patch
5/5 and I believe not adding a DT property is always a good idea.

What is your PWM that is not supporting polarity inversion ?

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBCAAGBQJTQmX7AAoJEKbNnwlvZCyzbRYP/1yirSaLVTQAIgmzcYgqqLWg
uoRGLXbtQ/e/aA8nK9Q2qNCmJFmXSAJtwYo9yBirDXiu8c3o7+66cV1lX/M7Wg/J
7PZFfFm4vmGxKuNOI6BbDiLO6tvwOwxo+JqJ/hv1OJzOzvD3fVe++Smm6ccH3lLT
yggb0elkmfru6ZGeZHqTFQuU2Agd4w9wz9wMOHJm+Z7CY9nWFxhqa0HHsqG7SaIk
1yuDI5IOO+J/vdrM58R2U6qAZQvK6lANm+31cTCL4fWh9ZQIE3geQsfcANTE3bM9
i8EnvfnKBhqv+PFAgtddVPGH4GFYUg05g/nJho68yIe/LP5eA7gk38tr4LT4XqvX
itsho3tCKd0EvpdCm9QgslWAZ1zDscwMgqUA+fJFQaLAh0ebfrC4p3WEq4cSsO34
iAQ5ken2t1dy/UXyj1L2KxWKnKHSc3SZgoNNwWJneV2OR1rzJwrsP1vNIwSZQB7P
WHxur9DHGKYTDU5wXeX383CIrprjmPupkNaBrzpS2NcjynoZKdeSyNW4oN9jy12M
ypIkYEqiT+Np5i7Sse7TPHshPJaDm5cwZo2whYUS36SxVwQ5y8/1ZUSXd4eC2PTY
VftiKUBZ43ztDGGcsEHeDYsxz+DvdB2k96jqoXWSWWmvOyzgTGM0tDuvYWTQmjLe
YFfm23QXM2+UGUzSDMD3
=xTVJ
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
