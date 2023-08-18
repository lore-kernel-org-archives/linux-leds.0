Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04069C678DC
	for <linux-leds@archiver.kernel.org>; Fri, 18 Aug 2023 08:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358453AbjHRIJs (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 18 Aug 2023 04:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358469AbjHRIJZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 04:09:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C905B2D70
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 01:09:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C2346530B
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 08:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2305C433C8;
        Fri, 18 Aug 2023 08:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692346160;
        bh=QGMK5l/tH344BYrGoY75uGXret6HT8nfA63b/N5HRjY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t+W1JwsKIqWF/AwLXli+XO7e3IO8vIOL2qTtdGVQaT5PLhhrlXQBsLIpsiu+WUX6K
         JPo4BJSHcI62RFL80zKu8chCEoYc0MbMuNhQESvtFH1YlHVfz/v3UDsARRU5/3rC55
         3T/hnQt216pLU/iSZHMSKi4orbRo5VqnhTbb0yCBYVPI70yMTXon34dFkw2EUSN/03
         tpSjrMg6K15TEDGOPu9+6LSveh6SpQTYPInCHJK+bAmxrhRrqc0MIhs2xlfk7maJOw
         GHubYIIeEdJ2C7G7d7ymU1voeMT5GFLzVHfdgACML2TkxLEr8YXoxnSi/QegEw/65Z
         nkizPtd2bc0+Q==
Date:   Fri, 18 Aug 2023 09:09:16 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 1/6] leds: turris-omnia: drop unnecessary mutex locking
Message-ID: <20230818080916.GP986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-2-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230802160748.11208-2-kabel@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 02 Aug 2023, Marek Behún wrote:

> Do not lock driver mutex in the global LED panel brightness sysfs
> accessors brightness_show() and brightness_store().
> 
> The mutex locking is unnecessary here. The I2C transfers are guarded by
> I2C core locking mechanism, and the LED commands itself do not interfere
> with other commands.
> 
> Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/leds/leds-turris-omnia.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
