From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 13:10:05 +0200
Message-ID: <20140407111003.GA26985@ulmo>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
 <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk>
 <20140407084651.GA30127@piout.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:56273 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753408AbaDGLKz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 07:10:55 -0400
Received: by mail-bk0-f54.google.com with SMTP id 6so640174bkj.41
        for <linux-leds@vger.kernel.org>; Mon, 07 Apr 2014 04:10:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140407084651.GA30127@piout.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2014 at 10:46:51AM +0200, Alexandre Belloni wrote:
> (adding Thierry Reding)
>=20
> Hi,
>=20
> On 06/04/2014 at 23:20:18 +0100, Russell King wrote :
> > Some PWM outputs are wired such that the LED they're controlling is
> > connected to supply rather than ground.  These PWMs may not support
> > output inversion, or when they do, disabling the PWM may set the
> > PWM output low, causing a "brightness" value of zero to turn the LED
> > fully on.
> >=20
> > The platform data for this driver already indicates that this was
> > thought about, and we have the "active_low" property there already.
> > However, the implementation for this is missing.
> >=20
> > Add the trivial implementation for this feature.
> >=20
> > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > ---
> >  drivers/leds/leds-pwm.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > index e1b4c23a409a..1d47742c551f 100644
> > --- a/drivers/leds/leds-pwm.c
> > +++ b/drivers/leds/leds-pwm.c
> > @@ -70,6 +70,10 @@ static void led_pwm_set(struct led_classdev *led_cde=
v,
> > =20
> >  	duty *=3D brightness;
> >  	do_div(duty, max);
> > +
> > +	if (led_dat->active_low)
> > +		duty =3D led_dat->period - duty;
> > +
> >  	led_dat->duty =3D duty;
> > =20
>=20
> This will conflict with my patch (which is still lacking proper review)
> there:
> http://thread.gmane.org/gmane.linux.leds/482
>=20
> I would say that it is better to hide the polarity inversion in the PWM
> driver for your specific PWM. Else we will end up with all the drivers
> using PWMs trying to detect whether the PWM supports inversion and if it
> is not the case, calculating the inverted duty cycle.

If the PWM hardware really does support inversion of the polarity, then
by all means that's what you should be using. However, and I've said
this a few times already, polarity inversion is not the same as
reversing the duty-cycle. The *effect* will be the same for LEDs and
backlights, but the signal is not in fact inverted.

There were at my latest count exactly two drivers who used PWM devices,
so the extent is somewhat limited. But if you're concerned about code
duplication, then perhaps a helper can be created that checks whether or
not a PWM channel's signal can be inverted and otherwise reverses the
duty-cycle. That can then be used for the special case where only the
effect of the PWM signal matters rather than the signal's inversion.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTQoeLAAoJEN0jrNd/PrOh+EsQAJZxEkr38+Z/iJgGmHyclZlG
28DN+tJwhCaYBz0mIZesPj/6l0Zu7FVkLPSP+BoOdIcCixu5o2bRjt6RmAtXMZMD
AlShOX5+LPvULZwaXQp0mWYBqnTID0bKrEhPOSFbaXQZEe1+RaAssj+oVPQGLaFv
z5piSPrb/c87R2/jhR08dZlLDsqSfYfrHSY95UJU3xmcqWYzs/kgTNCXM4/ga39K
H2vLlYHyQOa0vHB5NpWG8heRN5qbzA8v1ascIgDZ9Fm4RJR7MUxSu7ZKfHybn+/H
6Kn0IhrNRdp51A4wS6q23PAzr7+UN7Flf9UuTDtRp2sXoQxS1kleiEOD036rK9i2
AN51vNmVc4q+ju4oeFP93kPCaUroBxxVV0G4DJXlJEc8Jldxwylg0rIa5W+ARKCJ
zOMFx02DRIQtthj3911ZCxFJOa7NBA29tSwgZJKhMga+Wi56wA+PhxbOlpQ7S+6l
41Qim04bvHejYMso4/TSSMggkePe5t4T5QGsnzj0E5dc8fZ5nIXq7iDI3nc/jIhC
AcBlgQ0GUHV7XtGt7718MeD6F6fiQ1ri0RrKeBvmUo999sUvI75CoYjjg6bUNZAl
OVM21R8Cuj2sJQVI3vW5xEEoHZZOFPvBwWvXWwoP/NR/GGWI+BnuzR5EKCdYvkPZ
MIht+InipRLvHKDyWzOp
=+WTa
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
