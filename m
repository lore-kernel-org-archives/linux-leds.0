From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/3] led: gpio: Fix possible ZERO_SIZE_PTR pointer
 dereferencing error.
Date: Mon, 29 Sep 2014 10:21:35 -0700
Message-ID: <CAK5ve-KgcekmJizMY9cc+uBrO5i4fsqRDid97GCW347aYdZxuw@mail.gmail.com>
References: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com> <1411894636-12360-3-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:53979 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752591AbaI2RV5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Sep 2014 13:21:57 -0400
Received: by mail-lb0-f177.google.com with SMTP id w7so1618129lbi.36
        for <linux-leds@vger.kernel.org>; Mon, 29 Sep 2014 10:21:55 -0700 (PDT)
In-Reply-To: <1411894636-12360-3-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Xiubo Li <Li.Xiubo@freescale.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Sun, Sep 28, 2014 at 1:57 AM, Xiubo Li <Li.Xiubo@freescale.com> wrote:
> Since we cannot make sure the 'pdata->num_leds' will always be none
> zero here, and then if it equals to zero, the kmemdup() will return
> ZERO_SIZE_PTR, which equals to ((void *)16).
>
> So this patch fix this with just doing the zero check before calling
> kmemdup().
>

Thanks, applied.

-Bryan

> Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
> ---
>  drivers/leds/leds-gpio-register.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/leds-gpio-register.c
> index fbd8934..75717ba 100644
> --- a/drivers/leds/leds-gpio-register.c
> +++ b/drivers/leds/leds-gpio-register.c
> @@ -28,6 +28,9 @@ struct platform_device *__init gpio_led_register_device(
>         struct platform_device *ret;
>         struct gpio_led_platform_data _pdata = *pdata;
>
> +       if (!pdata->num_leds)
> +               return ERR_PTR(-EINVAL);
> +
>         _pdata.leds = kmemdup(pdata->leds,
>                         pdata->num_leds * sizeof(*pdata->leds), GFP_KERNEL);
>         if (!_pdata.leds)
> --
> 2.1.0.27.g96db324
>
