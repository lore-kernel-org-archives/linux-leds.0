From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds-gpio: Fix error handling and memory leak
Date: Thu, 26 Mar 2015 18:20:02 -0700
Message-ID: <CAK5ve-+vwbMhDc-_YE3skwSS0RtCULspzQiYyPwero6a_jFk7w@mail.gmail.com>
References: <1425948222-7925-1-git-send-email-minyard@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:38145 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752632AbbC0BUX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 21:20:23 -0400
In-Reply-To: <1425948222-7925-1-git-send-email-minyard@acm.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: minyard@acm.org
Cc: Raphael Assenat <raph@8d.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Corey Minyard <cminyard@mvista.com>

On Mon, Mar 9, 2015 at 5:43 PM,  <minyard@acm.org> wrote:
> From: Corey Minyard <cminyard@mvista.com>
>
> The leds-gpio driver would not clean up properly if it failed in some
> places, and it wasn't freeing its private data.
>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/leds/leds-gpio.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index d26af0a..32f7642 100644
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
> @@ -217,19 +219,21 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>                 if (fwnode_property_present(child, "retain-state-suspended"))
>                         led.retain_state_suspended = 1;
>
> -               ret = create_gpio_led(&led, &priv->leds[priv->num_leds++],
> +               ret = create_gpio_led(&led, &priv->leds[priv->num_leds],

Why need this change? it's correct. And your add one more line
"priv->num_leds++"
>                                       dev, NULL);
>                 if (ret < 0) {
>                         fwnode_handle_put(child);
>                         goto err;
>                 }
> +               priv->num_leds++;
Why need this?

>         }
>
>         return priv;
>
>  err:
> -       for (count = priv->num_leds - 2; count >= 0; count--)
> +       for (count = priv->num_leds - 1; count >= 0; count--)
>                 delete_gpio_led(&priv->leds[count]);
> +       devm_kfree(dev, priv);
priv is created by devm_kzalloc(), so if driver probing return error,
it will be freed automatically, you don't need call devm_free();

>         return ERR_PTR(ret);
>  }
>
> @@ -283,6 +287,7 @@ static int gpio_led_remove(struct platform_device *pdev)
>
>         for (i = 0; i < priv->num_leds; i++)
>                 delete_gpio_led(&priv->leds[i]);
> +       devm_kfree(&pdev->dev, priv);
No need this during remove.

>
>         return 0;
>  }
> --
> 1.8.3.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
