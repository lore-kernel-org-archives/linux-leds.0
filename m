From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Thu, 30 Nov 2017 09:41:47 +0000
Message-ID: <20171130094147.5c42ioeoqnujulox@dell>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
 <CACRpkdYg-dUpaMQwvovBrmjp=zHdPS9geBW=xuS0ioLqfvPaGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:44393 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751486AbdK3Jlu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Nov 2017 04:41:50 -0500
Received: by mail-wm0-f66.google.com with SMTP id t8so11732854wmc.3
        for <linux-leds@vger.kernel.org>; Thu, 30 Nov 2017 01:41:50 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYg-dUpaMQwvovBrmjp=zHdPS9geBW=xuS0ioLqfvPaGw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>

On Thu, 30 Nov 2017, Linus Walleij wrote:

> On Thu, Nov 30, 2017 at 4:05 AM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> 
> > The pointer returned by of_device_get_match_data() doesn't have the same
> > size as u32 on 64-bit architectures, causing issues when compile testing
> > the driver on such platform. Make ledtype unsigned long instead, to
> > solve this problem.
> >
> > Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Thanks for covering my ass.

:D

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I still need a LED Ack if I'm going to take this.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
