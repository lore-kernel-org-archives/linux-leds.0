Return-Path: <SRS0=brh8=4O=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C1BC4BA18
	for <linux-leds@archiver.kernel.org>; Wed, 26 Feb 2020 16:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 835E724670
	for <linux-leds@archiver.kernel.org>; Wed, 26 Feb 2020 16:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="VdeYRAhb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgBZQun (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 26 Feb 2020 11:50:43 -0500
Received: from mail.nic.cz ([217.31.204.67]:60998 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727552AbgBZQun (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Feb 2020 11:50:43 -0500
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 70B2614132D;
        Wed, 26 Feb 2020 17:50:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1582735841; bh=8WOj4xTgROZjVGwrJqDsu0701oDauJ/xT9Nb7czLJrc=;
        h=Date:From:To;
        b=VdeYRAhbcReVEoL75kpAQsNPOjcUjo66s3QszQRcUnqQCtM1HSjK+/tPMQzqp57oz
         uilDqBZC0LIoDMfKC01aco8wV0da4bTrCns2BFym9kl+Bkf1mmf+5Nf1GDsi/iuHER
         JzhLip+d0BnJdkD76EZhN5SDi7VQOLxvh3h0vH48=
Date:   Wed, 26 Feb 2020 17:50:41 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: How to synchronize leds in trigger
Message-ID: <20200226175041.771dac02@nic.cz>
In-Reply-To: <20200226141557.GK4080@duo.ucw.cz>
References: <69050f67-b611-dfd9-b166-a0d51edc18e2@kaa.org.ua>
        <d44bcd3c-bc6f-9168-bfbd-c71469d5e771@gmail.com>
        <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
        <20200130104424.22cec119@nic.cz>
        <20200226141557.GK4080@duo.ucw.cz>
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

On Wed, 26 Feb 2020 15:15:57 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> > Just look at how long the API for RGB LEDs is being agreed upon. It is
> > over a year already, if not longer, and still not merged.  
> 
> Sorry about that.

Hi Pavel,
this was not a complaint, I understand that the problem is compilated,.
Just stating it for Oleh who thought that synchoronizing LED triggers
would be fast work.

> Anyway, you have a pretty good driver with RGB support disabled, IIRC,
> and it only had one tiny thing left to fix.
>
> If you want to re-submit that, maybe we can have that for 5.7.

Yeah, sorry, I had ton of other work to do and then I forgot. I will try
to send patches this week.

Marek

