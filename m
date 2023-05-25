Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474B9C7EE29
	for <linux-leds@archiver.kernel.org>; Thu, 25 May 2023 12:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbjEYMCb (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 25 May 2023 08:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjEYMCa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 May 2023 08:02:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2DD13A;
        Thu, 25 May 2023 05:02:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60135644EF;
        Thu, 25 May 2023 12:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EC6C433EF;
        Thu, 25 May 2023 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685016148;
        bh=6cMWfyYxquh84atqJ0WzGSDvducDprtXvAOZRpr31oI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tnkvNLlr3a3x8Et9TQ8vy2AlfVZcIiCRCGv6tEHDyJTXxTv3CsSZ75a/ttzPxs1/O
         tRS8OiqD0QxYW94FzpEHoCdh84oD3lBhaoqFXCsuH8xlnluCn+WO6EWUC4O1dpW94R
         BUScCsjemNDrUVvuE0ndm/ZoN/vT4gHTUJ8LCvy86gJlejQjbEz/DCiDvdtnuNt8vP
         gU/I6+ciIaPktxIPdZAO1egTUVmfSwygzxd4MQrddYrVK5wajLQSPjjOb3Y9SbG+Rv
         9xFBoRT34nvd7wAg0PebxgyZ8KzEQ2w7caNm4tKQ6IEFCXtkQ7o1LirdrhtSaYjsDP
         rXQYJRWJZK6zg==
Date:   Thu, 25 May 2023 13:02:23 +0100
From:   Lee Jones <lee@kernel.org>
To:     Lu Hongfei <luhongfei@vivo.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lu Hongfei <11117923@bbktel.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        opensource.kernel@vivo.com
Subject: Re: [PATCH] led: qcom-lpg: Fix resource leaks in
 for_each_available_child_of_node() loops
Message-ID: <20230525120223.GB443478@google.com>
References: <20230525111705.3055-1-luhongfei@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230525111705.3055-1-luhongfei@vivo.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 25 May 2023, Lu Hongfei wrote:

> for_each_available_child_of_node in lpg_probe and lpg_add_led need
> to execute of_node_put before return. this patch could fix this bug.
> 
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>  mode change 100644 => 100755 drivers/leds/rgb/leds-qcom-lpg.c

I made a few tweaks to the commit messaged.

Applied, thanks

-- 
Lee Jones [李琼斯]
