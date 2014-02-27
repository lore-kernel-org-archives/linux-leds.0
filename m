From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/1] leds: leds-s3c24xx: Trivial cleanup in header file
Date: Thu, 27 Feb 2014 09:57:37 -0800
Message-ID: <CAK5ve-KhJXq5QJG6pU7+ZpWCPJAq2uhZcJet6_FPnMWXchqJaA@mail.gmail.com>
References: <1392359829-12493-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:59473 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384AbaB0R56 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2014 12:57:58 -0500
Received: by mail-lb0-f173.google.com with SMTP id p9so1939705lbv.32
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2014 09:57:57 -0800 (PST)
In-Reply-To: <1392359829-12493-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>

On Thu, Feb 13, 2014 at 10:37 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Commit 436d42c61c3e ("ARM: samsung: move platform_data definitions")
> moved the files to the current location but forgot to remove the pointer
> to its previous location. Clean it up. While at it also change the header
> file protection macros appropriately.
>

Thanks, merged.

-Bryan

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  include/linux/platform_data/leds-s3c24xx.h |    9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/platform_data/leds-s3c24xx.h b/include/linux/platform_data/leds-s3c24xx.h
> index d8a7672519b6..441a6f290649 100644
> --- a/include/linux/platform_data/leds-s3c24xx.h
> +++ b/include/linux/platform_data/leds-s3c24xx.h
> @@ -1,5 +1,4 @@
> -/* arch/arm/mach-s3c2410/include/mach/leds-gpio.h
> - *
> +/*
>   * Copyright (c) 2006 Simtec Electronics
>   *     http://armlinux.simtec.co.uk/
>   *     Ben Dooks <ben@simtec.co.uk>
> @@ -11,8 +10,8 @@
>   * published by the Free Software Foundation.
>  */
>
> -#ifndef __ASM_ARCH_LEDSGPIO_H
> -#define __ASM_ARCH_LEDSGPIO_H "leds-gpio.h"
> +#ifndef __LEDS_S3C24XX_H
> +#define __LEDS_S3C24XX_H
>
>  #define S3C24XX_LEDF_ACTLOW    (1<<0)          /* LED is on when GPIO low */
>  #define S3C24XX_LEDF_TRISTATE  (1<<1)          /* tristate to turn off */
> @@ -25,4 +24,4 @@ struct s3c24xx_led_platdata {
>         char                    *def_trigger;
>  };
>
> -#endif /* __ASM_ARCH_LEDSGPIO_H */
> +#endif /* __LEDS_S3C24XX_H */
> --
> 1.7.9.5
>
