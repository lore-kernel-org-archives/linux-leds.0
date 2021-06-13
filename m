Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C67C48BE5
	for <linux-leds@archiver.kernel.org>; Sun, 13 Jun 2021 00:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D89F0610A0
	for <linux-leds@archiver.kernel.org>; Sun, 13 Jun 2021 00:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhFMAXX (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 12 Jun 2021 20:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFMAXW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Jun 2021 20:23:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521CFC061574
        for <linux-leds@vger.kernel.org>; Sat, 12 Jun 2021 17:21:03 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id p7so14593769lfg.4
        for <linux-leds@vger.kernel.org>; Sat, 12 Jun 2021 17:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kLgm/naPKo94DUlmpKFkLYCsXS9yC5D9UG7AzupGIgM=;
        b=M0aGyGIgYoEIYsdhgNFnmaYw4hq863WqbNdWfOq38fZZ3s0wLE5A4yDaq/7RYsf2/+
         /GEXkluEd/hJRFSk/b/VqpoOHEh64m3ADtRgLBGoPjMDQ0NtU2EoAy0IKGpXUAw9680C
         LKpUjVPBQxjrcIcH8CU0/g8B9Y4GM7Fqlfd+d96Ufht8PkdEQ0WTorHfiFpEUB49mZW5
         vlsVDyq20E4LVVBjcgJXL7YXXsn0Qg8+X8QZ/yAnMHPglk6h7gnxBl2D9muzHUGSTrBB
         g6Kjs5gMG9aOvi0WUHZCobnlHSmk4W7rgV7BrCX6hUqJ1ahCKYW7RTaOdN369khmUV9H
         5Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kLgm/naPKo94DUlmpKFkLYCsXS9yC5D9UG7AzupGIgM=;
        b=QpfI1qh5WSLtB6utsOw9bbQ2cvdfNqsvF4OZB5NrJCTNays5lCLFUqyeeiiBYyC5I+
         KjX6SRRpuDtgbzi72qspOfCL4eX7AGo0PEO6WPFtVCcdD4fJhiZZW3jFi87gp4SpiBHz
         xgOk2Kkorc+ahSifckeIWfbfemkT2bAWlKbXrE9qvWruDfuG2usjza6ZeaAAC0ef0f/D
         qnBywEWxFoijGp2Xzk0CcUmqB9sUUOzhNqXeUhY+CNFbcPh0a2XZoQ2GG7QOfVe3MKTK
         o2YlF00xcICCc8ivVX1E++y+zIxt5bpMbbIcMCYUAjN5r9hl75chtfLwSNasAoyRKwpJ
         Eb1w==
X-Gm-Message-State: AOAM533wweAIERVt93M9+CX4hFCALWD8oBdcl1jpX3LsRWJI6HmjOO8a
        AKd2/19c74QOIufbhm6QG+1UNOBppazsXmjgXiSgeA==
X-Google-Smtp-Source: ABdhPJw4xs5UzEAlSh6vTIJqAx964aQLL9ZfLtyiPfXI6Ws95BxtxWw5h3xTCVYJ/pzvZeyQRfFFi7asQL49qf4BIEM=
X-Received: by 2002:a19:8157:: with SMTP id c84mr7326808lfd.529.1623543661424;
 Sat, 12 Jun 2021 17:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210613000302.421268-1-linus.walleij@linaro.org> <20210613000302.421268-2-linus.walleij@linaro.org>
In-Reply-To: <20210613000302.421268-2-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 13 Jun 2021 02:20:50 +0200
Message-ID: <CACRpkdbxSscUZpPvgo62jonBqK5t6givsu-oVUcZ35yKOOHOEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: davinci: dm646x: Convert LEDs to GPIO descriptor table
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Jun 13, 2021 at 2:05 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> This converts the DaVinci DM646x LEDs to use GPIO
> descriptor look-ups.
>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Rebase on v5.13-rc1
> - Resend
> - LED maintainers: please apply this patch, it is ACKed by a DaVinci
>   maintainer

Do not apply this either until I figured out what the problem is,
thanks!

Yours,
Linus Walleij
