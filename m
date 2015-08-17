From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH RESEND v6 0/2] Driver for TI tlc591xx 8/16 Channel i2c
 LED driver
Date: Mon, 17 Aug 2015 23:47:29 +0300
Message-ID: <55D24861.3020202@ti.com>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch> <55D1CF84.8040906@ti.com> <20150817132718.GF7537@lunn.ch> <55D1EBA8.9090609@ti.com> <20150817142147.GG7537@lunn.ch> <55D20E96.3020504@ti.com> <20150817164822.GA29494@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="IQKXBTjCkp7kl5IdIU4GASxGVWFQui2p8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:49171 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750906AbbHQUsI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 17 Aug 2015 16:48:08 -0400
In-Reply-To: <20150817164822.GA29494@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com, "R, Vignesh" <vigneshr@ti.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

--IQKXBTjCkp7kl5IdIU4GASxGVWFQui2p8
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 17/08/15 19:48, Andrew Lunn wrote:
>> TLC591xx is quite simple HW, and the code doing the HW programming
>> should be identical for a pwm and for a led driver. I don't see either=
 a
>> pwm or a led driver being somehow superior. They are very similar simp=
le
>> drivers, implementing a different interface. Whether the interface wor=
ks
>> for you should be clear from the interface itself. The code is just de=
tails.
>>
>> On the other hand, if you want something you can use to test, it's a
>> different case, but you haven't indicated any interest in that.
>=20
> What i want is code in the kernel to driver the LEDs on my Linksys
> WRT1900ac. You say, "the code is just details", is just plain
> wrong. Code is the Linux kernel and is the process of getting stuff
> into the kernel. I've followed the process, submitted code for review,
> fixed up comments, got it tested and ACKed by people, and merged.

Your process also included in ignoring my questions, and dropping me
from cc so you'd get the driver merged. My idea of the Linux development
process differs greatly from yours.

> Where as all you have done is emailed.

Yes, as you were writing the driver for the HW, and I was expecting
answers from you. I would find it rather rude if I'm working on a
driver, getting comments on it and fixing things, and suddenly someone
else goes and writes his own version of the driver for the HW.

I presumed that you would either answer to my comments, or you would cc
me when you want to ping the maintainers.

Sure, if the driver is complex or somehow controversial it's good to
have different implementations of the driver so the best one can be
picked. This is not the case here. The HW is simple, and both PWM and
LED interfaces are simple. The code is just details in such a case.

I can post a pwm based driver tomorrow. I could've done that long ago if
you would have just said that you're not interested in finding answers
to my questions or trying a pwm driver. Or if you'd have bothered to cc
me in the last series, so I would've realized you are done with the drive=
r.

 Tomi


--IQKXBTjCkp7kl5IdIU4GASxGVWFQui2p8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJV0khtAAoJEPo9qoy8lh71i9YQAK26QE7s1KElu9sNA0wa4rsw
w8Lcno7gR82k9HIhwh4IgplWmwBkztCSc1YhPN6Q78KGBLYC6fpPtSlgmq+dC87r
JtteE/2wGa8mPQ0cQjWFg3xuPmF+nky1gVsPkWSZ1C+Eth57ntKFqRx4N7FEFMg0
g4kOEF/iuX6CuI10DeR4JamuDZuUzSEnLTDdFn85sXmhGzAJ6e5zl1Z/QhLGZXd7
HD6f3trVtrHW1j7tahWCGAeo7gLVuLW751JJ4Hojypf+S0kHC57Eptyqka0YZaMx
jvrQorzMJ3jDSyZZYH0QwQlAIGKHU8MjBiDP238OKK6IbiG/13woFpcVav8USyo3
BdeLL1vwdGIlnkjDi9mbdyCuRRSdtVhNqp4lwkZYLsKZdOuXCyAQkGi7+0NUPuq9
G2WeW3wqkW6KwkEAaR+EHldcjkSzyGYQKnqi5U5erumnVik9+RfCqe9OJeZiYhts
T3BONkgbF/cgdoZQ5cbq0YmI3TybrECH5DrSkguvAo06mkc4q2lBvqD6Aomuz9PC
3AwNt6TASYUw5SxQ/VNEykLCP0cmHFjXVSfwVdBNRau1Sf2Rfpmc74vxZ6Ay9F58
4nKDxuq+1oH6PS0EOPmZOP6ME/FSPQF7tXnqI2zDyrZPwvFRgn2EZqS3CjWrEyZ9
rOhESAtUhmbrTdG2vxqu
=83am
-----END PGP SIGNATURE-----

--IQKXBTjCkp7kl5IdIU4GASxGVWFQui2p8--
