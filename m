Return-Path: <SRS0=BIkm=DD=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B27C4727D
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 01:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 065CF2075A
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 01:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601083473;
	bh=0ufQlNsRRx9NSNO7HzrPQhwnxasobcXS489JmiK12sk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=uKzRYROnFebd7ZI6sdwF1thEXQFom7HOx7D4CpJiV1JUe7Vt/939utiGsnnkEPVIM
	 l++Hh+rSW7RQ0wM9/dedxAVRQTzfKZaq6XlKJsi82WkNJYxv96KwU0DM7RM+VuIgPk
	 v9uPYHsyEmf2hywComGJvaO9bPyjajNAlbrqK+TY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbgIZBY0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Sep 2020 21:24:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:56568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728935AbgIZBYL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 25 Sep 2020 21:24:11 -0400
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 786C020878;
        Sat, 26 Sep 2020 01:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601083450;
        bh=0ufQlNsRRx9NSNO7HzrPQhwnxasobcXS489JmiK12sk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tbFKkwONDpAHgYcVZan/Q48SIV5/6eI8ZrOubYyRdFPKTFTE7gL4KoSAIphDpHTww
         Fawdl4e2FsEb+yeGTAOcDXV+1jiARuZ0gNBrdbw5Adrz8U5BCTwS4RJdGHcYypiEOY
         EnyFgF8rrFH8lbMXsJu93/PJgUFkMV+3oQD4Gf+g=
Date:   Sat, 26 Sep 2020 03:24:06 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Tobias Jordan <kernel@cdqe.de>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2] leds: tlc591xx: fix leak of device node iterator
Message-ID: <20200926032406.00c7cfb2@kernel.org>
In-Reply-To: <20200926005117.GA32209@agrajag.zerfleddert.de>
References: <20200926005117.GA32209@agrajag.zerfleddert.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 26 Sep 2020 02:51:17 +0200
Tobias Jordan <kernel@cdqe.de> wrote:

> In one of the error paths of the for_each_child_of_node loop in
> tlc591xx_probe, add missing call to of_node_put.
>=20
> Fixes: 1ab4531ad132 ("leds: tlc591xx: simplify driver by using the
> managed led API")
>=20
> Signed-off-by: Tobias Jordan <kernel@cdqe.de>
> ---
> v2: rebased to Pavel's for-next branch
>=20
>  drivers/leds/leds-tlc591xx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
> index f24271337bd8..5b9dfdf743ec 100644
> --- a/drivers/leds/leds-tlc591xx.c
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -205,10 +205,12 @@ tlc591xx_probe(struct i2c_client *client,
>  		led->ldev.max_brightness =3D TLC591XX_MAX_BRIGHTNESS;
>  		err =3D devm_led_classdev_register_ext(dev, &led->ldev,
>  						     &init_data);
> -		if (err < 0)
> +		if (err < 0) {
> +			of_node_put(child);
>  			return dev_err_probe(dev, err,
>  					     "couldn't register LED %s\n",
>  					     led->ldev.name);
> +		}
>  	}
>  	return 0;
>  }

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
