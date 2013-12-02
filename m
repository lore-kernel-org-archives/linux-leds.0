From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] leds/pwm: Don't disable pwm when setting brightness
 to 0
Date: Mon, 2 Dec 2013 13:33:19 +0100
Message-ID: <20131202123318.GC12793@ulmo.nvidia.com>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1385412225-29740-3-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:43901 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753749Ab3LBMeN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Dec 2013 07:34:13 -0500
Received: by mail-bk0-f53.google.com with SMTP id na10so5412716bkb.12
        for <linux-leds@vger.kernel.org>; Mon, 02 Dec 2013 04:34:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1385412225-29740-3-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 09:43:44PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> This fixes disabling the LED on i.MX28. The PWM hardware delays using
> the newly set pwm-config until the beginning of a new period. It's very
> likely that pwm_disable is called before the current period ends. In
> case the LED was on brightness=3Dmax before the LED stays on because in
> the disabled PWM block the period never ends.
>=20
> Also only call pwm_enable only once in the probe call back and the
> matching pwm_disable in .remove(). Moreover the pwm is explicitly
> initialized to off.

While I do understand the reasoning behind this, if this is really the
behaviour that we need then there's no use in having pwm_enable() and
pwm_disable() at all. They can just be folded into pwm_get() and
pwm_put(), respectively.

Thierry

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnH4OAAoJEN0jrNd/PrOhp3cP/j4TjISorx/ovCQkOO07XSKt
rt0uGvKUP39KIAgVff5+uE9R4NnR+/aIGOJSssNdE5vQSCc2+FWthQaXXRS6e1Jh
OyPvUOFgQhwfGEc+0WeQLWTBI5r+d/HP4r5/Uu5bVvi1UEhbSz0/pPjoCKI2OK16
IJlAZKwkbU7P8Co7hBfnTQOyblYHFKCaywfyGDtOMVIP7eMoR2935m7wo1o9C5nq
wuDyzcFJ4IfKXWvh/8l+sEz50iPQP40MwetwBw1qz+9c+DJs9yrN+26vOmrhbqjG
eVZ8ObdxeQ5VOxDsOogkAnsgIk4dkyYrGBD23AaAVv9/2pn3tdA6d/zhwMFpIutq
D4RTpAeH6fAAlFCVxWBb42wfLN2qq2UKOZdnij+wx6EIP3Z+GF6665wyFgSqQmpI
Wmf6VJ4e2dUu3FWzNC7S5dxDqTaYFhsuGX08dZI5q5WpCKpq6RpYILdeFy0SO8BT
vWznCnsKQrZoqqDpbR1RxpQ80QZxd2TqsmA45qKebEtlQi5ScKEpS31RUzuSdcKg
AjbNqTL/F7GpeNsj7v53rmCO1g2omrIAs+2R50135v/uHaGFqAkqxlv5gy0azkU0
EoP2EYksLMFuiM9S88JcRyesYwOZgSHrE+NGjbORAOfHWD6yV5lJCED+iJe9IJG/
yR8YLMkKHz9wgwQGn05Z
=nNfY
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
