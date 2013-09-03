From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] MIPS: sead3: Select NEW_LEDS, LEDS_CLASS and I2C symbols
Date: Tue, 3 Sep 2013 16:55:10 +0100
Message-ID: <20130903155510.GA3156@katana>
References: <1378218420-28011-1-git-send-email-markos.chandras@imgtec.com>
 <20130903145839.GA14258@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:58153 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755295Ab3ICPzO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 3 Sep 2013 11:55:14 -0400
Content-Disposition: inline
In-Reply-To: <20130903145839.GA14258@linux-mips.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>, linux-i2c@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-mips@linux-mips.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2013 at 04:58:39PM +0200, Ralf Baechle wrote:
> On Tue, Sep 03, 2013 at 03:27:00PM +0100, Markos Chandras wrote:
>=20
> > Select NEW_LEDS and LEDS_CLASS since they export symbols
> > needed by leds-sead3.c. Fixes the following build problem:
> >=20
> > leds-sead3.c:(.text+0xf0c): undefined
> > reference to `led_classdev_unregister'
> > leds-sead3.c:(.text+0xf18): undefined
> > reference to `led_classdev_unregister'
> >=20
> > Also select I2C since it's needed by sead3-pic32-i2c-drv.c
> > Fixes the following build problem:
> > arch/mips/mti-sead3/sead3-pic32-i2c-drv.c:350:2: error:
> > implicit declaration of
> > function 'i2c_add_numbered_adapter'
>=20
> You probably should setup a bus like all the other callers of
> i2c_add_numbered_adapter() in drivers/i2c/busses/; similar for the LED
> issue.

The I2C driver should really be in the i2c realm AFAICS. Also, it needs
a few cleanups.


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSJgZeAAoJEBQN5MwUoCm2GrQP/iKDGX1BbrUcNll7RrG9Dehb
RuyOeyyhLy1WT9umB0O8u47tfzJH9WHfZEabR8A5o1lKWfZ0/kYQ01g5oKAdz6+T
eo3V2gV5TIvvnQyvGiegDE5mTavs7/jKbTAF55Gr8XoBoeNyg5X7uLIm2cOdsL/e
VwJpp2CStWL1nfdhou80ZA3odgQ9kkTMfQEWRm9mB1PPvEtLh+dyl9c4fRf+D4VH
j80fcXWnNkTYN056aQ2xhzdf8Cc8HjYKCD/J49iLPVnXnphQvpqVy8wkmNgUfjxz
LvLBqbtyqhcH5iTbJHb0qBtiPw9ear/ybD2B5cYyYQMnVJKbBZp0qli5OPL8Y+09
6VBITDTcvZ0Z0ucVozg4QXdoP5JSST1lKdso9f4KnoMIN7+4rMlIVQ41vIGSjw3N
nQ0uhrgfBlWwM5tV2FxOoypByKJRzaV9WhyqAmbi6K3xYmNxKjIIN3+vP+P6QBcc
1z1IseP3A5IXZMoKc9y0YKmju5L/xc6dwiQ+iJLsVQLn0gWnwDqoC/ed0ZjUdoe3
zPC37NAY25dqC6lz1L9myYw8TZHA0UT93Rdpgcb67LMMf5FS3xF7YCSBxpjmFTvq
OvJlwfCE4vkeklHoLlAVZQimhzPS2o+Foje2KdWjJCAlO3TiDlDaWMUpUje6GPVR
i3Dd4Dppgbfdoypg+7Bc
=mCKM
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
