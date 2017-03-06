From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: cpcap: new driver
Date: Mon, 6 Mar 2017 23:11:47 +0100
Message-ID: <20170306221147.GA24272@amd>
References: <20170305172234.24120-1-sre@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33291 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754107AbdCFWll (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Mar 2017 17:41:41 -0500
Content-Disposition: inline
In-Reply-To: <20170305172234.24120-1-sre@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Motorola CPCAP is a PMIC found in multiple smartphones.
> This driver adds support for the chip's LED controllers.
> It has explicit support for all controllers used by the
> Droid 4. Since no datasheets are available the other
> available controllers are not supported until somebody
> verified, that the register layout matches.

This of course leads me to two questions:

1) Where can I get Droid 4?

2) How well is it supported?

> index 000000000000..d523f8c3c358
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cpcap-leds.txt
> @@ -0,0 +1,29 @@
> +Motorola CPCAP PMIC LEDs
> +------------------------
> +
> +This module is part of the CPCAP. For more details about the whole
> +chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
> +
> +Requires node properties:
> +- compatible: should be one of
> +   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
> +   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
> +   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
> +   * "motorola,cpcap-led-red"		(Red Triode)
> +   * "motorola,cpcap-led-green"		(Green Triode)
> +   * "motorola,cpcap-led-blue"		(Blue Triode)
> +   * "motorola,cpcap-led-cf"		(Camera Flash)
> +   * "motorola,cpcap-led-bt"		(Bluetooth)
> +   * "motorola,cpcap-led-cp"		(Camera Privacy LED)

BTW. Does the RGB controller support any kind of "patterns" similar to
what n900 can do?

> +&cpcap {
> +	cpcap_led_red: red-led {
> +		compatible =3D "motorola,cpcap-led-red";
> +		label =3D "cpcap:red";
> +		vdd-supply =3D <&sw5>;
> +	};
> +};

This should be copied to the device tree people.

> index 275f467956ee..043f02a4fe73 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -76,6 +76,15 @@ config LEDS_BCM6358
>  	  This option enables support for LEDs connected to the BCM6358
>  	  LED HW controller accessed via MMIO registers.
> =20
> +config LEDS_CPCAP
> +	tristate "LED Support for Motorola CPCAP"
> +	depends on LEDS_CLASS
> +	depends on MFD_CPCAP
> +	depends on OF
> +	help
> +	  This option enables support for LEDs offered by Motorola's
> +	  CPCAP PMIC.
> +

Umm. That help explains exactly what I oculd tell from the name. Can
you spell out "CPCAP" and "PMIC"... and maybe mention that it is used
on the Droid 4 phone?

> +#define DEBUG

Remove for production?

> +	err =3D device_property_read_string(&pdev->dev, "label", &led->led.name=
);
> +	if (err) {
> +		dev_err(led->dev, "Couldn't read led label: %d", err);

s/led/LED/.

> +	if (err) {
> +		dev_err(led->dev, "Couldn't register led: %d", err);
> +		return err;

And here.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAli93qMACgkQMOfwapXb+vKOTACeJaoGvHzFAzHBsklWc8IEAAvH
9dkAni90YTwvtJY9JUyH5frwWAJn5zUL
=CyAt
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
