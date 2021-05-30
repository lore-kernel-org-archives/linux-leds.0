Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829FBC47092
	for <linux-leds@archiver.kernel.org>; Sun, 30 May 2021 21:04:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4569C60FF2
	for <linux-leds@archiver.kernel.org>; Sun, 30 May 2021 21:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhE3VGM (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 30 May 2021 17:06:12 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57502 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhE3VGL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 May 2021 17:06:11 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3DF591C0B7F; Sun, 30 May 2021 23:04:31 +0200 (CEST)
Date:   Sun, 30 May 2021 23:04:30 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] leds: lm36274: Add missed property.h
Message-ID: <20210530210430.GA13716@duo.ucw.cz>
References: <20210530203228.3958241-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20210530203228.3958241-1-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> It appears that property.h has been included in some configurations impli=
citly,
> but in some it's not and hence build may fail. Add missed property.h expl=
icitly.
>=20
> Fixes: e2e8e4e81875 ("leds: lm36274: Correct headers (of*.h -> mod_device=
table.h)")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you, applied.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYLP93gAKCRAw5/Bqldv6
8rffAJ9LFVJ3At3v6NKagM9aK+2RzfpQSQCgpgxrAIMjIrxkw7WoENzI1s197Hc=
=dyrp
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
