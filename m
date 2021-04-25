Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002AEC433B4
	for <linux-leds@archiver.kernel.org>; Sun, 25 Apr 2021 20:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5EDF61249
	for <linux-leds@archiver.kernel.org>; Sun, 25 Apr 2021 20:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhDYUiO (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 25 Apr 2021 16:38:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48414 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDYUiO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 16:38:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C0DBC1C0B77; Sun, 25 Apr 2021 22:37:32 +0200 (CEST)
Date:   Sun, 25 Apr 2021 22:37:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmurphy@ti.com
Subject: Re: [PATCH v2 -next] leds: convert comma to semicolon
Message-ID: <20210425203732.GA13414@amd>
References: <20210108092446.19547-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20210108092446.19547-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri 2021-01-08 17:24:46, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.

Thanks, applied.
							Pavel
						=09
--=20
http://www.livejournal.com/~pavelmachek

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCF0wwACgkQMOfwapXb+vJzQACdFNN9VXk3Q7g0KW2wR7zjh9ff
yEIAnAg0O4VYqEr5Ot+GLr9penPbudQr
=+1uY
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
