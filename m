Return-Path: <SRS0=O/xm=EE=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD20C4363A
	for <linux-leds@archiver.kernel.org>; Thu, 29 Oct 2020 18:16:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2EEF20825
	for <linux-leds@archiver.kernel.org>; Thu, 29 Oct 2020 18:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgJ2SQ0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 29 Oct 2020 14:16:26 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36698 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgJ2SQZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 14:16:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 450341C0B7C; Thu, 29 Oct 2020 19:16:24 +0100 (CET)
Date:   Thu, 29 Oct 2020 19:16:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] leds: qcom-lpg: add support for pm8150[bl] leds
Message-ID: <20201029181623.GF26053@duo.ucw.cz>
References: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
 <20201021225100.162795-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline
In-Reply-To: <20201021225100.162795-3-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add support for the LPG/PWM block found on newer PMICs: PM8150B and
> PM8150A/L.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/leds/leds-qcom-lpg.c | 68 ++++++++++++++++++++++++++++++++----
>  1 file changed, 61 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/leds/leds-qcom-lpg.c b/drivers/leds/leds-qcom-lpg.c
> index 86131a65d2c5..4d24e0c973d6 100644
> --- a/drivers/leds/leds-qcom-lpg.c
> +++ b/drivers/leds/leds-qcom-lpg.c
> @@ -48,6 +48,8 @@ struct lpg_data;
>   * @lut_bitmap:	allocation bitmap for LUT entries
>   * @triled_base: base address of the TRILED block (optional)
>   * @triled_src:	power-source for the TRILED
> + * @triled_no_atc_ctl:	true if there is no TRI_LED_ATC_CTL register
> + * @triled_no_src_sel:	true if there is no TRI_LED_SRC_SEL register

Please make logic the other way around. ... triled_has_atc_ctl.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5sG9wAKCRAw5/Bqldv6
8sEiAJ9K2UA9erz7P3IYw9npZ2MKUROJ/wCcDk3HHP6eTsKa1rg8qOEmRM8UpM8=
=WCEj
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
