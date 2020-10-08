Return-Path: <SRS0=/T0w=DP=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6ACC43467
	for <linux-leds@archiver.kernel.org>; Thu,  8 Oct 2020 12:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42B3021527
	for <linux-leds@archiver.kernel.org>; Thu,  8 Oct 2020 12:11:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgJHMLA (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 8 Oct 2020 08:11:00 -0400
Received: from w1.tutanota.de ([81.3.6.162]:54158 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbgJHMK7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 8 Oct 2020 08:10:59 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id A2BDFFBF4CB;
        Thu,  8 Oct 2020 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1602159057;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=pTaGEEATW9dJCr5qgH388eK98QN7MnVFy+nvAOMbdso=;
        b=E1DXk4t9Px12QbLTqkyvLqmRr+zTD41xB6Gbkz9avAk0je6UmUYeSQTnlKzBBZMA
        93Xu1UHvaU9LYRyY1Xnr8Lcsx7lk4SjBhn/P27yWNSv779nDryRdGNVpPmdBh96CKAW
        klZa6SecNUycuTZwOydhKOqOZfGDRpW5lBwRGa2aBvn7w/+3OEfK394/xJpM+xOnjCd
        BWdr9uuCPdT1ZVbhTLM4q0WhlHaQD3dbHEARCDtSpsU1f5WTXom+9kzK9p0J9POCDAa
        ZZZYPtuNBqjl4C3dZ6dcdKMEpSq4GDRgCQpoEqOACez0CM2DKrf16hQ0PRpUD5CtSOk
        u0WyNYYccg==
Date:   Thu, 8 Oct 2020 14:10:57 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Dan Murphy <dmurphy@ti.com>, Pavel <pavel@ucw.cz>
Cc:     Marek Behun <kabel@blackhole.sk>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MJ76lXD--3-2@tutanota.com>
In-Reply-To: <346621c1-757e-d182-d290-877fccc8b4aa@ti.com>
References: <MIuPIKy--3-2@tutanota.com> <20201007012600.3b3e7779@blackhole.sk> <MJ2-gcy----2@tutanota.com> <346621c1-757e-d182-d290-877fccc8b4aa@ti.com>
Subject: Re: [PATCH] lm3697: Rename struct into more appropiate name
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gotcha.

From now on I'm gonna respond with this new email: ultracoolguy@disroot.org .

Oct 7, 2020, 14:56 by dmurphy@ti.com:

> Gabriel
>
> On 10/7/20 7:21 AM, ultracoolguy@tutanota.com wrote:
>
>> The reason I didn't use git send-mail earlier is because Tutanota doesn't supports SMTP and Protonmail requires a paid account for using SMTP/IMAP. However, I made an account creation request for Disroot(which does support SMTP for free), so when/if the account gets created I'll send future patches through there.
>> Oct 6, 2020, 23:26 by kabel@blackhole.sk:
>>
> Also please note top posting on emails is not preferred. As you will find in the LED domain bottom posts and trimming emails to what is being commented on is preferred.
>
> As demonstrated.
>
> Dan
>

