Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AC9C433E6
	for <linux-leds@archiver.kernel.org>; Mon,  1 Mar 2021 10:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CE4364D90
	for <linux-leds@archiver.kernel.org>; Mon,  1 Mar 2021 10:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbhCAKkb (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 1 Mar 2021 05:40:31 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:55612 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234562AbhCAKjq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Mar 2021 05:39:46 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 114CA1C0B76; Mon,  1 Mar 2021 11:38:53 +0100 (CET)
Date:   Mon, 1 Mar 2021 11:38:52 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     netdev@vger.kernel.org, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Ben Whitten <ben.whitten@gmail.com>
Subject: Re: [PATCH RFC leds + net-next 3/7] leds: trigger: add API for HW
 offloading of triggers
Message-ID: <20210301103852.GB31897@duo.ucw.cz>
References: <20201030114435.20169-1-kabel@kernel.org>
 <20201030114435.20169-4-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <20201030114435.20169-4-kabel@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> If the trigger with given configuration cannot be offloaded, the method
> should return -EOPNOTSUPP, in which case the trigger must blink the LED
> in SW.
>=20
> Signed-off-by: Marek Beh=FAn <kabel@kernel.org>

> +
> +If the second argument (enable) to the trigger_offload() method is false=
, any
> +active HW offloading must be deactivated.

Are errors permitted in the "disable" case?

> +static inline void led_trigger_offload_stop(struct led_classdev *led_cde=
v)
> +{
> +	if (!led_cdev->trigger_offload)
> +		return;
> +
> +	if (led_cdev->offloaded)
> +		led_cdev->trigger_offload(led_cdev, false);
> +}

Set offloaded to false?

Let me check the rest to decide if this makes sense.

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYDzEPAAKCRAw5/Bqldv6
8nF+AJ0dEgQX8EyDrYeYcGLpQlphEAh3zgCgp/ylg5hBQbtC9IOIH5n1CYp7fW0=
=lg9m
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
