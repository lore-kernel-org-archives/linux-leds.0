Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F1FC7618E
	for <linux-leds@archiver.kernel.org>; Mon, 24 Apr 2023 13:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbjDXNn3 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 24 Apr 2023 09:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjDXNn2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Apr 2023 09:43:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F1583C0;
        Mon, 24 Apr 2023 06:42:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D22026248F;
        Mon, 24 Apr 2023 13:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD59CC433D2;
        Mon, 24 Apr 2023 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682343776;
        bh=RR0qyZByoFl8DnxyaC7z0i1+wY+F9PPPdmfu4FwrSHo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ngoOaGWVCWA4DYdPxmBsxLrLPkLXFWo3TvTtcrSF3YRqg0kBoDihewpLULM6yRhwf
         exBgfs/rtx4a84kSaApzq0Sx5Q7E0wMu9dV3DbfMQuywEI5WR7mE8w0+1xGyoWGHyF
         Usjrl7XrZHz6XHTf1I63BycSRJ5QEFnNncJppvAtGZjUkBS0rWoRr1FQcK766z+7Sz
         wmQ32Urn+uDcTT0N+4DD/gtLRpSpzf3S6ZqYMKEwZIgp3bcCLznruRp6V73iFJryEr
         61vJF6bOProwp/ufF+EC5+g0ekNvOE2RpJUyt7MGMRvAJJGJ2wYKF5EozuI1FS496D
         NomB3tvh6kwgQ==
Date:   Mon, 24 Apr 2023 14:42:51 +0100
From:   Lee Jones <lee@kernel.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Martin Schiller <ms@dev.tdt.de>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/5] leds: trigger: netdev: drop NETDEV_LED_MODE_LINKUP
 from mode
Message-ID: <20230424134251.GH50521@google.com>
References: <20230419210743.3594-1-ansuelsmth@gmail.com>
 <20230419210743.3594-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230419210743.3594-3-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 19 Apr 2023, Christian Marangi wrote:

> Putting NETDEV_LED_MODE_LINKUP in the same list of the netdev trigger
> modes is wrong as it's used to set the link state of the device and not
> to set a blink mode as it's done by NETDEV_LED_LINK, NETDEV_LED_TX and
> NETDEV_LED_RX. It's also wrong to put this state in the same bitmap of the
> netdev trigger mode and should be external to it.
> 
> Drop NETDEV_LED_MODE_LINKUP from mode list and convert to a simple bool
> that will be true or false based on the carrier link. No functional
> change intended.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
