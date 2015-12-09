From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 159/182] leds: tca6507: use gpiochip data pointer
Date: Wed, 09 Dec 2015 15:29:30 +0100
Message-ID: <56683ACA.8020506@samsung.com>
References: <1449668778-5980-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:65366 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752659AbbLIO3d (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 9 Dec 2015 09:29:33 -0500
In-reply-to: <1449668778-5980-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Riku Voipio <riku.voipio@iki.fi>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On 12/09/2015 02:46 PM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> LEDS people: please ACK this so I can merge it in the GPIO tree.
> ---
>   drivers/leds/leds-tca6507.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index 75529a24a615..c548ea10f0f0 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -603,7 +603,7 @@ static int tca6507_blink_set(struct led_classdev *led_cdev,
>   static void tca6507_gpio_set_value(struct gpio_chip *gc,
>   				   unsigned offset, int val)
>   {
> -	struct tca6507_chip *tca = container_of(gc, struct tca6507_chip, gpio);
> +	struct tca6507_chip *tca = gpiochip_get_data(gc);
>   	unsigned long flags;
>
>   	spin_lock_irqsave(&tca->lock, flags);
> @@ -655,7 +655,7 @@ static int tca6507_probe_gpios(struct i2c_client *client,
>   #ifdef CONFIG_OF_GPIO
>   	tca->gpio.of_node = of_node_get(client->dev.of_node);
>   #endif
> -	err = gpiochip_add(&tca->gpio);
> +	err = gpiochip_add_data(&tca->gpio, tca);
>   	if (err) {
>   		tca->gpio.ngpio = 0;
>   		return err;
>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
