Return-Path: <SRS0=O/xm=EE=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9EFC4363A
	for <linux-leds@archiver.kernel.org>; Thu, 29 Oct 2020 18:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9723E20825
	for <linux-leds@archiver.kernel.org>; Thu, 29 Oct 2020 18:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603995239;
	bh=3Tg21T6d2Yee8/eZC90KsbI3cyUJW44IbXMMwvoXA9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=QFR3UCR7FmPfD4OzCqvkS2G8Dmg6VzYfw4bq3vUpSkAVa3m/ioRVWD5HDdHQdqF60
	 5rBmOz3bqovSQ5YqK7SrY839wZK2o43Ce40UYPbUYtKzqyVLDpfL/AErQLOaKCu7U+
	 jFvynCgPa40G7EaOrL0CK1OGlsYh0r7JlGtIuWZ8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgJ2SN7 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 29 Oct 2020 14:13:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:59756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgJ2SN6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 14:13:58 -0400
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65934207EA;
        Thu, 29 Oct 2020 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603995238;
        bh=3Tg21T6d2Yee8/eZC90KsbI3cyUJW44IbXMMwvoXA9A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HI5UixmsZAWL2AvIso+0q4vfgLoEANYWuOs+I7zuJ+LKuDY2SU8M/YW1OUlCsStPU
         kWHgMoOWnEAERflS8YAnQyR8rQO111DpnzKoJa/3lYqPOxKtvM/JHuTiq6aUl03MhR
         DM66j/zOOp3S7etwOwrHyTHz/jiCmI8dV1O1yvrQ=
Date:   Thu, 29 Oct 2020 19:13:47 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Ben Whitten <ben.whitten@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: ledtrig netdev: what is the purpose of spinlock usage?
Message-ID: <20201029191347.6d509614@kernel.org>
In-Reply-To: <20201029174529.GA26053@duo.ucw.cz>
References: <20201029070000.15472666@kernel.org>
        <20201029174529.GA26053@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 29 Oct 2020 18:45:29 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > since you are the original author of netdev LED trigger, I guess this
> > question should go to you. Why are spinlocks used as locks in the
> > netdev trigger code? Is this for performance? Would it be a drastic
> > performance hit to use mutexes?  
> 
> Triggers can be called from interrupt context, IIRC, and many simple
> LEDs can be operated from interrupt context, too.
> 
> Thus you need spinlocks...
> 
> Best regards,
> 								Pavel

Pavel,

the set_baseline_state function in netdev trigger is guarded by a
spinlock only when reading/writing device_name attribute and in
netdev notify callback.

netdev_trig_notify can for example put the device away on
NETDEV_UNREGISTER event, and if someone was reading/writing the
device_name at the same time netdev_trig_notify is manipulating
netdevice pointer, it could break. So my guess for the lock is that it
is used because of this.

It is possible that netdev_trig_notify can be called from interrupt
context, I will have to look into this.

Anyway for the trigger_offload() method to be able to communicate with
PHYs I need the set_baseline_state function not to be called from
within spinlock. Otherwise the drivers implementing this method would
get too complicated. Would it be allright if on netdev event (link up,
link down, netdev changename, netdev unregister) the set_baseline_state
was called from a work, instead of directly from the spinlock?

I will send a patch proposing and explaining this.

Marek
