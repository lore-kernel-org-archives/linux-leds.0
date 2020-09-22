Return-Path: <SRS0=VYW2=C7=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC923C2D0E2
	for <linux-leds@archiver.kernel.org>; Tue, 22 Sep 2020 19:31:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92CDC2371F
	for <linux-leds@archiver.kernel.org>; Tue, 22 Sep 2020 19:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIVTbm (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:31:42 -0400
Received: from vsmx012.vodafonemail.xion.oxcs.net ([153.92.174.90]:26923 "EHLO
        vsmx012.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726448AbgIVTbm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 22 Sep 2020 15:31:42 -0400
Received: from vsmx004.vodafonemail.xion.oxcs.net (unknown [192.168.75.198])
        by mta-8-out.mta.xion.oxcs.net (Postfix) with ESMTP id 8D925F35204;
        Tue, 22 Sep 2020 19:23:01 +0000 (UTC)
Received: from x2.localnet (unknown [92.194.127.111])
        by mta-8-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 3AEDB19A723;
        Tue, 22 Sep 2020 19:22:55 +0000 (UTC)
From:   Markus Moll <moll.markus@arcor.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH 2/2] dt: bindings: pca9532: add description of pwm and psc properties
Date:   Tue, 22 Sep 2020 21:22:54 +0200
Message-ID: <3075354.44csPzL39Z@x2>
In-Reply-To: <20200919115956.GB21747@duo.ucw.cz>
References: <1023311712.12962.1600197989828@mail.vodafone.de> <20200919115956.GB21747@duo.ucw.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-VADE-STATUS: LEGIT
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat 2020-09-19 13:59:56, Pavel Machek wrote:
> This will need ACK from dt people.
> 
> Also patch came whitespace-damaged.

Sorry about that, I'll send a new patch and cc it appropriately.

Regards
Markus




