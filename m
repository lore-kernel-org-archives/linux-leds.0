From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv5 2/2] leds: tlc591xx: Driver for the TI 8/16 Channel
 i2c LED driver
Date: Tue, 27 Jan 2015 13:17:47 +0200
Message-ID: <54C773DB.8010905@ti.com>
References: <1421879364-8573-1-git-send-email-andrew@lunn.ch> <1421879364-8573-3-git-send-email-andrew@lunn.ch> <54C625D8.7040305@ti.com> <20150126174100.GD5015@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="xk6sMj9wGHHP2hn0gR6UeMcpfOlvRR97x"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:52432 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751593AbbA0LSj (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 27 Jan 2015 06:18:39 -0500
In-Reply-To: <20150126174100.GD5015@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, vigneshr@ti.com, Matthew.Fatheree@belkin.com, linux-leds@vger.kernel.org, kaloz@openwrt.org, linux ARM <linux-arm-kernel@lists.infradead.org>

--xk6sMj9wGHHP2hn0gR6UeMcpfOlvRR97x
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 26/01/15 19:41, Andrew Lunn wrote:

>> Maybe it's normal for LED drivers, but why is the workqueue needed? Wh=
y
>> not just do the work synchronously?
>=20
> include/linux/leds.h says:
>=20
>         /* Must not sleep, use a workqueue if needed */
>         void            (*brightness_set)(struct led_classdev *led_cdev=
,
>                                           enum led_brightness brightnes=
s);
>=20
> and regmap uses a lock to protect its structures, and so does i2c, etc.=


Ah ok.

>>> +static int
>>> +tlc591xx_configure(struct device *dev,
>>> +		   struct tlc591xx_priv *priv,
>>> +		   struct regmap *regmap,
>>> +		   const struct tlc591xx *tlc591xx)
>>> +{
>>> +	unsigned int i;
>>> +	int err =3D 0;
>>> +
>>> +	tlc591xx_set_mode(regmap, MODE2_DIM);
>>> +	for (i =3D 0; i < TLC59116_LEDS; i++) {
>>
>> Looping for tlc591xx->maxleds should be enough?
>=20
> Yes, it would, but i'm not sure that is any better. At the moment it
> is a constant, so the compiler can optimise it. We might save 8
> iterations for TLC59108, but how much do we add by having less well
> optimized code? And this is during probe, not some hot path, so do we
> really care?

True. And if the define is renamed to TLC591XX_MAX_LEDS or such, then
it's clear.

>>> +
>>> +	tlc591xx =3D of_match_device(of_tlc591xx_leds_match, dev)->data;
>>
>> I presume of_match_device() can return NULL or an error, making the
>> above crash.
>=20
> It would be very odd. The fact the probe function is being called
> means there is a match. So return values like -ENODEV would mean a
> core OF bug. There is no memory allocations needed, so -ENOMEM would
> also not be expected.

The match could come from non-DT based matching. You don't support that
in the driver, but it would be good to bail out early if that is the case=
=2E

>>> +
>>> +	count =3D of_get_child_count(np);
>>
>> 'np' may be NULL. I'm not sure how of_get_child_count() likes that.
> =20
> How can it be NULL? If the probe has been called, it means the
> compatibility string must match. If it matches, there must be a np!

Again with non-DT match, although if that's the case the driver should
have already returned an error at this point.

> Anyway, of_get_child_count() looks to be happy with NULL and will
> return 0.

Yep, then it's not an issue.

 Tomi



--xk6sMj9wGHHP2hn0gR6UeMcpfOlvRR97x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUx3PbAAoJEPo9qoy8lh71jrgP/imXWyKvuaUUdYnDJ3Zw6KnN
87M6ez0VwlcUIEqRnNPLn3u6QeVWQ4xOT5Wp0MLcjJRVJb+02EEgluS9zcqjaUT+
WuO0MTbgJnUUkaqXVat5gugXArmdb4dJqo8ImQWozWFaN95KGfx/dCa5hP1EZ70O
4IKHGukgUleG/e4NoIJKAHLWQna41picLy7PdveGPfaM3Z3ZVeoRujmgoEfsqaNU
cBqakve+IHmenryc4S9HZPaB0eI9fMXIcK1+eI+Jw9T5lTIDbM9dpzJawW0mUCHQ
JSBCLhmkKAE82m6uHmE85jQYfB7isEaojqbs+ZN8ASBsaahxS49mZHtGB/v++YOs
YER9Rrf1Fx3jagGd+7pVVlZWumcuuw8NQByGtTKo8OKLzOGdCJfGIQJJ90S0vJTY
fpmRlaWP4s1reVyv/7tKoYlqv7wh7beA9s4ZzeliwBHzbyAiTo0+PE89HCbHBYQQ
joq9TIyQ4vClO6uT3N1tay1AcW8JctEwon12TJjVZ/+M55B//aTD1RULwiEOjcJB
RjvG/Vv5HPafAbuFj55HIZcECFthyeIwNZWU52wX0qrKDoi4tQlDVYX7z2Zv33Uk
hDUC2oG/y2K6p8+LnDASPid7CgB7UlYmcwld6zYNwMAH9VEBRPeCIgaPpsV7Mxnk
uy2HNrDsDNI8aZjbEczv
=MENv
-----END PGP SIGNATURE-----

--xk6sMj9wGHHP2hn0gR6UeMcpfOlvRR97x--
