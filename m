Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8B4EB64DA
	for <linux-leds@archiver.kernel.org>; Sun, 16 Jul 2023 09:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjGPJTh (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 16 Jul 2023 05:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjGPJTf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Jul 2023 05:19:35 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399F1FD
        for <linux-leds@vger.kernel.org>; Sun, 16 Jul 2023 02:19:34 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E870F1C0D21; Sun, 16 Jul 2023 11:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1689499171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lUsMF7/bFEdbKvrKmyOQouKCMfV9T0RzPcenMiphtXI=;
        b=sRuBZtezXtSUEEOAcNGLwJliWcIwNWFP4sDXlrLKTS62uimyGK3ni9viagV4efZfsm3D25
        XeDQXZnrQeza2NkUo21SodQdWTriq3qFaUqe9T/BbqW3c4BvyCE3USqUPFptTKhLomU9mm
        uL4SbKeUC6VQDOhoDgzYEiYhqnuoo/4=
Date:   Sun, 16 Jul 2023 11:19:30 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Beh??n <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 1/3] leds: turris-omnia: change max brightness from
 255 to 1
Message-ID: <20230716091929.GA1182@bug>
References: <20230714085253.13544-1-kabel@kernel.org>
 <20230714085253.13544-2-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714085253.13544-2-kabel@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Using binary brightness makes more sense for this controller, because
> internally in the MCU it works that way: the LED has a color, and a
> state whether it is ON or OFF.

So, controller can do (1, 3, 5) but not (3, 3, 3)?

> The resulting brightness computation with led_mc_calc_color_components()
> will now always result in either (0, 0, 0) or the multi_intensity value.

Won't that limit you to 8 colors total?

I guess I`m confused how this hw works...

Best regards,
									Pavel

>  	init_data.fwnode = &np->fwnode;
>  
>  	cdev = &led->mc_cdev.led_cdev;
> -	cdev->max_brightness = 255;
> +	cdev->max_brightness = 1;
>  	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
>  
>  	/* put the LED into software mode */
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
