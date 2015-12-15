From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] drivers/leds: make trigger/ledtrig-cpu.c driver
 explicitly non-modular
Date: Tue, 15 Dec 2015 14:28:40 +0100
Message-ID: <CACRpkdbXQWG33wvEE-iO6LzxWZqxjFh4T=VC5VK+bqYdMYDLDQ@mail.gmail.com>
References: <1450043151-30820-1-git-send-email-paul.gortmaker@windriver.com>
	<1450043151-30820-2-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35837 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933323AbbLON2m (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 08:28:42 -0500
Received: by mail-ob0-f176.google.com with SMTP id 18so6203470obc.2
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 05:28:42 -0800 (PST)
In-Reply-To: <1450043151-30820-2-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Sun, Dec 13, 2015 at 10:45 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for this driver is currently:
>
> config LEDS_TRIGGER_CPU
>         bool "LED CPU Trigger"
>
> ...meaning that it currently is not being built as a module by anyone.
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
