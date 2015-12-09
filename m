From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 158/182] leds: pca9532: use gpiochip data pointer
Date: Wed, 09 Dec 2015 15:29:23 +0100
Message-ID: <56683AC3.6070300@samsung.com>
References: <1449668770-5933-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61887 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754153AbbLIO32 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 9 Dec 2015 09:29:28 -0500
In-reply-to: <1449668770-5933-1-git-send-email-linus.walleij@linaro.org>
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
>   drivers/leds/leds-pca9532.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index a975b32ee8c8..1b228adfd1a7 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -245,7 +245,7 @@ static void pca9532_led_work(struct work_struct *work)
>   #ifdef CONFIG_LEDS_PCA9532_GPIO
>   static int pca9532_gpio_request_pin(struct gpio_chip *gc, unsigned offset)
>   {
> -	struct pca9532_data *data = container_of(gc, struct pca9532_data, gpio);
> +	struct pca9532_data *data = gpiochip_get_data(gc);
>   	struct pca9532_led *led = &data->leds[offset];
>
>   	if (led->type == PCA9532_TYPE_GPIO)
> @@ -256,7 +256,7 @@ static int pca9532_gpio_request_pin(struct gpio_chip *gc, unsigned offset)
>
>   static void pca9532_gpio_set_value(struct gpio_chip *gc, unsigned offset, int val)
>   {
> -	struct pca9532_data *data = container_of(gc, struct pca9532_data, gpio);
> +	struct pca9532_data *data = gpiochip_get_data(gc);
>   	struct pca9532_led *led = &data->leds[offset];
>
>   	if (val)
> @@ -269,7 +269,7 @@ static void pca9532_gpio_set_value(struct gpio_chip *gc, unsigned offset, int va
>
>   static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
>   {
> -	struct pca9532_data *data = container_of(gc, struct pca9532_data, gpio);
> +	struct pca9532_data *data = gpiochip_get_data(gc);
>   	unsigned char reg;
>
>   	reg = i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));
> @@ -416,7 +416,7 @@ static int pca9532_configure(struct i2c_client *client,
>   		data->gpio.parent = &client->dev;
>   		data->gpio.owner = THIS_MODULE;
>
> -		err = gpiochip_add(&data->gpio);
> +		err = gpiochip_add_data(&data->gpio, data);
>   		if (err) {
>   			/* Use data->gpio.dev as a flag for freeing gpiochip */
>   			data->gpio.parent = NULL;
>

This applies only with 3-way merge due to work queue removal related
changes that already sit on LED git. Nothing clever can be done to fix
that since those changes depend on LED core changes and this patch
depends on GPIO changes. We'll need to add relevant remarks in the pull
requests.

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
