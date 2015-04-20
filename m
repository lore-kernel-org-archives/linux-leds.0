From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: gpio: Fix error handling for led name null pointer case
Date: Mon, 20 Apr 2015 11:35:25 -0700
Message-ID: <CAK5ve-+FyDHQ01UnENcCaJOy_+ExcCQksT9ozVBtyx_j+Yh2Vg@mail.gmail.com>
References: <1429169450-11791-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:36512 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751393AbbDTSfq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 14:35:46 -0400
Received: by pabsx10 with SMTP id sx10so214717747pab.3
        for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 11:35:46 -0700 (PDT)
In-Reply-To: <1429169450-11791-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

On Thu, Apr 16, 2015 at 12:30 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Make sure that already registered LEDs will be torn down properly
> if the name of the next LED to create is unavailable.
>

Thanks, merged.
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  drivers/leds/leds-gpio.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 25df4a2..c3db74a 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -198,8 +198,10 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>                 } else {
>                         if (IS_ENABLED(CONFIG_OF) && !led.name && np)
>                                 led.name = np->name;
> -                       if (!led.name)
> -                               return ERR_PTR(-EINVAL);
> +                       if (!led.name) {
> +                               ret = -EINVAL;
> +                               goto err;
> +                       }
>                 }
>                 fwnode_property_read_string(child, "linux,default-trigger",
>                                             &led.default_trigger);
> --
> 1.7.9.5
>
