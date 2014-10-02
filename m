From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] led: remove use of gpiochip_remove() retval
Date: Thu, 2 Oct 2014 09:12:36 +0200
Message-ID: <CACRpkdZDVPTKX4N9fxYdr1OEBQ_BisU2vXrvNRZ3YXCax4jm+A@mail.gmail.com>
References: <1412087707-8313-1-git-send-email-pramod.gurav@smartplayin.com>
	<CAK5ve-KCYHySjs4f+rd+kAvKQmTkJqsq87Muq_j-D0nB7WSYjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:47015 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285AbaJBHMh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 2 Oct 2014 03:12:37 -0400
Received: by mail-ig0-f175.google.com with SMTP id uq10so578632igb.8
        for <linux-leds@vger.kernel.org>; Thu, 02 Oct 2014 00:12:36 -0700 (PDT)
In-Reply-To: <CAK5ve-KCYHySjs4f+rd+kAvKQmTkJqsq87Muq_j-D0nB7WSYjQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, lkml <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 30, 2014 at 11:21 PM, Bryan Wu <cooloney@gmail.com> wrote:
> On Tue, Sep 30, 2014 at 7:35 AM, Pramod Gurav
> <pramod.gurav@smartplayin.com> wrote:
>> Get rid of using return value from gpiochip_remove() as it returns
>> void.
>
> Looks good to me. I will merge it.

Please don't.

The issue is already fixed through the GPIO tree, where the
API change is.

Yours,
Linus Walleij
