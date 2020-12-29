Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF846C433DB
	for <linux-leds@archiver.kernel.org>; Tue, 29 Dec 2020 16:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CE8920825
	for <linux-leds@archiver.kernel.org>; Tue, 29 Dec 2020 16:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgL2QFe (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 29 Dec 2020 11:05:34 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46994 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgL2QFe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Dec 2020 11:05:34 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0F3BA1C0B7C; Tue, 29 Dec 2020 17:04:51 +0100 (CET)
Date:   Tue, 29 Dec 2020 17:04:50 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dylan Van Assche <me@dylanvanassche.be>
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: gpio: Set max brightness to 1
Message-ID: <20201229160450.GA9564@duo.ucw.cz>
References: <20201229142440.31916-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20201229142440.31916-1-me@dylanvanassche.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> GPIO LEDs only know 2 states: ON or OFF and do not have PWM capabilities.
> However, the max brightness is reported as 255.
>=20
> This patch sets the max brightness value of a GPIO controlled LED to 1.
>=20
> Tested on my PinePhone 1.2.
>=20
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
> v2 drops an obsolete change in include/linux/leds.h

I thought that one looked odd.

> +++ b/drivers/leds/leds-gpio.c
> @@ -96,7 +96,8 @@ static int create_gpio_led(const struct gpio_led *templ=
ate,
>  	} else {
>  		state =3D (template->default_state =3D=3D LEDS_GPIO_DEFSTATE_ON);
>  	}
> -	led_dat->cdev.brightness =3D state ? LED_FULL : LED_OFF;
> +	led_dat->cdev.brightness =3D state ? LED_ON : LED_OFF;
> +	led_dat->cdev.max_brightness =3D LED_ON;

Would simpler version work:

> +	led_dat->cdev.brightness =3D state;
> +	led_dat->cdev.max_brightness =3D 1;

? Easier to understand... I'd prefer that version unless it causes
warnings or something.

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+tTogAKCRAw5/Bqldv6
8q5gAJ94hjKKxVWQMxuwtttZ0iJVnaTPygCePsBZqRHQmvNPgOR/nF4blVwn6Sc=
=qyHF
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
