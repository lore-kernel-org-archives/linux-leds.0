Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028F7C00A5A
	for <linux-leds@archiver.kernel.org>; Thu, 19 Jan 2023 16:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjASQS0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 19 Jan 2023 11:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjASQSM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Jan 2023 11:18:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141204FCEB;
        Thu, 19 Jan 2023 08:18:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C95861CBD;
        Thu, 19 Jan 2023 16:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F26C433D2;
        Thu, 19 Jan 2023 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674145084;
        bh=KPB9grz4uvPJpF4QpoFc6YTHB9fcdI0QZLt3JLksYgk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KseCt10wUfr4FTjsx7zyulL8S7ZmllLdt7pkJu2f3aEYLGrvbT9L32Lvp8V6vizWe
         TGkRUL7kNvurFIHTVBuviKZXPNFvh1r0Kclr8cyMed3fXBDz/4Rcnn2gCYmlABo8PW
         baljXHIydxYZON3PyeYiiV8HjfHw+u7n0+fhlPrxevP9IZn4wk0YfEbKgh9EFz0ugi
         CMO+CIflYwFFsIYqgr7TQWLQQQa896zXdqX9JovSP84bdmz3kAJVaGmQmiey5inXId
         pElZ1dfzyuMowMlXbzC8579IIqd+rzxb+02ozF8fG6IaIHVweUltagb9hq4dxHOVAk
         VIVBclatYXxMw==
Date:   Thu, 19 Jan 2023 16:17:56 +0000
From:   Lee Jones <lee@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v4 03/11] leds: an30259a: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8ltNNM9aeWQnlNL@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 03 Jan 2023, Andy Shevchenko wrote:

> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/leds-an30259a.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
