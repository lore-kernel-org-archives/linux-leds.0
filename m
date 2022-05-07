Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC5CC433F5
	for <linux-leds@archiver.kernel.org>; Sat,  7 May 2022 21:19:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387466AbiEGVW5 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 7 May 2022 17:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245719AbiEGVW4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 7 May 2022 17:22:56 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0152725;
        Sat,  7 May 2022 14:19:09 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C6ED81C0BA6; Sat,  7 May 2022 23:19:07 +0200 (CEST)
Date:   Sat, 7 May 2022 23:19:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: qcom-lpg: Add compatible for
 PM660L LPG block
Message-ID: <20220507211907.GF11004@duo.ucw.cz>
References: <20220504205704.699500-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GLp9dJVi+aaipsRk"
Content-Disposition: inline
In-Reply-To: <20220504205704.699500-1-marijn.suijten@somainline.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--GLp9dJVi+aaipsRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Document the availability of an LPG configuration for the PM660L PMIC in
> the Qualcomm Light Pulse Generator driver.

Thank you, but I could not apply it. Can you collect reviews and
resend? I'll only be able to apply first two.

Best regards,
							Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--GLp9dJVi+aaipsRk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnbiSwAKCRAw5/Bqldv6
8sYaAJ9d519U7+1jCcA/aH+chSf6UjiowwCfYe85zKLIVLOw3A9Akq25Jzg9Ue8=
=pQAJ
-----END PGP SIGNATURE-----

--GLp9dJVi+aaipsRk--
