From: Evan McClain <aeroevan@gmail.com>
Subject: Re: [PATCH] platform/chrome: Add Chrome OS keyboard backlight LEDs
 support
Date: Sat, 05 Mar 2016 11:44:06 -0500
Message-ID: <1457196246.2647.2.camel@gmail.com>
References: <20160305012309.GA30176@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-WfbXZfc17cdJoy1XjsNf"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:36729 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702AbcCEQoS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 5 Mar 2016 11:44:18 -0500
In-Reply-To: <20160305012309.GA30176@dtor-ws>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Olof Johansson <olof@lixom.net>
Cc: Rhard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Duncan Laurie <dlaurie@chromium.org>, Simon Que <sque@chromium.org>, Bryan Wu <cooloney@gmail.com>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org


--=-WfbXZfc17cdJoy1XjsNf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-03-04 at 17:23 -0800, Dmitry Torokhov wrote:
> This is a driver for ACPI-based keyboard backlight LEDs found on
> Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
> backlight as "chromeos::kbd_backlight" LED class device in sysfs.
>=20
> Signed-off-by: Simon Que <sque@chromium.org>
> Signed-off-by: Duncan Laurie <dlaurie@chromium.org>
> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
> ---
>=20
> Changes form previous submission:
>=20
> - moved from drivers/leds to drivers/platform/chrome
> - added method to retrieve brightness from ACPI
> - renamed to cros_kbd_led_backlight
> - config option renamed to CROS_KBD_LED_BACKLIGHT
> - no longer setting initial brightness to max brightness (although on
> =C2=A0 Pixel 1 - Link - ACPI initially reports 100 as brightness anyway)
>=20
> I ran this on Pixel 1; Evan, could you give it a spin on your Pixel
> 2?

Works fine here.

Thanks
--=20
Evan McClain
https://keybase.io/aeroevan

--=-WfbXZfc17cdJoy1XjsNf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJW2wzXAAoJEPQx78gG1JMfUIwH/R6fQlSxquIWyjiRMV0uodAF
qY8AVszlfI97CoqZPNMSRnm8rjxD1fL5IYXeJsLrId+JH6K9jIpA7JfGTMYwHSpm
ZNAewIm6TBN4yJ1WbqaMaJYrKPqS6Po0QNY2fr4s6ssZUkfgJQA8BulEHiRgvEAt
IEOwnLz3Va9IobBz8g9yCOyR0SH1R8GielVqBZFrRLBRtSvz4BAw5Ekxjmn+XNFO
FqhwVypa8u7Dk4+NPnAgwHEC4Milft0BEuddNuyquooP7P9GqAMzgBhPYTpWRXJU
MqB2JbIAPm+gDc2/1LMUdXqkIaFxkISX6RE8VGmXuMUWd1NkhQdMvzsiKDjFbgY=
=VQzn
-----END PGP SIGNATURE-----

--=-WfbXZfc17cdJoy1XjsNf--
