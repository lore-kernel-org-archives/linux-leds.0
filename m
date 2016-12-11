From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/7] ALSA: hda - use dell_micmute_led_set() instead of dell_app_wmi_led_set()
Date: Sun, 11 Dec 2016 11:40:37 +0100
Message-ID: <201612111140.38170@pali>
References: <20161208123618.28603-1-kernel@kempniu.pl> <20161208123618.28603-4-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2957448.cosGxbBbF3";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36171 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751252AbcLKKkm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 11 Dec 2016 05:40:42 -0500
In-Reply-To: <20161208123618.28603-4-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

--nextPart2957448.cosGxbBbF3
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 08 December 2016 13:36:14 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> --- a/sound/pci/hda/dell_wmi_helper.c
> +++ b/sound/pci/hda/dell_wmi_helper.c
> @@ -6,7 +6,7 @@
>  #include <linux/dell-led.h>
>=20
>  static int dell_led_value;
> -static int (*dell_led_set_func)(int, int);
> +static int (*dell_led_set_func)(int);

Suggestion: what about changing name to dell_micmute_led_set_func to=20
match real function name which is used after this patch?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2957448.cosGxbBbF3
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlhNLSYACgkQi/DJPQPkQ1KbUQCdFi4NvEP87H0DJOMxcqVlvaGS
XiAAoK+La+iYpov4gBUU+JZxtmDQ1ejm
=FY7Q
-----END PGP SIGNATURE-----

--nextPart2957448.cosGxbBbF3--
