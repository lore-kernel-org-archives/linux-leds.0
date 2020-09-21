Return-Path: <SRS0=T4uw=C6=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8786DC43468
	for <linux-leds@archiver.kernel.org>; Mon, 21 Sep 2020 14:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A93B222BB
	for <linux-leds@archiver.kernel.org>; Mon, 21 Sep 2020 14:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgIUOrq (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 21 Sep 2020 10:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727730AbgIUOrq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2020 10:47:46 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132EBC061755
        for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2020 07:47:46 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 3093513FFC2;
        Mon, 21 Sep 2020 16:47:44 +0200 (CEST)
Date:   Mon, 21 Sep 2020 16:47:43 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Simon Guinot <simon.guinot@sequanux.org>
Cc:     Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-leds@vger.kernel.org
Subject: Re: question about Network Space v2 LED driver
Message-ID: <20200921164743.1c3dc35d@nic.cz>
In-Reply-To: <20200921141540.GC4828@kw.sim.vm.gnt>
References: <20200918005258.44c0bfc6@blackhole.sk>
        <20200918134201.GF29951@kw.sim.vm.gnt>
        <20200918194315.61fd8f43@nic.cz>
        <20200921141540.GC4828@kw.sim.vm.gnt>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 21 Sep 2020 16:15:40 +0200
Simon Guinot <simon.guinot@sequanux.org> wrote:

> 
> There are several NAS devices using the leds-ns2 driver. On most of them
> the activity is wired to a single disk. But on some (such as the Network
> Space v2 Max), the activity is wired to two disks.
> 

Are they implemented via device-tree or platform-data?

If we are going to implement the disk trigger offloading, we will need
to use the trigger-sources property so that the driver will know which
disks can be offloaded.

Marek
