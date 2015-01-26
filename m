From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCHv5 2/2] leds: tlc591xx: Driver for the TI 8/16 Channel
 i2c LED driver
Date: Mon, 26 Jan 2015 13:46:33 +0200
Message-ID: <54C62919.8000205@ti.com>
References: <1421879364-8573-1-git-send-email-andrew@lunn.ch> <1421879364-8573-3-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="iHUKXFl55uCQ5q9cMtwrcTxQ4cMLfbAsD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421879364-8573-3-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, vigneshr-l0cyMroinI0@public.gmane.org, Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

--iHUKXFl55uCQ5q9cMtwrcTxQ4cMLfbAsD
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On 22/01/15 00:29, Andrew Lunn wrote:
> The TLC59116 is an I2C bus controlled 16-channel LED driver.  The
> TLC59108 is an I2C bus controlled 8-channel LED driver, which is very
> similar to the TLC59116. Each LED output has its own 8-bit
> fixed-frequency PWM controller to control the brightness of the LED.
> The LEDs can also be fixed off and on, making them suitable for use as
> GPOs.

So as I've mentioned, our HW uses TLC59108 not only for LED (backlight)
but also as a GPO. And as we shortly discussed (in private mails, I
think), technically it's possible to write gpio and backligth drivers
that utilize a LED driver to do the actual work.

Some years ago there was a patch from Peter to implement GPO on top of PW=
M:

https://lkml.org/lkml/2012/11/22/108

That wasn't merged, but there was also no outright NAK, although it
seemed different people preferred different approach. That patch is
quite similar to what we'd need for GPO on top of LED.

However, I'm still not convinced that is the correct solution. A GPO
support for a PWM output makes sense, as it's just a PWM with full
on/off output. But a LED means a, well, LED, something that emits light.
GPO on LED sounds a bit silly.

So... To me it's still slightly unclear when should one write a PWM
driver and when a LED driver. But I would say that as the TLC591xx
outputs a PWM signal, it should be a PWM driver. Then the different
users of this PWM signal could be made on top of that (LED, backlight, GP=
O).

What would be the technical drawbacks with having the TLC591xx driver as
a PWM, instead of LED?

 Tomi



--iHUKXFl55uCQ5q9cMtwrcTxQ4cMLfbAsD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxikZAAoJEPo9qoy8lh71R30QAJbWXlr7cgtePNnEVt8DzB6H
KlzMstJcgU86C6Ruq6t1jGi1zGZciVIG52VrGwzBkBUbcFKX0OWf1F+ei6gOw1lc
GYLqx230YCReRuU29234VLeNqtBKanFKGJL8uIkFJIygSenIiohEAKG7+BR2skR8
qAvdfveOrFZ6mfeckzXKDFqk49WOb4spQ60eb5b+FIj9P4GzBzRXU0MIUGrhY1lA
7NfCD6hcyPIcpWNx8zkJyCz03gYr1Fm2zSdr3LdkwwTxlfLirG5/wmhjKr8SDX3Q
APw1iR9YZ2Bw0I4WpuvSGe2M6Tnl3sRD1sIbtLBPHQYzOZuN+OOfnUt6Ct0YypjV
J/93kxNlq6YZOveAJ8ZvC6pzGTyxFAvoBa0fzuz1OnvtPJukA+3xNnWg447UZOZq
tPxkXJU68UPeEqg9lmH5Y9uFCH63ZQKaSYLLpSQpe+pz42cdXmIjGI7LhDnCyUUV
YNyDjWYIL1hYUByoW8Yj512VVK06jJG1tPg8e4yNBfdN1af/D4uaVvTU1LjCSUmk
eVunX7YQVbsPt6S9Q6wkYqTmY1YMM+gJY9Qko+Mp9XaIdbe3WXuL+/yvnARbD+xg
vUgVXCR72/2eooU9oVUv9sf7nteHpRwu2sV+9+hOqXrEJzKMBQj9yqfJHD0IJsC8
z4YU9ftlye8V6Jo2rUwP
=rKKU
-----END PGP SIGNATURE-----

--iHUKXFl55uCQ5q9cMtwrcTxQ4cMLfbAsD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
