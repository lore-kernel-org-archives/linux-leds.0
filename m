Return-Path: <SRS0=tdXK=3L=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375E0C32771
	for <linux-leds@archiver.kernel.org>; Wed, 22 Jan 2020 21:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06CAE2465A
	for <linux-leds@archiver.kernel.org>; Wed, 22 Jan 2020 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579726930;
	bh=mI1h+XcUohH1Ah0tPd29whLheExYAGqOqauXp6wVM8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=C6SblOZRQ1J2b8QJm+IyUPm5ytff/4a5F00zfieBeVR8Ih2WldgQOuvUcCpJ4AiHr
	 4YXMcqBptJC4WLP1OczGRI3E12CahlvjVoHMyEQoNHZZsLmBuD3xp3++c1BCUAZ0LY
	 Iq9KAVSJf0g5XeQtiPJcB5JRxRB4sA3d4ACUaW8w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgAVVCJ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 22 Jan 2020 16:02:09 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36490 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728978AbgAVVCG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jan 2020 16:02:06 -0500
Received: by mail-lf1-f66.google.com with SMTP id f24so687770lfh.3
        for <linux-leds@vger.kernel.org>; Wed, 22 Jan 2020 13:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hP1mENuItdJnN2aVntO5IMnlJCI7lfXArukwoEVqH/I=;
        b=Atv4A5J15roxDToZcP61ysc18ZTE6nszskdZa28nkL7KJWUTLnHzBqR9QFtpRpHtnm
         T1ItpDcHVq3ctozS7CL2QGu+dUmvkYE0sSYvclZRaEoMooONPNIt0/VrDiSfz0HJCMU2
         +fPIUDF3rnWCLtLj2Tm3MzXz3gKuLrkpFvHDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hP1mENuItdJnN2aVntO5IMnlJCI7lfXArukwoEVqH/I=;
        b=GiSjO6JIcEN4WEhHuHvzlf5XJ0ZvWtM+SCY7cMj19r1dU2/2AnFf9ezvALLaEUqC47
         9RIA/unp3pfMvjcyj5jUAoRWTfALrUFvJKQBy4vzV6po582BMXPEPn/dVImZBGDxNEoX
         zdH23RAF8WOu3e0iDmDskVyV3ToiR8UXcyk5YY432JgRF+i7o/X0IdKaN3Ny9K94nK+N
         lzIM5cqT5TMXuYz2/sxSKLCYiRL4D8fVoPgJxv4pjedlQv3x566w4NfFWcduDRXTxIBd
         MastSMw4w3ISlpTK7WG80GMYmTBrbZcZnbBvtAIbQ1D1H0zgd39NWs9NM7OezTFkmLi3
         afTA==
X-Gm-Message-State: APjAAAXS7NlXcErkYHOEyJj+Kr+onyYYSNaKDKT2aPFKMc+fPNf1clJd
        VPXOFR6ct4vtCppkdhk69OY48ofoqLg=
X-Google-Smtp-Source: APXvYqxdRavaH+vhzQ7RnxqpqHgK2m9nazo14ZvrkLOxBHdgi4y+LZD+mnCuYTJZ8XatR+2zHgAtdg==
X-Received: by 2002:a19:23d7:: with SMTP id j206mr2825224lfj.108.1579726924190;
        Wed, 22 Jan 2020 13:02:04 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id f16sm20755290ljn.17.2020.01.22.13.02.03
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 13:02:03 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id o13so641698ljg.4
        for <linux-leds@vger.kernel.org>; Wed, 22 Jan 2020 13:02:03 -0800 (PST)
X-Received: by 2002:a2e:7a13:: with SMTP id v19mr20632976ljc.43.1579726922616;
 Wed, 22 Jan 2020 13:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20200122201711.GA29496@amd>
In-Reply-To: <20200122201711.GA29496@amd>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 22 Jan 2020 13:01:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjDUy5_070R-3W15+Aknjsnhe=EmSeKQ6mt=dOxe3zNeg@mail.gmail.com>
Message-ID: <CAHk-=wjDUy5_070R-3W15+Aknjsnhe=EmSeKQ6mt=dOxe3zNeg@mail.gmail.com>
Subject: Re: [GIT PULL] LEDs changes for 5.5-rc8
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jan 22, 2020 at 12:17 PM Pavel Machek <pavel@ucw.cz> wrote:
>
>       leds: lm3532: add pointer to documentation and fix typo

You should just have fixed the grammar error in that string too while
fixing the typo.

   "Too many LED string defined\n"

that would have been better with "strings", since it's plural.

I didn't bother to fix it up, just reacted to it since I was looking
at the changes. Not important.

               Linus

            Linus
