Return-Path: <SRS0=ep0a=BQ=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD829C433E0
	for <linux-leds@archiver.kernel.org>; Thu,  6 Aug 2020 17:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 201C323132
	for <linux-leds@archiver.kernel.org>; Thu,  6 Aug 2020 17:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbgHFRJ7 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:09:59 -0400
Received: from mail.thorsis.com ([92.198.35.195]:59708 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730043AbgHFRJk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 6 Aug 2020 13:09:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 981E629BE
        for <linux-leds@vger.kernel.org>; Thu,  6 Aug 2020 12:52:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id C9IDGUtvL98i for <linux-leds@vger.kernel.org>;
        Thu,  6 Aug 2020 12:52:36 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 7828D2A2E; Thu,  6 Aug 2020 12:52:36 +0200 (CEST)
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Luca Weiss <luca@z3ntu.xyz>
Subject: Re: Multicolor leds-gpio
Date:   Thu, 06 Aug 2020 12:52:33 +0200
Message-ID: <2050851.IQFrM7rjFq@ada>
In-Reply-To: <20200805220547.mkjtuzcitwrb6whn@duo.ucw.cz>
References: <2530787.iFCFyWWcSu@g550jk> <20200805220547.mkjtuzcitwrb6whn@duo.ucw.cz>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

Am Donnerstag, 6. August 2020, 00:05:47 CEST schrieb Pavel Machek:
> > would it be possible to make the leds-gpio driver compatible with the new
> > multicolor framework for a light that's composed of 3 leds (red, green,
> > blue) and where each led is controlled via a gpio (so it can produce 8
> > different colors)? As far as I can tell leds-gpio is too generic to
> > support that but please correct me if I'm wrong. What's the way forward
> > here for this use case? The same probably also applies to leds-pwm.
> 
> For pwm it definitely makes sense.

I think it also makes sense for plain GPIO, I asked the same thing last year 
IIRC.

> For gpio... well, I'm not sure you'll get useful colors that way. You
> can probably still do multicolor, yes.

Let's assume a typical RGB LED, like the one on the SAMA5D27-SOM1-EK board, 
you would roughly get those colors:

- R: red
- G: green
- B: blue
- R + G: yellow
- R + B: magenta
- G + B: cyan
- R + G + B: white

I count more than twice the colors as with the simple leds-gpio approach only. 
;-)

SCNR
Alex



