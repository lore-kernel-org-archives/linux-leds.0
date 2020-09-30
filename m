Return-Path: <SRS0=EaiZ=DH=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9E6C4363D
	for <linux-leds@archiver.kernel.org>; Wed, 30 Sep 2020 20:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D90C12071E
	for <linux-leds@archiver.kernel.org>; Wed, 30 Sep 2020 20:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgI3UwD (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 30 Sep 2020 16:52:03 -0400
Received: from agrajag.zerfleddert.de ([88.198.237.222]:57538 "EHLO
        agrajag.zerfleddert.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3UwD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 16:52:03 -0400
X-Greylist: delayed 441 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Sep 2020 16:52:02 EDT
Received: from denkmatte (unknown [5.182.90.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: knilch)
        by agrajag.zerfleddert.de (Postfix) with ESMTPSA id B75475B20134;
        Wed, 30 Sep 2020 22:44:40 +0200 (CEST)
Date:   Wed, 30 Sep 2020 22:44:39 +0200
From:   Tobias Jordan <kernel@cdqe.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: Re: [PATCH] leds: aw2013: fix leak of device node iterator
Message-ID: <20200930224439.0014c2dd@denkmatte>
In-Reply-To: <20200930171017.GF27760@duo.ucw.cz>
References: <20200925232644.GA17005@agrajag.zerfleddert.de>
        <20200930171017.GF27760@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at agrajag
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020-09-30 19:10, Pavel Machek wrote:
Hi Pavel,

> > In the error path of the for_each_available_child_of_node loop in
> > aw2013_probe_dt, add missing call to of_node_put to avoid leaking
> > the iterator.
> > 
> > Fixes: 59ea3c9faf32 ("leds: add aw2013 driver")
> > Signed-off-by: Tobias Jordan <kernel@cdqe.de>  
> 
> This failed to apply to my -for-next tree.

Yes, it turns out this had been fixed by Marek already one day
before I submitted my patch (in commit 2c6775625434) and I didn't
notice that. So nothing to do there, sorry for the inconvenience.

Best regards,

Tobias
