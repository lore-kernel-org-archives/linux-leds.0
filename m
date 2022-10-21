Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F83CC433FE
	for <linux-leds@archiver.kernel.org>; Fri, 21 Oct 2022 13:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiJUNKK (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 21 Oct 2022 09:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiJUNKF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 21 Oct 2022 09:10:05 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64E1BC61B;
        Fri, 21 Oct 2022 06:09:51 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C67351C09D6; Fri, 21 Oct 2022 15:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1666357725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tA4VVF/5mJdTqrprHndtKRiYsUiXim9pA/NSbFuYx+w=;
        b=UuklZPUvRWZRTiez/dBmhtGqXT8KwjCD7Mc5OZc/qB0w/+fN4qkswgBc0GWoKHYL33BE46
        y8nXBwhA7NbUJbKK69rEjTNZdW+LRh8u0jWlFvuD4B1yNIJpVYJGT2PPydNzCDa7iLTxUg
        XuS6TFsCse5ifAaLk9Lbg1ioJIUpFXI=
Date:   Fri, 21 Oct 2022 15:08:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] leds-pca955x: Remove the unused function
 pca95xx_num_led_regs()
Message-ID: <20221021130845.GA16264@duo.ucw.cz>
References: <20221017081053.52388-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20221017081053.52388-1-jiapeng.chong@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The function pca95xx_num_led_regs() is defined in the leds-pca955x.c
> file, but not called elsewhere, so delete this unused function.
>=20
> drivers/leds/leds-pca955x.c:149:19: warning: unused function 'pca95xx_num=
_led_regs'.

Thank you, applied.

Best regards,
									Pavel


> +++ b/drivers/leds/leds-pca955x.c
> @@ -145,12 +145,6 @@ static inline int pca95xx_num_input_regs(int bits)
>  	return (bits + 7) / 8;
>  }
> =20
> -/* 4 bits per LED selector register */
> -static inline int pca95xx_num_led_regs(int bits)
> -{
> -	return (bits + 3)  / 4;
> -}
> -
>  /*
>   * Return an LED selector register value based on an existing one, with
>   * the appropriate 2-bit state value set for the given LED number (0-3).

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY1KZ3QAKCRAw5/Bqldv6
8nMaAJ43HmLO4zeFHwMAiePUeNJgL3pThgCdFbbgxqTMLO9ylnTp4j8ny+YOHks=
=1LkM
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
