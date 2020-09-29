Return-Path: <SRS0=zYQx=DG=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81C6C47423
	for <linux-leds@archiver.kernel.org>; Tue, 29 Sep 2020 18:56:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 757E12076D
	for <linux-leds@archiver.kernel.org>; Tue, 29 Sep 2020 18:56:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgI2S4W (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 29 Sep 2020 14:56:22 -0400
Received: from vsmx011.vodafonemail.xion.oxcs.net ([153.92.174.89]:59019 "EHLO
        vsmx011.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727740AbgI2S4V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 29 Sep 2020 14:56:21 -0400
Received: from vsmx003.vodafonemail.xion.oxcs.net (unknown [192.168.75.197])
        by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id E00D359D365;
        Tue, 29 Sep 2020 18:56:19 +0000 (UTC)
Received: from x2.localnet (unknown [92.194.27.243])
        by mta-7-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 6D48D539A1E;
        Tue, 29 Sep 2020 18:56:09 +0000 (UTC)
From:   Markus Moll <moll.markus@arcor.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/2] dt: bindings: pca9532: add description of pwm and psc settings
Date:   Tue, 29 Sep 2020 20:56:02 +0200
Message-ID: <4565211.GXAFRqVoOG@x2>
In-Reply-To: <20200929181409.GA890687@bogus>
References: <1570334746.101942.1600803234657@mail.vodafone.de> <20200929181409.GA890687@bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-VADE-STATUS: LEGIT
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Am Dienstag, 29. September 2020, 20:14:09 CEST schrieb Rob Herring:
> 
> I believe we have standard properties for LED patterns now.
> 

Oh... I  guess I had completely misunderstood how the timer trigger works. 
It's quite possible that the timer trigger + the led-pattern property will 
solve all of the problems I originally had and thus eliminate the need for my 
device-tree patches.

Markus



