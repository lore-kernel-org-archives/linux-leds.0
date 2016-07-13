From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Wed, 13 Jul 2016 16:20:48 +0300
Message-ID: <87lh15isi7.fsf@linux.intel.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com> <1468413734-9569-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:55786 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751037AbcGMNWV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 13 Jul 2016 09:22:21 -0400
In-Reply-To: <1468413734-9569-1-git-send-email-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:
> Hi again,
>
> This is my second try of getting HCD providers into usb subsystem.
>
> During discussion of V1 I realized there are about 26 drivers adding a
> single HCD and all of them would need to be modified. So instead I
> decided to put relevant code in usb_add_hcd. It checks if the HCD we
> register is a primary one and if so, it registers a proper provider.
>
> Please note that of_hcd_xlate_simple was also extended to allow getting
> shared HCD (which is used e.g. in case of XHCI).
>
> So now you can have something like:
>
> ohci: ohci@21000 {
> 	#usb-cells =3D <0>;
> 	compatible =3D "generic-ohci";
> 	reg =3D <0x00001000 0x1000>;
> 	interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> };
>
> ehci: ehci@22000 {
> 	#usb-cells =3D <0>;
> 	compatible =3D "generic-ehci";
> 	reg =3D <0x00002000 0x1000>;
> 	interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> };
>
> xhci: xhci@23000 {
> 	#usb-cells =3D <1>;
> 	compatible =3D "generic-xhci";
> 	reg =3D <0x00003000 0x1000>;
> 	interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> };
>
> The last (second) patch is not supposed to be applied, it's used only as
> a proof and example of how providers can be used.

nowhere here (or in previous patch) you clarify why exactly you need
this. What is your LED trigger supposed to do? Why can't it handle ports
changing number in different boots? Why do we need this at all? Why is
your code DT-specific?

There are still too many 'unknowns' here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhkAwAAoJEIaOsuA1yqREgfUQAJm9E1DG1W9AaaospLHfMGTL
d64cZOYdJqo6btLEdzUb0apnMWDNgflM93pgA9+6WpET+zJKyfQ5ldI+C4jcYSva
Q6bQWDnd5FlpEYZSe5kjfK50RhMyG0LHu7WqHD44ZJNE2Mn58UK2dEmbwteFYgYu
VnwijGL7g5mNaAWEfrTlDO1TQFikY/lggEM414e6acWGwkNIjF01ER8UWgYgvV6o
WRGZVVgFXBbvJ1iao923GpwMJRK67grLw8dUCoI9Yl1AtYslOu8+kLOcW3JMQP+x
UCBPR3WTfV1QuJh4hZa6QMXWIW4Xi9QcjY8uOa89tE8erXVrd5qfAoD3+D+i5+0Z
PYAMEMe8NHnvpnvcqV2Ej1cdLc8o1kaH7TZamFd4Uzs27Oc5KpQGq+mEMXV6rDLu
1Cix/BCyE/TWlgvajl79X3+OZV6zSIKD3/7jHgAb6sqv0XFvf1aIS3Hb2Z03rmwE
CuaKdAepZMGix+YxpPpayTNbskfVpyGH6BQxb0+wXbYpdXlP+QAa6xUP93/6vuYn
rx88fG6IWCMaMX7z3r3j4Kmy8GLvOanJByvTy2qZfyjKOb1Icao0QKktASKNZYiG
xifWaGJLY/tjlVJsFoIt8lCv2IO3mdk8dzHQQyJ/LH/yZAm+EGJuAvirt3CPl8Tl
1uyN5bMCi5OZieOha2Wd
=PAxZ
-----END PGP SIGNATURE-----
--=-=-=--
