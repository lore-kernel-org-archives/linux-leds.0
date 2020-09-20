Return-Path: <SRS0=P4mj=C5=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0DEC43463
	for <linux-leds@archiver.kernel.org>; Sun, 20 Sep 2020 21:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4A6720829
	for <linux-leds@archiver.kernel.org>; Sun, 20 Sep 2020 21:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgITVyi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 20 Sep 2020 17:54:38 -0400
Received: from lists.nic.cz ([217.31.204.67]:39666 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgITVyi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 20 Sep 2020 17:54:38 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 6CE1C140A87;
        Sun, 20 Sep 2020 23:54:36 +0200 (CEST)
Date:   Sun, 20 Sep 2020 23:54:36 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH leds v3 6/9] leds: lm36274: use devres LED registering
 function
Message-ID: <20200920235436.185ceebc@nic.cz>
In-Reply-To: <20200920214532.GB31397@duo.ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
        <20200919180304.2885-7-marek.behun@nic.cz>
        <20200920214532.GB31397@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 20 Sep 2020 23:45:32 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > Now that the potential use-after-free issue is resolved we can use
> > devres for LED registration in this driver.
> > 
> > By using devres version of LED registering function we can remove the
> > .remove method from this driver.
> > 
> > Signed-off-by: Marek Behún <marek.behun@nic.cz>
> > Cc: Dan Murphy <dmurphy@ti.com>  
> 
> AFAICT this one is buggy, I sent explanation before. Why are you
> resubmitting it?
> 
> 								Pavel

The previous patch in this series (v3 5/9) should solve this issue and
th commit message explains how.

Marek
