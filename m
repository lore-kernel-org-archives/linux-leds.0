From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/3] led: gpio: Sort include headers alphabetically
Date: Mon, 29 Sep 2014 10:19:42 -0700
Message-ID: <CAK5ve-JJcHYrsj7c91yj3XPZ3niM=yNmWAu+Ue35XMfuX5baow@mail.gmail.com>
References: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com> <1411894636-12360-2-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:34597 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752177AbaI2RUE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Sep 2014 13:20:04 -0400
Received: by mail-lb0-f182.google.com with SMTP id z11so6444207lbi.41
        for <linux-leds@vger.kernel.org>; Mon, 29 Sep 2014 10:20:03 -0700 (PDT)
In-Reply-To: <1411894636-12360-2-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Xiubo Li <Li.Xiubo@freescale.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Sun, Sep 28, 2014 at 1:57 AM, Xiubo Li <Li.Xiubo@freescale.com> wrote:
> If the inlcude headers aren't sorted alphabetically, then the
> logical choice is to append new ones, however that creates a
> lot of potential for conflicts or duplicates because every change
> will then add new includes in the same location.
>

Good move, thanks. I will merge it.

-Bryan

> Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
> ---
>  drivers/leds/leds-gpio-register.c |  2 +-
>  drivers/leds/leds-gpio.c          | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/leds-gpio-register.c
> index 1c4ed55..fbd8934 100644
> --- a/drivers/leds/leds-gpio-register.c
> +++ b/drivers/leds/leds-gpio-register.c
> @@ -7,9 +7,9 @@
>   * Free Software Foundation.
>   */
>  #include <linux/err.h>
> +#include <linux/leds.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> -#include <linux/leds.h>
>
>  /**
>   * gpio_led_register_device - register a gpio-led device
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 57ff20f..1b1e617 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -10,17 +10,17 @@
>   * published by the Free Software Foundation.
>   *
>   */
> -#include <linux/kernel.h>
> -#include <linux/platform_device.h>
> +#include <linux/err.h>
>  #include <linux/gpio.h>
> +#include <linux/kernel.h>
>  #include <linux/leds.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
>  #include <linux/of_gpio.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> -#include <linux/module.h>
> -#include <linux/err.h>
>
>  struct gpio_led_data {
>         struct led_classdev cdev;
> --
> 2.1.0.27.g96db324
>
