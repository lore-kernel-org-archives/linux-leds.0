From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 4/7] dell-led: remove dell_app_wmi_led_set()
Date: Sun, 11 Dec 2016 11:40:48 +0100
Message-ID: <201612111140.48561@pali>
References: <20161208123618.28603-1-kernel@kempniu.pl> <20161208123618.28603-5-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1602740.PkY1h6fYxb";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161208123618.28603-5-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

--nextPart1602740.PkY1h6fYxb
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 08 December 2016 13:36:15 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> All calls to dell_app_wmi_led_set() have been replaced with direct
> calls to dell_micmute_led_set(), so the former can be safely removed
> along with its related enum.
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

I would suggest to squash patches 2,3,4 into one. But I let decision to=20
alsa & led maintainers.

Anyway, for patches 2,3,4 you can add my Reviewed-by. It is nice cleanup

Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1602740.PkY1h6fYxb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlhNLTAACgkQi/DJPQPkQ1J9bQCgyrQNkicgARy9qKNUBq5FJUEo
4P8AoJkt3Ac2L7jX01GynYhSJs8aZ2Yq
=wEyD
-----END PGP SIGNATURE-----

--nextPart1602740.PkY1h6fYxb--
