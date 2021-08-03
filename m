Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BDEC4338F
	for <linux-leds@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D21EB60725
	for <linux-leds@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhHCVrX (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 3 Aug 2021 17:47:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39304 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhHCVrX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 17:47:23 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A5E6F1C0B76; Tue,  3 Aug 2021 23:47:10 +0200 (CEST)
Date:   Tue, 3 Aug 2021 23:47:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] leds: lm3697: Update header block to reflect
 reality
Message-ID: <20210803214709.GB30387@amd>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
 <20210529111935.3849707-9-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20210529111935.3849707-9-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Currently the headers to be included look rather like a random set.
> Update them a bit to reflect the reality.
>=20
> While at it, drop unneeded dependcy to OF.

3-9 applied, thanks.
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEJuV0ACgkQMOfwapXb+vIS4wCfTY17EkykVNpAv1vgVPXrfGEz
83EAnRqIwolpzRPoCRSTGfyZD17QI1EW
=4Axz
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
