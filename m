From: Evan McClain <aeroevan@gmail.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 04 Mar 2016 03:38:49 -0500
Message-ID: <1457080729.18482.6.camel@gmail.com>
References: <20160303234646.GA17641@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-v6S+nJZySwLTbgCHvndP"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35718 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751489AbcCDIi6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 03:38:58 -0500
In-Reply-To: <20160303234646.GA17641@dtor-ws>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Olof Johansson <olofj@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org


--=-v6S+nJZySwLTbgCHvndP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-03-03 at 15:46 -0800, Dmitry Torokhov wrote:
> From: Simon Que <sque@chromium.org>
>=20
> This is a driver for ACPI-based keyboard backlight LEDs found on
> Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
> backlight as "chromeos::kbd_backlight" LED class device in sysfs.

Was it ever decided where this driver should live? I was planning on
submitting to platform/chrome since most keyboard backlights seem to
live over there but I don't think I got a response.

--=20
Evan McClain
https://keybase.io/aeroevan

--=-v6S+nJZySwLTbgCHvndP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJW2UmaAAoJEPQx78gG1JMfqioH/j6/1i6zEmoWw7c5e+MOad1k
Dm9EJNNcsxwazUF+WOyS5D7jU/afmMulhzK/WEGzmaQbp0uUkaEz/MxBH8c1liv8
zOj/yZKIov87vh4azrmXezWedu22OUUyTBKGUzrcSWUkFSNNKPz4DdfNASlCFclP
QLQHz5dCxNIm+04ku7t1IcCBw4BzawX8fPUeRxikaN7fOXnsN39DnMEclOTvoiz9
TR8DEYQ06phYNFjZPv/Bh0gv9E/NoEtO1eRL14EzcUjEbJOhNRMHCiF7a2e9ER4c
kfceKaJIxPhCnEOJd6ZIWA+RF7gWOeRF3h8q+cYrxl/sjUKNKTRATAWDG3gMwHY=
=bk9N
-----END PGP SIGNATURE-----

--=-v6S+nJZySwLTbgCHvndP--
