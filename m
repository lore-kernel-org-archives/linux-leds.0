From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Sat, 12 Aug 2017 14:34:02 +0300
Message-ID: <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gFIf6FP2ngbfoSNjQKBaHgEvEOHtT5bUh"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:42236 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750973AbdHLLeI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 12 Aug 2017 07:34:08 -0400
In-Reply-To: <20170812105620.GA23543@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gFIf6FP2ngbfoSNjQKBaHgEvEOHtT5bUh
Content-Type: multipart/mixed; boundary="BJwDVWgsqf9B4ukSJde5hUkP6hVFSetm6";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Message-ID: <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
In-Reply-To: <20170812105620.GA23543@amd>

--BJwDVWgsqf9B4ukSJde5hUkP6hVFSetm6
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 12.08.17 13:56, Pavel Machek wrote:
> Hi!
>=20
>>> On Sat 2017-08-12 12:09:35, Oleh Kravchenko wrote:
>>>> This patch adds a LED class driver for the RGB LEDs found on
>>>> the Crane Merchandising System CR0014114 LEDs board.
>>>
>>> What kind of hardware is this?=20
>>
>> It's from vending machines produced by Crane Merchandising System http=
://cranems.com/
>> =20
>>>> Driver creates LED devices with name written using the following
>>>> pattern "LABEL-{N}:{red,green,blue}:".
>>>
>>> Is the "-{N} suffix needed?
>>
>> It's number of RGB LED, board has 6 LEDs.
>=20
> Normally label differentiates them...?

For example, possible names when two boards connected is:
/sys/class/leds/board0-0:blue:
/sys/class/leds/board0-0:green:
/sys/class/leds/board0-0:red:
/sys/class/leds/board0-1:blue:
/sys/class/leds/board0-1:green:
/sys/class/leds/board0-1:red:
/sys/class/leds/board0-2:blue:
/sys/class/leds/board0-2:green:
/sys/class/leds/board0-2:red:
/sys/class/leds/board0-3:blue:
/sys/class/leds/board0-3:green:
/sys/class/leds/board0-3:red:
/sys/class/leds/board0-4:blue:
/sys/class/leds/board0-4:green:
/sys/class/leds/board0-4:red:
/sys/class/leds/board0-5:blue:
/sys/class/leds/board0-5:green:
/sys/class/leds/board0-5:red:

/sys/class/leds/board1-0:blue:
/sys/class/leds/board1-0:green:
/sys/class/leds/board1-0:red:
/sys/class/leds/board1-1:blue:
/sys/class/leds/board1-1:green:
/sys/class/leds/board1-1:red:
/sys/class/leds/board1-2:blue:
/sys/class/leds/board1-2:green:
/sys/class/leds/board1-2:red:
/sys/class/leds/board1-3:blue:
/sys/class/leds/board1-3:green:
/sys/class/leds/board1-3:red:
/sys/class/leds/board1-4:blue:
/sys/class/leds/board1-4:green:
/sys/class/leds/board1-4:red:
/sys/class/leds/board1-5:blue:
/sys/class/leds/board1-5:green:
/sys/class/leds/board1-5:red:
=20
>>> How special hardware is this? Does it make sense to ask this question=

>>> for x86 users, for example?
>>
>> I think it's possible to connect it to x86 hardware, but I don't try i=
t.
>> Board need not only SPI connection, but good power supply.
>=20
> Aha, ok.
>=20
>>>> +/* CR0014114 SPI commands */
>>>> +#define CR0014114_SET_BRIGHTNESS	0x80
>>>> +#define CR0014114_INIT_REENUMERATE	0x81
>>>> +#define CR0014114_NEXT_REENUMERATE	0x82
>>>
>>> can we s/cr0014114/cr00/g, or something? There are local to the
>>> module, so they can be shorter...
>>
>> Sure, may be CMD_SET_BRIGHTNESS
>=20
> Please do the replace for all static symbols.> >> +fail:

Of course (CMD_, DEF_, ..)
=20
>>>> +	while (i--)
>>>> +		led_classdev_unregister(&priv->leds[i].ldev);
>>>
>>> Can devm_* be used to simplify this?
>>
>> I think no, because it will cause race condition.
>=20
> Please take a look at devm_led_classdev_register() and friends. It
> should be possible to simplify code without races.

I don't understand how I can call destroy_workqueue() after calling unreg=
ister leds.
=20
> Thanks,
> 									Pavel
>=20

--=20
Best regards,
Oleh Kravchenko


--BJwDVWgsqf9B4ukSJde5hUkP6hVFSetm6--

--gFIf6FP2ngbfoSNjQKBaHgEvEOHtT5bUh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEi1A9NvPuYyDfQuWpz/dMoHrZTo8FAlmO56oACgkQz/dMoHrZ
To+X3hAAoE2IxMh9JguExazVoYZCHQ6L4jfSw2c5jzHp6G+GawnbTBYYI4klLVZo
COBP8HMI4pf/rX7yNOsvzkO6bMwb1XiVO6vfC25W5JVihKitYuf1fH4jRbP2rsFb
QswLGUYFVJbbXQY0FiJDDFcxFV5Nzg2QSOEOu0VgrdhDJassNcQE4qDnrbqH16jT
NrQwIRyBokTrg3SEAJ4wFL+0wYvmEeCEzbQkpB5fpxRRlAnnuEVVoC+kqVkKuVQX
6AeqliDGAvIhttgPJ5dZRUblHpT0e4xvwrX2MXW/QcPgHyUPTC+FYK37M6FUyPd9
PGepQtk7wvwgTGhyvx77aqpH7u7wSVab7rbAVUXol5jXpgr0kbb8z1qC1046xeCX
SeCC802vrH/8hKW7ZwJLF+pNbDC7qCmAk6k5go74rVkc1BqV7jKU8F8j4lhclZn7
1xtSXL7RGj3LpwEx4cktQVOtXvSKB6WeqoZfiL0xKjr0kRopj4zNEBkG6T9tj8ws
83d3a774nhZkpOuwWtKO5AYciSyq71GmmkhdldZkuIZ2+oLDeJVp5m0RO3ydvYdr
QQ4iREeoNZiMZev2t4NTqv5ueooBnOZ8200Vn6lZ51DiWeRe9hIWB+Q7BDk6dqFA
gNHPDEYI+h3qFV26gqrLjtgAEnJkWoNijMz7Sj2AxWcKrAjDocU=
=kNb5
-----END PGP SIGNATURE-----

--gFIf6FP2ngbfoSNjQKBaHgEvEOHtT5bUh--
