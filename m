From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv5 2/2] leds: tlc591xx: Driver for the TI 8/16 Channel
 i2c LED driver
Date: Tue, 27 Jan 2015 13:11:57 +0200
Message-ID: <54C7727D.70000@ti.com>
References: <1421879364-8573-1-git-send-email-andrew@lunn.ch> <1421879364-8573-3-git-send-email-andrew@lunn.ch> <54C62919.8000205@ti.com> <20150126171052.GC5015@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="B16BJrEnQpmu9e1J54vLNJgNeCguaWSGK"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:52263 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752479AbbA0LMs (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 27 Jan 2015 06:12:48 -0500
In-Reply-To: <20150126171052.GC5015@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org, vigneshr@ti.com, Matthew.Fatheree@belkin.com, linux-leds@vger.kernel.org, kaloz@openwrt.org, linux ARM <linux-arm-kernel@lists.infradead.org>

--B16BJrEnQpmu9e1J54vLNJgNeCguaWSGK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On 26/01/15 19:10, Andrew Lunn wrote:
>> So... To me it's still slightly unclear when should one write a PWM
>> driver and when a LED driver. But I would say that as the TLC591xx
>> outputs a PWM signal, it should be a PWM driver. Then the different
>> users of this PWM signal could be made on top of that (LED, backlight,=
 GPO).
>>
>> What would be the technical drawbacks with having the TLC591xx driver =
as
>> a PWM, instead of LED?
> =20
> Hi Tomi
>=20
> We have been through this once, but the big technical drawback is that
> this hardware cannot do what the Linux Kernel defines as PWM.
>=20
> It cannot correctly implement the PMW call:
>=20
> int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns);
>=20
> This hardware has a fixed period, since it is clocked at 97-kHz.  So
> you cannot set the period. The duty is also somewhat restrictive, in
> that it only allows 1/256 increments of the 97Khz.

Surely other PWM devices also have restrictions in the period or duty cyc=
le?

> This hardware does however perfectly fit the LED API:
>=20
> enum led_brightness {
>         LED_OFF         =3D 0,
>         LED_HALF        =3D 127,
>         LED_FULL        =3D 255,
> };
>=20
>         void            (*brightness_set)(struct led_classdev *led_cdev=
,
>                                           enum led_brightness brightnes=
s);
>=20
> So we can model it perfectly as an LED driver, or badly as a PWM
> driver.

Maybe so, but what does it mean in practice? If it's implemented as a
PWM driver, and the existing leds-pwm driver is used for the led
functionality, shall we miss some brightness values? Is the
configuration more difficult? Or what?

So my point here is that it outputs a PWM signal, so it makes sense to
have it as a PWM driver. It has restricted configurability compared to
more versatile PWM hardware, but I so far don't see why that would be an
issue.

If it is a PWM driver, we get backlight support for free via the
existing pwm_bl driver, and LED support via leds-pwm. And there has been
a clear acceptance on GPO functionality with PWM outputs (in the Peter's
mail thread), whereas I would bet that a LED based GPO functionality
would encounter resistance, because that doesn't quite make sense.

 Tomi



--B16BJrEnQpmu9e1J54vLNJgNeCguaWSGK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUx3J9AAoJEPo9qoy8lh71BYAQAKzotZRZJy0wsY5V78XH36MK
786T3MeUDbRMKtUw6+ewEa4i0fJKPewaiOYorxKWkrLyRr7TnSSAcxLE873DHunj
mLMOaRR5vH8ehWIS6WfbVnwFMf8cmmkfe3HfwkGUfdlcxOlaK+U/IY+gw7TCS+RM
OrqnefwfHIJuI+jY37JIHpsrPY2UjdkA/fWVUplHwKuUmXPb1gfiRsiZ0XNZboh/
g9qk6LrIfK3m0KUzoL1YZXcPzwdXnNqot/XEoo2Zm8ng6ZLgXgKSYtYXEDmHGM1d
1Zg+e2bfy6RjCPMOhDQqfZEU5DpbX4NfLpyFjym2SG5qX8QdO5iq60pxTvoNYzpW
vtflcvZg/izfr/Ax2j0AzmRu97SM4iipsW2jUJsqDHeImL0GuisdXWiJISKttFnr
cBoTrjfq1IvvYi/s0ax24ZdTlL8/2NNDxVZOSPJR+P5aJDQj37L/NCFYuSrpA/Ix
5gFFE0HabjI3a6plPei/z+CVUgjdY+R1/Ld/AiCa6jfK/WoLkCciVDlbzCckAtlt
1mfoDq8OD+XjoKwMUhGtxxQtrqu1TeaMXEVbp1WYY2hNAIpESSmz5NZxI0pi4ZvL
rk05JRt7ZLL+C2RRo8nDKjFPZOy8x8yBMt4VSL+5Lo7HKKTn9Nktqw4dFKJahOXN
CbiOcUDBoz4IIZmJdHFs
=M+fj
-----END PGP SIGNATURE-----

--B16BJrEnQpmu9e1J54vLNJgNeCguaWSGK--
