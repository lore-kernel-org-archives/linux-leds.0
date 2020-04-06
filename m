Return-Path: <SRS0=CrCS=5W=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D96C2BA19
	for <linux-leds@archiver.kernel.org>; Mon,  6 Apr 2020 13:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71CBC22582
	for <linux-leds@archiver.kernel.org>; Mon,  6 Apr 2020 13:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="MntAUMz7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgDFNxl (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 6 Apr 2020 09:53:41 -0400
Received: from lists.nic.cz ([217.31.204.67]:59394 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728374AbgDFNxl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Apr 2020 09:53:41 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id B715314138B;
        Mon,  6 Apr 2020 15:53:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1586181218; bh=UeqJJJiFMTg0tpjmMOH7YdRpeO1X/AOws16dUfgFRqg=;
        h=Date:From:To;
        b=MntAUMz7u82HvKKkDjAVq5GoXNcIuNgPmGtWxqhgHLL7ZoOVJfkuvSLUiMaKIrECM
         BwNqvJsGV31KVoCB23bmmvWfpQJK9vCki/aNDfrRS/ZGP7JbeZyjezwm58/1jQkGPr
         uUW4uq82mUGpRmYkgEcSSZxdSXzvDYrWFZ4+Po3Q=
Date:   Mon, 6 Apr 2020 15:53:38 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200406155338.4aff9fed@nic.cz>
In-Reply-To: <20200406083423.GA31120@duo.ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <20200321153444.GE8386@duo.ucw.cz>
        <661959c3-cd24-1125-be35-f293212f4fe4@gmail.com>
        <20200321215030.08b75ccc@nic.cz>
        <e6f20e72-0bfc-5fc1-839e-1283d8f15394@gmail.com>
        <20200406083423.GA31120@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 6 Apr 2020 10:34:23 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Yes please.
> 
> > Anyway, "omnia" alone doesn't allow to tell the location of the
> > LED either.  
> 
> ACK.

Pavel, what about the other thread (starting with message ID 
<20200402162950.5c2847be@nic.cz>, sent at 04/02/2020 16:29) ?

Marek
