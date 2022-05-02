Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E13C433F5
	for <linux-leds@archiver.kernel.org>; Mon,  2 May 2022 20:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbiEBUtt (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 2 May 2022 16:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiEBUts (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 May 2022 16:49:48 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94DD60FD
        for <linux-leds@vger.kernel.org>; Mon,  2 May 2022 13:46:18 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 892631C0B82; Mon,  2 May 2022 22:46:16 +0200 (CEST)
Date:   Mon, 2 May 2022 22:46:16 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schwermer <sven@svenschwermer.de>
Cc:     linux-leds@vger.kernel.org
Subject: Re: Initial multicolor LED intensities
Message-ID: <20220502204616.GA27288@ucw.cz>
References: <bee0ab23-1324-6989-1d67-a6b4e9e29bdb@svenschwermer.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bee0ab23-1324-6989-1d67-a6b4e9e29bdb@svenschwermer.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Is there a way to assign initial (non-zero) intensities to the individual
> colors of a multicolor LED via the device tree?

I don't believe we have such functionality. Patch would be welcome.

> In my use case, I'd like to assign a default trigger to a multicolor LED
> (e.g. linux,default-trigger="heartbeat"). However, since the color
> intensities are zero upon boot, I don't get a heartbeat on the multicolor
> LED.

Hmm. Defaulting to zero does not really make much sense. I guess we
should default to full on all channels?

Best regards,
								Pavel
