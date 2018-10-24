From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 2/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Wed, 24 Oct 2018 11:04:21 +0200
Message-ID: <20181024090421.GB24997@amd>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181023170623.31820-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The LM3697 is a single function LED driver. The single function LED
> driver needs to reside in the LED directory as a dedicated LED driver
> and not as a MFD device.  The device does have common brightness and ramp

So it is single function LED driver. That does not mean it can not
share bindings with the rest. Where the bindings live is not imporant.

> reside in the Documentation/devicetree/bindings/leds directory and follow=
 the
> current LED and general bindings guidelines.

What you forgot to tell us in the changelog:

> +Optional child properties:
> +	- runtime-ramp-up-msec: Current ramping from one brightness level to
> +				the a higher brightness level.
> +				Range from 2048 us - 117.44 s

The other binding uses "ramp-up-msec". Tell us why you are changing this, or
better don't change things needlessly.

We don't want to be using "runtime-ramp-up-msec" for one device and
"ramp-up-msec" for the other.

I'm not sure what other changes you did, and changelog does not tell
me.

> --- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> @@ -9,7 +9,6 @@ TI LMU driver supports lighting devices below.
>    LM3632       Backlight and regulator
>    LM3633       Backlight, LED and fault monitor
>    LM3695       Backlight
> -  LM3697       Backlight and fault monitor
> =20
>  Required properties:
>    - compatible: Should be one of:

NAK. You can use existing binding.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvQNZUACgkQMOfwapXb+vLFrQCePprM1e0VfDEX433UAglIWdwL
N9wAn1JtNbW8lF43Y5o8u6F4uxfI7yfy
=JVUJ
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
