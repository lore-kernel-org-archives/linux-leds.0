Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FBBEB64DA
	for <linux-leds@archiver.kernel.org>; Wed, 12 Jul 2023 14:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjGLOYk (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbjGLOYk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Jul 2023 10:24:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76E91993;
        Wed, 12 Jul 2023 07:24:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D53B617E8;
        Wed, 12 Jul 2023 14:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE7FC433C8;
        Wed, 12 Jul 2023 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689171878;
        bh=LO3gFDTc1LRhsbk/RpDGQZEDw/RAtTG3QAU5D15yh+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G+fTQEXGuEELYh+u/uccbV4r70V6l+MkZloBynSlAcL+m14Eu/8O/NnHL/B7FhW+k
         SjJwnVGpp+HjjW9vVMJImBEIsQ4xM1PkpjYSJXanEGlZm4zlFdO8IoIQxRcWJe+auG
         GjDJ1I9U7TSOJ6oCMJhyAfuBxWBkpcKjkn9UXXqoI+lqEq0c880oCIBLa4hsjU54Ew
         KErbX4pP5soOewF/rzdjfdlVcB9G4lggEMi3St3yQeJYvoD1BGDJqQvZTisC9G1Oed
         8RMg4lm/OECBX684//FB3h+gtmHzrlf8uHQ0jEd3FrojNABQ6CW1XmyhaGJ/K3qrXa
         qVcmvKEIqkjYQ==
Date:   Wed, 12 Jul 2023 15:24:33 +0100
From:   Lee Jones <lee@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Martin Kurbanov <mmkurbanov@sberdevices.ru>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: aw200xx: Fix error code in probe()
Message-ID: <20230712142433.GF10768@google.com>
References: <4d791b69-01c7-4532-818c-63712d3f63e1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d791b69-01c7-4532-818c-63712d3f63e1@moroto.mountain>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 23 Jun 2023, Dan Carpenter wrote:

> The "ret" variable is zero/success here.  Don't return that, return
> -EINVAL instead.
> 
> Fixes: 36a87f371b7a ("leds: Add AW20xx driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/leds/leds-aw200xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
