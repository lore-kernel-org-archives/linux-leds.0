Return-Path: <SRS0=TsxB=D5=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A85C388F2
	for <linux-leds@archiver.kernel.org>; Thu, 22 Oct 2020 10:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A453223BF
	for <linux-leds@archiver.kernel.org>; Thu, 22 Oct 2020 10:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896288AbgJVKGy (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 22 Oct 2020 06:06:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35608 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896266AbgJVKGx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Oct 2020 06:06:53 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6B9491C0B7D; Thu, 22 Oct 2020 12:06:52 +0200 (CEST)
Date:   Thu, 22 Oct 2020 12:06:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH leds] Documentation: leds: remove invalidated information
Message-ID: <20201022100652.GB26350@duo.ucw.cz>
References: <20201019110808.10689-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline
In-Reply-To: <20201019110808.10689-1-kabel@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The contents of the Future Development section of leds-class
> Documentation was invalidated when support for LED-private triggers
> was merged. Remove this section.
>=20
> Signed-off-by: Marek Beh=FAn <kabel@kernel.org>
> Fixes: 93690cdf3060 ("leds: trigger: add support for LED-private
> device...")

Okay, I can take this -- when -rc1 is released.

OTOH... having few lines there explaining that some triggers are just
for one LED might be nice... as a separate patch :-).

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5FZvAAKCRAw5/Bqldv6
8jd8AJ4kFbhKDzAkV2GX/AMhL4ztyVD27QCeLCppb13MI9EewCdR95fdzevruIo=
=jqDt
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
