From: Evan McClain <aeroevan@gmail.com>
Subject: Chromebook Keyboard LEDs
Date: Sat, 02 Jan 2016 16:54:02 -0500
Message-ID: <1451771642.25561.10.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-69MFzTTBHMbzPtZeX4JX"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:36224 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751937AbcABVyL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 2 Jan 2016 16:54:11 -0500
Received: by mail-qg0-f43.google.com with SMTP id e32so141142762qgf.3
        for <linux-leds@vger.kernel.org>; Sat, 02 Jan 2016 13:54:10 -0800 (PST)
Received: from pixel.fios-router.home (pool-96-231-213-81.washdc.fios.verizon.net. [96.231.213.81])
        by smtp.gmail.com with ESMTPSA id b95sm24098893qge.47.2016.01.02.13.54.07
        for <linux-leds@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Jan 2016 13:54:08 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org


--=-69MFzTTBHMbzPtZeX4JX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi list,

I'm not sure how kosher it is to submit changes that I didn't author
(cherry-picks from the chromium kernel), but since these patches are a
few years old and having support in the mainline kernel would be nice I
thought I'd give it a shot.

I have tested on my Chromebook Pixel 2 (samus) which runs fine but is
missing a few drivers (this and ASoC, but ASoC isn't as easy).


The following changes since commit
376886d44f4cba72c4942aa1ac834ba00f6f222d:

=C2=A0 leds: bcm6358: remove unneeded busy status check (2015-12-17 09:39:0=
2
+0100)

are available in the git repository at:

=C2=A0 https://github.com/aeroevan/linux.git for-leds

for you to fetch changes up to
589e241e11fa01a5fef59b40c9ad826e11322e4f:

=C2=A0 leds-chromeos-keyboard: Add ACPI _HID probing (2016-01-01 02:04:09
-0500)

----------------------------------------------------------------
Duncan Laurie (1):
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leds-chromeos-keyboard: Add ACPI _HID p=
robing

Simon Que (3):
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leds: Add Chrome OS keyboard LEDs drive=
r
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leds: chromeos keyboard name should con=
tain "kbd_backlight"
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leds: Fix chromeos keyboard LED suspend=
 behavior

=C2=A0drivers/leds/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=
=C2=A07 ++
=C2=A0drivers/leds/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 =
+
=C2=A0drivers/leds/leds-chromeos-keyboard.c | 127
++++++++++++++++++++++++++++++++++
=C2=A03 files changed, 135 insertions(+)
=C2=A0create mode 100644 drivers/leds/leds-chromeos-keyboard.c

Thanks
--=20
Evan McClain
https://keybase.io/aeroevan

--=-69MFzTTBHMbzPtZeX4JX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWiEb7AAoJEPQx78gG1JMf2ngH/2L308kNSma5ManD3hoY2ACI
Zq+M9u3z/TGxj+4UFDRud+0Bp0XR2fo1ssPS9ZxRIbP7SmWEPnygbvXww7c/PxGW
81AHkhMACxI2iaueLbXMgffRQiTPu9IKenTBv2R6U0PaWUwycOAJ+FiLGKw4C6GQ
mjna9cl87qE050NxA9k1d2ZVA6P1GnozNzOrlkf1hYTtl1oT8LQcg80l0T88EN1f
L+jfo4uWtxmbDRB3uBF0f/ZpbH1K4WxUZDm0nMMRqrfqXJ/gjeqePNxQ7va9Q1F3
c0hM0ntI8M1KQZgf7lx4vUzv8zq5DJAjIDE230rvYUXNkjqsr6b62wUI5rK965Y=
=/HUS
-----END PGP SIGNATURE-----

--=-69MFzTTBHMbzPtZeX4JX--
