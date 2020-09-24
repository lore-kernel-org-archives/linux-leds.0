Return-Path: <SRS0=GPQo=DB=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB096C4363D
	for <linux-leds@archiver.kernel.org>; Thu, 24 Sep 2020 12:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 674F023787
	for <linux-leds@archiver.kernel.org>; Thu, 24 Sep 2020 12:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbgIXMTe (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 24 Sep 2020 08:19:34 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37206 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727449AbgIXMTe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 08:19:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EED1C1C0BCB; Thu, 24 Sep 2020 14:19:31 +0200 (CEST)
Date:   Thu, 24 Sep 2020 14:19:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        marek.behun@nic.cz
Subject: Re: [PATCH 2/2] leds: lm36274: Fix warning for undefined parameters
Message-ID: <20200924121931.GG3933@duo.ucw.cz>
References: <20200922190638.5323-1-dmurphy@ti.com>
 <20200922190638.5323-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Content-Disposition: inline
In-Reply-To: <20200922190638.5323-2-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-22 14:06:38, Dan Murphy wrote:
> Fix warnings for undefined parameters when building with W=3D1.
>

It also adds of_match_table. I guess that's okay.

I'll remove the fixes tags as I don't believe these need to go to
stable.

Best regards,
								Pavel
    =20

> Fixes: 11e1bbc116a75 ("leds: lm36274: Introduce the TI LM36274 LED driver=
")
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-lm36274.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
> index 10a63b7f2ecc..bf6487e9a1f4 100644
> --- a/drivers/leds/leds-lm36274.c
> +++ b/drivers/leds/leds-lm36274.c
> @@ -26,8 +26,8 @@
>   * @lmu_data: Register and setting values for common code
>   * @regmap: Devices register map
>   * @dev: Pointer to the devices device struct
> - * @led_sources - The LED strings supported in this array
> - * @num_leds - Number of LED strings are supported in this array
> + * @led_sources: The LED strings supported in this array
> + * @num_leds: Number of LED strings are supported in this array
>   */
>  struct lm36274 {
>  	struct platform_device *pdev;
> @@ -163,6 +163,7 @@ static struct platform_driver lm36274_driver =3D {
>  	.probe  =3D lm36274_probe,
>  	.driver =3D {
>  		.name =3D "lm36274-leds",
> +		.of_match_table =3D of_lm36274_leds_match,
>  	},
>  };
>  module_platform_driver(lm36274_driver)
> --=20
> 2.28.0

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2yO0wAKCRAw5/Bqldv6
8lQ9AJsGzVOGQ0FpAYHwJm2pqZhnS8ibNQCfcdKYbqBU6TSpmVLxQEaP97LqiOc=
=SguN
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
