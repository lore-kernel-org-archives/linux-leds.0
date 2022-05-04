Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CB3C433FE
	for <linux-leds@archiver.kernel.org>; Wed,  4 May 2022 18:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344735AbiEDSNr (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 4 May 2022 14:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376717AbiEDSN2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:13:28 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646CB5B89D;
        Wed,  4 May 2022 10:32:38 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C07BC1C0BCC; Wed,  4 May 2022 19:32:36 +0200 (CEST)
Date:   Wed, 4 May 2022 19:32:36 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 0/4] Add PM8350C PMIC PWM support for backlight
Message-ID: <20220504173236.GA8725@duo.ucw.cz>
References: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series depends on [1], which adds driver for Qualcomm LPG.
>=20
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=3D615848

Thank you, I added 1 and 2 of the series.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnK4tAAKCRAw5/Bqldv6
8jYeAJ9Fzqbb3LiztndHby6NFpeqAvotPQCfUsKmBx9AzEGthW+cMnk/R5xefY4=
=/ZCF
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
