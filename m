From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 4/5] leds: leds-mc13783: Remove unnecessary cleaning of
 registers on exit
Date: Mon, 16 Dec 2013 12:29:21 -0800
Message-ID: <CAK5ve-JGG2TP2R==dPYQPT0mG3+sjE_gU+sMXVfL5yOcwczcdA@mail.gmail.com>
References: <1387018850-6974-1-git-send-email-shc_work@mail.ru> <1387018850-6974-4-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:55187 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751102Ab3LPU3n (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2013 15:29:43 -0500
Received: by mail-la0-f54.google.com with SMTP id b8so2934512lan.13
        for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2013 12:29:41 -0800 (PST)
In-Reply-To: <1387018850-6974-4-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Philippe Retornaz <philippe.retornaz@epfl.ch>

On Sat, Dec 14, 2013 at 3:00 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> LED core switches each LED to OFF-state on exit, so there is no need
> for resetting registers.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/leds/leds-mc13783.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
> index 40e4de0..b5a8357 100644
> --- a/drivers/leds/leds-mc13783.c
> +++ b/drivers/leds/leds-mc13783.c
> @@ -224,7 +224,6 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
>  static int mc13xxx_led_remove(struct platform_device *pdev)
>  {
>         struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
> -       struct mc13xxx *mcdev = leds->master;
>         int i;
>
>         for (i = 0; i < leds->num_leds; i++) {
> @@ -232,9 +231,6 @@ static int mc13xxx_led_remove(struct platform_device *pdev)
>                 cancel_work_sync(&leds->led[i].work);
>         }
>
> -       for (i = 0; i < leds->devtype->num_regs; i++)
> -               mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i, 0);
> -

This one looks good to me,
-Bryan


>         return 0;
>  }
>
> --
> 1.8.3.2
>
