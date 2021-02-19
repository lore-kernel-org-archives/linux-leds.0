Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C6DC433DB
	for <linux-leds@archiver.kernel.org>; Fri, 19 Feb 2021 10:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C06FC64E43
	for <linux-leds@archiver.kernel.org>; Fri, 19 Feb 2021 10:48:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhBSKsH (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 19 Feb 2021 05:48:07 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46936 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhBSKsG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 05:48:06 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6BE091C0B8A; Fri, 19 Feb 2021 11:47:24 +0100 (CET)
Date:   Fri, 19 Feb 2021 11:47:24 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v13 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20210219104724.GC19207@duo.ucw.cz>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-4-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <1608547554-6602-4-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add LED_FUNCTION_MOONLIGHT definitions
>=20
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

No, sorry, I don't believe we need another define for flash/torch.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+XPAAKCRAw5/Bqldv6
8lIeAJ0bxWGiBnfkBbC4/RxlsGWR6QDCBACgutK9h/9LOXVqS/aDrfS/TD5Iyjc=
=Qqoj
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
