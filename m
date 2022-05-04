Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D186BC4321E
	for <linux-leds@archiver.kernel.org>; Wed,  4 May 2022 18:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376492AbiEDSJ3 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 4 May 2022 14:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376874AbiEDSI6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:08:58 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383BE73054;
        Wed,  4 May 2022 10:24:31 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 094F61C0BBB; Wed,  4 May 2022 19:24:30 +0200 (CEST)
Date:   Wed, 4 May 2022 19:24:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        patrick@stwcx.xyz, andy.shevchenko@gmail.com,
        openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: Re: [PATCH v3 3/4] leds: pca955x: Optimize probe led selection
Message-ID: <20220504172429.GF1623@bug>
References: <20220411162033.39613-1-eajames@linux.ibm.com>
 <20220411162033.39613-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411162033.39613-4-eajames@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Previously, the probe function might do up to 32 reads and writes
> to the same 4 registers to program the led selection. Reduce this to
> a maximum of 8 operations by accumulating the changes to the led
> selection and comparing with the previous value to write the
> selection if different.

We have regmap APIs. You are free to use them if you really care about
those few reads. Reimplementing them by hand is not acceptable. How big is 
the seedup here?

Best regards,
								Pavel

> @@ -554,6 +556,15 @@ static int pca955x_probe(struct i2c_client *client)
>  	init_data.devname_mandatory = false;
>  	init_data.devicename = "pca955x";
>  
> +	nls = pca955x_num_led_regs(chip->bits);
> +	for (i = 0; i < nls; ++i) {
> +		err = pca955x_read_ls(pca955x, i, &ls1[i]);
> +		if (err)
> +			return err;
> +
> +		ls2[i] = ls1[i];
> +	}
> +
>  	for (i = 0; i < chip->bits; i++) {
>  		pca955x_led = &pca955x->leds[i];
>  		pca955x_led->led_num = i;
> @@ -624,6 +634,14 @@ static int pca955x_probe(struct i2c_client *client)
>  		}
>  	}
>  
> +	for (i = 0; i < nls; ++i) {
> +		if (ls1[i] != ls2[i]) {
> +			err = pca955x_write_ls(pca955x, i, ls2[i]);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
>  	/* PWM0 is used for half brightness or 50% duty cycle */
>  	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
>  	if (err)

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
