Return-Path: <SRS0=O/xm=EE=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3A1C2D0A3
	for <linux-leds@archiver.kernel.org>; Thu, 29 Oct 2020 08:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF14920728
	for <linux-leds@archiver.kernel.org>; Thu, 29 Oct 2020 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603960044;
	bh=EHa5BsSfCkh9DS+40ELjTKWR7bfIby87AkF7gtbKwyM=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=RM1O6O+Tqr1bAdlK2ADsnVcU3IEuor9U6rOUhxBVnkSZP3PfebX2sfDnkVvoNGeEv
	 ONzuK65/qef58xI1NDuv1JBqSFhQjZATnrR66LCSFyiQBWp6PzNG8z1QG4PLkb3Ufz
	 ZueUrnW/JohEVhLM29GKJz/CG46icJTg0ydcO9xg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgJ2I1Y (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 29 Oct 2020 04:27:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727766AbgJ2I1Y (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 04:27:24 -0400
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6339320728;
        Thu, 29 Oct 2020 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603951211;
        bh=EHa5BsSfCkh9DS+40ELjTKWR7bfIby87AkF7gtbKwyM=;
        h=Date:From:To:Cc:Subject:From;
        b=nEF7Bhu/SUGWNMR374BWy3InFE7vXM/d6r68rPzZ5dqr44sQp+DzrzPAMaIsBEEeV
         iizLKH7MZXvWa3p4CZ4WcAGowKo6RRiVIGWHhlceCwnVHQx+gk7S6WeA+Q16eNamTr
         QtCNQOyWEssPJkLzV7YOks2VHKSJ8sI+55ebVy00=
Date:   Thu, 29 Oct 2020 07:00:00 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ben Whitten <ben.whitten@gmail.com>
Cc:     linux-leds@vger.kernel.org
Subject: ledtrig netdev: what is the purpose of spinlock usage?
Message-ID: <20201029070000.15472666@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Ben (or Pavel or whomever can explain this),

since you are the original author of netdev LED trigger, I guess this
question should go to you. Why are spinlocks used as locks in the
netdev trigger code? Is this for performance? Would it be a drastic
performance hit to use mutexes?

The reason why I am asking is that I am designing an API for transparent
HW offload of LED triggers. (Some LEDs, eg. LEDs on ethernet PHYs, can
blink on rx/tx activity themselves).

You can find this at
https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=leds-trigger-hw-offload

The current approach for the netdev trigger is that the
set_baseline_state function calls trigger_offload() method of the LED
classdev. But the whole set_baseline_state function is called from
within spinlock, and so when the trigger_offload method calls something
that can sleep (MDIO bus communication, for example), kernel complains:
  BUG: scheduling while atomic

Thanks.

Marek
