From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/1] leds: s3c24xx: Remove hardware.h inclusion
Date: Tue, 7 Jan 2014 16:34:23 -0800
Message-ID: <CAK5ve-Lhj+axbQTz7nHo6E-QmPA4c3Eb8j+67RGer6qmRG+-rQ@mail.gmail.com>
References: <1388730604-32329-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:42312 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751350AbaAHAep (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2014 19:34:45 -0500
Received: by mail-la0-f46.google.com with SMTP id eh20so662193lab.33
        for <linux-leds@vger.kernel.org>; Tue, 07 Jan 2014 16:34:44 -0800 (PST)
In-Reply-To: <1388730604-32329-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, patches@linaro.org

On Thu, Jan 2, 2014 at 10:30 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> The contents of this header file is not referenced in the led driver.
> Remove its inclusion. While at it, re-arrange the headers as per the
> category.
>

OK, applied to my tree.

Thanks,
-Bryan

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/leds/leds-s3c24xx.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
> index 76483fb5ee45..b7876eb09e8c 100644
> --- a/drivers/leds/leds-s3c24xx.c
> +++ b/drivers/leds/leds-s3c24xx.c
> @@ -18,10 +18,9 @@
>  #include <linux/gpio.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/leds-s3c24xx.h>
>
> -#include <mach/hardware.h>
>  #include <mach/regs-gpio.h>
> -#include <linux/platform_data/leds-s3c24xx.h>
>
>  /* our context */
>
> --
> 1.7.9.5
>
