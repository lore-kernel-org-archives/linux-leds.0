From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 00/16] Common Dell SMBIOS API
Date: Mon, 8 Feb 2016 22:04:32 +0100
Message-ID: <201602082204.32958@pali>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl> <20160208192920.GA10110@kroah.com> <20160208204646.GQ1779@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5623993.q72nXXMmEq";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20160208204646.GQ1779@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

--nextPart5623993.q72nXXMmEq
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 08 February 2016 21:46:46 Darren Hart wrote:
> Pali, are you happy enough with this to add your reviewed-by?

There was dicussion about dell-smbios API which you probably missed in
tons of other emails. It has subject:

"[PATCH 01/14] dell-laptop: extract SMBIOS-related code to a separate modul=
e"

And you can find it in archive at:
http://www.spinics.net/lists/linux-leds/msg05379.html

I wanted to hear your opinion about this API and I'm not 100% fine with
it but on other side it is not easy to design better... Maybe you could
have better idea.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5623993.q72nXXMmEq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAla5AuAACgkQi/DJPQPkQ1LzHACdFEHdbVl4mz4h4ZnDbCBykjHr
OYYAoJOylyg73vcTTlDAT6v2yHcG06j0
=pZGG
-----END PGP SIGNATURE-----

--nextPart5623993.q72nXXMmEq--
