Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1645C433B4
	for <linux-leds@archiver.kernel.org>; Sun, 25 Apr 2021 20:38:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9938761260
	for <linux-leds@archiver.kernel.org>; Sun, 25 Apr 2021 20:38:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhDYUjK (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 25 Apr 2021 16:39:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48460 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDYUjJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 16:39:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 439871C0B77; Sun, 25 Apr 2021 22:38:27 +0200 (CEST)
Date:   Sun, 25 Apr 2021 22:38:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Colin King <colin.king@canonical.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Amireddy Mallikarjuna <mallikarjunax.reddy@linux.intel.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] leds: lgm: Fix spelling mistake "prepate" ->
 "prepare"
Message-ID: <20210425203825.GC10996@amd>
References: <20210222134939.1510720-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline
In-Reply-To: <20210222134939.1510720-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> There is a spelling mistake in a dev_err error message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCF00EACgkQMOfwapXb+vKosQCfd5cbyZ/YvBNkdvF3mwm6gtyj
01EAn2cSiUeZkrI6hmm6c3DaPiiRBW7U
=xVQg
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
