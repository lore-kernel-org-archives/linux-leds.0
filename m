Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E54C433ED
	for <linux-leds@archiver.kernel.org>; Tue,  4 May 2021 15:55:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5581860241
	for <linux-leds@archiver.kernel.org>; Tue,  4 May 2021 15:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhEDPzz (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 4 May 2021 11:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbhEDPzz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 May 2021 11:55:55 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE91C061574
        for <linux-leds@vger.kernel.org>; Tue,  4 May 2021 08:54:59 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z9so9542018lfu.8
        for <linux-leds@vger.kernel.org>; Tue, 04 May 2021 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+unjtHm/rBLwTMZM4tl4Q30PDymo74btwmzKLoZ/sA=;
        b=ZLT2JvpPvPUPbbcIHgI3bQtXWtU/Hm0/A4U+RLt0R5BiQfq1zpGbnBh63E42n5wnzu
         Lot16wxaeNXbReHlLIOQ13aRZYx4FLwegzuNmmjLYrN9nBkeQiNfyVrUT3Mc2X5fBf9d
         oDLqzodlQKQUHRQBoeBp80DzxHmbsEMZ6wifw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+unjtHm/rBLwTMZM4tl4Q30PDymo74btwmzKLoZ/sA=;
        b=HSEV3l7pzRcAIs82wz1uVBDK/I+otdcRdFR1eH9s361h1eFx4nMSp/fPjeX4d59MKA
         vxFUiIi/QE7+8xCAEI9iQSWGMl/UD/rijp/MtucPoNe9KA4zKD25DA6BraG7vKKRs6o/
         eRSXFVkH7vw/4cxg8kDGw6iqo3EBuLnYwDYI7lBm2v7RtA4YxU0SjjHZgNqXTyV7JipK
         8wEbbhf6MjDOlwMeeUs62JAgYu3GNO3jnheCY9lvX490vgZice38iO/R3mdbZQ4wZlXx
         S0+aJDOIlpmApnKuAT7EivTY5gLFBPrFrfM20/HvQkNx6rIpwQVmY21hUSc3ApIwApOl
         k1FA==
X-Gm-Message-State: AOAM532MdEHxcbs3CSOlbXiaiag1nxehr28gt9mjvmYpkmYI1/w+YxVW
        KYbkaSLJCIw72ckzeV4XzgErkvRIqOOEvm3Z
X-Google-Smtp-Source: ABdhPJzigQE1Io1KrYRAf7uWbn2U0NcLOKqvTHWYMq49nQUVSVSBAxB/XOKlMqeZj2ukv4kazv8xUA==
X-Received: by 2002:a05:6512:3b0f:: with SMTP id f15mr6302769lfv.384.1620143698214;
        Tue, 04 May 2021 08:54:58 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id r25sm298237lfm.145.2021.05.04.08.54.57
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 08:54:57 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id x19so14038990lfa.2
        for <linux-leds@vger.kernel.org>; Tue, 04 May 2021 08:54:57 -0700 (PDT)
X-Received: by 2002:a19:7504:: with SMTP id y4mr16748492lfe.41.1620143697568;
 Tue, 04 May 2021 08:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210502220519.GA24775@duo.ucw.cz> <CAHk-=wg0Cvmxk58f0waakTKo8G5wPWarVw5b2=11f35vBAOYUw@mail.gmail.com>
 <YJFro4ue80SIboQd@mobian>
In-Reply-To: <YJFro4ue80SIboQd@mobian>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 May 2021 08:54:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjuAbLtGY6UcV+_KTEXLxeKnQU+0AyxV75-FHovSB15Jg@mail.gmail.com>
Message-ID: <CAHk-=wjuAbLtGY6UcV+_KTEXLxeKnQU+0AyxV75-FHovSB15Jg@mail.gmail.com>
Subject: Re: [GIT PULL] LEDs changes for v5.13-rc1
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 4, 2021 at 8:43 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Oops, sounds like I should have test-merged it and dropped the
> change. Thanks for solving it for me.

Oh, it was fine this way too.

In fact, I prefer to see a (trivial) merge conflict over having people
change their branch just to avoid it. So I think this all went down
exactly how it should have been done.

Thanks,
           Linus
