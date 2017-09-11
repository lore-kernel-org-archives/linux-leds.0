From: Pavel Machek <pavel@ucw.cz>
Subject: Re: PC Engines APU/APU2 led driver
Date: Mon, 11 Sep 2017 08:15:14 +0200
Message-ID: <20170911061514.GA25933@amd>
References: <1c59aa68-cc27-c577-312a-14f58b62dd89@mizrahi.com.ve>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42808 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbdIKGPP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Sep 2017 02:15:15 -0400
Content-Disposition: inline
In-Reply-To: <1c59aa68-cc27-c577-312a-14f58b62dd89@mizrahi.com.ve>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Mizrahi <alan@mizrahi.com.ve>
Cc: linux-leds@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> static int __init apu_led_init(void)
> {
> 	struct platform_device *pdev;
> 	int err;
>=20
> 	if (!dmi_match(DMI_SYS_VENDOR, "PC Engines")) {
> 		pr_err("No PC Engines board detected\n");
> 		return -ENODEV;
> 	}
> 	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, =
"APU2"))) {
> 		printk(KERN_ERR "Unknown PC Engines board: %s\n", dmi_get_system_info(D=
MI_PRODUCT_NAME));
> 		return -ENODEV;
> 	}
>=20
> 	pdev =3D platform_device_register_simple(KBUILD_MODNAME, -1, NULL, 0);
> 	if (IS_ERR(pdev)) {
> 		pr_err("Device allocation failed\n");
> 		return PTR_ERR(pdev);
> 	}
>=20
> 	err =3D platform_driver_probe(&apu_led_driver, apu_led_probe);
> 	if (err) {
> 		pr_err("Probe platform driver failed\n");
> 		platform_device_unregister(pdev);
> 	}
>=20
> 	return err;
> }
>=20
> static void __exit apu_led_exit(void)
> {
> 	platform_device_unregister(apu_led->pdev);
> 	platform_driver_unregister(&apu_led_driver);
> }

Normally, I'd expect _exit() to be 'reverse' of _init(). That is I'd
expect reverese order there.
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm2KfIACgkQMOfwapXb+vJBggCcDgM2HLQnjo6H+uCHGlLmhK/U
itsAn2PFEHTUvUerTf7vzErTEYJDwM+t
=ipS/
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
