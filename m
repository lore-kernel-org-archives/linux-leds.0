From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 08/13] leds: Replace ARCH_KIRKWOOD dependency
Date: Mon, 30 Jun 2014 10:01:13 -0700
Message-ID: <CAK5ve-LyzmskEtXOXDr1ZNCXmb5bWkPZrYfr=5fUGjoWwsonBQ@mail.gmail.com>
References: <1404075603-31838-1-git-send-email-andrew@lunn.ch> <1404075603-31838-11-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:37268 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754168AbaF3RBf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Jun 2014 13:01:35 -0400
Received: by mail-la0-f54.google.com with SMTP id mc6so4972751lab.41
        for <linux-leds@vger.kernel.org>; Mon, 30 Jun 2014 10:01:33 -0700 (PDT)
In-Reply-To: <1404075603-31838-11-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Sun, Jun 29, 2014 at 1:59 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> mach-kirkwood has been removed, now that kirkwood SoC lives in
> mach-mvebu. Use MACH_KIRKWOOD which will be set when kirkwood is built
> as part of mach-mvebu.
>

Looks good to me. You can take my Ack and merge it with other patches.

Acked-by: Bryan Wu <cooloney@gmail.com>

> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: linux-leds@vger.kernel.org
> ---
>  drivers/leds/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a1b044e7eaad..2d7c380f79ce 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -411,7 +411,7 @@ config LEDS_MC13783
>  config LEDS_NS2
>         tristate "LED support for Network Space v2 GPIO LEDs"
>         depends on LEDS_CLASS
> -       depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
> +       depends on MACH_KIRKWOOD
>         default y
>         help
>           This option enable support for the dual-GPIO LED found on the
> @@ -421,7 +421,7 @@ config LEDS_NS2
>  config LEDS_NETXBIG
>         tristate "LED support for Big Network series LEDs"
>         depends on LEDS_CLASS
> -       depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
> +       depends on MACH_KIRKWOOD
>         default y
>         help
>           This option enable support for LEDs found on the LaCie 2Big
> --
> 2.0.0
>
