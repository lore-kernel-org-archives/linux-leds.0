From: Evan McClain <aeroevan@gmail.com>
Subject: Re: [PATCH] leds: Add driver for Chrome OS keyboard LEDs
Date: Sat, 09 Jan 2016 14:38:25 -0500
Message-ID: <1452368305.17442.7.camel@gmail.com>
References: <1452282543-10884-1-git-send-email-sque@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YbajYL0DtyLQSQKLGoRg"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:34798 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755194AbcAITih (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 9 Jan 2016 14:38:37 -0500
Received: by mail-qg0-f43.google.com with SMTP id 6so298202229qgy.1
        for <linux-leds@vger.kernel.org>; Sat, 09 Jan 2016 11:38:37 -0800 (PST)
In-Reply-To: <1452282543-10884-1-git-send-email-sque@chromium.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Que <sque@chromium.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Sameer Nanda <snanda@chromium.org>, Todd Broch <tbroch@chromium.org>, Duncan Laurie <dlaurie@chromium.org>


--=-YbajYL0DtyLQSQKLGoRg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-01-08 at 11:49 -0800, Simon Que wrote:
> Some Chrome OS devices use ACPI-based keyboard backlight LEDs.
>=20
> Signed-off-by: Simon Que <sque@chromium.org>
> ---
> =C2=A0drivers/leds/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A07 +++
> =C2=A0drivers/leds/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=
=A01 +
> =C2=A0drivers/leds/leds-chromeos-keyboard.c | 115
> ++++++++++++++++++++++++++++++++++
> =C2=A03 files changed, 123 insertions(+)
> =C2=A0create mode 100644 drivers/leds/leds-chromeos-keyboard.c
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 72156c1..4b64e80 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -5,6 +5,13 @@ config LEDS_GPIO_REGISTER
> =C2=A0	=C2=A0=C2=A0As this function is used by arch code it must not be
> compiled as a
> =C2=A0	=C2=A0=C2=A0module.
> =C2=A0
> +config LEDS_CHROMEOS_KEYBOARD
> +	tristate "LED support for Chrome OS keyboards"
> +	depends on LEDS_CLASS && ACPI
> +	help
> +	=C2=A0=C2=A0This option enables support for the LEDs on Chrome OS
> keyboards.
> +	=C2=A0=C2=A0Say Y to enable keyboard LEDs on Chrome OS systems.
> +
> =C2=A0menuconfig NEW_LEDS
> =C2=A0	bool "LED Support"
> =C2=A0	help

This config option should be in the NEW_LEDS menu.

And it probably shouldn't get merged until:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/85142
c8507ec367b2283ad2398aa7fc6d8ec1765
is also submitted.

Thanks
--=20
Evan McClain
https://keybase.io/aeroevan

--=-YbajYL0DtyLQSQKLGoRg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWkWGxAAoJEPQx78gG1JMfdSIH/3MmpU+JCdCLTSJozgUKBKmj
u09TgB3fPotBVr/bdbCyBgrSkog3DCWrY3xZ6tJeBT7NTA4OlLL9fQ25PHBu5HER
HKx2TGTiCwxpweB2N+JCWRMqLCWxBBJKO6nC6Ve76lWfoHue/1UHh+LyrsjLfe+v
iZhMnYlS9UM9vCOQ5Iwkv9V1BV15X6uhShIb9zgwSlRbJ+I4i0DP5Dlxv779qDf3
UMSmK9oI0b7df7r60m2OmqAxJAHIYw4vuKUOumADf/Riq7QUMrt0xdAfG7PTF70t
OFxDbYx60a7eq1g+2lVk2eoQtBdX8x6c8eexuKdCHewU+UdRdULbyVrO9nDADSc=
=w6aP
-----END PGP SIGNATURE-----

--=-YbajYL0DtyLQSQKLGoRg--
