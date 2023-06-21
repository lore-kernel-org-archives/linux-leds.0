Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89085EB64D7
	for <linux-leds@archiver.kernel.org>; Wed, 21 Jun 2023 15:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbjFUPCJ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 21 Jun 2023 11:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232986AbjFUPBy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Jun 2023 11:01:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E8165AA;
        Wed, 21 Jun 2023 07:56:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1AAD661539;
        Wed, 21 Jun 2023 14:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E27C433C0;
        Wed, 21 Jun 2023 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687359317;
        bh=XmUJrXEv6FpzPmLHQQVKfx65ofQ5ze4boTYNspgJr0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kYY4WwazOEzAfa9uKMwIbqFeb+IwrNPKg0dDGTL6E7G6rgUqeA0xh8V/X/BLAsJhV
         XDXyL+NFeKMO2zqsjJ1rcizAgnq1s7xYwvZT4mLYs1F1FmPSKv0RW/NjLyP+PNCv+0
         QwEryrNC1YNYuoZsGXdEIc5G4hpbgicTWFN36uW9/MZXO+XenFgx0etsg+4rFu6vs0
         VF3r7OeijylkG4EdhEFUXQcL8ih80xDn/M/Y8htSzcG9/mqw62TfHt9Aw2tjf7uvMh
         m5PPoUII+bQqsaECsXCOVfgaw0EOp4mDPJ9/4Co35eUq4hgbL9IWgpdGUxUwHcPZay
         tT30H/lAr7EkA==
Date:   Wed, 21 Jun 2023 15:55:12 +0100
From:   Lee Jones <lee@kernel.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [net-next PATCH v5 2/3] leds: trigger: netdev: add additional
 specific link duplex mode
Message-ID: <20230621145512.GB10378@google.com>
References: <20230619204700.6665-1-ansuelsmth@gmail.com>
 <20230619204700.6665-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230619204700.6665-3-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 19 Jun 2023, Christian Marangi wrote:

> Add additional modes for specific link duplex. Use ethtool APIs to get the
> current link duplex and enable the LED accordingly. Under netdev event
> handler the rtnl lock is already held and is not needed to be set to
> access ethtool APIs.
> 
> This is especially useful for PHY and Switch that supports LEDs hw
> control for specific link duplex.
> 
> Add additional modes:
> - half_duplex: Turn on LED when link is half duplex
> - full_duplex: Turn on LED when link is full duplex
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 27 +++++++++++++++++++++++++--
>  include/linux/leds.h                  |  2 ++
>  2 files changed, 27 insertions(+), 2 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
