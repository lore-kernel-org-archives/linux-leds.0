Return-Path: <SRS0=TSfc=3T=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ED2C33C9E
	for <linux-leds@archiver.kernel.org>; Thu, 30 Jan 2020 10:37:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 201C120658
	for <linux-leds@archiver.kernel.org>; Thu, 30 Jan 2020 10:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgA3KhV (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 30 Jan 2020 05:37:21 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:47118 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgA3KhV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Jan 2020 05:37:21 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7B8A21C25F4; Thu, 30 Jan 2020 11:37:20 +0100 (CET)
Date:   Thu, 30 Jan 2020 11:37:20 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: How to synchronize leds in trigger
Message-ID: <20200130103720.5uecvirjqeeaemrv@ucw.cz>
References: <69050f67-b611-dfd9-b166-a0d51edc18e2@kaa.org.ua>
 <d44bcd3c-bc6f-9168-bfbd-c71469d5e771@gmail.com>
 <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> > What prevents you from solving this problem in userspace?
> 
> User-space don't fast enough to provide correct timings.

That's hard to believe.

							Pavel


