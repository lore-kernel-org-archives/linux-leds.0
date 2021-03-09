Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2925C433E0
	for <linux-leds@archiver.kernel.org>; Tue,  9 Mar 2021 18:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 793E46523D
	for <linux-leds@archiver.kernel.org>; Tue,  9 Mar 2021 18:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhCISI5 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 9 Mar 2021 13:08:57 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:34048 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhCISIx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Mar 2021 13:08:53 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8919B1C0B7A; Tue,  9 Mar 2021 19:08:51 +0100 (CET)
Date:   Tue, 9 Mar 2021 19:08:51 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Arnd Bergmann <arnd@kernel.org>, rafael.j.wysocki@intel.com
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Intel, please maintain your drivers was Re: [PATCH] leds: lgm: fix
 gpiolib dependency
Message-ID: <20210309180851.GA4669@duo.ucw.cz>
References: <20210308153052.2353885-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <20210308153052.2353885-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Without gpiolib, the driver fails to build:
>=20
>     drivers/leds/blink/leds-lgm-sso.c:123:19: error: field has incomplete=
 type 'struct gpio_chip'
>             struct gpio_chip chip;
>                              ^

Thanks, applied.

I'd like people from Intel to contact me. There's more to fix there,
and AFAICT original author went away.

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYEe5swAKCRAw5/Bqldv6
8g/BAKChV/y8/zyZH3eUHuuZxTtxolrmFQCfXSS4rIX4JrvPLkCXXICRu0eWr0o=
=hNjL
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
