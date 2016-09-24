From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/3] leds: Introduce userspace leds driver
Date: Sat, 24 Sep 2016 14:06:03 +0200
Message-ID: <20160924120603.GC8696@amd>
References: <1474053410-24387-1-git-send-email-david@lechnology.com>
 <1474053410-24387-2-git-send-email-david@lechnology.com>
 <CACRpkdZH4aJxbbPOnmvCapPaw78+Wtu8pjpC=oWGJpAvmO+WVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42605 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750726AbcIXMGG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Sep 2016 08:06:06 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZH4aJxbbPOnmvCapPaw78+Wtu8pjpC=oWGJpAvmO+WVw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2016-09-22 15:43:35, Linus Walleij wrote:
> On Fri, Sep 16, 2016 at 9:16 PM, David Lechner <david@lechnology.com> wro=
te:
>=20
> > This driver creates a userspace leds driver similar to uinput.
>=20
> Just out of curiosity: what is this used for?
> The typical usecase evades me, so I'd really want to know.

I have RGB led connected using ESP board over ttyUSB0. I guess I'll
want to keep the driver in userspace, but I still may want "normal"
/sys/class/leds interface for it.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfmbCsACgkQMOfwapXb+vKSoQCgnbfhRE2qb73dEIGt5jXDbhfQ
VpkAoITHVy38oR+Q4T4JCtwZIHAtsRxS
=QC4+
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
