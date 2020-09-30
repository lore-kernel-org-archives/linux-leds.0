Return-Path: <SRS0=EaiZ=DH=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FB2C4727C
	for <linux-leds@archiver.kernel.org>; Wed, 30 Sep 2020 17:10:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B75DA20754
	for <linux-leds@archiver.kernel.org>; Wed, 30 Sep 2020 17:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgI3RKU (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 30 Sep 2020 13:10:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57026 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3RKU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 13:10:20 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 494461C0B81; Wed, 30 Sep 2020 19:10:18 +0200 (CEST)
Date:   Wed, 30 Sep 2020 19:10:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tobias Jordan <kernel@cdqe.de>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: Re: [PATCH] leds: aw2013: fix leak of device node iterator
Message-ID: <20200930171017.GF27760@duo.ucw.cz>
References: <20200925232644.GA17005@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Content-Disposition: inline
In-Reply-To: <20200925232644.GA17005@agrajag.zerfleddert.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In the error path of the for_each_available_child_of_node loop in
> aw2013_probe_dt, add missing call to of_node_put to avoid leaking the
> iterator.
>=20
> Fixes: 59ea3c9faf32 ("leds: add aw2013 driver")
> Signed-off-by: Tobias Jordan <kernel@cdqe.de>

This failed to apply to my -for-next tree.

Best regards,
								Pavel


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S7+QAKCRAw5/Bqldv6
8nNYAJ9s3GCgKstToi/W2qVv+ZwHTw+cOQCgg/tLkKwo2Ialc4q3sXDaYfWahGY=
=658p
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
