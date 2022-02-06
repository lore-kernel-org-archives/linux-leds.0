Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A15C433EF
	for <linux-leds@archiver.kernel.org>; Sun,  6 Feb 2022 11:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbiBFLEi (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 6 Feb 2022 06:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiBFLEi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Feb 2022 06:04:38 -0500
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6801C06173B
        for <linux-leds@vger.kernel.org>; Sun,  6 Feb 2022 03:04:37 -0800 (PST)
Message-ID: <0df04a77-6765-f9bd-a678-9016d0c0c5d5@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1644145476;
        bh=IZQnnziWkU5df/txtb3Vl3B5mN0yuJO3G3RnGpTiv68=;
        h=Subject:To:Cc:References:From:In-Reply-To;
        b=EvVeTEum3dgPnnTKYjRHne3jSuHfLPBl7mcaKwvCxrOlY/ccjTOkXvXMc07Er6mAc
         ZBmUMLx09YmSYDS8sI8BxpGKqpXkXOapOK2dJ6jEoQB8sgI+gJkwSe7MzQhdUX9oxQ
         jEhLLmQAued/KKvGSOGbhIDLf3QFUQf+f5LaLtEn0A1AKGEq72gSTEOrqqfCLfWKQa
         zUdl2OoZcv95DaMGJqb0XL5HE+tcGtDnx6RCtlEJelPeAaQhGQQSm56VRA9DgCoSp/
         hrcstkoZoeaUv204MLK+FBsCSdpi6mzlEaRyrIYzxXIzc+DHDXQXE3Kfbz/O04Ib5E
         Ce6p7+wixq9tA==
Date:   Sun, 6 Feb 2022 12:04:34 +0100
Mime-Version: 1.0
Subject: Re: [PATCH v3 2/2] leds: Add PWM multicolor driver
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        "post@lespocky.de" <post@lespocky.de>
References: <20220126104844.246068-1-sven@svenschwermer.de>
 <20220126104844.246068-3-sven@svenschwermer.de>
 <CAHp75VfMTCvgib__PhnfB_g7xLhyNws5TDRyMVyzuAkT1ydY_w@mail.gmail.com>
 <20f95cfd-a851-af4f-1c60-45f2ca238e10@svenschwermer.de>
 <CAHp75VeSD5bYERp=s9Dzd0xScVc+sYSdc8W4XBfCVXJgyWMPyA@mail.gmail.com>
From:   Sven Schwermer <sven@svenschwermer.de>
In-Reply-To: <CAHp75VeSD5bYERp=s9Dzd0xScVc+sYSdc8W4XBfCVXJgyWMPyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> Skipping mutex destruction is not critical, but in general if you wish 
> to free allocated resource, it should be done in reversed order...
As far as I can tell, the ordering is already reversed:

mcnode = device_get_named_child_node(&pdev->dev, "multi-led");
/* ... */
mutex_init(&priv->lock);
/* ... */
fwnode_for_each_child_node(mcnode, fwnode) {
     /* ... */
     fwnode_handle_put(fwnode);
     goto destroy_mutex;
     /* ... */
}
/* ... */
destroy_mutex:
     mutex_destroy(&priv->lock);
release_mcnode:
     fwnode_handle_put(mcnode);
out:
     return ret;

>             +destroy_mutex:
>             +       mutex_destroy(&priv->lock);
> 
> 
>         Wrong ordering here and in ->remove().
> 
>         Don't mix devm_* with non-devm_* calls.
> 
>     What do you mean by this?
> 
> 
> ...which is exactly the issue with this code because of the use of 
> devm_*() calls mixed with non-devm_*() ones.
> 
> TL;DR: ordering is broken here. And to fix it you need either a) to 
> convert all calls to be devm_*(), or b) make them all non-devm, or c) 
> regroup resource allocation so that all devm followed by non-devm ones.Which non-devm calls are you referring to?

Thanks for your patience,
Sven
