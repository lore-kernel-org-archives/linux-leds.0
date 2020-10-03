Return-Path: <SRS0=Mf/o=DK=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1521C41604
	for <linux-leds@archiver.kernel.org>; Sat,  3 Oct 2020 13:56:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85D19206CD
	for <linux-leds@archiver.kernel.org>; Sat,  3 Oct 2020 13:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgJCN4G (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 3 Oct 2020 09:56:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60958 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgJCN4F (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Oct 2020 09:56:05 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9ABDB1C0B81; Sat,  3 Oct 2020 15:56:00 +0200 (CEST)
Date:   Sat, 3 Oct 2020 15:56:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     ultracoolguy@tutanota.com
Cc:     Dmurphy <dmurphy@ti.com>, Linux Leds <linux-leds@vger.kernel.org>,
        Trivial <trivial@kernel.org>, linux-kernel@vger.kernel.org,
        marek.behun@nic.cz
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201003135600.GA25460@duo.ucw.cz>
References: <MIiYgay--3-2@tutanota.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <MIiYgay--3-2@tutanota.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Signed-off-by: Ultracoolguy <ultracoolguy@tutanota.com>

I'll need your real name to apply a patch.

> Hi, all. This is a patch fixing an out-of-bounds error due to lm3697_init=
 expecting the device tree to use both control banks.=A0 This fixes it by a=
dding a new variable that will hold the number of used banks.
>=20
> Panic caused by this bug:

> <7>[=A0=A0=A0 3.059893] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G=A0=A0=A0=
=A0=A0=A0=A0 W=A0=A0=A0=A0=A0=A0=A0=A0 5.9.0-rc7-postmarketos-qcom-msm8953 =
#71

Ok, so I assume this is only problem with certain device trees, and
not a problem with dts' in mainline?

This is not trivial patch, no need to cc trivial tree. OTOH Ccing
Marek who did a lot of cleanups in -next might be useful. Doing that
now.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3iC8AAKCRAw5/Bqldv6
8sa3AJ9JF0aojI2xKqcCGsgNFNF9jNonnACff9gr5JH8H6PkzXYth1TF7HrA/hI=
=Vfbg
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
