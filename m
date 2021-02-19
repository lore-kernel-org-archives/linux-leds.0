Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572A3C433E0
	for <linux-leds@archiver.kernel.org>; Fri, 19 Feb 2021 11:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 032E564E77
	for <linux-leds@archiver.kernel.org>; Fri, 19 Feb 2021 11:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhBSLFT (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 19 Feb 2021 06:05:19 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:48302 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhBSLFP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 06:05:15 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 282181C0B80; Fri, 19 Feb 2021 12:04:17 +0100 (CET)
Date:   Fri, 19 Feb 2021 12:04:16 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@protonmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH v2 0/4] Add support for QCOM SPMI Flash LEDs
Message-ID: <20210219110416.GH19207@duo.ucw.cz>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+QwZB9vYiNIzNXIj"
Content-Disposition: inline
In-Reply-To: <20210126140240.1517044-1-nfraprado@protonmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+QwZB9vYiNIzNXIj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Another thing worth mentioning: for v1 the dt nodes were added in hammerh=
ead's
> dts (just to simplify testing), but I have now moved them to pm8941's dts=
i,
> since it was like that in downstream. So if folks using devices based on
> PM8941/MSM8974 other than the Nexus 5 could test it, that would be great,=
 since
> I have only tested on the Nexus 5.

Please cc phone-devel, there may be people there to help with testing.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--+QwZB9vYiNIzNXIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+bMAAKCRAw5/Bqldv6
8olzAKCoQLoFBHp501DOXkylS/RTtXUV1wCeOqmjK+tmPNLtN2m8imxPj2Zgz20=
=rFph
-----END PGP SIGNATURE-----

--+QwZB9vYiNIzNXIj--
