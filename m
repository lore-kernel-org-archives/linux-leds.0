Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68579C433EF
	for <linux-leds@archiver.kernel.org>; Mon, 23 May 2022 16:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238835AbiEWQan (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 23 May 2022 12:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238830AbiEWQam (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 May 2022 12:30:42 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5378668F9C;
        Mon, 23 May 2022 09:30:41 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D6BF51C0B82; Mon, 23 May 2022 18:30:38 +0200 (CEST)
Date:   Mon, 23 May 2022 18:30:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Message-ID: <20220523163038.GA9124@duo.ucw.cz>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20170323055435.29197-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> PMICs from Qualcomm. It can operate on fixed parameters or based on a
> lookup-table, altering the duty cycle over time - which provides the
> means for e.g. hardware assisted transitions of LED brightness.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I'd really like to see the patch fixing the pattern interface (or
disabling it). I don't want to push the tree to Linus with that bug.

Thanks,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYou2rgAKCRAw5/Bqldv6
8up+AJ4nHtgQLA7di0YaokaMVDO+tfKsAACghM0AeWQIYIv8bXxObK6a+Ye8csM=
=Aahg
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
