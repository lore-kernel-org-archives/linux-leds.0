Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83262C433E6
	for <linux-leds@archiver.kernel.org>; Thu,  4 Mar 2021 12:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 530F564F21
	for <linux-leds@archiver.kernel.org>; Thu,  4 Mar 2021 12:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240127AbhCDMJV (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 4 Mar 2021 07:09:21 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:48058 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240369AbhCDMJQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Mar 2021 07:09:16 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 39FCF1C0B8A; Thu,  4 Mar 2021 13:08:34 +0100 (CET)
Date:   Thu, 4 Mar 2021 13:08:33 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     qiuxiaojin <qxj511mail@gmail.com>
Cc:     dmurphy@ti.com, qiuxiaojin@cvte.com, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: add touch screen LED triggers
Message-ID: <20210304120833.GA21533@duo.ucw.cz>
References: <20210304120449.10441-1-qiuxiaojin@cvte.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20210304120449.10441-1-qiuxiaojin@cvte.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-03-04 20:04:49, qiuxiaojin wrote:
> Some LED devices support touch screen.
> This patch enables direct LED trigger controls by the driver.
> touch screen or pressure can be done simply by other driver space.
> Two trigger APIs are added, ledtrig_touch_panel_ctrl()
> and ledtrig_touch_pressure_ctrl().

Why?

> Signed-off-by: qiuxiaojin <qiuxiaojin@cvte.com>

Need real name and matching from: and signed-off.

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYEDNwQAKCRAw5/Bqldv6
8n1SAJwPWRhbl4PXRt1PDqC298S+XkcWZwCglsC+Asqf1nPmvk4GnZgL8FeDXRk=
=txmO
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
