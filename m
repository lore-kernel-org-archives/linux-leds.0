From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] drivers: leds: leds-tca6507: check CONFIG_GPIOLIB whether
 defined for 'gpio_base'
Date: Mon, 9 Dec 2013 10:24:51 -0800
Message-ID: <CAK5ve-K9mVnsOUAQCC2byXRzK3-PyZnxc1rr09p4-xz4oNKa3g@mail.gmail.com>
References: <52A54A01.60107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:48879 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755633Ab3LISZM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2013 13:25:12 -0500
Received: by mail-la0-f43.google.com with SMTP id n7so1876974lam.16
        for <linux-leds@vger.kernel.org>; Mon, 09 Dec 2013 10:25:11 -0800 (PST)
In-Reply-To: <52A54A01.60107@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Chen Gang <gang.chen.5i5j@gmail.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>

On Sun, Dec 8, 2013 at 8:41 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>
> Need check CONFIG_GPIOLIB whether defined, just like another area has
> done within this file. Or can not pass compiling when CONFIG_GPIOLIB
> disabled.
>
> The related error (with allmodconfig for metag):
>
>     CC [M]  drivers/leds/leds-tca6507.o
>   drivers/leds/leds-tca6507.c: In function 'tca6507_led_dt_init':
>   drivers/leds/leds-tca6507.c:731: error: 'struct tca6507_platform_data' has no member named 'gpio_base'
>
>

Good, I merged it into my tree.
Thanks,
-Bryan

>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  drivers/leds/leds-tca6507.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index 503df83..3d9e267 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -728,8 +728,9 @@ tca6507_led_dt_init(struct i2c_client *client)
>
>         pdata->leds.leds = tca_leds;
>         pdata->leds.num_leds = NUM_LEDS;
> +#ifdef CONFIG_GPIOLIB
>         pdata->gpio_base = -1;
> -
> +#endif
>         return pdata;
>  }
>
> --
> 1.7.7.6
