From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Sat, 12 Aug 2017 22:39:39 +0300
Message-ID: <026d9ec2-f2bd-18b9-d5fa-f593d40e2f57@kaa.org.ua>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
 <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua> <20170812174623.GA2545@amd>
 <00efd6b5-494f-0f8d-d32b-321236ed8aaa@kaa.org.ua>
 <20170812191300.GA23619@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MhtQI5sd3ARaIOBq4lo48iQIINmHj92Sj"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:39253 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750995AbdHLTjp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 12 Aug 2017 15:39:45 -0400
In-Reply-To: <20170812191300.GA23619@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MhtQI5sd3ARaIOBq4lo48iQIINmHj92Sj
Content-Type: multipart/mixed; boundary="U5c9hliNsaIXbv6jQ5fip8kDcbFfvDskj";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Message-ID: <026d9ec2-f2bd-18b9-d5fa-f593d40e2f57@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
 <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua> <20170812174623.GA2545@amd>
 <00efd6b5-494f-0f8d-d32b-321236ed8aaa@kaa.org.ua>
 <20170812191300.GA23619@amd>
In-Reply-To: <20170812191300.GA23619@amd>

--U5c9hliNsaIXbv6jQ5fip8kDcbFfvDskj
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 12.08.17 22:13, Pavel Machek wrote:
> Hi!
>=20
>>> Hmm. Well, this works if you can't provide better names. Still "board=
"
>>> is somehow generic, andsomeone else might want to use it. "board" ->
>>> "crms"?
>>
>> It's specified in device tree by defining label.
>> In my examples:
>> board@0 {
>>        compatible =3D "ccs,cr0014114";
>>        reg =3D <0>;
>>        spi-max-frequency =3D <50000>;
>>        spi-cpha;
>>        label =3D "board0";
>> };
>>
>> board@1 {
>>        compatible =3D "ccs,cr0014114";
>>        reg =3D <1>;
>>        spi-max-frequency =3D <50000>;
>>        spi-cpha;
>>        label =3D "board1";
>> };
>=20
> Ok, makes sense. How does the board look?

Did you mean a photo? Sure http://i.imgur.com/OShLIJx.jpg
=20
>>>>>>>> +	while (i--)
>>>>>>>> +		led_classdev_unregister(&priv->leds[i].ldev);
>>>>>>>
>>>>>>> Can devm_* be used to simplify this?
>>>>>>
>>>>>> I think no, because it will cause race condition.
>>>>>
>>>>> Please take a look at devm_led_classdev_register() and friends. It
>>>>> should be possible to simplify code without races.
>>>>
>>>> I don't understand how I can call destroy_workqueue() after calling =
unregister leds.
>>>
>>> Do you actually need the workqueues? It should be possible to avoid
>>> them, using workqueue support in the core.
>>
>> The delay between data sends to SPI board should be at least 10 ms
>> I think it will be bad idea to use shared workqueue from kernel,
>> so I create separate single threaded work queue :)
>=20
> If workqueue support in led core can not take 10 msec wait, we should
> fix it, not add hacks around...
> 								=09
>=20

Could you please explain or give a example?
Because it's not clear for me, how I can use it.

--=20
Best regards,
Oleh Kravchenko


--U5c9hliNsaIXbv6jQ5fip8kDcbFfvDskj--

--MhtQI5sd3ARaIOBq4lo48iQIINmHj92Sj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEi1A9NvPuYyDfQuWpz/dMoHrZTo8FAlmPWXsACgkQz/dMoHrZ
To9IeBAAna30x1QUMHfbQwv65QcvUZobpkNjFM1KLTPGAUsvDLrxSihJXdOY+vrH
4dxfBms8HKkAYj2F0onLZ0jxWfAqQO/qBBZkz1xpO9/4HEblVJxAmrxduPHfiRau
fw/FSTa+BSwYFLLw3m984k4DDWWYIN/BJE78619TCqll81VSu3sE7nTN4B/lCgh0
duNa+KtTkGYaSXT/EdXg04c0RfL7R6Bq9Jzxgsbz5nH0+drRBgG8TYgsQn4OqvWA
Qrlf0HsTyEybwwjXCMPbOwLkHiSDTuAo3eVLgzF1/1qXVfGrMHdH7ycHRdrAAd98
2JxxpBKAxfP4XrSvVsmMQt/OlxOy8/2a280wHchNHmgOS19Tr2F2sLhAqD50Ih2d
5eqdHStVVSQ3gAoYKvRVsytZALyqe2Z2dmCbG1rZBTBd7ZWr68z9/nSH+E5gwOoU
943qog7CviLr6189AM/pwJwHWByEFD4bmXa86hBUA3JQ7QA31U6ZivWOd6e5iq/A
5Z40Sdm5wssyrLeyraBerpHgEF/83qU/FDdW5g0w7qN021kvphjFkwVFGAILt+nu
fkkM0CG//A+aOyu97C2qHc3o+JBL8hsOKjuPgNa/FXYUe63Wg6WQEDPzQRRjq3Vq
+Mv+y97srsu2kUYPxIkZtizSjHICeKXqjZpfYCgkiWWZ4FbnIWc=
=gDXV
-----END PGP SIGNATURE-----

--MhtQI5sd3ARaIOBq4lo48iQIINmHj92Sj--
