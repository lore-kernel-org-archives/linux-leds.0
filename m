From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 3/5] leds: lp5562: remove unnecessary parentheses
Date: Thu, 27 Feb 2014 10:03:29 -0800
Message-ID: <CAK5ve-LZUMrsfPqinmbSf-mRKsqY4D36Y2svzQq1DNryj-VSTw@mail.gmail.com>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com> <000d01cf32b1$3c15de20$b4419a60$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:59464 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751663AbaB0SDv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2014 13:03:51 -0500
Received: by mail-la0-f54.google.com with SMTP id mc6so1973820lab.27
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2014 10:03:50 -0800 (PST)
In-Reply-To: <000d01cf32b1$3c15de20$b4419a60$%han@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Kim Milo <Milo.Kim@ti.com>

On Tue, Feb 25, 2014 at 9:11 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> Remove unnecessary parentheses in order to fix the following
> checkpatch error.
>
>   ERROR: return is not a function, parentheses are not required
>

Applied, thanks,
-Bryan

> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/leds/leds-lp5562.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
> index 315d3ca..ca85724 100644
> --- a/drivers/leds/leds-lp5562.c
> +++ b/drivers/leds/leds-lp5562.c
> @@ -346,9 +346,9 @@ static void lp5562_write_program_memory(struct lp55xx_chip *chip,
>  /* check the size of program count */
>  static inline bool _is_pc_overflow(struct lp55xx_predef_pattern *ptn)
>  {
> -       return (ptn->size_r >= LP5562_PROGRAM_LENGTH ||
> -               ptn->size_g >= LP5562_PROGRAM_LENGTH ||
> -               ptn->size_b >= LP5562_PROGRAM_LENGTH);
> +       return ptn->size_r >= LP5562_PROGRAM_LENGTH ||
> +              ptn->size_g >= LP5562_PROGRAM_LENGTH ||
> +              ptn->size_b >= LP5562_PROGRAM_LENGTH;
>  }
>
>  static int lp5562_run_predef_led_pattern(struct lp55xx_chip *chip, int mode)
> --
> 1.7.10.4
>
>
