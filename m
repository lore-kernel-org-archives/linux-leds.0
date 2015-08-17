From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH RESEND v6 0/2] Driver for TI tlc591xx 8/16 Channel i2c
 LED driver
Date: Mon, 17 Aug 2015 19:40:54 +0300
Message-ID: <55D20E96.3020504@ti.com>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch> <55D1CF84.8040906@ti.com> <20150817132718.GF7537@lunn.ch> <55D1EBA8.9090609@ti.com> <20150817142147.GG7537@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="5EHeSCXM8kkHVkAhKBtbMNcpvJhGwndmT"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:39511 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750799AbbHQQlR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 17 Aug 2015 12:41:17 -0400
In-Reply-To: <20150817142147.GG7537@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com, "R, Vignesh" <vigneshr@ti.com>

--5EHeSCXM8kkHVkAhKBtbMNcpvJhGwndmT
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On 17/08/15 17:21, Andrew Lunn wrote:

>>> If you think your PWM code is so much better, please submit a revert
>>> patch plus your PWM LED driver. We can find somebody to do a side by
>>> side review.
>>
>> It's not about the driver code. That can be cleaned up if needed. The
>> question is whether the driver should be a PWM driver or a LED driver.=

>=20
> There i disagree. It is all about the code. Release early, release
> often.  Show us the code. Get it discussed, reviewed, tested, and then
> ultimately merged.
>=20
> You keep saying PWM is the way to solve this problem, but where is
> your code showing your solution is superior to mine, yet still solves
> my use case?

No, I have not said PWM is the way to solve this problem. I have said it
sounds to me that a PWM driver better matches the HW and our use case. I
have asked you if PWM + pwd-leds would solve your use case as well as a
led driver.

If you don't have an answer, it's fine to say "I don't know". But you
have just ignored the question. And even worse, you dropped me (and
Vignesh) from the latest mail thread.

We have a pwm driver for the chip, but it only supports TLC59108. It
should be trivial to extend it to support TLC59116, but it's pointless
to spend time on that if a PWM driver doesn't handle your use cases.

> So please stop talking and show us the code.

TLC591xx is quite simple HW, and the code doing the HW programming
should be identical for a pwm and for a led driver. I don't see either a
pwm or a led driver being somehow superior. They are very similar simple
drivers, implementing a different interface. Whether the interface works
for you should be clear from the interface itself. The code is just detai=
ls.

On the other hand, if you want something you can use to test, it's a
different case, but you haven't indicated any interest in that.

 Tomi


--5EHeSCXM8kkHVkAhKBtbMNcpvJhGwndmT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJV0g6WAAoJEPo9qoy8lh71TusP/27pz3ICSgSRCjOq0+LTqk97
XckWauNrkTHnw0Exf8I+Y52XildtiTBmp8gc6JyrYU31mm3fPSpRfnd40GiJHLci
hPytQRRoFYRyNZ7/lEwGhZOCh8vVYRaW4bHeKja48Ue5HKyuZ/++6a6wGzPZOaYU
MXxUc6Msyvb29mdFI+eQSzLz4nK4IW7bUvcNpMC7Dha/5oEaFt32GJq9FKKzmqBM
i0Xt6/mN/zLt5II/uKqYmIs/ZBSA+5SYWPNhfWjAUxuhvpCPNwZaYsVqCpDWbrjS
tWpjHnBMcLePInLLwXXOzkFc1fKbTGtklFsSfVgrYQcvUq3tYaCA+wOb+K63+dCg
dUQegc8PNreabft9xX8rHZKu4kIHN7Mo2/qRP7/fymF6huDKg5UVqblhB5uB6+7o
KjhyEUbwFvxfIHXoAOchbFO4PPaPZ9bgytuz52AWj19MrH0MyaVz//ICRRKaHxAA
2C7r0GRtp7quvpzrgMz4/Se88JzPDY7DLtb0iXU8Hqm+7Hs+O0S3yOgmASJK4sLi
x79JiPs0s2HIgazaGeDMwx1voom1AvPKKVzYqefFWDFUsoqZSgf+fizwp/6dOz2L
3DCC6pVojSPdxHuIvlwkcDeeuYSQIqiRiUWo5hDHaZf8cYI0zEJdRTTLiApk/mOn
/sPb6HmjnHl/lgvn3nMJ
=IU5w
-----END PGP SIGNATURE-----

--5EHeSCXM8kkHVkAhKBtbMNcpvJhGwndmT--
