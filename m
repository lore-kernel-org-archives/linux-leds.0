Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC1CE81E03
	for <linux-leds@archiver.kernel.org>; Fri,  6 Oct 2023 14:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbjJFOpY (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 6 Oct 2023 10:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJFOpY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Oct 2023 10:45:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7953CE
        for <linux-leds@vger.kernel.org>; Fri,  6 Oct 2023 07:45:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82406C433C7;
        Fri,  6 Oct 2023 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696603522;
        bh=SGn4k4LpFpXp5UzOKPYuxrJZlZ21P79Lmzrd+gXjSUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bL/Kx5wD3kPBLCsYREhmibOgYLgS5s/62Y6PqhqrhK+vDBGltpTXx/eDaD0b+2Xcn
         nSkEb3KP5B2wW4/Ui5aLw6RlGabu/MehGifkajheUq3ycgmRRJb3RFdDdSFoIZcJ2o
         nze3jycKpYk1LP74ZZqpCzSW27w4IXAqWYyN/8rp7pK+gekwpPA350xVwh6EhqVV4c
         F91MTg1Z3vKmUnXnxw0AkhMKFp6BJlvATDjrZ1FwL8yp4/mkYQSukhqKS4NokvCMMU
         WMRJRoGu6vtCGLYRxOgD4HBijjh2rHKND9RdgrV4BYnkT+/vHOUkUmCTH6x7SY9EJ6
         vZvhy+woyE05A==
Date:   Fri, 6 Oct 2023 15:45:18 +0100
From:   Lee Jones <lee@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Marek Beh'un <kabel@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is
 always false
Message-ID: <20231006144518.GD808963@google.com>
References: <20230801151623.30387-1-kabel@kernel.org>
 <ZSAYejE_cBw1kd_G@FVFF77S0Q05N.cambridge.arm.com>
 <ZSAcKoRFop-NCsFG@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSAcKoRFop-NCsFG@FVFF77S0Q05N.cambridge.arm.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 06 Oct 2023, Mark Rutland wrote:

> On Fri, Oct 06, 2023 at 03:24:04PM +0100, Mark Rutland wrote:
> > On Tue, Aug 01, 2023 at 05:16:23PM +0200, Marek Beh'un wrote:
> > > At the time we call
> > >     BUG_ON(props.color == LED_COLOR_ID_MULTI);
> > > the props variable is still initialized to zero.
> > > 
> > > Call the BUG_ON only after we parse fwnode into props.
> > > 
> > > Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
> > > Signed-off-by: Marek Beh'un <kabel@kernel.org>
> > 
> > I've just discovered this has broken boot on my Libre Computer
> > AML-A311D-CC-V0.2, which was working just fine with Debian 12's stock kernel:
> 
> Sorry the the noise; I've just spotted this is fixed by:
> 
>   https://lore.kernel.org/linux-leds/20230918140724.18634-1-kabel@kernel.org/
> 
> ... and I look forward to that hitting mainline :)

Your long agonising wait is over:

commit 9dc1664fab2246bc2c3e9bf2cf21518a857f9b5b
Author: Marek Behún <kabel@kernel.org>
Date:   Mon Sep 18 16:07:24 2023 +0200

    leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
    
    Commit c3f853184bed ("leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that
    is always false") fixed a no-op BUG_ON. This turned out to cause a
    regression, since some in-tree device-tree files already use
    LED_COLOR_ID_MULTI.
    
    Drop the BUG_ON altogether.
    
    Fixes: c3f853184bed ("leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is always false")
    Reported-by: Da Xue <da@libre.computer>
    Closes: https://lore.kernel.org/linux-leds/ZQLelWcNjjp2xndY@duo.ucw.cz/T/
    Signed-off-by: Marek Behún <kabel@kernel.org>
    Link: https://lore.kernel.org/r/20230918140724.18634-1-kabel@kernel.org
    Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-core.c | 4 ----
 1 file changed, 4 deletions(-)

-- 
Lee Jones [李琼斯]
