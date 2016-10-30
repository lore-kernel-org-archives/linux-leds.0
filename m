From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: [PATCH v2] Add LED / GPIO support for the PC Engines APU2.
Date: Mon, 31 Oct 2016 00:43:49 +1100
Message-ID: <c522f9bd-e6e4-1932-30d9-b1cc579d3172@crc.id.au>
References: <e8fbcb33-bf50-9118-8943-c3f3d0833da3@crc.id.au>
 <a0b21db6-aa1b-bcda-ff33-94ce7b3a8c46@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oocV8MjSG11k8bXoMKaTD8ED4nCOE1P9f"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.crc.id.au ([203.56.246.92]:40666 "EHLO mail.crc.id.au"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756284AbcJ3NoD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 30 Oct 2016 09:44:03 -0400
In-Reply-To: <a0b21db6-aa1b-bcda-ff33-94ce7b3a8c46@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oocV8MjSG11k8bXoMKaTD8ED4nCOE1P9f
Content-Type: multipart/mixed; boundary="HB5b49C4NojLXrxK5bo16PIdXElVix58q";
 protected-headers="v1"
From: Steven Haigh <netwiz@crc.id.au>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Message-ID: <c522f9bd-e6e4-1932-30d9-b1cc579d3172@crc.id.au>
Subject: Re: [PATCH v2] Add LED / GPIO support for the PC Engines APU2.
References: <e8fbcb33-bf50-9118-8943-c3f3d0833da3@crc.id.au>
 <a0b21db6-aa1b-bcda-ff33-94ce7b3a8c46@gmail.com>
In-Reply-To: <a0b21db6-aa1b-bcda-ff33-94ce7b3a8c46@gmail.com>

--HB5b49C4NojLXrxK5bo16PIdXElVix58q
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback.

The difficult part here is that these are not my drivers, but are both
GPL - and I feel should be included upstream.

While I'm not a C coder, I may be able to do minor changes, but this was
my best effort of putting something together that does actually work -
but may benefit from the expertise of the associated lists to improve.

On 30/10/16 23:06, Jacek Anaszewski wrote:
> Hi Steven,
>=20
> Thanks for the patches. Few initial notes:
>=20
> - generally it is preferred to submit patches with "git send-email",
>   which simplifies review, as the remarks can be added directly in the
>   code, in a reply to the patch,
> - if you want do add some overall description of the patch set then you=

>   can add --cover-letter switch which will generate template for this
>   purpose.
> - please also use scripts/checkpatch.pl before submission
> - make sure that the patches are based on the master branch of
>   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git,
> - always add on CC the maintainers of the affected kernel subsystems -
>   this information can be found in the MAINTAINERS file
> - in case of LED drivers cc also linux-kernel@vger.kernel.org,
> - subscribe to the mailing list related to the subsystem the patches
>   are dedicated to, and skim through some recent patches and reviews -
>   it can allow for eliminating some common problems from your driver
>   and reducing the number of review iterations.
>=20
> Regarding the patches - gpio-nct5104d.c seems to be targeted for
> GPIO subsystem - you should add Linus Walleij and
> linux-gpio@vger.kernel.org on cc.

Correct, the nct5104 is required for the leds-apu2 module. They both
co-exist to address the LEDs on the PC Engines APU2 board. There are
requirements for the leds_gpio module on leds-apu2 as well - but I
couldn't figure out how to reference this.

> For leds-apu2.c - you shouldn't register gpio driver in the LED
> subsystem but add the relevant dependency in the Kconfig. Nonetheless
> I can't find gpio-apu2.c driver in the mainline kernel.
>=20
> You should also use devm_led_classdev_register() for registering LED
> class device. Please follow the design of the other LED class drivers
> using platform_device_register_simple() for probing.

You've gone above my head here :P

As mentioned, I was hoping it would be possible to get someone to pick
it up and run with it based on my initial throwing of things together.

If that's not possible, I can keep hunting for someone to clean things
up a little bit and try again at a later stage?

> Best regards,
> Jacek Anaszewski
>=20
> On 10/29/2016 06:38 PM, Steven Haigh wrote:
>> Patches attached.
>>
>> Changes:
>> * Updated leds_apu driver. Included an older version in my previous
>> email.
>> * Added required nct5104d GPIO driver support.
>>
>> These are all against 4.4.28 right now - but should probably apply
>> cleanly to any future builds with minimal (or nil) changes.
>>
>> Please include me in the reply as I'm not part of this list.
>>
>=20

--=20
Steven Haigh

Email: netwiz@crc.id.au
Web: https://www.crc.id.au
Phone: (03) 9001 6090 - 0412 935 897


--HB5b49C4NojLXrxK5bo16PIdXElVix58q--

--oocV8MjSG11k8bXoMKaTD8ED4nCOE1P9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYFfkZAAoJEEGvNdV6fTHcLsUP/AuA6Uwjj4rAcyN0iA23Labx
vJSYi0w3oHNUC0n7qY5viVL0y7AYVZiiGwRgAxEzlgHnEt9FsJ5cXax0Xzy9fWRH
Vbpt+1q6N+8Tr55GZBZf+LR7vMt+DUgett5sLn9+p/r06ABeDGcUVpIlRC95pC0E
4I6bCISZKT0h8gImBI7m1FNJfRD6JhZlwB/ajzq3F36lWXsxvMKAwXii7A5cBdWT
A4lqSZ+tkO/5t3Oycv04tCryZu/t3Du/E85gtJzZ3Yx9WbD+moThsxvJeu2RjAzZ
6PEjn3GunA1v/GAtlvVXA9avy1uWV47K/LI+wgLK7VG82p7F8rIFYpXip/hpeuIF
tzD6K7rmZXEq20MnzecAApcceysIzhSA6wloiyxJH5yCL+0YW2qq6QUOoH1/klCI
/6fsKHXvZ46OZkrqtS2qBTxVzDAni5ZA0jupbeNNfBz2B/WlaZzOi2sK0c6YimNr
grNDsfivdx4VHpD6DMmZyG/ac9vzaPHbRSeb0mNvUshx6mV2v8HsLwuyi0MLhLlb
ANSLq6SgkFDYyDF3h6P/iaSyqInlAy8M/GRUG+Q+QGMAd6A0bdHzinRc+wIXPvIG
i7ShPcAye8kQe4IsQvHb7mXJWLcCrKPT1eL6xsBTmrFqNpy5YOaPZF/cRk9zKhJi
+NPmu5pMUsrGv6413r1y
=7X5a
-----END PGP SIGNATURE-----

--oocV8MjSG11k8bXoMKaTD8ED4nCOE1P9f--
