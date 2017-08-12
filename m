From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Sat, 12 Aug 2017 13:28:07 +0300
Message-ID: <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="99V1MB4Nfo9B2HAFhLKfpDMo26a17l2au"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:60822 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750778AbdHLK2O (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 12 Aug 2017 06:28:14 -0400
In-Reply-To: <20170812093024.GA21428@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--99V1MB4Nfo9B2HAFhLKfpDMo26a17l2au
Content-Type: multipart/mixed; boundary="GwpnV0e70SxfLCKAbMSCqpJMP9hQ3TXhg";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Message-ID: <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
In-Reply-To: <20170812093024.GA21428@amd>

--GwpnV0e70SxfLCKAbMSCqpJMP9hQ3TXhg
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hello Pavel!

Thank you for your reply.

On 12.08.17 12:30, Pavel Machek wrote:
> Hi!
>=20
> On Sat 2017-08-12 12:09:35, Oleh Kravchenko wrote:
>> This patch adds a LED class driver for the RGB LEDs found on
>> the Crane Merchandising System CR0014114 LEDs board.
>=20
> What kind of hardware is this?=20

It's from vending machines produced by Crane Merchandising System http://=
cranems.com/
=20
>> Driver creates LED devices with name written using the following
>> pattern "LABEL-{N}:{red,green,blue}:".
>=20
> Is the "-{N} suffix needed?

It's number of RGB LED, board has 6 LEDs.

>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  23 ++
>>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>=20
> You'll need to cc device tree maintainers to get their acks. Also you
> should probably cc: Jacek and me.

Okay, I will add them.
=20
>> @@ -76,6 +76,18 @@ config LEDS_BCM6358
>>  	  This option enables support for LEDs connected to the BCM6358
>>  	  LED HW controller accessed via MMIO registers.
>> =20
>> +config LEDS_CR0014114
>> +	tristate "LED Support for Crane Merchandising Systems CR0014114"
>> +	depends on LEDS_CLASS
>> +	depends on SPI
>> +	depends on OF
>> +	help
>> +	  The CR0014114 LED board used in vending machines produced
>> +	  by Crane Merchandising Systems.
>> +
>> +	  This driver creates LED devices with name written using the
>> +	  following pattern "LABEL-{N}:{red,green,blue}:".
>=20
> How special hardware is this? Does it make sense to ask this question
> for x86 users, for example?

I think it's possible to connect it to x86 hardware, but I don't try it.
Board need not only SPI connection, but good power supply.
=20
>> +/* CR0014114 SPI commands */
>> +#define CR0014114_SET_BRIGHTNESS	0x80
>> +#define CR0014114_INIT_REENUMERATE	0x81
>> +#define CR0014114_NEXT_REENUMERATE	0x82
>=20
> can we s/cr0014114/cr00/g, or something? There are local to the
> module, so they can be shorter...

Sure, may be CMD_SET_BRIGHTNESS
=20
>> +static void cr0014114_test(struct cr0014114 *priv)
>> +{
>> +	unsigned int		mdelay;
>> +	size_t			i;
>> +	struct led_classdev	*ldev;
>> +
>> +	/* blink all LEDs in 500 milliseconds */
>> +	mdelay =3D 500 / priv->leds_count - CR0014114_FW_DELAY_MSEC;
>> +	if (mdelay < CR0014114_FW_DELAY_MSEC)
>> +		mdelay =3D CR0014114_FW_DELAY_MSEC;
>> +
>> +	for (i =3D 0; i < priv->leds_count; i++) {
>> +		ldev =3D &priv->leds[i].ldev;
>> +
>> +		ldev->brightness_set(ldev, CR0014114_MAX_BRIGHTNESS);
>> +		msleep(mdelay);
>> +		ldev->brightness_set(ldev, LED_OFF);
>> +	}
>> +}
>=20
> I'd remove this.

I will do it.
=20
>> +fail:
>> +	while (i--)
>> +		led_classdev_unregister(&priv->leds[i].ldev);
>=20
> Can devm_* be used to simplify this?

I think no, because it will cause race condition.
=20
> Thanks,
> 									Pavel
>=20

--=20
Best regards,
Oleh Kravchenko



--GwpnV0e70SxfLCKAbMSCqpJMP9hQ3TXhg--

--99V1MB4Nfo9B2HAFhLKfpDMo26a17l2au
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEi1A9NvPuYyDfQuWpz/dMoHrZTo8FAlmO2DgACgkQz/dMoHrZ
To+Jsw/+OXRKwx3YaBN23mGdju9RiRIp//23xRTWitIGu3y/fQclvaRarQustquP
QaxG2kJIV0ATCLixPK9UXcxgDV3lCCgEQuxfkrFlMxFCbiIAUdxRxcrHBo9Zgzi2
6ZN382iR1pW5BV2hP8FEbxK4lxW/9qXup3J7pXDNq0cBBXCbTCKOeh7cL+fuiPb1
vP27aUsQim2jdVzbZmPO3i/gCL3kgdfEoiDOADZyqihvNsECvpvEr6TAfpApKTn8
8YnRu7tJrHYmtr3SKBbHd7a0wTlL33f8vUG9D9DuY2o0N3uD6QTCduVIIoUA4+Hc
qmDS33taPBVDBmIuBGrGgmUeXv3fGCDEcwl9suRrY0Jm7Xn7kdc58kDAu4bnQq6D
7UG1nIHzxWghdIWADgGu4nhLFLq+JYVAd8/bGJt8Ntf4RI1ONj+GppLBgODUt4e6
7AblEdIlguMYL/YsKWW1JgmBdDEqiTBixB9Xd+Y/3OuthdhIg7hVNSL4kjdjCQaV
T9uPTSQlPy9bwFIcdPkMelI4RHKDPUEhfozuKZ0CVOi4jT83xU/rMXfaFCY53pUW
q/4knJdbynu8lRaCGJ6gkXyGBIU2pVtk3mjQA5TS6pXuXc8BXR03URQ6D3DbfGLr
dU64pynVsm2WHHH18v47mfk832EJZ0x330/pZ4dSCPpbu0dA8g4=
=eeYH
-----END PGP SIGNATURE-----

--99V1MB4Nfo9B2HAFhLKfpDMo26a17l2au--
