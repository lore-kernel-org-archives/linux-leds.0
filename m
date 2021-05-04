Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF696C433B4
	for <linux-leds@archiver.kernel.org>; Tue,  4 May 2021 15:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9062C6112F
	for <linux-leds@archiver.kernel.org>; Tue,  4 May 2021 15:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhEDPo3 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 4 May 2021 11:44:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49094 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhEDPo2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 May 2021 11:44:28 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 827341C0B87; Tue,  4 May 2021 17:43:32 +0200 (CEST)
Date:   Tue, 4 May 2021 17:43:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [GIT PULL] LEDs changes for v5.13-rc1
Message-ID: <YJFro4ue80SIboQd@mobian>
References: <20210502220519.GA24775@duo.ucw.cz>
 <CAHk-=wg0Cvmxk58f0waakTKo8G5wPWarVw5b2=11f35vBAOYUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg0Cvmxk58f0waakTKo8G5wPWarVw5b2=11f35vBAOYUw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> > This modifies MAINTAINER's file to remove Dan Murphy's email that is
> > bouncing (and does it globally). I hope that does not conflict too badly.
> 
> Well, it caused conflicts, but it's not like they were hard to resolve.
> 
> In fact, the resolution was to ignore your changes, because those
> email addresses had been removed by the other branches I already
> merged, so they were gone even before your merge (and the conflicts
> were just due to other changes around it)

Oops, sounds like I should have test-merged it and dropped the
change. Thanks for solving it for me.

Best regards,
									Pavel

-- 
