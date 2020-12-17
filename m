Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AA1C4361B
	for <linux-leds@archiver.kernel.org>; Thu, 17 Dec 2020 20:54:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AA4E233E2
	for <linux-leds@archiver.kernel.org>; Thu, 17 Dec 2020 20:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729111AbgLQUyE (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Dec 2020 15:54:04 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44258 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgLQUyE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Dec 2020 15:54:04 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 791B11C0B7D; Thu, 17 Dec 2020 21:53:21 +0100 (CET)
Date:   Thu, 17 Dec 2020 21:53:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     marek.behun@nic.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 -next] leds: ss4200: simplify the return expression of
 register_nasgpio_led()
Message-ID: <20201217205321.GB27883@duo.ucw.cz>
References: <20201214063149.1970-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline
In-Reply-To: <20201214063149.1970-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-12-14 14:31:49, Zheng Yongjun wrote:
> Simplify the return expression.
>=20
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Thanks, applied.
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9vFQQAKCRAw5/Bqldv6
8nLbAKCiV3t4iTpt6TN6HhuA1IOJtJu30wCfSonIb75cBifsX0O/waEkfscwgok=
=K6G7
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
