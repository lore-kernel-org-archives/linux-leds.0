From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH RFC 07/11] leds: Remove ARCH_KIRKWOOD dependency
Date: Wed, 25 Jun 2014 16:08:35 -0700
Message-ID: <CAK5ve-K0DN0QX1r5thRcajfN4xV6hk6xaEniPDzBF+kaZSPCeQ@mail.gmail.com>
References: <1400163836-9831-1-git-send-email-andrew@lunn.ch> <1400163836-9831-12-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:45011 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757066AbaFYXI5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Jun 2014 19:08:57 -0400
Received: by mail-la0-f47.google.com with SMTP id s18so1292590lam.34
        for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2014 16:08:55 -0700 (PDT)
In-Reply-To: <1400163836-9831-12-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux ARM <linux-arm-kernel@lists.infradead.org>, Jason Cooper <jason@lakedaemon.net>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, May 15, 2014 at 7:23 AM, Andrew Lunn <andrew@lunn.ch> wrote:
> mach-kirkwood has been removed, now that kirkwood lives in mach-mvebu.
>

Sorry for the delay.

Please take my Ack for merging this change.

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
> index 6de9dfbf61c1..01ebebfcc891 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -421,7 +421,7 @@ config LEDS_MC13783
>  config LEDS_NS2
>         tristate "LED support for Network Space v2 GPIO LEDs"
>         depends on LEDS_CLASS
> -       depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
> +       depends on MACH_KIRKWOOD
>         default y
>         help
>           This option enable support for the dual-GPIO LED found on the
> @@ -431,7 +431,7 @@ config LEDS_NS2
>  config LEDS_NETXBIG
>         tristate "LED support for Big Network series LEDs"
>         depends on LEDS_CLASS
> -       depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
> +       depends on MACH_KIRKWOOD
>         default y
>         help
>           This option enable support for LEDs found on the LaCie 2Big
> --
> 2.0.0.rc2
>
