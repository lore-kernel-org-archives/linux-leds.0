Return-Path: <SRS0=qzSt=CB=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF390C433E1
	for <linux-leds@archiver.kernel.org>; Sun, 23 Aug 2020 00:52:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B8322078A
	for <linux-leds@archiver.kernel.org>; Sun, 23 Aug 2020 00:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598143934;
	bh=fHKSK8wdF749P2iqH1it2zMw2LMD18Kh7O1CA/kPKLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DWpAKpl24e/1LKN0UIlxbiaT4tuw2OZc3kzO36uFhpLe1z2D3Sa3NA1gHqrBdVbBi
	 aj1aECrxdNuvYfZMJDXpJkFYZNiebCCV7RtO/4naxRe/ZA3FuJgUXbVEb8Iq3hrLle
	 z7e6NVXiFutXk5xMtzGI5PCcSfnhNeTAfAVaZG9o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgHWAwO (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 22 Aug 2020 20:52:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgHWAwO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 22 Aug 2020 20:52:14 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 402412072D;
        Sun, 23 Aug 2020 00:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598143933;
        bh=fHKSK8wdF749P2iqH1it2zMw2LMD18Kh7O1CA/kPKLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GX0WngMrj73Isxo8BzajuGY1NeGUDH9y8qqQwbwcTPgDOviruOgCM4LWLXCkdIwMz
         ygUj0VsFy8mmtC07WgEXEMyXpETytdYKFwRKh/3t7Y+steYARJH2Lvnt16af9IA+ES
         Z/IpqGR5TLfnpCiI3zzSZImi0PegfYLDSAIzF1mU=
Date:   Sun, 23 Aug 2020 08:52:07 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh@kernel.org,
        marek.behun@nic.cz, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v33 5/6] ARM: dts: imx6dl-yapp4: Add reg property to the
 lp5562 channel node
Message-ID: <20200823005206.GD30094@dragon>
References: <20200812195020.13568-1-dmurphy@ti.com>
 <20200812195020.13568-6-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812195020.13568-6-dmurphy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Aug 12, 2020 at 02:50:19PM -0500, Dan Murphy wrote:
> Add the reg property to each channel node.  This update is
> to accommodate the multicolor framework.  In addition to the
> accommodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Sascha Hauer <s.hauer@pengutronix.de>
> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: NXP Linux Team <linux-imx@nxp.com>

Applied, thanks.
