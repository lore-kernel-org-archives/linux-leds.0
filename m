Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7318EC4708C
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 10:04:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54C0B61358
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 10:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbhE1KGQ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 May 2021 06:06:16 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33412 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236404AbhE1KGQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:06:16 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CB17C1C0B76; Fri, 28 May 2021 12:04:40 +0200 (CEST)
Date:   Fri, 28 May 2021 12:04:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/28] leds: el15203000: Give better margin for
 usleep_range()
Message-ID: <20210528100440.GE2209@amd>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-4-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Uwl7UQhJk99r8jnw"
Content-Disposition: inline
In-Reply-To: <20210510095045.3299382-4-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Uwl7UQhJk99r8jnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-10 12:50:20, Andy Shevchenko wrote:
> 1 microsecond with 20 millisecond parameter is too low margin for
> usleep_range(). Give 100 to make scheduler happier.
>=20
> While at it, fix indentation in cases where EL_FW_DELAY_USEC is in use.
> In the loop, move it to the end to avoid a conditional.

Its not like unhappy schedulers are problem...
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--Uwl7UQhJk99r8jnw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwwDgACgkQMOfwapXb+vL+TgCbBnOTrS1VboW4BCT9gM6QpTH2
gEwAoLD8X4eSoXjnvQ0qwo32uTk5rzaK
=W7we
-----END PGP SIGNATURE-----

--Uwl7UQhJk99r8jnw--
