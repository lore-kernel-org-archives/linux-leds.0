Return-Path: <SRS0=X9ll=DC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A69DC4727D
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 23:29:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55E0520838
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 23:29:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbgIYX3Q (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Sep 2020 19:29:16 -0400
Received: from lists.nic.cz ([217.31.204.67]:56638 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726694AbgIYX3P (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 25 Sep 2020 19:29:15 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 51E741408AF;
        Sat, 26 Sep 2020 01:29:14 +0200 (CEST)
Date:   Sat, 26 Sep 2020 01:29:14 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Tobias Jordan <kernel@cdqe.de>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: omnia: fix leak of device node iterator
Message-ID: <20200926012914.3b40ce13@nic.cz>
In-Reply-To: <20200925231823.GA15759@agrajag.zerfleddert.de>
References: <20200925231823.GA15759@agrajag.zerfleddert.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Already fixed in Pavel's for-next
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?h=for-next&id=62aa40d0e907849d740ceba2a7f6bcc88896699f
