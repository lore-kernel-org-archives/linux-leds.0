From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Sat, 12 Aug 2017 21:50:34 +0300
Message-ID: <00efd6b5-494f-0f8d-d32b-321236ed8aaa@kaa.org.ua>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
 <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua> <20170812174623.GA2545@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jdScediSki6bpW4x5NbchMHesFAJJpmPh"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:35574 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750973AbdHLSul (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 12 Aug 2017 14:50:41 -0400
In-Reply-To: <20170812174623.GA2545@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jdScediSki6bpW4x5NbchMHesFAJJpmPh
Content-Type: multipart/mixed; boundary="FOeMxfgoKHioIBCogj7si2P7qUtot2INe";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Message-ID: <00efd6b5-494f-0f8d-d32b-321236ed8aaa@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
 <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua> <20170812174623.GA2545@amd>
In-Reply-To: <20170812174623.GA2545@amd>

--FOeMxfgoKHioIBCogj7si2P7qUtot2INe
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 12.08.17 20:46, Pavel Machek wrote:
> On Sat 2017-08-12 14:34:02, Oleh Kravchenko wrote:
>> On 12.08.17 13:56, Pavel Machek wrote:
>>> Hi!
>>>
>>>>> On Sat 2017-08-12 12:09:35, Oleh Kravchenko wrote:
>>>>>> This patch adds a LED class driver for the RGB LEDs found on
>>>>>> the Crane Merchandising System CR0014114 LEDs board.
>>>>>
>>>>> What kind of hardware is this?=20
>>>>
>>>> It's from vending machines produced by Crane Merchandising System ht=
tp://cranems.com/
>>>> =20
>>>>>> Driver creates LED devices with name written using the following
>>>>>> pattern "LABEL-{N}:{red,green,blue}:".
>>>>>
>>>>> Is the "-{N} suffix needed?
>>>>
>>>> It's number of RGB LED, board has 6 LEDs.
>>>
>>> Normally label differentiates them...?
>>
>> For example, possible names when two boards connected is:
>> /sys/class/leds/board0-0:blue:
>> /sys/class/leds/board0-0:green:
>> /sys/class/leds/board0-0:red:
>=20
> Hmm. Well, this works if you can't provide better names. Still "board"
> is somehow generic, andsomeone else might want to use it. "board" ->
> "crms"?

It's specified in device tree by defining label.
In my examples:
board@0 {
       compatible =3D "ccs,cr0014114";
       reg =3D <0>;
       spi-max-frequency =3D <50000>;
       spi-cpha;
       label =3D "board0";
};

board@1 {
       compatible =3D "ccs,cr0014114";
       reg =3D <1>;
       spi-max-frequency =3D <50000>;
       spi-cpha;
       label =3D "board1";
};
=20
>>>>>> +	while (i--)
>>>>>> +		led_classdev_unregister(&priv->leds[i].ldev);
>>>>>
>>>>> Can devm_* be used to simplify this?
>>>>
>>>> I think no, because it will cause race condition.
>>>
>>> Please take a look at devm_led_classdev_register() and friends. It
>>> should be possible to simplify code without races.
>>
>> I don't understand how I can call destroy_workqueue() after calling un=
register leds.
>=20
> Do you actually need the workqueues? It should be possible to avoid
> them, using workqueue support in the core.

The delay between data sends to SPI board should be at least 10 ms
I think it will be bad idea to use shared workqueue from kernel,
so I create separate single threaded work queue :)

--=20
Best regards,
Oleh Kravchenko


--FOeMxfgoKHioIBCogj7si2P7qUtot2INe--

--jdScediSki6bpW4x5NbchMHesFAJJpmPh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEi1A9NvPuYyDfQuWpz/dMoHrZTo8FAlmPTfoACgkQz/dMoHrZ
To/Ujw//dQAbxT9WEPuoqRpQ3D8AjC4nfy55dSWTKWtCOY+QflsSmy7cEmKTVbem
l8TfYMVyVILdfC7TK8Lnr/G5D+YXrLRPX2pppO7D8kkoqvocMmF8EvAgUrAgIXOZ
VtRClErb2PFvv+YTUP8uXpddhjv3JwE7d8K140poE+NRoLNIGFvoNgOQy2j3D1rB
ua3OnuGjUxvdpLglZqETYUTJSOZdlt0zBOUDJtt2/SnXSo7On5dxVZww2/jG1szB
KcszkY1oQRFqeEDj1bxVfotQjLltej04mzYXtRPN2aZOIu+vBXZtVLj4I78OfsaC
8rhXKb7z88YjLZufTVYRrYDD1SevnHzciYsHn6A6EuMqQ9U7ytYmwC0lnasv+iCR
SxfsgAkGKopxKFHlxPs2Dc7NRR9EZWUT3kP5Wkzc8UcfxxRChE3Tywe/9Tk0A2lK
nkIZn9gYqnkgZLgQke30hZeqtG7h+elslIVmHq5Ms/Jw0ltxf3PPo4YsBorCnfvj
eDbKgchBgeDy+ilX2shXNS0vhfatldJwg1HIWZJmVAj0Jg68olbjKUwoEi8QWn2h
9bpnn/YuOcczOjt7udRceitliXgD8IwQDLfofy3K2LVv+7BKkEuouLe57nFvSIPv
Z3RjGmvDVUks5PrxSgn3sc+3WLusucqCQyMvlJG5/gPConm8Q7I=
=Hrbp
-----END PGP SIGNATURE-----

--jdScediSki6bpW4x5NbchMHesFAJJpmPh--
