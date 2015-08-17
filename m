From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH RESEND v6 0/2] Driver for TI tlc591xx 8/16 Channel i2c
 LED driver
Date: Mon, 17 Aug 2015 17:11:52 +0300
Message-ID: <55D1EBA8.9090609@ti.com>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch> <55D1CF84.8040906@ti.com> <20150817132718.GF7537@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="u0xUaE0xQw6EQ4aal7lblenIkBfRWoxR5"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:36966 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752081AbbHQOMQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2015 10:12:16 -0400
In-Reply-To: <20150817132718.GF7537@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, cooloney@gmail.com
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com

--u0xUaE0xQw6EQ4aal7lblenIkBfRWoxR5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 17/08/15 16:27, Andrew Lunn wrote:
> On Mon, Aug 17, 2015 at 03:11:48PM +0300, Tomi Valkeinen wrote:
>> Hi Andrew, (and Brian),

(Sorry for typoing your name, Bryan =3D).

>> On 18/03/15 00:08, Andrew Lunn wrote:
>>> This patchset is a driver for the TI tlc59116 16 Channel i2c LED
>>> driver and tlc59108 8 Channel i2c LED driver. This driver is used on
>>> the Belkin WRT1900AC access point and the C code is derived from code=

>>> Belkin contributed to OpenWRT.  However it has been extensively
>>> re-written, and a device tree binding added to replace platform data.=

>>
>> I see this is now in 4.2-rc... And I see you dropped me from Cc in thi=
s
>> resend series. Because of that, I missed this resend, and couldn't
>> object to merging.
>>
>> I'm not very happy about this getting merged. I think I had valid
>> comments to the driver, to which I did get no answers. You knew my
>> objections, but you did not even bother mentioning those in the resend=

>> intro.
>=20
> Hi Tomi
>=20
> Our discussions were going around in circles, no progress being made.
> The subsystem maintainer is ultimately the one who needs to decide,
> bar Linus himself. Bryan Wu has seen all the discussions, and
> ultimately decided the driver was O.K, despite any unresolved issues
> you might have.

If so, Bryan did not comment to the unanswered questions in any way.
More probable is that he missed them.

It's not easy as a maintainer to follow all the discussions on the
various threads. It's your responsibility as the sender of the patches
to make sure all the relevant information is available for the maintainer=
=2E

> If you think your PWM code is so much better, please submit a revert
> patch plus your PWM LED driver. We can find somebody to do a side by
> side review.

It's not about the driver code. That can be cleaned up if needed. The
question is whether the driver should be a PWM driver or a LED driver.

My question to you was that if this driver would be a PWM driver, and
you would use pwm-leds to implement the led functionality, would that
cover your use case?

We use the chip as a PWM device, for backlight, and also as a GPIO
expander. A PWM driver makes sense in our case. If it also works fine
for your use case, then isn't a PWM driver better option?

 Tomi


--u0xUaE0xQw6EQ4aal7lblenIkBfRWoxR5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBCAAGBQJV0euoAAoJEPo9qoy8lh71g4wP+IsU1cKXuIkcISBwwRlIjURg
3HvywNjHqysTEj6xXAuml+nodNSXjIDYfB4fseJIFtbfI57aX3t6f0KCgQjvO09Q
2zyHEuvl3Ks41dDrvKFUk4f3IBuszjb9J5g41/m2Eb1FUnn9U46D3f+Pp6oM/Wxh
ZPuaHvpbzlUZ6JWo3inlN84OdUk7+kDsWS4UsZzxJJ2EydAYBaoaULvyL6qyRc20
vvV67wxXNTnCQwllmIWJYMTtivC9hGK01F5ImacJdgZ3TT5fvHcqS1ZJPM6H8njl
2AWZ3YFEOXBIcVShWwCxJKkkzZ3ZLboKn2N1EhZZ+BE/RXWlytmH5Uz6IbgXPhDw
rdLdaG+vGBJTWwyxuIsiFd1PO9MNHD1WCJ+kr8bMcEq5tT6Q8g1uiJS7nhiN1gFR
iJt0ky26+1mKGeEB9fH2posZt+SQmybG7EY/kHIBVPA1OfjAxSTvQs0z/5KpohNf
7b6BR1/rb0a7fz4v4cwS3PnHsWf0by7JLhiWIfPCQL9vpKb0K0X/m8zHjgjJZgni
mzZH93LXfkn6U14aSHPVwk4P/D5MBLauylLvi0thHNMSuKQUV423Ip8K5cJfXyf9
ULQQuPJNHBJFr83vZLhItkKCTEMoHuFQjHLW6v+mXZTM6Q1JGdfy99SL2936KNZ+
daQ3goUR3eZejTNcEAo=
=G16h
-----END PGP SIGNATURE-----

--u0xUaE0xQw6EQ4aal7lblenIkBfRWoxR5--
