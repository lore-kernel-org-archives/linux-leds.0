Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1D7C433F5
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 09:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFDC060F21
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 09:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhINJSS (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 14 Sep 2021 05:18:18 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44970 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhINJSR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Sep 2021 05:18:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AA45F1C0BA5; Tue, 14 Sep 2021 11:16:59 +0200 (CEST)
Date:   Tue, 14 Sep 2021 11:16:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Donovan Drews <donovancarldrews@gmail.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: Fix bank enable mask
Message-ID: <20210914091658.GA31657@amd>
References: <20210828214253.16207-1-donovancarldrews@gmail.com>
 <CAHP10D8mwCb-_dacVDiLTQkr-YzppNAydR76kSG=YP-xZhK0Uw@mail.gmail.com>
 <20210913091650.GA11752@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20210913091650.GA11752@amd>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Just bumping this patch in case it was overlooked.
>=20
> Please don't. Patches are not usually merged during the -rc1 time.
>=20
> Best regards,
> 								Pavel
>=20
> > On Sat, Aug 28, 2021 at 2:43 PM DonDrews <donovancarldrews@gmail.com> w=
rote:
> >=20
> > >         Fixes an issue where previously 0 is used as a sentinel when
> > >         moving device tree configuration into the bank enable mask. T=
his
> > >         prevented the first LED from being added to bank control.

Remove whitespace at the start of the line.

> > > Signed-off-by: DonDrews <donovancarldrews@gmail.com>

And I'll need your full name here.

Fixes: tag if you want this to go to stable would not hurt.

Otherwise looks good.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmFAaIoACgkQMOfwapXb+vJxMACdHSLrf/vT7JDs8REPIN3/eaeO
ZvgAn1ucPS2vKIAgGWGvGMggxNc5lWoV
=sFKN
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
