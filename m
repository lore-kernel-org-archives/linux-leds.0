Return-Path: <SRS0=GPQo=DB=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC64C4363D
	for <linux-leds@archiver.kernel.org>; Thu, 24 Sep 2020 13:07:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 466C82311A
	for <linux-leds@archiver.kernel.org>; Thu, 24 Sep 2020 13:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgIXNH0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 24 Sep 2020 09:07:26 -0400
Received: from vsmx009.vodafonemail.xion.oxcs.net ([153.92.174.87]:20454 "EHLO
        vsmx009.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727704AbgIXNH0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 24 Sep 2020 09:07:26 -0400
Received: from vsmx001.vodafonemail.xion.oxcs.net (unknown [192.168.75.191])
        by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id 07F4E159D207;
        Thu, 24 Sep 2020 13:07:25 +0000 (UTC)
Received: from x2.localnet (unknown [92.194.22.117])
        by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 3765A159CF80;
        Thu, 24 Sep 2020 13:07:16 +0000 (UTC)
From:   Markus Moll <moll.markus@arcor.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Riku Voipio <riku.voipio@iki.fi>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1] leds: pca9532: correct shift computation in pca9532_getled
Date:   Thu, 24 Sep 2020 15:07:11 +0200
Message-ID: <5639829.lOV4Wx5bFT@x2>
In-Reply-To: <20200924122421.GI3933@duo.ucw.cz>
References: <718260256.101908.1600802915869@mail.vodafone.de> <20200924122421.GI3933@duo.ucw.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-VADE-STATUS: LEGIT
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi

Am Donnerstag, 24. September 2020, 14:24:21 CEST schrieb Pavel Machek:
> 
> Note that default-state = keep should _not_ be supported unless
> someone needs it.
> 

We are using it (hence the patch), does that count? 

(We actually need it, as on our board U-Boot determines whether the leds 
should blink during boot, and glitch-free blinking wouldn't otherwise be 
possible).

Markus



