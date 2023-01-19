Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7852C677F1
	for <linux-leds@archiver.kernel.org>; Fri, 20 Jan 2023 05:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjATFDd (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 20 Jan 2023 00:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjATFDM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2023 00:03:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A59A56192;
        Thu, 19 Jan 2023 20:50:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B3558B825E5;
        Thu, 19 Jan 2023 16:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C258EC433EF;
        Thu, 19 Jan 2023 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674145360;
        bh=mMNU0hX5604g+0qs6K1wrlzdb2Auk61vShun7veApWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JQMhvA8xwnA/qZrYWMsM9GhMhIrpN8+y9l4tdbYFWzGo/LPsOuxuOkqEq+BtoLj+K
         FyqkYUDtCkFsxQOFO3C+AFPb7bQoYr10AlYAxhCe+AwygoIK6GaM3pkKnhFN2rxZMV
         I3lY3SWaS3mNdWgwkFI7HiGkHc0EEB3mNCeugfVTnSLLx75YNneJFwG0QhkOOm6rf8
         gcxTCWlh/I6gIE1uDPFq4YOZrq+vFrx0DWEd7PFfNR12vKGw97mj2swcTXmK9pW5hi
         On3GIyT2IMVqLGDVHERAawvGtiKMyfS4zShzh11K0cpOPQ0SC42PE/1g/+JRwfoS9P
         ay9RKCzs7erDA==
Date:   Thu, 19 Jan 2023 16:22:32 +0000
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
        Paolo Abeni <pabeni@redhat.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 07/11] leds: mt6360: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8luSMOOSPj266sC@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-8-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 03 Jan 2023, Andy Shevchenko wrote:

> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/leds/flash/leds-mt6360.c | 38 +++++---------------------------
>  1 file changed, 6 insertions(+), 32 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
