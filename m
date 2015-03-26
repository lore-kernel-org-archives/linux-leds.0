From: Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH] leds-gpio: Fix error handling and memory leak
Date: Thu, 26 Mar 2015 09:55:59 -0500
Message-ID: <55141DFF.5020905@mvista.com>
References: <1425948222-7925-1-git-send-email-minyard@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34119 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752391AbbCZO4H (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 10:56:07 -0400
Received: by oigz129 with SMTP id z129so6322149oig.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2015 07:56:06 -0700 (PDT)
In-Reply-To: <1425948222-7925-1-git-send-email-minyard@acm.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: minyard@acm.org, Raphael Assenat <raph@8d.com>
Cc: linux-leds@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Ping.  This is a rather obvious fix and can result in an oops.

-corey

On 03/09/2015 07:43 PM, minyard@acm.org wrote:
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
>  		} else {
>  			if (IS_ENABLED(CONFIG_OF) && !led.name && np)
>  				led.name = np->name;
> -			if (!led.name)
> -				return ERR_PTR(-EINVAL);
> +			if (!led.name) {
> +				ret = -EINVAL;
> +				goto err;
> +			}
>  		}
>  		fwnode_property_read_string(child, "linux,default-trigger",
>  					    &led.default_trigger);
> @@ -217,19 +219,21 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>  		if (fwnode_property_present(child, "retain-state-suspended"))
>  			led.retain_state_suspended = 1;
>  
> -		ret = create_gpio_led(&led, &priv->leds[priv->num_leds++],
> +		ret = create_gpio_led(&led, &priv->leds[priv->num_leds],
>  				      dev, NULL);
>  		if (ret < 0) {
>  			fwnode_handle_put(child);
>  			goto err;
>  		}
> +		priv->num_leds++;
>  	}
>  
>  	return priv;
>  
>  err:
> -	for (count = priv->num_leds - 2; count >= 0; count--)
> +	for (count = priv->num_leds - 1; count >= 0; count--)
>  		delete_gpio_led(&priv->leds[count]);
> +	devm_kfree(dev, priv);
>  	return ERR_PTR(ret);
>  }
>  
> @@ -283,6 +287,7 @@ static int gpio_led_remove(struct platform_device *pdev)
>  
>  	for (i = 0; i < priv->num_leds; i++)
>  		delete_gpio_led(&priv->leds[i]);
> +	devm_kfree(&pdev->dev, priv);
>  
>  	return 0;
>  }
