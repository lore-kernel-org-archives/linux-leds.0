From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: pca955x: add GPIO support
Date: Mon, 22 May 2017 21:53:36 +0200
Message-ID: <20170522195336.GA15681@amd>
References: <1494311772-21872-1-git-send-email-clg@kaod.org>
 <20170513112601.GA21785@amd>
 <b1834a28-f094-0c46-4ac1-7830575701c7@kaod.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33065 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761955AbdEVTx5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 May 2017 15:53:57 -0400
Content-Disposition: inline
In-Reply-To: <b1834a28-f094-0c46-4ac1-7830575701c7@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On Tue 2017-05-09 08:36:12, C=E9dric Le Goater wrote:
> >> The PCA955x family of chips are I2C LED blinkers whose pins not used
> >> to control LEDs can be used as general purpose I/Os (GPIOs).
> >>
> >> The following adds support for device tree and Open Firmware to be
> >> able do define different operation modes for each pin. See bindings
> >> documentation for more details. The pca955x driver is then extended
> >> with a gpio_chip when pins are operating in GPIO mode.
> >=20
> > Actually.. maybe better solution would be to turn this into GPIO
> > driver, and then use gpio-leds on top...?
>=20
> yes probably. We could introduce a new driver for the PCA955[0-3]
> when all pins are in GPIO mode. I have taken the approach of the=20
> leds-pca9532 which behaves quite similarly.

Does the GPIO mode differ electrically?

> > What is the difference between pin in GPIO mode and pin in LED mode?
>=20
> Well, first of all the PCA955[0-3] are LED blinkers chips, and not=20
> GPIO chips. So you have an extra couple registers to set the frequency=20
> and the pwm.

Well.. PWM is used all over the place, not only for LEDs.

> As for the pins in GPIO mode, here is what the specs says :=20
>=20
> - For input, set LEDn to high-impedance (01) and then read the pin=20
>   state via the input register.
>=20
> - For output, LED output pin is HIGH when the output is programmed=20
>   as high-impedance, and LOW when the output is programmed LOW through=20
>   the LS register. The output can also be pulse-width controlled when=20
>   PWM0 or PWM1 are used.
>=20
> So for output, GPIO control is quite similar to LED control. For input,
> the INPUTx registers need to be read.

Ok, makes sense. So you have GPIO pins with PWM support. (And some
kind of blinking? Blinking sounds like a low frequency PWM to me :-).

Can you take a look at drivers/pwm?

Thanks,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkjQcAACgkQMOfwapXb+vK/jACgu/OQqK/ZjcOJ84NhUxaVuKCh
PKUAn0+5MR/MkKfSS2BafCRkbxREPgZl
=nwxF
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
