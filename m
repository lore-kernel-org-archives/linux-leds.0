Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC066C4361B
	for <linux-leds@archiver.kernel.org>; Thu, 17 Dec 2020 20:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83DBC233E2
	for <linux-leds@archiver.kernel.org>; Thu, 17 Dec 2020 20:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731110AbgLQUyi (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Dec 2020 15:54:38 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44304 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbgLQUyh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Dec 2020 15:54:37 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 49E241C0BA6; Thu, 17 Dec 2020 21:53:54 +0100 (CET)
Date:   Thu, 17 Dec 2020 21:53:53 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] leds: leds-lm3533: convert comma to semicolon
Message-ID: <20201217205353.GC27883@duo.ucw.cz>
References: <20201216131653.14827-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline
In-Reply-To: <20201216131653.14827-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-12-16 21:16:53, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.

> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Thanks, applied.
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9vFYQAKCRAw5/Bqldv6
8rRVAKCqSJD86dWzK9OKLAWp+QuFe8wKWwCePOIKfMXQGAIlsHgYrfeLZadMnDA=
=deJh
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
