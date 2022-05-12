Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887BEC433F5
	for <linux-leds@archiver.kernel.org>; Thu, 12 May 2022 06:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348270AbiELGxc (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 12 May 2022 02:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238889AbiELGxb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 May 2022 02:53:31 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4A920CA71;
        Wed, 11 May 2022 23:53:26 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D85301C0B92; Thu, 12 May 2022 08:53:24 +0200 (CEST)
Date:   Thu, 12 May 2022 08:53:24 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: netxbig: Fix refcount leak in
 netxbig_leds_get_of_pdata
Message-ID: <20220512065323.GA8632@amd>
References: <20220512050253.8987-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <20220512050253.8987-1-linmq006@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not needed anymore.
> When of_find_device_by_node() fails, of_node_put() is missing.

Can you take a look at the code and simplify it? AFAICT the node_put
should go right after

       gpio_ext_pdev =3D of_find_device_by_node(gpio_ext_np);


=2E Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmJ8ruMACgkQMOfwapXb+vKxKgCgq/LbToDnu8kaUevCNBdHaZOZ
AQsAnicnD76UXE6zBRhSWkb9/6Kf7A0I
=dBm7
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
