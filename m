From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] ARM/leds: move ARM Versatile LED driver to leds subsystem
Date: Fri, 14 Mar 2014 10:55:24 +0100
Message-ID: <CACRpkdYhFO+ur-RpwC6geBpuzMa-nghc86oWdCiVMiB2-BsrmQ@mail.gmail.com>
References: <1393509500-26002-1-git-send-email-linus.walleij@linaro.org>
	<1393509500-26002-2-git-send-email-linus.walleij@linaro.org>
	<1393510075.460580224@f137.i.mail.ru>
	<CACRpkdb+nLnjM7PUtkzmSJLjEC7FOH65sgOB6m-BUPB8YMzxiA@mail.gmail.com>
	<1394540634.21334.27.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:43101 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752926AbaCNJzZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 14 Mar 2014 05:55:25 -0400
Received: by mail-ob0-f174.google.com with SMTP id wo20so2303116obc.19
        for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2014 02:55:24 -0700 (PDT)
In-Reply-To: <1394540634.21334.27.camel@hornet>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Alexander Shiyan <shc_work@mail.ru>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Tue, Mar 11, 2014 at 1:23 PM, Pawel Moll <pawel.moll@arm.com> wrote:
> On Tue, 2014-03-11 at 12:18 +0000, Linus Walleij wrote:

>> On some systems without "real" GPIO the above would lead to
>> compiling in the entire gpiolib (149 KB) just to do this.
>>
>> I would agree more with inventing something like leds-mmio as a
>> separate refactoring after this, i.e. a driver for any memory-mapped
>> LED, which should cover a few cases. What do you think about this
>> idea?
>
> Something like this?
> http://thread.gmane.org/gmane.linux.kernel/1387110 ;-)

Yes.

The current GPIO maintainer is not aligned with the statements
that this is "some kind of GPIO".

Also the fact that this adds some hundred KB of code just to do
this simple thing wasn't brought up.

> But seriously speaking, I did exactly what Alexander mentioned on VE,
> considering the SYS_LED & alikes as "pseudo-gpios".

I just don't agree with that. They aren't GPIO's until used as
such, and push in a huge abstraction layer inbetween the driver
and its hardware for no good reason whatsoever I think.
This is not keeping things simple, it is making things obscure.

Yours,
Linus Walleij
